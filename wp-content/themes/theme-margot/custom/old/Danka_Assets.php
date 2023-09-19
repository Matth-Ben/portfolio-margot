<?php

trait Danka_Assets
{
    public function init_danka_assets()
    {
        add_action( 'wp_enqueue_scripts', function()
        {
            wp_enqueue_style( 'app', get_template_directory_uri() . '/dist/app.css');
            wp_enqueue_script( 'app', get_template_directory_uri() . '/dist/app.js');
            wp_enqueue_script( 'chunk', get_template_directory_uri() . '/dist/chunk-vendors.js');
        } );

        add_filter('style_loader_tag', 'add_type_attribute' , 10, 3);
        function add_type_attribute($tag, $handle, $src) {
            // if not your script, do nothing and return original $tag
            // if ( 'your-script-handle' !== $handle ) {
            //     return $tag;
            // }
            // change the script tag by adding type="module" and return it.
            // $tag = '<script type="module" src="' . esc_url( $src ) . '"></script>';
            // return $tag;

            $tag = '<link class="component" onload="this.classList.add(\'loaded\')" rel="stylesheet" type="text/css" media="all" href="' . esc_url( $src ) . '"></link>';
            // echo $src;
            // die;
            return $tag;
        }

        // add_filter('script_loader_tag', function($tag, $handle, $src) {
        //     return 'app' !== $handle ? $tag : '<script type="module" src="' . esc_url( $src ) . '"></script>';
        // }, 10, 3);
    }

    /**
     * Ajoute un seul lien dans la page pour inclure l'asset
     *
     * @param $type string "js" || "css"
     */
    public function enqueue_asset( $path, $type )
    {

        if ( !isset( $_POST["enqueue_$type"] ) ) {
            $_POST["enqueue_$type"] = array();
        }

        if ( !in_array( $path, $_POST["enqueue_$type"] ) ) {
            $_POST["enqueue_$type"][] = $path;
            $url = get_template_directory_uri() . '/dist/' . $path . ".$type";

            if($type == 'css'){
                wp_enqueue_style($path, $url);
            }else{
                wp_enqueue_script($path, $url);
            }
        }
    }
}
