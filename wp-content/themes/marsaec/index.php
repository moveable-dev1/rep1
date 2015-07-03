<?php
/**
 * The main template file
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * e.g., it puts together the home page when no home.php file exists.
 *
 * Learn more: {@link https://codex.wordpress.org/Template_Hierarchy}
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

get_header(); ?>


<?php get_template_part( 'toggle' ); ?>

<!--Newest Profiles section starts-->
<div class="row">
  <div class="profile-sec">
    <div class="large-12 columns">
      <h1 class="profile-head">Newest Profiles</h1>
    </div>
    <?php foreach(newest_profile() as $newvalue) { 
      ?>
    <div class="large-5 columns prof-col">
      <div class="panel">
        <div class="th radius feat-img"><img src="<?php echo wpse_resizeimage(feautured_image($newvalue->id),291); ?>" alt="image"/> 
        </div>
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="<?php echo $newvalue->logo; ?>" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="<?php echo get_profileUrl($newvalue->id); ?>" class="comp-name" title=""><?php echo $newvalue->name; ?></a>
            <div class="comp-short"><?php echo $newvalue->description; ?></div>
          </div>
        </div>
      </div>
    </div>
    <?php } ?>

    </div>
  </div>
</div>
<!--Newest Profiles section ends--> 

<?php get_template_part( 'promo' ); ?> 

<?php get_footer(); ?>
