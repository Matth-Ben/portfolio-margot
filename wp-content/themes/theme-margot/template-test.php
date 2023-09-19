<?php

/**
 * Template Name: Test
 */


echo "<div id='abc'></div>";

$args = array(
    'tinymce' => array(
        'toolbar1' => 'bold,italic,underline,separator,alignleft,aligncenter,alignright,separator,link,unlink,undo,redo',
        'toolbar2' => '',
        'toolbar3' => '',
        'textcolor_map' => '["fabb2b", "Yellow",
        "e5ebf0", "Light Blue",
        "003b71", "Medium Blue",
        "042240", "Dark Blue",
        "f16061", "Red",
        "929292", "Medium Gray",
        "262626", "Charcoal"]',
        'textcolor_rows' => 1
    ),
);

wp_editor( '', 'abc', $args );