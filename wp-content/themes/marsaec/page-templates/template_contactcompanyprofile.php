<?php
/**
 * Template Name: Contact Company/Profile
 *
 * Description: Submit profile for company and projects
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
<?php if(!empty($_GET['pid'])) {
  $pid=$_GET['pid'];
  $getProfile= get_profileDetail($pid);
 ?>
<!--Form section starts-->
<div class="row">
  <div class="profile-sec">
      <div class="large-12 columns">
          <div class="page-head">
        <h1 class="page-title">Contact <?php echo $getProfile->name; ?></h1>
        <?php if( get_post_meta($post->ID, 'sub-heading', true) ) {  //If sub heading exist
          echo "<h3 class='sub-txt'>".get_post_meta($post->ID, 'sub-heading', true)."</h3>"; 
        } ?>
            </div>
            <div class="basic-cont">
         <?php   echo do_shortcode( '[gravityform id="3" title="false" field_values="sname='.$getProfile->name.'&email='.$getProfile->email.'" description="true" ajax="true"]' ); 
        
        // Start the loop.
        while ( have_posts() ) : the_post(); 
          // Include the page content .
          the_content();
        // End the loop.
        endwhile;
        ?>
        </div>
      </div>
  </div>
</div>
<!--Form section ends--> 
<?php } else {
  echo '<div class="row">
  <div class="profile-sec">
      <div class="large-12 columns">No Profile Found.</div></div></div>';
} ?>

<?php get_footer(); ?>