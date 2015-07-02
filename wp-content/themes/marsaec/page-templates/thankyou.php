<?php
/**
 * Template Name: Thank you submit form
 *
 *
 * @package Marsaec
 * 
 */

get_header();
session_start();
?>
<!--Banner section starts-->

<div class="row">
  <div class="banner"> <img src="<?php bloginfo('template_directory'); ?>/img/profile-banner.jpg" alt="image"/> </div>
</div>
<!--Banner section ends--> 

<!--Form section starts-->
<div class="row">
	<div class="profile-sec">
    	<div class="large-12 columns">
      		<div class="page-head">
		 		<?php the_title( '<h1 class="page-title">', '</h1>' ); ?>
		 		<?php if( get_post_meta($post->ID, 'sub-heading', true) ) {  //If sub heading exist
		 			echo "<h3 class='sub-txt'>".get_post_meta($post->ID, 'sub-heading', true)."</h3>"; 
		 		} ?>
	      		</div>

	      		<?php
	      		if(!isset($_SESSION['profile_id']))
	      		{
	      			echo "Click <a href='".get_permalink( 20 )."'>here</a> to submit the form";

	      		} else {
				// Start the loop.
				while ( have_posts() ) : the_post(); 
					// Include the page content .
					the_content();
				// End the loop.
				endwhile;
				}

				?>
   	 	</div>
	</div>
</div>
<!--Form section ends--> 

<?php 
session_destroy();
get_footer(); ?>
