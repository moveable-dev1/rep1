<?php
/**
 * Twenty Fifteen functions and definitions
 *
 * Set up the theme and provides some helper functions, which are used in the
 * theme as custom template tags. Others are attached to action and filter
 * hooks in WordPress to change core functionality.
 *
 * When using a child theme you can override certain functions (those wrapped
 * in a function_exists() call) by defining them first in your child theme's
 * functions.php file. The child theme's functions.php file is included before
 * the parent theme's file, so the child theme functions would be used.
 *
 * @link https://codex.wordpress.org/Theme_Development
 * @link https://codex.wordpress.org/Child_Themes
 *
 * Functions that are not pluggable (not wrapped in function_exists()) are
 * instead attached to a filter or action hook.
 *
 * For more information on hooks, actions, and filters,
 * {@link https://codex.wordpress.org/Plugin_API}
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

/**
 * Set the content width based on the theme's design and stylesheet.
 *
 * @since Twenty Fifteen 1.0
 */
if ( ! isset( $content_width ) ) {
	$content_width = 660;
}

/**
 * Twenty Fifteen only works in WordPress 4.1 or later.
 */
if ( version_compare( $GLOBALS['wp_version'], '4.1-alpha', '<' ) ) {
	require get_template_directory() . '/inc/back-compat.php';
}

if ( ! function_exists( 'twentyfifteen_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 *
 * @since Twenty Fifteen 1.0
 */
function twentyfifteen_setup() {

	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on twentyfifteen, use a find and replace
	 * to change 'twentyfifteen' to the name of your theme in all the template files
	 */
	load_theme_textdomain( 'twentyfifteen', get_template_directory() . '/languages' );

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
	 * See: https://codex.wordpress.org/Function_Reference/add_theme_support#Post_Thumbnails
	 */
	add_theme_support( 'post-thumbnails' );
	set_post_thumbnail_size( 825, 510, true );

	// This theme uses wp_nav_menu() in two locations.
	register_nav_menus( array(
		'primary' => __( 'Primary Menu',      'twentyfifteen' ),
		'social'  => __( 'Social Links Menu', 'twentyfifteen' ),
	) );

	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form', 'comment-form', 'comment-list', 'gallery', 'caption'
	) );

	/*
	 * Enable support for Post Formats.
	 *
	 * See: https://codex.wordpress.org/Post_Formats
	 */
	add_theme_support( 'post-formats', array(
		'aside', 'image', 'video', 'quote', 'link', 'gallery', 'status', 'audio', 'chat'
	) );

	$color_scheme  = twentyfifteen_get_color_scheme();
	$default_color = trim( $color_scheme[0], '#' );

	// Setup the WordPress core custom background feature.
	add_theme_support( 'custom-background', apply_filters( 'twentyfifteen_custom_background_args', array(
		'default-color'      => $default_color,
		'default-attachment' => 'fixed',
	) ) );

	/*
	 * This theme styles the visual editor to resemble the theme style,
	 * specifically font, colors, icons, and column width.
	 */
	add_editor_style( array( 'css/editor-style.css', 'genericons/genericons.css', twentyfifteen_fonts_url() ) );
}
endif; // twentyfifteen_setup
add_action( 'after_setup_theme', 'twentyfifteen_setup' );

/**
 * Register widget area.
 *
 * @since Twenty Fifteen 1.0
 *
 * @link https://codex.wordpress.org/Function_Reference/register_sidebar
 */
function twentyfifteen_widgets_init() {

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
add_action( 'widgets_init', 'twentyfifteen_widgets_init' );

if ( ! function_exists( 'twentyfifteen_fonts_url' ) ) :
/**
 * Register Google fonts for Twenty Fifteen.
 *
 * @since Twenty Fifteen 1.0
 *
 * @return string Google fonts URL for the theme.
 */
function twentyfifteen_fonts_url() {
	$fonts_url = '';
	$fonts     = array();
	$subsets   = 'latin,latin-ext';

	/*
	 * Translators: If there are characters in your language that are not supported
	 * by Noto Sans, translate this to 'off'. Do not translate into your own language.
	 */
	if ( 'off' !== _x( 'on', 'Noto Sans font: on or off', 'twentyfifteen' ) ) {
		$fonts[] = 'Noto Sans:400italic,700italic,400,700';
	}

	/*
	 * Translators: If there are characters in your language that are not supported
	 * by Noto Serif, translate this to 'off'. Do not translate into your own language.
	 */
	if ( 'off' !== _x( 'on', 'Noto Serif font: on or off', 'twentyfifteen' ) ) {
		$fonts[] = 'Noto Serif:400italic,700italic,400,700';
	}

	/*
	 * Translators: If there are characters in your language that are not supported
	 * by Inconsolata, translate this to 'off'. Do not translate into your own language.
	 */
	if ( 'off' !== _x( 'on', 'Inconsolata font: on or off', 'twentyfifteen' ) ) {
		$fonts[] = 'Inconsolata:400,700';
	}

	/*
	 * Translators: To add an additional character subset specific to your language,
	 * translate this to 'greek', 'cyrillic', 'devanagari' or 'vietnamese'. Do not translate into your own language.
	 */
	$subset = _x( 'no-subset', 'Add new subset (greek, cyrillic, devanagari, vietnamese)', 'twentyfifteen' );

	if ( 'cyrillic' == $subset ) {
		$subsets .= ',cyrillic,cyrillic-ext';
	} elseif ( 'greek' == $subset ) {
		$subsets .= ',greek,greek-ext';
	} elseif ( 'devanagari' == $subset ) {
		$subsets .= ',devanagari';
	} elseif ( 'vietnamese' == $subset ) {
		$subsets .= ',vietnamese';
	}

	if ( $fonts ) {
		$fonts_url = add_query_arg( array(
			'family' => urlencode( implode( '|', $fonts ) ),
			'subset' => urlencode( $subsets ),
		), '//fonts.googleapis.com/css' );
	}

	return $fonts_url;
}
endif;

/**
 * JavaScript Detection.
 *
 * Adds a `js` class to the root `<html>` element when JavaScript is detected.
 *
 * @since Twenty Fifteen 1.1
 */
function twentyfifteen_javascript_detection() {
	echo "<script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>\n";
}
add_action( 'wp_head', 'twentyfifteen_javascript_detection', 0 );

/**
 * Enqueue scripts and styles.
 *
 * @since Twenty Fifteen 1.0
 */
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

	// Add modernizr.js
	wp_enqueue_script( 'marsaec', get_template_directory_uri() . '/js/vendor/modernizr.js', array( 'jquery' ), '2.8.3', true );

	// Add foundation.js
	wp_enqueue_script( 'foundation-min', get_template_directory_uri() . '/js/foundation.min.js', array( 'jquery' ), '5', true );

	// Add custom.js
	wp_enqueue_script( 'custom', get_template_directory_uri() . '/js/custom.js', array( 'jquery' ), '2015', true );

}
add_action( 'wp_enqueue_scripts', 'marsaec_scripts' );

/**
 * Add featured image as background image to post navigation elements.
 *
 * @since Twenty Fifteen 1.0
 *
 * @see wp_add_inline_style()
 */
function twentyfifteen_post_nav_background() {
	if ( ! is_single() ) {
		return;
	}

	$previous = ( is_attachment() ) ? get_post( get_post()->post_parent ) : get_adjacent_post( false, '', true );
	$next     = get_adjacent_post( false, '', false );
	$css      = '';

	if ( is_attachment() && 'attachment' == $previous->post_type ) {
		return;
	}

	if ( $previous &&  has_post_thumbnail( $previous->ID ) ) {
		$prevthumb = wp_get_attachment_image_src( get_post_thumbnail_id( $previous->ID ), 'post-thumbnail' );
		$css .= '
			.post-navigation .nav-previous { background-image: url(' . esc_url( $prevthumb[0] ) . '); }
			.post-navigation .nav-previous .post-title, .post-navigation .nav-previous a:hover .post-title, .post-navigation .nav-previous .meta-nav { color: #fff; }
			.post-navigation .nav-previous a:before { background-color: rgba(0, 0, 0, 0.4); }
		';
	}

	if ( $next && has_post_thumbnail( $next->ID ) ) {
		$nextthumb = wp_get_attachment_image_src( get_post_thumbnail_id( $next->ID ), 'post-thumbnail' );
		$css .= '
			.post-navigation .nav-next { background-image: url(' . esc_url( $nextthumb[0] ) . '); border-top: 0; }
			.post-navigation .nav-next .post-title, .post-navigation .nav-next a:hover .post-title, .post-navigation .nav-next .meta-nav { color: #fff; }
			.post-navigation .nav-next a:before { background-color: rgba(0, 0, 0, 0.4); }
		';
	}

	wp_add_inline_style( 'twentyfifteen-style', $css );
}
add_action( 'wp_enqueue_scripts', 'twentyfifteen_post_nav_background' );

/**
 * Display descriptions in main navigation.
 *
 * @since Twenty Fifteen 1.0
 *
 * @param string  $item_output The menu item output.
 * @param WP_Post $item        Menu item object.
 * @param int     $depth       Depth of the menu.
 * @param array   $args        wp_nav_menu() arguments.
 * @return string Menu item with possible description.
 */
function twentyfifteen_nav_description( $item_output, $item, $depth, $args ) {
	if ( 'primary' == $args->theme_location && $item->description ) {
		$item_output = str_replace( $args->link_after . '</a>', '<div class="menu-item-description">' . $item->description . '</div>' . $args->link_after . '</a>', $item_output );
	}

	return $item_output;
}
add_filter( 'walker_nav_menu_start_el', 'twentyfifteen_nav_description', 10, 4 );

/**
 * Add a `screen-reader-text` class to the search form's submit button.
 *
 * @since Twenty Fifteen 1.0
 *
 * @param string $html Search form HTML.
 * @return string Modified search form HTML.
 */
function twentyfifteen_search_form_modify( $html ) {
	return str_replace( 'class="search-submit"', 'class="search-submit screen-reader-text"', $html );
}
add_filter( 'get_search_form', 'twentyfifteen_search_form_modify' );

/**
 * Implement the Custom Header feature.
 *
 * @since Twenty Fifteen 1.0
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 *
 * @since Twenty Fifteen 1.0
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Customizer additions.
 *
 * @since Twenty Fifteen 1.0
 */
require get_template_directory() . '/inc/customizer.php';

//Ajax Request for profile category

function implement_ajax() {
    $parent_cat_ID = $_POST['parent_cat_ID'];
    $args = array(
   					 'parent'         => $parent_cat_ID, //Get all category of profile
   					 'hide_empty'    => false,
				); 
				$parentcategory = get_categories($args);
				if($parentcategory){
				?>
				<div id="getallcat<?php echo $parent_cat_ID; ?>">
					<?php
					foreach ($parentcategory as $catvalue) {
					?>
	               	<label class="type_label fw-nrml" for="item1">
	             	<input id="parent_cat2" name="term_taxonomy_id[]" class="element checkbox" type="checkbox" value="<?php echo $catvalue->cat_ID; ?>">
	             	<?php echo $catvalue->cat_name; ?>
	             	<input id="parent_id<?php echo $catvalue->cat_ID; ?>" name="parent_id" type="hidden" value="<?php echo $parent_cat_ID; ?>">
	             	</label> 
	             	<?php
					}
					?> 
				</div>
				<?php }
        die();
    } // end if

add_action('wp_ajax_category_select_action', 'implement_ajax');


//Get Similar Profiles
function get_similarProfile($ID,$loadmore=false,$parentId=0)
{	

	   //Display all Parent Category
        $args = array(
             'parent'         => 8, //Get all category of profile
             'hide_empty'    => false,
        ); 
        $parentcategory = get_categories($args); 
        if($loadmore==false){
        	$loadID=$ID;
        } else{
        	$loadID=$parentId;
        }
        $getSelectedCat=GetSingleFront($metaid=16,$ID); //Get all taxanomy for user, ID=16

        foreach ($parentcategory as $catvalue) {
          if(!empty($getSelectedCat)){
            foreach ($getSelectedCat as $Selectedvalue) {
              $checkedvalue=$Selectedvalue->value;
              $taxanomyid=$catvalue->cat_ID;
              if($checkedvalue==$taxanomyid){
                $level2checks[]=$checkedvalue; //Add into array parent category in level 2
              } 
            }
          }
        }
        if(empty($level2checks)){
        	return false;
        }
         if(is_array($level2checks)) {
            foreach($level2checks as $level2values){
              if(!empty($level2values)) {
              $argsLevel2 = array(
                   'parent'         => $level2values, //Get all category of profile
                   'hide_empty'    => false,
              ); 
              $parentcategoryLevel2 = get_categories($argsLevel2);
              foreach ($parentcategoryLevel2 as $catvalueLevel2) {
                if(!empty($getSelectedCat)){
                  foreach ($getSelectedCat as $SelectedvalueLevel2) {
                    $checkedvalueLevel2=$SelectedvalueLevel2->value;
                    $taxanomyidLevel2=$catvalueLevel2->cat_ID;
                    if($checkedvalueLevel2==$taxanomyidLevel2){
                      $level3checks[]=$checkedvalueLevel2;
                    }
                  }
                }
              }  
          	} 
          }//enforeach  
        }//endif
        if(!empty($level3checks)){
        	$similarcategory=array_merge($level2checks,$level3checks);
        } else{
        	$similarcategory=$level2checks;
        }
        
        $comma_separated = implode(",", $similarcategory);
        global $wpdb;
        if($loadmore==false){
        	$query="Select DISTINCT(id) from aec_profilevalue where value in ($comma_separated) AND id!=$ID AND metaid=16 ORDER BY id DESC LIMIT 4";
        } else{ //Load more content
        	$query="Select DISTINCT(id) from aec_profilevalue where value in ($comma_separated) AND id!=$ID AND id<$ID AND id!=$parentId AND metaid=16 ORDER BY id DESC LIMIT 4";
        }
		$profileIds=$wpdb->get_results($query);
		return $profileIds;
}

//Get Meta Details
function GetSingleFront($metaid,$profileId) 
{
	global $wpdb;
	$profileFields=$wpdb->get_results( "SELECT * FROM aec_profilevalue WHERE id=$profileId AND metaid=$metaid");
	return $profileFields;
}

//Get Profile detail by ID
function get_profileDetail($ID)
{
	global $wpdb;
	$getDetail = $wpdb->get_row("SELECT * FROM aec_profile WHERE id=$ID");
	return $getDetail;
}

//Similar profile for Load more
function getSimilarProfile() {
    if(isset($_POST['getLastContentId']))
		{
	      $i=1;
	      $getRelProfile=get_similarProfile($_POST['getLastContentId'],$loadmore=true,$parentId=$_POST['getParentId']);
	      if(!empty($getRelProfile)){
		      foreach($getRelProfile as $similarId) { 
		     	  $getSimilarID=$similarId->id;
		      	  $getSimilarProfile= get_profileDetail($getSimilarID); 
	    		?>
			    <div class="large-5 <?php echo $i%2==0? "large-offset-2":""; ?> columns prof-col">
			      <div class="panel">
			        <div class="row prof-cont">
			          <div class="small-3 columns">
			            <div class="comp-thumb"><img src="<?php echo $getSimilarProfile->logo; ?>" alt="image" class="th radius"/> </div>
			          </div>
			          <div class="small-9 columns"> <a href="" class="comp-name" title=""><?php echo $getSimilarProfile->name; ?></a>
			            <div class="comp-short"><?php echo $getSimilarProfile->description; ?></div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <?php echo $i%2==0 ? "<div class='clearfix'></div>":""; 
			    $i++;
			    } ?>
		       <div class="large-12 columns text-center" id="load_more_<?php echo $getSimilarID; ?>"> <a role="button" class="button tiny radius more-btn more-btn-inner more_button" href="#" title="" id="<?php echo $getSimilarID; ?>">Load More</a> </div>
		<?php }
    die();
    } // end if
}
add_action('wp_ajax_get_similar_profile', 'getSimilarProfile');
add_action('wp_ajax_nopriv_get_similar_profile', 'getSimilarProfile');

//Ajax Request for submit a profile frontend

function submit_formcategory() {
    $parent_cat_ID = $_POST['parent_cat_ID'];
    $args = array(
   					 'parent'         => $parent_cat_ID, //Get all category of profile
   					 'hide_empty'    => false,
				); 
				$parentcategory = get_categories($args);
				if($parentcategory){
				?>
				<div id="getallcat<?php echo $parent_cat_ID; ?>">
					<?php
					foreach ($parentcategory as $catvalue) {
					?>
	               <li>
	                	<div>
			             	<input id="parent_cat2" name="term_taxonomy_id[]" class="cb" type="checkbox" value="<?php echo $catvalue->cat_ID; ?>">
			             	<label class="type_label fw-nrml" for="<?php echo $catvalue->cat_name; ?>"><?php echo $catvalue->cat_name; ?></label>
			             	<input id="parent_id<?php echo $catvalue->cat_ID; ?>" name="parent_id" type="hidden" value="<?php echo $parent_cat_ID; ?>">
			             </div>
					</li>
			             	<?php
							}
							?> 
				</div>
				<?php }
        die();
    } // end if

add_action('wp_ajax_category_select_frontend', 'submit_formcategory');
add_action('wp_ajax_nopriv_category_select_frontend', 'submit_formcategory');
//add_action('wp_ajax_nopriv_category_select_action', 'implement_ajax');//for users that are not logged in.
//For Admin Redirects
add_action('init', 'start_buffer_output');
function start_buffer_output() {
        ob_start();
}

//Trim words for page
function trim_words($id)
{
	$page_data = get_page( $id );
    $content = $page_data->post_content;
    $trimmed_content = wp_trim_words( $content, 48, '' );
    return $trimmed_content;
}

//Get Newest Profile on Home Page

function newest_profile()
{
	global $wpdb;
	$query="SELECT * FROM aec_profile ORDER BY id DESC LIMIT 2";
	$newprofile=$wpdb->get_results($query);
	return $newprofile;
}

//Get Featured Image by ID
function feautured_image($id)
{
	global $wpdb;
	$query="SELECT a1.value FROM aec_profilevalue a1 INNER JOIN aec_profilevalue a2 ON a2.value=a1.fieldid AND a1.id=$id AND a1.metaid=8 AND a2.metaid=9 AND a2.id=$id";
	$getimage=$wpdb->get_row($query);
	return $getimage->value;
}

//Get Profile URL
function get_profileUrl($id)
{
	global $wpdb;
	$getURL = $wpdb->get_var( $wpdb->prepare(
    "SELECT permalink FROM aec_profile WHERE id=%s", "$id"
 	 ) );
	if(!$getURL){
		$getURL=$id;
	}
	return "/profile/".$getURL;
}

//Get Search by keyword
function search_keyword($searchterm)
{
	global $wpdb;
	$searchFieldName= "name";
	$searchCondition = "$searchFieldName LIKE '%" . $searchterm . "%'";
	$query="SELECT * FROM aec_profile WHERE $searchCondition AND status=1 ORDER BY id DESC";
	$getsearch=$wpdb->get_results($query);
	return $getsearch;
}

//
function search_count($searchterm)
{
	global $wpdb;
	$searchFieldName= "name";
	$searchCondition = "$searchFieldName LIKE '%" . $searchterm . "%'";
	$query="SELECT COUNT(*) FROM aec_profile WHERE $searchCondition AND status=1 ORDER BY id DESC";
	$getsearch=$wpdb->get_var($query);
	return $getsearch;
}

//Add Fields in settings
$new_general_setting = new new_general_setting();

class new_general_setting {
    function new_general_setting( ) {
        add_filter( 'admin_init' , array( &$this , 'register_fields' ) );
    }
    function register_fields() {
    	//Field for Vimeo
        register_setting( 'general', 'vimeo_url', 'esc_attr' );
        add_settings_field('vimeo_url', '<label for="vimeo_url">'.__('Vimeo URL (Home Page)' , 'vimeo' ).'</label>' , array(&$this, 'fields_html') , 'general' );
        register_setting( 'general', 'profile_email', 'esc_attr' );
        add_settings_field('profile_email', '<label for="profile_email">'.__('Email Copy to (Submit a Profile)' , 'profile' ).'</label>' , array(&$this, 'fields_html_email') , 'general' );
    }
    function fields_html() {
        $value = get_option( 'vimeo_url', '' );
        echo '<input type="text" id="vimeo_url" name="vimeo_url" value="' . $value . '" />';
    }

    function fields_html_email() {
        $value = get_option( 'profile_email', '' );
        echo '<input type="text" id="profile_email" name="profile_email" value="' . $value . '" />';
    }
}

/**
  * Resize Images
  * @param string $url
  * @param int $width 
  * return $image resized image URL
 */
function wpse_resizeimage($url, $width, $height = null, $crop = null, $single = true) {
//validate inputs
    if (!$url OR !$width)
        return false;

//define upload path & dir
    $upload_info = wp_upload_dir();
    $upload_dir = $upload_info['basedir'];
    $upload_url = $upload_info['baseurl'];

//check if $img_url is local
    if (strpos($url, $upload_url) === false)
        return false;

//define path of image
    $rel_path = str_replace($upload_url, '', $url);
    $img_path = $upload_dir . $rel_path;

//check if img path exists, and is an image indeed
    if (!file_exists($img_path) OR !getimagesize($img_path))
        return false;

//get image info
    $info = pathinfo($img_path);
    $ext = $info['extension'];
    list($orig_w, $orig_h) = getimagesize($img_path);

//get image size after cropping
    $dims = image_resize_dimensions($orig_w, $orig_h, $width, $height, $crop);
    $dst_w = $dims[4];
    $dst_h = $dims[5];

//use this to check if cropped image already exists, so we can return that instead
    $suffix = "{$dst_w}x{$dst_h}";
    $dst_rel_path = str_replace('.' . $ext, '', $rel_path);
    $destfilename = "{$upload_dir}{$dst_rel_path}-{$suffix}.{$ext}";

    if (!$dst_h) {
//can't resize, so return original url
        $img_url = $url;
        $dst_w = $orig_w;
        $dst_h = $orig_h;
    }
//else check if cache exists
    elseif (file_exists($destfilename) && getimagesize($destfilename)) {
        $img_url = "{$upload_url}{$dst_rel_path}-{$suffix}.{$ext}";
    }
//else, we resize the image and return the new resized image url
    else {

// Note: pre-3.5 fallback check 
        if (function_exists('wp_get_image_editor')) {

            $editor = wp_get_image_editor($img_path);

            if (is_wp_error($editor) || is_wp_error($editor->resize($width, $height, $crop)))
                return false;

            $resized_file = $editor->save();

            if (!is_wp_error($resized_file)) {
                $resized_rel_path = str_replace($upload_dir, '', $resized_file['path']);
                $img_url = $upload_url . $resized_rel_path;
            } else {
                return false;
            }
        } else {

            $resized_img_path = image_resize($img_path, $width, $height, $crop);
            if (!is_wp_error($resized_img_path)) {
                $resized_rel_path = str_replace($upload_dir, '', $resized_img_path);
                $img_url = $upload_url . $resized_rel_path;
            } else {
                return false;
            }
        }
    }

//return the output
    if ($single) {
//str return
        $image = $img_url;
    } else {
//array return
        $image = array(
            0 => $img_url,
            1 => $dst_w,
            2 => $dst_h
        );
    }

    return $image;
}

//SEO friendly profile detail page
function custom_rewrite_tag() {
  add_rewrite_tag('%profile%', '([^&]+)');
}
add_action('init', 'custom_rewrite_tag', 10, 0);

function custom_rewrite_rule() {
    add_rewrite_rule('^profile/([^/]*)/?','index.php?page_id=39&profile=$matches[1]','top');
  }
add_action('init', 'custom_rewrite_rule', 10, 0);


//Ajax Request for frontend Search Category Checkbox
function homeCheckAjax() {
    $parent_cat_ID = $_POST['parent_cat_ID'];
    $args = array(
   					 'parent'         => $parent_cat_ID, //Get all category of profile
   					 'hide_empty'    => false,
				); 
				$parentcategory = get_categories($args);
				if($parentcategory){
				?>
				<div id="getallcat<?php echo $parent_cat_ID; ?>">
					<?php
					foreach ($parentcategory as $catvalue) {
					?>
					<div>
                	 <input type="checkbox" class="cb" id="parent_cat2" value="<?php echo $catvalue->cat_ID; ?>">
                	 <label for="<?php echo $catvalue->cat_name; ?>"><?php echo $catvalue->cat_name; ?></label>
                	 <input id="parent_id<?php echo $catvalue->cat_ID; ?>" name="parent_id" type="hidden" value="<?php echo $parent_cat_ID; ?>">
                	</div>
	             	<?php
					} 
					?> 
				</div>
				<?php }
        die();
    } // end if

add_action('wp_ajax_home_category_select_action', 'homeCheckAjax');
add_action('wp_ajax_nopriv_home_category_select_action', 'homeCheckAjax');