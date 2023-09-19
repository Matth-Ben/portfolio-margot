<?php

add_action( 'init', function()
{
	if ( ! session_id() ) {
		@session_start();
	}

	if ( !isset( $_SESSION['welcome'] ) ) {
		$_SESSION['welcome'] = true;
        
		// add_filter( 'body_class', function( $classes ) {
        //     $classes[] = 'welcome';
            
		// 	return $classes;
		// } );
	} else {
        $_SESSION['welcome'] = false;
    }
}, 1 );