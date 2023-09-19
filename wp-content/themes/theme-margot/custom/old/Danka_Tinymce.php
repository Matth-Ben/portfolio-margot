<?php

trait Danka_Tinymce
{
    public function init_danka_tinymce()
    {
        // Enlève les boutons de niveau 2
        add_filter( 'mce_buttons_2', function ( $buttons ) { return array(); } );
        add_filter( 'tiny_mce_before_init', [$this, 'custom_formats'] );
        add_filter( 'acf/fields/wysiwyg/toolbars' , [$this, 'register_custom_acf_toolbar_tinymce']  );
    }

    /**
     * Ajouter des formats, ajouter des couleurs
     */
    public function custom_formats( $init_array )
    {
        // Style formats
        $style_formats = array(
            array(
                'title' => 'Titre 2',
                'block' => 'h2',
                'classes' => '',
                'wrapper' => false,
            ),
            array(
                'title' => 'Titre 3',
                'block' => 'h3',
                'classes' => '',
                'wrapper' => false,
            ),
            array(
                'title' => 'Paragraph',
                'block' => 'p',
                'classes' => '',
                'wrapper' => false,
            ),
            array(
                'title' => 'Paragraph',
                'block' => 'p',
                'classes' => json_encode($init_array),
                'wrapper' => false,
            ),
        );
    
        // Colors
        $custom_colors = '
            "36BF7D", "Vert",
        ';
    
        $init_array['plugins'] = str_replace( 'colorpicker', '', $init_array['plugins'] );
        $init_array['textcolor_map'] = '['.$custom_colors.']';
        $init_array['textcolor_rows'] = 1;
        $init_array['style_formats'] = json_encode( $style_formats );
    
        return $init_array;
    }

    function register_custom_acf_toolbar_tinymce( $toolbars )
    {
        $toolbars['Complet'] = array(
            1 => array(
                "styleselect",
                "bold",
                "italic",
                "bullist",
                "link",
                "spellchecker",
                "forecolor",
                "removeformat",
                "fullscreen",
            ),
            2 => array(),
            3 => array(),
            4 => array()
        );
        
        $toolbars['Simple'] = array(
            1 => array(
                "bold",
                "italic",
                "bullist",
                "link",
                "spellchecker",
                "removeformat",
                "fullscreen",
            ),
            2 => array(),
            3 => array(),
            4 => array()
        );
        
        $toolbars['Couleur'] = array(
            1 => array(
                "forecolor",
            ),
            2 => array(),
            3 => array(),
            4 => array()
        );

        return $toolbars;
    }
}


// {
// "theme":"modern",
// "skin":"lightgray",
// "language":"fr",
// "formats":"{
//     alignleft: [
//         {
//             selector: \"p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li\",
//             styles: {textAlign:\"left\"}},{selector: \"img,table,dl.wp-caption\", classes: \"alignleft\"}],
//             aligncenter: {textAlign:\"center\"}},{selector: \"aligncenter\"}],alignright: {textAlign:\"right\"}},{selector: \"alignright\"}],strikethrough: {inline: \"del\"}
//         }",
// "relative_urls":false,
// "remove_script_host":false,
// "convert_urls":false
// "browser_spellcheck":true,
// "fix_list_elements":true,
// "entities":"38,amp,60,lt,62,gt",
// "entity_encoding":"raw",
// "keep_styles":false,
// "cache_suffix":"wp-mce-49110-20201110",
// "resize":"vertical",
// "menubar":false,
// "branding":false,
// "preview_styles":"font-family font-size font-weight font-style text-decoration text-transform",
// "end_container_on_empty_block":true,
// "wpeditimage_html5_captions":true,
// "wp_lang_attr":"fr-FR",
// "wp_keep_scroll_position":false,
// "wp_shortcut_labels":"{\"Heading 1\":\"access1\",\"Heading 2\":\"access2\",\"Heading 3\":\"access3\",\"Heading 4\":\"access4\",\"Heading 5\":\"access5\",\"Heading 6\":\"access6\",\"Paragraph\":\"access7\",\"Blockquote\":\"accessQ\",\"Underline\":\"metaU\",\"Strikethrough\":\"accessD\",\"Bold\":\"metaB\",\"Italic\":\"metaI\",\"Code\":\"accessX\",\"Align center\":\"accessC\",\"Align right\":\"accessR\",\"Align left\":\"accessL\",\"Justify\":\"accessJ\",\"Cut\":\"metaX\",\"Copy\":\"metaC\",\"Paste\":\"metaV\",\"Select all\":\"metaA\",\"Undo\":\"metaZ\",\"Redo\":\"metaY\",\"Bullet list\":\"accessU\",\"Numbered list\":\"accessO\",\"Insert\\\/edit image\":\"accessM\",\"Insert\\\/edit link\":\"metaK\",\"Remove link\":\"accessS\",\"Toolbar Toggle\":\"accessZ\",\"Insert Read More tag\":\"accessT\",\"Insert Page Break tag\":\"accessP\",\"Distraction-free writing mode\":\"accessW\",\"Add Media\":\"accessM\",\"Keyboard Shortcuts\":\"accessH\"}",
// "content_css":"http:\/\/sovitrat.test\/wp-includes\/css\/dashicons.min.css?ver=6.1.1,http:\/\/sovitrat.test\/wp-includes\/js\/tinymce\/skins\/wordpress\/wp-content.css?ver=6.1.1",
// "plugins":"charmap,colorpicker,hr,lists,media,paste,tabfocus,textcolor,fullscreen,wordpress,wpautoresize,wpeditimage,wpemoji,wpgallery,wplink,wpdialogs,wptextpattern,wpview",
// "external_plugins":"{\"acfe_form\":\"http:\\\/\\\/sovitrat.test\\\/wp-content\\\/plugins\\\/acf-extended\\\/assets\\\/inc\\\/tinymce\\\/acfe-form.min.js\"}",
// "selector":"#acf_content",
// "wpautop":true,
// "indent":false,
// "toolbar1":"formatselect,bold,italic,bullist,numlist,blockquote,alignleft,aligncenter,alignright,link,wp_more,spellchecker,fullscreen,wp_adv",
// "toolbar2":"",
// "toolbar3":"",
// "toolbar4":"",
// "tabfocus_elements":":prev,:next",
// "body_class":"acf_content post-type-page post-status-publish page-template-default locale-fr-fr"
// }