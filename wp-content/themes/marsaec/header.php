<?php
/**
 * The template for displaying the header
 *
 * Displays all of the head element and everything up until the "site-content" div.
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php bloginfo( 'charset' ); ?>" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" type="text/css">
	<?php wp_head(); ?>
	<script type="text/javascript">var switchTo5x=true;</script>
	<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
	<script type="text/javascript">stLight.options({publisher: "afe19910-531a-4ee4-9af8-83e4dd02e6e0", doNotHash: false, doNotCopy: false, hashAddressBar: false, onhover: false});</script>
</head>

<body <?php body_class(); ?>>
<div class="row">
  <header class="site-head">
    <div class="large-6 columns"> 
    	<a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="marsaec">
    		<img src="<?php bloginfo('template_directory'); ?>/img/logo.jpg" alt="Energy Innovation Snapshot" title="Energy Innovation Snapshot">
    	</a> 
    </div>
    <div class="large-6 columns show-for-large-only"> 
    	<a href="<?php echo get_permalink( 20 ); ?>" class="button radius prof-btn right"  title="">SUBMIT A PROFILE</a> 
    </div>
  </header>
</div>