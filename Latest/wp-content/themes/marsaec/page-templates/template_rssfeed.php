<?php
/**
 * Template Name: RSS Feed
 *
 *
 * @package Marsaec
 * 
 */

get_header();
?>
<!--Banner section starts-->

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
				// Start the loop.
				//while ( have_posts() ) : the_post(); 
					// Include the page content .
					//the_content();
				// End the loop.
				//endwhile;
				?>
				<h2><?php if(get_post_meta($post->ID, 'rss-subtitle',true)){
					echo get_post_meta($post->ID, 'rss-subtitle',true);
				} ?></h2>

			<?php // Get RSS Feed(s)
			include_once( ABSPATH . WPINC . '/feed.php' );

			// Get a SimplePie feed object from the specified feed source.
			$rss = fetch_feed( get_post_meta($post->ID, 'rss-link',true) );

			if ( ! is_wp_error( $rss ) ) : // Checks that the object is created correctly

				// Figure out how many total items there are, but limit it to 5. 
				$maxitems = $rss->get_item_quantity( get_post_meta($post->ID, 'rss-limit',true) ); 

				// Build an array of all the items, starting with element 0 (first element).
				$rss_items = $rss->get_items( 0, $maxitems );

			endif;
			?>

		<ul>
			<?php if ( $maxitems == 0 ) : ?>
				<li><?php _e( 'No items', 'my-text-domain' ); ?></li>
			<?php else : ?>
				<?php // Loop through each feed item and display each item as a hyperlink. ?>
				<?php foreach ( $rss_items as $item ) : ?>
					<li>
						<a href="<?php echo esc_url( $item->get_permalink() ); ?>"
							title="<?php printf( __( 'Posted %s', 'my-text-domain' ), $item->get_date('j F Y | g:i a') ); ?>">
							<?php echo esc_html( $item->get_title() ); ?>
						</a>
					</li>
				<?php endforeach; ?>
			<?php endif; ?>
		</ul>
   	 	</div>
	</div>
</div>
<!--Form section ends--> 

<?php get_footer(); ?>
