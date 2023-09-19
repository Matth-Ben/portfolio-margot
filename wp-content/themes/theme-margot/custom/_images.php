<?php

if ( ! defined( 'ABSPATH' ) ) {
    exit; // Exit if accessed directly
}


class AppImages
{
    public static $sizes = [200, 768, 1024, 1440, 1920, 2560];

    public static function init()
    {
        add_theme_support( 'post-thumbnail' );
        add_action( 'intermediate_image_sizes_advanced', array( get_called_class(), 'remove_default_image_sizes' ) );
		// add_action( 'admin_print_styles', array( get_called_class(), 'hide_media_settings' ) );
        add_action( 'after_setup_theme', array( get_called_class(), 'add_image_sizes' ) );
        add_filter( 'admin_init', array( get_called_class(), 'register_settings_for_images' ) );
        // add_filter( 'admin_init', array( get_called_class(), 'convert_all_images' ) );
        add_filter( 'big_image_size_threshold', '__return_false' );
        add_filter( 'wp_handle_upload', array( get_called_class(), 'convert_to_webp' ) );

        add_action( 'wp_ajax_count_all_images_can_be_converted', array( get_called_class(), 'async_count_all_images_can_be_converted' ) );
        add_action( 'wp_ajax_nopriv_count_all_images_can_be_converted', array( get_called_class(), 'async_count_all_images_can_be_converted' ) );
        add_action( 'wp_ajax_convert_images', array( get_called_class(), 'async_convert_images' ) );
        add_action( 'wp_ajax_nopriv_convert_images', array( get_called_class(), 'async_convert_images' ) );
    }


    /**
     * Supprimer les tailles d'images par défaut qui sont crées pendant l'upload
     * (Voir https://developer.wordpress.org/reference/hooks/intermediate_image_sizes_advanced/)
     */
    public static function remove_default_image_sizes( $sizes )
    {
        unset( $sizes['thumbnail'] );       // 150px
        unset( $sizes['medium'] );          // 300px
        unset( $sizes['medium_large'] );    // 768px
        unset( $sizes['large'] );           // 1024px
        unset( $sizes['1536x1536'] );       // 1536px
        unset( $sizes['2048x2048'] );       // 2048px

        return $sizes;
    }


    /**
     * Dans Options > Médias : cache les options qui gèrent les dimensions d'images à utiliser pendant l'upload
     */
    public static function hide_media_settings()
    {
        if ( 'options-media' !== get_current_screen()->id ) {
            return;
        }
        ?>

        <style>
            #wpbody-content form > h2,
            #wpbody-content form > p { display: none; }
            #wpbody-content form > table:first-of-type tr:nth-of-type( 1 ),
            #wpbody-content form > table:first-of-type tr:nth-of-type( 2 ),
            #wpbody-content form > table:first-of-type tr:nth-of-type( 3 ) { display: none; }
        </style>

        <?php
    }


    /**
     * Ajouter les formats d'image
     */
    public static function add_image_sizes()
    {
        foreach ( self::$sizes as $size ) {
            add_image_size( "size-$size", $size );
        }
    }


    /**
     * Récupèrer l'HTML d'une image
     * 
     * @param int $id
     */
    public static function get_image_html( $id ) // https://developer.mozilla.org/fr/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images
    {
        $sources = '';
        $img = '';
        $alt = esc_attr(get_post_meta( $id, '_wp_attachment_image_alt', true ) );

        foreach ( self::$sizes as $index => $size ) {
            $data = wp_get_attachment_image_src( $id, "size-$size" );
            
            if ( $data ) {
                $src = $data[0];
                $sources .= "<source media='(max-width: $size" . "px)' srcset='$src'>";

                if ( $index === (count( self::$sizes ) - 1 ) ) {
                    $img = "<img src='$src' alt='$alt' />";
                }
            }
        }

       return "<picture>$sources $img</picture>";
    }


    /**
     * Convertir au format webp
     */
    public static function convert_to_webp( $data )
    {
        if ( isset( $_POST['convert_all_images'] ) ) {
            $is_allowed = true;
        } else {
            $is_allowed = get_option( 'danka__images__active_auto_convert' ) === 'on';
        }

        if ( $is_allowed === false ) {
            return $data;
        }

        // Nouveau chemin de fichier
        $file_parts = explode( '.', $data['file'] );
        unset( $file_parts[count( $file_parts ) - 1] );
        $new_file = implode( $file_parts ) . '.webp';

        // Nouvelle URL
        $url_parts = explode( '.', $data['url'] );
        unset( $url_parts[count( $url_parts ) - 1] );
        $new_url = implode( $url_parts ) . '.webp';

        switch ( $data['type'] ) {
            
            case 'image/jpeg':
                $image = imagecreatefromjpeg( $data['file'] );
                $has_new_image = imagewebp( $image, $new_file, 80 );
                imagedestroy( $image );
                break;

            case 'image/png':
                $image = imagecreatefrompng( $data['file'] );
                imagepalettetotruecolor( $image );
                imagealphablending( $image, true );
                imagesavealpha( $image, true );
                $has_new_image = imagewebp( $image, $new_file, 80 );
                imagedestroy( $image );
                break;
        }

        if ( $has_new_image ) {
            unlink( $data['file'] );
            $data['file'] = $new_file;
            $data['url'] = $new_url;
            $data['type'] = 'image/webp';
        }
        
        return $data;
    }


    /**
     * Enregistrer les paramètres pour les images
     */
    public static function register_settings_for_images()
    {
        $section_name = 'danka__images';
    
        add_settings_section(
            $section_name,  // id
            '',             // title
            '',             // callback
            'media'         // page
        );


        // activer l'auto convertion des images
        add_settings_field(
            "{$section_name}__active_auto_convert",                                         // id
            'Auto convertion des images en webp',		                                    // title
            array( get_called_class(), "render_setting__images__active_auto_convert" ),     // callback
            'media',                                      				                    // page
            $section_name                                       		                    // section
        );
    
        register_setting(
            'media',                                            // option group
            "{$section_name}__active_auto_convert",             // option name
            array(
                'type'              => 'boolean',
                'sanitize_callback' => 'sanitize_text_field',
            )
        );
    
    
        // step
        add_settings_field(
            "{$section_name}__convert_all_images",                                              // id
            'Convertir toutes les images jpeg et png',                                          // title
            array( get_called_class(), "register_settings_for_images__convert_all_images" ),    // callback
            'media',                                                                            // page
            $section_name                                                                       // section
        );
        
        
        // bouton enregistrer
        // add_settings_field(
        //     "{$section_name}__save",    // id
        //     '',		                    // title
        //     function() {
        //         submit_button();
        //     },                          // callback
        //     'media',                    // page
        //     $section_name               // section
        // );
    }


    /**
     * Afficher l'option pour l'auto convertion des images
     */
    public static function render_setting__images__active_auto_convert()
    {
        $option_name = 'danka__images__active_auto_convert';
        $option = get_option( $option_name );
        $value = $option === "on" ? "checked" : "";
    
        echo "<input id='{$option_name}' type='checkbox' name='{$option_name}' $value />";
        echo "<label for='{$option_name}'>Activer</label>";
    }


    /**
     * Afficher le bouton pour convertir toutes les images
     */
    public static function register_settings_for_images__convert_all_images()
    {
        $url = admin_url() . 'options-media.php?danka__convert_all_images=true';
    
        echo "<a href='$url' id='danka-convert-all-images' class='button'>Convertir au format webp</a>";
        echo "<p id='danka-convert-all-images-informations'></p>";
        echo "<p id='danka-convert-all-images-status'></p>";
        ?>
        <script>
            document.addEventListener( 'DOMContentLoaded', () => {
                const button = document.getElementById( 'danka-convert-all-images' )
                const informations = document.getElementById( 'danka-convert-all-images-informations' )
                const status = document.getElementById( 'danka-convert-all-images-status' )


                button.addEventListener( 'click', async e => {
                    e.preventDefault()
                    
                    const request = await fetch( ajaxurl, {
                        method: 'post',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                            'Cache-Control': 'no-cache',
                        },
                        body: new URLSearchParams( { action: 'count_all_images_can_be_converted' } )
                    } )
                    const ids = await request.json()

                    console.log( ids )

                    informations.innerHTML = "Chargement..."
                    
                    if ( ids.length > 0 ) {
                        let new_urls = []

                        informations.innerHTML = `${ids.length} ${ids.length > 1 ? ' images peuvent être converties' : ' image peut être convertie'}`
                        status.innerHTML = `Convertion des images en cours (${new_urls.length}/${ids.length})`

                        ids.forEach( async id => {
                            const images_request = await fetch( ajaxurl, {
                                method: 'post',
                                headers: {
                                    'Content-Type': 'application/x-www-form-urlencoded',
                                    'Cache-Control': 'no-cache',
                                },
                                body: new URLSearchParams( {
                                    action: 'convert_images',
                                    images: JSON.stringify( [id] )
                                } )
                            } )
                            const response = await images_request.json()

                            new_urls = [...new_urls, ...response]

                            
                            if ( new_urls.length != ids.length ) {
                                status.innerHTML = `Convertion des images en cours (${new_urls.length}/${ids.length})`
                            } else {
                                status.innerHTML = `Convertion terminé ! (${ids.length}/${ids.length})`
                            }
                        } )
                    } else {
                        informations.innerHTML = "Aucune image ne peut être convertie"
                    }
                } )
            } )
        </script>
        <?php
    }


    public static function async_count_all_images_can_be_converted()
    {
        $data = array();
        $query = new WP_Query( array(
            'post_type'         => 'attachment',
            'post_status'	    => 'inherit',
            'post_mime_type'    => array( 'image/jpeg', 'image/png' ),
            'posts_per_page'    => -1,
        ) );

        if ( $query->posts ) {
            foreach ( $query->posts as $p ) {
                $data[] = $p->ID;
            }
        }

        echo json_encode( $data );
        wp_die();
    }
    
    
    public static function async_convert_images()
    {
        $images_id = isset( $_POST['images'] ) ? json_decode( $_POST['images'], true ) : null;

        if ( $images_id ) {
            $_POST['convert_all_images'] = true;
            $new_urls = self::convert_images( $images_id );

            echo json_encode( $new_urls );
            wp_die();
        }

        echo json_encode( false );
        wp_die();
    }


    /**
     * Convertir des image existantes
     */
    public static function convert_images( $ids )
    {
        global $wpdb;

        $temp_folder_dir = wp_upload_dir()['basedir'] . '/temp';
        $temp_folder_url = wp_upload_dir()['baseurl'] . '/temp';

        // créer le fichier temporaire
        if ( ! is_dir( $temp_folder_dir ) ) {
            mkdir( $temp_folder_dir );
        }

        $new_urls = array();

        foreach ( $ids as $id ) {
            $old_id = $id;
            $path = get_attached_file( $old_id );
            $temp_path = $temp_folder_dir . '/' . basename( $path );
            $temp_uri = $temp_folder_url . '/' . basename( $path );

            $sql = $wpdb->prepare( "SELECT post_id FROM {$wpdb->prefix}postmeta WHERE meta_key LIKE '_thumbnail_id' AND meta_value LIKE %s", $old_id );
            $posts_with_this_thumbnail = $wpdb->get_results( $sql );

            // déplacer l'ancien fichier
            rename( $path, $temp_path );

            // supprimer le média
            wp_delete_attachment( $old_id );

            // créer un nouveau média
            $new_id = self::wp_insert_attachment_from_url( $temp_uri );
            
            // supprimer l'ancien fichier
            unlink( $temp_path );

            // changer le nouvel id avec le nouveau
            if ( $new_id ) {
                $wpdb->update(
                    $wpdb->prefix . 'postmeta',
                    array( 'post_id' => $old_id ),
                    array( 'post_id' => $new_id )
                );
            
                $wpdb->update(
                    $wpdb->prefix . 'posts',
                    array( 'ID' => $old_id ),
                    array( 'ID' => $new_id )
                );

                $new_urls[] = wp_get_attachment_url( $new_id );
            }

            // remettre les thumbnails
            foreach ( $posts_with_this_thumbnail as $p ) {
                add_post_meta( $p->post_id, '_thumbnail_id', $old_id );
            }
        }

        // supprimer le dossier temporaire
        if ( file_exists( $temp_folder_dir ) && is_readable( $temp_folder_dir ) && count( scandir( $temp_folder_dir ) ) == 2 ) {
            rmdir( $temp_folder_dir );
        }

        return $new_urls;
    }


    /**
     * Enregistrer un média
     * 
     * @param string $url
     * @param int $parent_post_id
     */
    public static function wp_insert_attachment_from_url( $url, $parent_post_id = null ) {

        if ( ! class_exists( 'WP_Http' ) ) {
            require_once ABSPATH . WPINC . '/class-http.php';
        }
    
        $http = new WP_Http();
        $response = $http->request( $url );
        if ( 200 !== $response['response']['code'] ) {
            return false;
        }
    
        $upload = wp_upload_bits( basename( $url ), null, $response['body'] );
        if ( ! empty( $upload['error'] ) ) {
            return false;
        }
    
        $file_path        = $upload['file'];
        $file_name        = basename( $file_path );
        $file_type        = wp_check_filetype( $file_name, null );
        $attachment_title = sanitize_file_name( pathinfo( $file_name, PATHINFO_FILENAME ) );
        $wp_upload_dir    = wp_upload_dir();
    
        $post_info = array(
            'guid'           => $wp_upload_dir['url'] . '/' . $file_name,
            'post_mime_type' => $file_type['type'],
            'post_title'     => $attachment_title,
            'post_content'   => '',
            'post_status'    => 'inherit',
        );
    
        // Create the attachment.
        $attach_id = wp_insert_attachment( $post_info, $file_path, $parent_post_id );
    
        // Include image.php.
        require_once ABSPATH . 'wp-admin/includes/image.php';
    
        // Generate the attachment metadata.
        $attach_data = wp_generate_attachment_metadata( $attach_id, $file_path );
    
        // Assign metadata to attachment.
        wp_update_attachment_metadata( $attach_id, $attach_data );
    
        return $attach_id;
    }
}


AppImages::init();