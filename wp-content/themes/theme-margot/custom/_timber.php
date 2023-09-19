<?php

// context
add_filter( 'timber/context', function( $context )
{
    $context['menus'] = get_all_menus();
    $context['assets'] = get_template_directory_uri() . '/assets';
    $context['_session'] = $_SESSION;
    $context['_get'] = $_GET;
    $context['_post'] = $_POST;

    return $context;
} );


// Ajouter les chemins
add_filter( 'timber/loader/loader', function ( $loader ) {
    $loader->addPath ( get_template_directory() . "/assets", "assets" );
    $loader->addPath ( get_template_directory() . "/assets/icons", "icons" );
    $loader->addPath ( get_template_directory() . "/assets/images", "images" );
    $loader->addPath ( get_template_directory() . "/views/components", "components" );
    $loader->addPath ( get_template_directory() . "/views/acf-components", "acf-components" );

    return $loader;
} );


// twig
add_filter( 'timber/twig', function( $twig )
{
    $twig->addExtension( new \Twig\Extension\StringLoaderExtension() );
    $twig->getExtension( \Twig\Extension\CoreExtension::class )->setTimezone( 'Europe/Paris' );


    // WordPress
    $twig->addFunction( new \Timber\Twig_Function( 'get_term', 'get_term' ) );
    $twig->addFunction( new \Timber\Twig_Function( 'get_meta', 'get_meta' ) );
    $twig->addFunction( new \Timber\Twig_Function( 'wp_list_categories', 'wp_list_categories' ) );
    $twig->addFunction( new \Timber\Twig_Function( 'get_field', 'get_field' ) );


    // utils
    $twig->addFunction( new \Timber\Twig_Function( 'uniqid', function() { return uniqid(); } ) );
    $twig->addFunction( new \Timber\Twig_Function( 'get_posts', function ( $post_type = 'post', $max = 4 )
    {
        return \Timber\Timber::get_posts( array(
            'post_type' => $post_type,
            'numberposts' => $max,
            'orderby' => 'date',
            'order' => 'DESC'
        ) );
    } ) );


    // data
    $twig->addFunction( new \Timber\Twig_Function( 'get_data', function()
    {
        $path = get_template_directory() . '/data.json';
        
        if ( file_exists( $path ) ) {
            $data = file_get_contents( $path );

            return  json_decode( $data, true );
        }
    } ) );


    // custom
    $twig->addFunction( new \Timber\Twig_Function( 'get_breadcrumbs', function() { return Breadcrumbs::get_breadcrumbs(); } ) );



    //
    // $twig->addFunction( new \Timber\Twig_Function( 'add_style', function( $path ) { $this->enqueue_asset( $path, 'css' ); } ) );
    // $twig->addFunction( new \Timber\Twig_Function( 'add_script', function( $path ) { $this->enqueue_asset( $path, 'js' ); } ) );


    // others
    $twig->addFunction( new \Timber\Twig_Function( 'get_all_menus', function() { return $this->get_all_menus(); } ) );
    $twig->addFunction( new \Timber\Twig_Function( 'timber_post', function( $id ) { return new \Timber\Post( $id ); } ) );
    $twig->addFunction( new \Timber\Twig_Function( 'timber_term', function( $id ) { return new \Timber\Term( $id ); } ) );
    // $twig->addFunction(new \Timber\Twig_Function('get_breadcrumbs', function() { return $this->get_breadcrumbs(); }));
    
    // images
    $twig->addFunction( new \Timber\Twig_Function( 'get_image_html', function( $id ) { return AppImages::get_image_html( $id ); } ) );
    

    return $twig;
} );


// paths
// add_filter( 'timber/loader/loader', function ( $loader ) {
// 	$loader->addPath( get_template_directory() . "/views/components", "components" );
// 	$loader->addPath( get_template_directory() . "/assets", "assets" );

// 	return $loader;
// } );

// Ajouter les fichiers twig à l'éditeur de thème
function add_custom_editor_file_types( $types ) {
    $types[] = 'twig';
    return $types;
}
add_filter( 'wp_theme_editor_filetypes', 'add_custom_editor_file_types' );