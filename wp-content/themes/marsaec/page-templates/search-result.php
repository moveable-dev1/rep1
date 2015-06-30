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
    <div class="large-5 columns prof-col">
      <div class="panel">
        <div class="th radius feat-img"><img src="img/profile-pic1.jpg" alt="image"/> </div>
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img1.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 large-offset-2 columns prof-col">
      <div class="panel">
        <div class="th radius feat-img"><img src="img/profile-pic2.jpg" alt="image"/> </div>
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 columns prof-col">
      <div class="panel panel-search">
        <div class="th radius feat-img"><img src="img/profile-pic1.jpg" alt="image"/> </div>
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img1.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 large-offset-2 columns prof-col">
      <div class="panel panel-search">
        <div class="th radius feat-img"><img src="img/profile-pic2.jpg" alt="image"/> </div>
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 columns prof-col">
      <div class="panel panel-search">
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 large-offset-2 columns prof-col">
      <div class="panel panel-search">
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 columns prof-col">
      <div class="panel panel-search">
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 large-offset-2 columns prof-col">
      <div class="panel panel-search">
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 columns prof-col">
      <div class="panel panel-search">
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 large-offset-2 columns prof-col">
      <div class="panel panel-search">
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 columns prof-col">
      <div class="panel panel-search">
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
    <div class="large-5 large-offset-2 columns prof-col">
      <div class="panel panel-search">
        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="img/company-img2.jpg" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title="">Company / Project Title</a>
            <div class="comp-short">Morbi ultricies eros vel varius luctus. Proin ullamcorper, quam ut ultrices aliquet, nulla purus molestie lacus, et lobortis ipsum ante sed diam.</div>
          </div>
        </div>
      </div>
    </div>
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
