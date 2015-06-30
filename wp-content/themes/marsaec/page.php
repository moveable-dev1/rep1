<?php
/**
 * The template for displaying pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages and that
 * other "pages" on your WordPress site will use a different template.
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

get_header(); ?>
<div class="row">
  <div class="banner"> <img src="<?php bloginfo('template_directory'); ?>/img/banner.jpg" alt="image"/> </div>
</div>

<div class="row">
 	<div class="profile-sec">
    	<div class="large-12 columns">

		<?php
		// Start the loop.
		while ( have_posts() ) : the_post();
			// Include the page content template.
			get_template_part( 'content', 'page' );
		// End the loop.
		endwhile;
		?>

		</div>
	</div>
</div>

<?php get_footer(); ?>
