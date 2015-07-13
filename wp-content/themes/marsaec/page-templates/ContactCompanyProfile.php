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
if(!empty($_GET['pid'])) {
  $getpid=$_GET['pid'];
  $getDetails=get_profileDetail($getpid);
} 
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
        <h1 class="page-title">Contact <?php echo $getDetails->name; ?></h1>
        <?php if( get_post_meta($post->ID, 'sub-heading', true) ) {  //If sub heading exist
          echo "<h3 class='sub-txt'>".get_post_meta($post->ID, 'sub-heading', true)."</h3>"; 
        } ?>
            </div>
            <?php
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
<!--Form section ends--> 

<?php get_footer(); ?>