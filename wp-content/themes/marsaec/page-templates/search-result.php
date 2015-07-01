<?php
/**
 * Template Name: Search Results
 *
 *
 * @package Marsaec
 * 
 */
global $road_opt;

get_header();
?>

<?php get_template_part( 'toggle' ); ?>

<div class="row">
  <div class="profile-sec">
<?php 
$searchterm=$_GET['q'];
if(!empty($searchterm)) { 
//print_r(search_keyword($searchterm));
  ?>
<!--Search results section starts-->
    <div class="large-12 columns">
      <div class="search-status">
        <div class="left">You searched for: <span class="Search-terms">Item 1, Item 2, Item 3</span></div>
        <div class="right search-count">51 results</div>
      </div>
    </div>
    <?php 
    $i=1;
    $getsearch=search_keyword($searchterm);
    foreach($getsearch as $searchvalue){
     ?>
    <div class="large-5 <?php echo $i%2==0?"large-offset-2":""; ?> columns prof-col">
      <div class="panel <?php echo $i>2?"panel-search":""; ?>">
      <?php if($i<=4) { ?>
      <div class="th radius feat-img">
        <img src="<?php echo wpse_resizeimage(feautured_image($searchvalue->id),291); ?>" alt="image"/> 
      </div>
      <?php } ?>

        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="<?php echo $searchvalue->logo; ?>" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title=""><?php echo $searchvalue->name; ?></a>
            <div class="comp-short"><?php echo $searchvalue->description; ?></div>
          </div>
        </div>
      </div>
    </div>
    <?php $i++; 
    }?>

    <div class="large-12 columns text-center"> <a role="button" class="button tiny radius more-btn more-btn-inner" href="#">Load More</a> 
    </div>
<!--Search results section ends--> 
<?php } 
      else { 
      // Start the loop.
      while ( have_posts() ) : the_post(); 
        // Include the page content .
        the_content();
      // End the loop.
      endwhile;
      } ?>
  </div>
</div>
<?php get_template_part( 'promo' ); ?> 

<?php get_footer(); ?>
