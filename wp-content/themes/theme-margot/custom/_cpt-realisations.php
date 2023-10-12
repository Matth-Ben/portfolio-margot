<?php 

function realisation_register_post_types() {
	
    $labels = array(
        'name' => 'Réalisations',
        'all_items' => 'Toutes les réalisations',
        'singular_name' => 'Réalisation',
        'add_new_item' => 'Ajouter une réalisation',
        'edit_item' => 'Modifier la réalisation',
        'menu_name' => 'Réalisations'
    );

	$args = array(
        'labels' => $labels,
        'public' => true,
        'show_in_rest' => true,
        'has_archive' => true,
        'supports' => array( 'title', 'editor','thumbnail' ),
        'menu_position' => 5, 
        'menu_icon' => 'dashicons-admin-customizer',
	);

	register_post_type( 'realisations', $args );
}
add_action( 'init', 'realisation_register_post_types' );

function get_last_realisation() {
    $args = array(
        'numberposts' => 3,
        'post_type'   => 'realisations'
    );

    $realisations = Timber::get_posts( $args );
    
    return $realisations;
}

function get_previous_realisation($id) {
    $previous = get_previous_post();

    if ($previous) {
        $realisation = Timber::get_post( $previous );
        return $realisation;
    } else {
        $args = array(
            'numberposts' => 1,
            'post_type'   => 'realisations'
        );
    
        $realisation = Timber::get_post( $args );
        return $realisation;
    }
}