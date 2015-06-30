<?php
/**
 * Template Name: Submit a profile
 *
 * Description: Submit profile for company and projects
 *
 * @package Marsaec
 * 
 */
global $road_opt;

get_header();
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
    <div class="large-6 columns">
      <form id="CompProfileForm" class="custom">
        <div class="main-label">Profile Type <span class="help-txt" id="profileType">Help Text: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span></div>
        <div class="mb">
          <label for="company" class="fw-nrml">
            <input type="radio" value="1" name="profile" class="rb" id="company">
            <span class="custom radio"></span>Company </label>
          <label for="project" class="fw-nrml">
            <input type="radio" name="profile"  value="1" class="rb" id="project">
            <span class="custom radio"></span>Project</label>
        </div>
        <label for="name">Name
          <input type="text" name="name" id="name">
        </label>
        <label for="logoFile"> Logo <span class="upload"> <span class="file-status">file name</span>
          <input type="file" name="uploadLogo" id="logoFile"/>
          </span> </label>
        <label for="FImageFile"> Upload Featured Images (Optional) <span class="help-txt">Help Text: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span> <span class="upload"> <span class="file-status">file name</span>
          <input type="file" name="uploadFImages" id="FImageFile"/>
          </span> </label>
        <div class="fw-nrml sub-label">
          <hr>
          <button class="add-field-btn"></button>
          Add Another </div>
        <div class="main-label">Categories <span class="help-txt">Help Text: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span> </div>
        <div class="sub-label">Level 1</div>
        <ul class="small-block-grid-2">
          <li>
            <label for="item1" class="fw-nrml">
              <input type="checkbox" class="cb" id="item1">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
          <li>
            <label for="item2" class="fw-nrml">
              <input type="checkbox" class="cb" id="item2">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
          <li>
            <label for="item3" class="fw-nrml">
              <input type="checkbox" class="cb" id="item3">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
          <li>
            <label for="item4" class="fw-nrml">
              <input type="checkbox" class="cb" id="item4">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
        </ul>
        <div class="sub-label">Level 2 </div>
        <ul class="small-block-grid-2">
          <li>
            <label for="item5" class="fw-nrml">
              <input type="checkbox" class="cb" id="item5">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
          <li>
            <label for="item6" class="fw-nrml">
              <input type="checkbox" class="cb" id="item6">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
          <li>
            <label for="item7" class="fw-nrml">
              <input type="checkbox" class="cb" id="item7">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
          <li>
            <label for="item8" class="fw-nrml">
              <input type="checkbox" class="cb" id="item8">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
        </ul>
        <div class="sub-label">Level 3 </div>
        <ul class="small-block-grid-2">
          <li>
            <label for="item9" class="fw-nrml">
              <input type="checkbox" class="cb" id="item9">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
          <li>
            <label for="item10" class="fw-nrml">
              <input type="checkbox" class="cb" id="item10">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
          <li>
            <label for="item11" class="fw-nrml">
              <input type="checkbox" class="cb" id="item11">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
          <li>
            <label for="item12" class="fw-nrml">
              <input type="checkbox" class="cb" id="item12">
              <span class="custom checkbox"></span>Item Selection</label>
          </li>
        </ul>
        <label for="tags" class="sub-label">Suggest New Tags (Optional)
          <textarea id="tags"></textarea>
        </label>
        <div class="main-label">Region</div>
        <div class="mb">
          <label for="region1" class="fw-nrml">
            <input type="radio" value="1" name="region" class="rb" id="region1">
            <span class="custom radio"></span>Ontario</label>
          <label for="region2" class="fw-nrml">
            <input type="radio" value="1" name="region" class="rb" id="region2">
            <span class="custom radio"></span>Canada</label>
          <label for="region3" class="fw-nrml">
            <input type="radio" value="1" name="region" class="rb" id="region3">
            <span class="custom radio"></span>Worldwide</label>
        </div>
        <div class="main-label">Location(s) <span class="help-txt">Help Text: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span> </div>
        <div class="has-btn">
          <label for="address" class="fw-nrml main-sub-label">Street Address</label>
          <input type="text" name="streetAdd" id="address">
          <span class="fw-nrml sub-label">
          <button class="remove-field-btn"></button>
          Remove Address</span> </div>
        <label for="city" class="fw-nrml main-sub-label">City
          <input type="text" name="city" id="city">
        </label>
        <label for="state" class="fw-nrml main-sub-label">State / Province / Region
          <input type="text" name="state" id="state">
        </label>
        <label for="zip" class="fw-nrml main-sub-label">ZIP / Postal Code
          <input type="text" name="zip" id="zip">
        </label>
        <label for="country" class="fw-nrml main-sub-label">Country
          <input type="text" name="country" id="country">
        </label>
        <div class="fw-nrml sub-label">
          <hr>
          <button class="add-field-btn"></button>
          Add Another Location </div>
        <label for="description">Description <span class="help-txt">Help Text: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span>
          <textarea class="mar-no" id="description"></textarea>
          <span class="sub-label">250 maximum characters</span> </label>
        <div class="main-label">Investors <span class="help-txt">Help Text: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span> </div>
        <div class="has-btn">
          <label for="investorName" class="fw-nrml main-sub-label">Investor Name</label>
          <input type="text" name="investorName" id="investorName">
          <span class="fw-nrml sub-label">
          <button class="remove-field-btn"></button>
          Remove Investor</span> </div>
        <div class="fw-nrml sub-label">
          <hr>
          <button class="add-field-btn"></button>
          Add Another Investor </div>
        <label for="email">Contact Email
          <input type="text" name="contactEmail"  class="mar-no" id="email">
        </label>
        <label for="terms" class="small-txt addn-txt">
          <input type="checkbox" data-validation="required" name="terms" class="cb" id="terms">
          <span data-validation="required" class="custom checkbox"></span>By submitting your email, you have read and agree to the <a title="" href="#">terms of use</a>.</label>
        <label for="website">Website
          <input type="text" name="website" id="website">
        </label>
        <div class="main-label">Social Media <span class="help-txt">Help Text: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span> </div>
        <label for="twitterLink" class="fw-nrml main-sub-label">Twitter
          <input type="text" name="twitterLink" id="twitterLink">
        </label>
        <label for="fbLink" class="fw-nrml main-sub-label">Facebook
          <input type="text" name="fbLink" id="fbLink">
        </label>
        <label for="inlink" class="fw-nrml main-sub-label">Linkedin
          <input type="text" name="inLink" id="inlink">
        </label>
        <input type="submit" value="SAVE / UPDATE" class="sub-btn">
      </form>
    </div>
    <div class="large-6 columns"> </div>
    <div class="large-12 columns">
      <div class="form-btm-txt">Please note that all responses are up to individual companies’/project’s discretion. A Visible AEC administrator will be copied on your message for information purposes only.<br>
        Please don’t hesitate to contact the Advanced Energy Centre if you would like to collaborate further: advancedenergycentre@marsdd.com </div>
    </div>
  </div>
</div>
<!--Form section ends--> 

<?php get_footer(); ?>