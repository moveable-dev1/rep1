<?php
// Add default posts and comments RSS feed links to head.
add_theme_support( 'automatic-feed-links' );

/*
 * Let WordPress manage the document title.
 * By adding theme support, we declare that this theme does not use a
 * hard-coded <title> tag in the document head, and expect WordPress to
 * provide it for us.
 */
add_theme_support( 'title-tag' );

/*
 * Enable support for Post Thumbnails on posts and pages.
 *
 */
add_theme_support( 'post-thumbnails' );
set_post_thumbnail_size( 825, 510, true );

// This theme uses wp_nav_menu() in two locations.
register_nav_menus( array(
	'primary' => __( 'Primary Menu',      'marsaec' ),
	'social'  => __( 'Social Links Menu', 'marsaec' ),
) );


/**
 * Register widget area.
 *
 * @since Marsaec 1.0
 *
 */
function marsaec_widgets_init() {

	register_sidebar( array(
		'name'          => __( 'Introductory Video Content', 'twentyfifteen' ),
		'id'            => 'vimeo-content',
		'description'   => __( 'Add video content on homepage', 'marsaec' ),
		'before_widget' => '',
		'after_widget'  => '',
		'before_title'  => '',
		'after_title'   => '',
	) );
}
add_action( 'widgets_init', 'marsaec_widgets_init' );

/**
 * JavaScript Detection.
 *
 * Adds a `js` class to the root `<html>` element when JavaScript is detected.
 */
function marsaec_javascript_detection() {
	echo "<script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>\n";
}
add_action( 'wp_head', 'marsaec_javascript_detection', 0 );

//Add global assets JS/CSS
function marsaec_scripts() {
	// Add custom fonts, used in the main stylesheet.
	wp_enqueue_style( 'marsaec', "http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700", array(), null );

	// Add font-awesome
	//wp_enqueue_style( 'font-awesome', get_template_directory_uri() . '/css/font-awesome.css', array(), '4.3.0' );

	// Load our main stylesheet.
	wp_enqueue_style( 'marsaec-style', get_stylesheet_uri() );

	// Add normalize.css
	wp_enqueue_style( 'normalize', get_template_directory_uri() . '/css/normalize.css', array(), '3.0.3' );

	// Add foundation.css
	wp_enqueue_style( 'foundation', get_template_directory_uri() . '/css/foundation.css', array(), '5' );
	
	// Add app.css
	wp_enqueue_style( 'app', get_template_directory_uri() . '/css/app.css', array(), '1' );

	// Add print.css
	wp_enqueue_style( 'print', get_template_directory_uri() . '/css/print.css', array(), '1' ,'print');	

	// Add modernizr.js
	wp_enqueue_script( 'marsaec', get_template_directory_uri() . '/js/vendor/modernizr.js', array( 'jquery' ), '2.8.3', true );

	// Add foundation.js
	wp_enqueue_script( 'foundation-min', get_template_directory_uri() . '/js/foundation.min.js', array( 'jquery' ), '5', true );

	// Add custom.js
	wp_enqueue_script( 'custom', get_template_directory_uri() . '/js/custom.js', array( 'jquery' ), '2015', true );

}
add_action( 'wp_enqueue_scripts', 'marsaec_scripts' );
 
//Admin Functions
require get_stylesheet_directory() . '/inc/include_admin.php';

//Similar Profile
require get_stylesheet_directory() . '/inc/include_similarprofile.php';

//Frontend Functions
require get_stylesheet_directory() . '/inc/include_frontend.php';

//Include Code for Filter by tag options
require get_stylesheet_directory() . '/inc/include_toggle.php';

//Include Code for Contact Forms
require get_stylesheet_directory() . '/inc/include_contactgravityform.php';

//Search by keyword
require get_stylesheet_directory() . '/inc/include_searchkeyword.php';

