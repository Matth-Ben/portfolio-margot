<?php

$composer_autoload = __DIR__ . '/vendor/autoload.php';

if ( file_exists( $composer_autoload ) ) {
	require_once $composer_autoload;
	$timber = new \Timber\Timber();
	\Timber\Timber::$dirname = array( 'views' );
}


// notify if timber is not installed
if ( !class_exists( 'Timber' ) ) {

	add_action( 'admin_notices', function() {
		echo '<div class="error"><p>Timber non activé. Assurez-vous d’activer le plugin dans <a href="' . esc_url( admin_url( 'plugins.php#timber' ) ) . '">' . esc_url( admin_url( 'plugins.php' ) ) . '</a></p></div>';
	} );

	add_filter( 'template_include', function( $template ) {
		echo "<!doctype html><html lang=\"en\"><head></head><body><p>Timber doit être activé</p></body></html>";
		return;
	} );

	return;
}

include get_template_directory() . '/custom/index.php';

function acf_export_json( $path ) {
	$path = get_stylesheet_directory() . '/acf-json';
	return $path;
}
add_filter( 'acf/settings/save_json', 'acf_export_json' );

/**
 * Create all image sizes
 */
add_image_size('xs', 240, 0, true);
add_image_size('sm', 480, 0, true);
add_image_size('md', 768, 0, true);
add_image_size('lg', 1024, 0, true);
add_image_size('xl', 1200, 0, true);
add_image_size('xxl', 1400, 0, true);
add_image_size('xxxl', 1600, 0, true);
add_image_size('hd', 1920, 1080, true);

remove_image_size('1536x1536');
remove_image_size('2048x2048');
update_option('medium_large_size_w', '0');