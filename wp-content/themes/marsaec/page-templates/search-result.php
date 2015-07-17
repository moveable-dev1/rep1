<?php
/**
 * Template Name: Search Results
 *
 *
 * @package Marsaec
 * 
 */

get_header();
wp_enqueue_script( 'searchResult', get_template_directory_uri() . '/js/searchResult.js', array( 'jquery' ), '1.0', true );
?>

<?php get_template_part( 'toggle' ); ?>

<div class="row isotope firstsearch">
    <?php 
    $searchterm=$_GET['q'];
    if(!empty($searchterm) && search_count($searchterm)!=0) { 
    //print_r(search_keyword($searchterm));
      ?>
      <div class="searcharea">
      <!--Search results section starts-->
        <div class="large-12 columns isotope-item">
          <div class="search-status">
            <div class="left">You searched for: <span class="Search-terms"><?php echo $searchterm; ?></span></div>
            <div class="right search-count"><?php echo search_count($searchterm); ?> results</div>
          </div>
        </div>
        <?php 
        $i=1;
        $getsearch=search_keyword($searchterm);
        foreach($getsearch as $searchvalue){
         ?>
        <div class="large-5 columns prof-col">
          <div class="panel <?php echo $i>2?"panel-search":""; ?>">
            <?php 
            $featuredimage=feautured_image($searchvalue->id);
            if($i<=4 && $featuredimage) { ?>
              <div class="th radius feat-img">
                <img src="<?php echo wpse_resizeimage($featuredimage,291); ?>" alt="image"/> 
              </div>
            <?php } ?>
            <div class="row prof-cont">
              <div class="small-3 columns">
                <div class="comp-thumb"><img src="<?php echo $searchvalue->logo; ?>" alt="image" class="th radius"/> </div>
              </div>
              <div class="small-9 columns"> 
                <a href="<?php echo get_profileUrl($searchvalue->id); ?>" class="comp-name" title=""><?php echo $searchvalue->name; ?>
                </a>
                <div class="comp-short">
                  <?php echo substr($searchvalue->description, 0,300); ?>
                </div>
              </div>
            </div>
          </div>
        </div>
         <?php if($i%2==0) { ?>
         <div class="clearfix"></div>
        <?php } $i++; 
        }?>
        <?php if(search_count($searchterm)>6) {?>
          <div class="large-12 columns text-center isotope-item loadSection" id="load_more_<?php echo $searchvalue->id; ?>"> 
            <a role="button" class="button tiny radius more-btn more-btn-inner searchmore_button" href="#" id="<?php echo $searchvalue->id; ?>">Load More
            </a> 
          </div>
          <?php } ?>
      </div>
<!--Search results section ends--> 
      <?php } else { ?>
      <div class="profile-sec">
        <?php // Start the loop.
        while ( have_posts() ) : the_post(); 
          // Include the page content .
          the_content();
        // End the loop.
        endwhile;
        } ?>
      </div>
</div>
<div id="getSearchProfiles" class="row">
</div>

<?php get_footer(); ?>
