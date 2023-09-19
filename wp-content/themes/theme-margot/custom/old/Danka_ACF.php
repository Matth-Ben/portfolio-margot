<?php

trait Danka_ACF
{
    public function init_danka_acf()
    {
        add_filter( 'acf/fields/wysiwyg/toolbars' , [$this, 'custom_tinymce_toolbars'] );
    }

    public function custom_tinymce_toolbars( $toolbars )
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

        return $toolbars;
    }
}
