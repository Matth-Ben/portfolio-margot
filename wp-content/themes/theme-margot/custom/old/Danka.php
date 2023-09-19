<?php

class Danka extends Timber\Site
{
	use Danka_Image, Danka_Menu, Danka_Assets, Danka_Breadcrumbs, Danka_Tinymce, Danka_ACF;

	public function __construct()
	{
		$this->init_danka();
		$this->init_danka_image();
		$this->init_danka_menu();
		$this->init_danka_assets();
		$this->init_danka_gutenberg();
		$this->init_danka_breadcrumbs();
		$this->init_danka_tinymce();
		$this->init_danka_acf();
		$this->add_svg_icon();
		parent::__construct();
	}

	/**
	 * Initialiser
	 */
	public function init_danka()
	{
		add_filter( 'timber/context', array( $this, 'add_to_context' ) );
		add_filter( 'timber/twig', array( $this, 'add_to_twig' ) );
		add_action( 'after_setup_theme', array( $this, 'theme_supports' ) );
	}

	/**
	 * Ajouter des éléments personnalisés au "contexte"
	 *
	 * @param string $context context['this'] Being the Twig's {{ this }}.
	 */
	public function add_to_context( $context )
	{

		$context['menus']  = $this->get_all_menus();
		$context['site']  = $this;
		$context['assets'] = get_template_directory_uri() . '/assets';

		return $context;
	}
	/**
	 * Ajouter des filtres personnalisés à twig
	 * Voir filtres existant https://twig.symfony.com/doc/3.x/filters/index.html
	 *
	 * @param object $twig get extension.
	 */
	public function add_to_twig( $twig )
	{
		$twig->addExtension( new Twig\Extension\StringLoaderExtension() );
		$twig->getExtension(\Twig\Extension\CoreExtension::class)->setTimezone('Europe/Paris');
		$twig->addFunction( new Timber\Twig_Function( 'get_perfect_image_size', 'get_perfect_image_size' ) );
		$twig->addFunction( new Timber\Twig_Function( 'make_perfect_image_size', 'make_perfect_image_size' ) );
		$twig->addFunction( new Timber\Twig_Function( 'get_media_data', function( $url ) { return $this->get_media_data( $url ); } ) );
		$twig->addFunction( new Timber\Twig_Function( 'display_menu', function( $slug ) { return $this->display_menu( $slug ); } ) );
		$twig->addFunction( new Timber\Twig_Function( 'add_style', function( $path ) { $this->enqueue_asset( $path, 'css' ); } ) );
		$twig->addFunction( new Timber\Twig_Function( 'add_script', function( $path ) { $this->enqueue_asset( $path, 'js' ); } ) );
		$twig->addFunction( new Timber\Twig_Function( 'get_menu', function( string $slug ) { return $this->get_menu( $slug ); } ) );
		$twig->addFunction( new Timber\Twig_Function( 'get_all_menus', function() { return $this->get_all_menus(); } ) );
		$twig->addFunction( new Timber\Twig_Function( 'pll__', 'pll__' ) );
		$twig->addFunction( new Timber\Twig_Function( 'pll_current_language', 'pll_current_language' ) );
		$twig->addFunction(new Timber\Twig_Function('get_term', 'get_term'));
		$twig->addFunction(new Timber\Twig_Function('get_meta', 'get_meta'));
		$twig->addFunction(new Timber\Twig_Function('get_breadcrumbs', function() { return $this->get_breadcrumbs(); }));
		$twig->addFunction(new Timber\Twig_Function('get_field', 'get_field'));
		$twig->addFunction(new Timber\Twig_Function('wp_list_categories', 'wp_list_categories'));
		$twig->addFunction(new Timber\Twig_Function('uniqid', function() { return uniqid(); }));
		$twig->addFunction(new Timber\Twig_Function('timber_post', function( $id ) { return new Timber\Post( $id ); }));
		$twig->addFunction(new Timber\Twig_Function('timber_term', function( $id ) { return new Timber\Term( $id ); }));
		$twig->addFunction(new Timber\Twig_Function('get_last_posts', function ($post_type, $max = 4) {
			$posts = get_posts([
				'post_type' => $post_type,
				'numberposts' => $max,
				'orderby' => 'date',
				'order' => 'DESC'
			]);

			foreach ($posts as $k => $offer) { $posts[$k] = new Timber\Post($offer->ID); }

			return $posts;
		}));
		$twig->addFunction(new Timber\Twig_Function('get_last_news', function ($max = 3) {
			$news = get_posts([
				'post_type' => 'news',
				'numberposts' => $max,
				'orderby' => 'date',
				'order' => 'DESC'
			]);

			foreach ($news as $k => $offer) { $news[$k] = new Timber\Post($offer->ID); }

			return $news;
		}));
		$twig->addGlobal('assets', get_template_directory_uri() . '/assets');
		$twig->addGlobal('_get', $_GET);
		$twig->addGlobal('_server', $_SERVER);
		$twig->addFunction(new Timber\Twig_Function('get_image', function ($image_id) {
			return $this->get_image_html($image_id);
		}));

		return $twig;
	}

	/**
	 * Ajouter les supports du thème, voir https://developer.wordpress.org/reference/functions/add_theme_support/
	 */
	public function theme_supports()
	{
		add_theme_support( 'title-tag' );
		add_theme_support( 'menus' );
		add_theme_support( 'post-thumbnails' );
	}

	/**
	 * Ajouter la favicon
	 */
	public function add_svg_icon()
	{
		add_action( 'wp_head', function() {
			echo '<link rel="icon" href="' . esc_url( get_stylesheet_directory_uri() . '/assets/img/favicon.svg' ) . '" type="image/svg+xml">';
		}, 100 );
	}

	/**
	 * Récupérer l'identifiant d'un média Youtube, Daylimotion, Spotify ou SoundCloud
	 */
	public function get_media_data( $url )
	{
		$platform = null;
		$media_id = null;

		// Youtube
		if (str_contains($url, 'youtu')) {
			
			if (str_contains($url, 'youtu.be')) {
				$splitted_link = explode('/', $url);
				$media_id = $splitted_link[count($splitted_link) - 1];
			}

			if (str_contains($url, 'youtube.com')) {
				$url_components = parse_url($url);
				parse_str($url_components['query'], $params);
		
				$media_id = $params['v'];
			}

			$platform = 'youtube';
		}

		// Dailymotion
		if (str_contains($url, 'dailymotion.com')) {
			$splitted_link = explode('/', $url);

			foreach ($splitted_link as $index => $item) {

				if ($item == 'video') {
					$media_id = $splitted_link[$index + 1];
				}
			}

			$platform = 'dailymotion';
		}

		// SoundCloud
		if (str_contains($url, 'soundcloud.com')) {
			$media_id = null;
			$platform = 'soundcloud';
		}
		
		// Spotify
		if (str_contains($url, 'spotify.com')) {
			$media_id = str_replace('https://open.spotify.com/', '', $url);
			$platform = 'spotify';
		}
		
		return [
			'platform' => $platform,
			'id' => $media_id
		];
	}
}
