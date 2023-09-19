<?php

// assets
add_action( 'wp_enqueue_scripts', function() {
	$theme = wp_get_theme();

	wp_dequeue_script( 'jquery' );

	wp_enqueue_style( 'app', get_template_directory_uri() . '/build/app.css', array(), $theme->get( 'Version' ) );
	wp_enqueue_script( 'app', get_template_directory_uri() . '/build/app.js', array(), $theme->get( 'Version' ) );
} );
