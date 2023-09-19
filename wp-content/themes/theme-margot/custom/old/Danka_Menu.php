<?php

trait Danka_Menu
{
    public function init_danka_menu()
    {
        add_action( 'after_setup_theme', array( $this, 'register_menu_locations' ) );
        add_action( 'admin_menu', array( $this, 'rename_admin_menu' ) );
    }

    /**
     * Enregistrer les emplacements de menu, voir https://developer.wordpress.org/reference/functions/register_nav_menu/
     */
    public function register_menu_locations()
    {
        register_nav_menu( 'header-primary',    'En tête (primaire)' );
        // register_nav_menu( 'header-secondary',  'En tête (secondaire)' );
        register_nav_menu( 'footer-primary',    'Pied de page (primaire)' );
        register_nav_menu( 'footer-secondary',  'Pied de page (secondaire)' );
        // register_nav_menu( 'mobile',            'Mobile' );
    }

    /**
     * Retourner tous les menus contenant au moins un lien
     */
    public function get_all_menus()
    {
        $menus = null;

		foreach ( get_nav_menu_locations() as $slug => $menu_id ) {
			if ($menu_id) {
				$menu = new Timber\Menu( $menu_id );

				if ( $menu->items ) {
					$menus[$slug] = $menu;
				}
			}
		}

        return $menus;
    }


    /**
     * Retourner tous les menus contenant au moins un lien
     */
    public function get_menu( string $slug )
    {
        $menus = null;

		foreach ( get_nav_menu_locations() as $menu_slug => $menu_id ) {
			if ($menu_slug == $slug) {
				$menu = new Timber\Menu( $menu_id );
			}
		}

        return $menus;
    }
    

    /**
     * Retourner le menu HTML par le slug
     * 
     * @param sring $slug
     */
    public function display_menu( string $slug )
    {
        $menu = isset( get_nav_menu_locations()[$slug] ) ? get_nav_menu_locations()[$slug] : false;

        return $menu ? wp_nav_menu( array( 'menu' => $menu, 'menu_id' => "menu--$slug" ) ) : '';
    }


    /**
     * Renommer le menu d'administration
     */
    public function rename_admin_menu()
    {
        global $menu;

        foreach ($menu as $index => $item) {

            if ( $item[0] == 'Médias' ) {
                $menu[$index][0] = 'Médiathèque';
            }
        }

        return $menu;
    }
}
