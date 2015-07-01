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
wp_enqueue_script( 'addprofile', get_template_directory_uri() . '/js/profile.js', array( 'jquery' ), '1.0', true );
require get_template_directory() . '/inc/add-profile.php';
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
      <form id="CompProfileForm" class="custom" enctype="multipart/form-data" method="post" action="<?php echo get_permalink( 20 ); ?>">

      <div id="profile_type">
        <div class="main-label">Profile Type <span class="help-txt" id="CompHTxt"><strong>Company</strong> is defined as a Canadian company that has deployed innovative energy technologies and is seeking export opportunities</span><span class="help-txt" id="ProfHTxt" style="display:none;"><strong>Project</strong> is defined as deployed initiatives using innovative energy technologies and solutions by Canadian companies.</span></div>
        <div class="mb">
          <label for="company" class="fw-nrml">
            <input type="radio" value="1" name="profile_type" class="rb" id="company" <?php echo $_POST['profile_type']==1? "checked='checked'":"checked='checked'"; ?>>
            <span class="custom radio"></span>Company </label>
          <label for="project" class="fw-nrml">
            <input type="radio" name="profile_type"  value="2" class="rb" id="project" <?php echo $_POST['profile_type']==2? "checked='checked'":""; ?>>
            <span class="custom radio"></span>Project</label>
        </div>
      </div>

      <div id="profile_name">
        <label for="name">Name
          <input type="text" name="name" id="name" value="<?php echo $_POST['name']; ?>" maxlength="150" data-validation="required">
        </label>
        <label for="logoFile"> Logo <span class="upload"> <span class="file-status">file name</span>
          <input type="file" name="logo" id="logo" data-validation="required"/>
          </span> 
        </label>
      </div>

      <div id="profile_affiliated">
        <div class="main-label">Affiliated Companies 
          <span class="help-txt" id="profileType">Provide up to 20 company names. If a company is not listed on this website, you may direct them to the following URL to submit a profile: (<a href="#">Submit a Profile webform</a>).
          </span> 
        </div>
        <div class="has-btn">
          <label for="affiliated" class="fw-nrml main-sub-label">Investor Name</label>
          <input type="text" name="affiliated[]" id="affiliated" value="<?php echo $_POST['affiliated'][0]; ?>" data-validation="required">
          <span class="fw-nrml sub-label">
          <button class="remove-field-btn"></button>
          Remove Company</span> </div>
        <div class="fw-nrml sub-label">
          <hr>
          <button class="add-field-btn" id="addinput" onclick="addinput(elementid='profile_affiliated',limit=21,postname='affiliated',postname2='affiliated_url')"></button>
          Add Another Company </div>
      </div>

      <div id="profile_featured">
        <label for="FImageFile"> Upload Featured Images (Optional) 
          <span class="help-txt">Providing at least one image of your innovation is highly recommended to increase the visibility of your profile on the site.</span> <span class="upload"> 
          <span class="file-status">file name</span>
          <input type="file" name="feauturedimage[]" id="feauturedimage"/>
          </span> 
        </label>
        <div class="fl-btn">
          <input name="feauturedimageradio[]" type="radio" id="feauturedimageradio" onclick="getElement()">
          <span class="type_label fw-nrml " for="featured_image">Featured Image</span>
        </div>
        <div class="fw-nrml sub-label">
          <hr>
          <button class="add-field-btn" id="add_featuredimage" onclick="addfeaturedimage(limit=9)"></button>
          Add Another 
        </div>
        <input type="hidden" value="" id="feauturedimagevalue" name="feauturedimagevalue"/>
      </div>

      <div id="profile_tags">
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
      </div>

      <div id="profile_suggesttags">
        <label for="tags" class="sub-label">Suggest New Tags (Optional)
          <textarea id="suggesttags" name="suggesttags"><?php echo $_POST['suggesttags']; ?></textarea>
        </label>
      </div>

      <div id="profile_region">
        <div class="main-label">Region</div>
        <div class="mb">
          <label for="region1" class="fw-nrml">
            <input type="radio" name="region" class="rb" id="region1" value="1" <?php echo $_POST['region']==1 ? "checked='checked'":"checked='checked'"; ?>>
            <span class="custom radio"></span>Ontario</label>
          <label for="region2" class="fw-nrml">
            <input type="radio" name="region" class="rb" id="region2" value="2" <?php echo $_POST['region']==2 ? "checked='checked'":""; ?>>
            <span class="custom radio"></span>Canada</label>
          <label for="region3" class="fw-nrml">
            <input type="radio" name="region" class="rb" id="region3" value="3" <?php echo $_POST['region']==3 ? "checked='checked'":""; ?>>
            <span class="custom radio"></span>Worldwide</label>
        </div>
      </div>

      <div id="profile_location">
        <div class="main-label">Location(s) <span class="help-txt">At least one location is required. If you’re a Company, include your head office address. If you’re a Project, include deployed location(s).</span> </div>
        <div class="has-btn">
          <label for="address" class="fw-nrml main-sub-label">Street Address</label>
          <input id="streetaddress" name="streetaddress[]" value="<?php echo $_POST['streetaddress'][0]; ?>" type="text" data-validation="required">
          <span class="fw-nrml sub-label">
          <button class="remove-field-btn"></button>
          Remove Address</span> </div>
        <label for="city" class="fw-nrml main-sub-label">City
          <input type="text" id="city" name="city[]" value="<?php echo $_POST['city'][0]; ?>" data-validation="required">
        </label>
        <label for="state" class="fw-nrml main-sub-label">State / Province / Region
          <input type="text" id="state" name="state[]" value="<?php echo $_POST['state'][0]; ?>" data-validation="required">
        </label>
        <label for="zip" class="fw-nrml main-sub-label">ZIP / Postal Code
          <input type="text" id="postalcode" name="postalcode[]" value="<?php echo $_POST['postalcode'][0]; ?>" data-validation="required">
        </label>
        <label for="country" class="fw-nrml main-sub-label">Country
          <input type="text" id="country" name="country[]" value="<?php echo $_POST['country'][0]; ?>" data-validation="required">
        </label>
        <div class="fw-nrml sub-label">
          <hr>
          <button class="add-field-btn" id="add_address" onclick="add_address(limit=19)"></button>
          Add Another Location </div>
      </div>

      <div id="profile_description">
        <label for="description">Description <span class="help-txt">Help Text: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span>
        <textarea class="mar-no" id="description" name="description" data-validation="required"><?php echo $_POST['description']; ?></textarea>
        <span class="sub-label">250 maximum characters</span> </label>
      </div>

      <div id="profile_projectfunders">
        <div class="main-label">Project Funders 
          <span class="help-txt">Provide up to 20 company names. If a company is not listed on this website, you may direct them to the following URL to submit a profile: (<a href="#">Submit a Profile webform</a>)</span> 
        </div>
        <div class="has-btn">
          <label for="project_funders" class="fw-nrml main-sub-label">Company Name</label>
          <input type="text" id="project_funders" name="project_funders[]" value="<?php echo $_POST['project_funders'][0]; ?>">
          <span class="fw-nrml sub-label">
          <button class="remove-field-btn"></button>
          Remove Company</span> 
        </div>
        <div class="fw-nrml sub-label">
          <hr>
          <button class="add-field-btn" id="addinput" onclick="addinput(elementid='profile_projectfunders',limit=21,postname='project_funders',postname2='project_fundersurl')" class="add-field-btn"></button>
          Add Another Company 
        </div>
      </div>

      <div id="profile_investors">
        <div class="main-label">Investors <span class="help-txt">Provide up to 20 company names. If a company is not listed on this website, you may direct them to the following URL to submit a profile: (<a href="#">Submit a Profile webform</a>)</span> </div>
        <div class="has-btn">
          <label for="investorName" class="fw-nrml main-sub-label">Company Name</label>
          <input type="text" id="investors" name="investors[]" value="<?php echo $_POST['investors'][0]; ?>">
          <span class="fw-nrml sub-label">
          <button class="remove-field-btn"></button>
          Remove Company</span> </div>
        <div class="fw-nrml sub-label">
          <hr>
          <button class="add-field-btn" id="addinput" onclick="addinput(elementid='profile_investors',limit=21,postname='investors',postname2='investorsurl')"></button>
          Add Another Company </div>
      </div>

      <div id="profile_email">
        <label for="email">Contact Email
          <input type="text" id="email" name="email" class="mar-no" value="<?php echo $_POST['email']; ?>" data-validation="email">
        </label>
        <label for="terms" class="small-txt addn-txt">
          <input type="checkbox" data-validation="required" name="terms" class="cb" id="terms">
          <span data-validation="required" class="custom checkbox"></span>By submitting your email, you have read and agree to the <a title="" href="#">terms of use</a>.</label>
      </div>

      <div id="profile_website">
        <label for="website">Website
          <input type="text" id="website" name="website" value="<?php echo $_POST['website']?$_POST['website']:""; ?>" data-validation="url" data-validation-error-msg="Please enter correct website URL e.g. http://aec.com" placeholder="http://">
        </label>
      </div>


        <div class="main-label">Social Media <span class="help-txt">Users will be able to follow you on social media using the links provided</span> </div>
          <div id="profile_twitter">
            <label for="twitterLink" class="fw-nrml main-sub-label">Twitter
              <input type="text" id="twitter" name="twitter" maxlength="150" value="<?php echo $_POST['twitter']; ?>">
            </label>
          </div>

          <div id="profile_facebook">
            <label for="fbLink" class="fw-nrml main-sub-label">Facebook
              <input type="text" id="facebook" name="facebook" maxlength="150" value="<?php echo $_POST['facebook']; ?>">
            </label>
          </div>

          <div id="profile_linkedin">
            <label for="inlink" class="fw-nrml main-sub-label">Linkedin
              <input type="text" id="linkedin" name="linkedin" maxlength="150" value="<?php echo $_POST['linkedin']; ?>">
            </label>
          </div>

        <input type="hidden" name="form_id" value="">
        <input type="submit" value="SAVE / UPDATE" class="sub-btn" id="saveForm" name="submit">
      </form>
    </div>
    <div class="large-6 columns"> </div>
    <div class="large-12 columns">
      <div class="form-btm-txt">Please note that all responses are up to individual companies’/project’s discretion. A Visible AEC administrator will be copied on your message for information purposes only.<br>
        Please don’t hesitate to contact the Advanced Energy Centre if you would like to collaborate further: advancedenergycentre@marsdd.com </div>
    </div>
  </div>
</div>
</div>
<!--Form section ends--> 

<?php get_footer(); ?>