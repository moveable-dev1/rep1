<?php
/**
 * The template for displaying 404 pages (not found)
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

get_header(); ?>

<div class="row">
  <div class="banner"> <img src="<?php bloginfo('template_directory'); ?>/img/contact-banner.jpg" alt="image"/> </div>
</div>
<!--Banner section ends--> 

<!--Thanks section starts-->
<div class="row">
  <div class="profile-sec">
    <div class="large-12 columns">
      <div class="page-head">
        <h1 class="page-title">Sorry! This page was not found.</h1>
        <span>Continue searching this site…</span> </div>
    </div>
    <div class="large-12 columns"> <a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="Home" class="sub-btn" role="button">RETURN TO HOMEPAGE</a> </div>
  </div>
</div>
<!--Thanks section ends--> 

<?php get_footer(); ?>
