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
  <div class="banner"> 
  <?php
		// Start the loop.
		while ( have_posts() ) : the_post();
		$image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'single-post-thumbnail' ); 
		if($image){
		?>
		<img src="<?php echo $image[0] ?>" alt="image"/>
		<?php
		}		
		endwhile;
	?>
  </div>
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
