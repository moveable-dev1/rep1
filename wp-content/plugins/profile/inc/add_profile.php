<?php 

include( plugin_dir_path( __FILE__ ) . 'AddProfileInclude.php'); ?>

<div id="profilebody">
  <div class="form_description">
    <h1>Profile Admin</h1>
    <span>Lorem ipsum dummy text..</span> </div>
  <div class="column">
    <form id="adminprofile" class="newprofile custom" enctype="multipart/form-data" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>?page=add-profile">
      <ul>
        <li id="profile_type">
          <div class="main-label">Profile Type <span class="help-txt" id="CompHTxt"><strong>Company</strong> is defined as a Canadian company that has deployed innovative energy technologies and is seeking export opportunities</span><span class="help-txt" id="ProfHTxt" style="display:none;"><strong>Project</strong> is defined as deployed initiatives using innovative energy technologies and solutions by Canadian companies.</span></div>
          <div class="mb">
            <label for="company" class="fw-nrml">
              <input id="company" name="profile_type" class="element radio" 
				type="radio" value="1" <?php echo $_POST['profile_type']==1? "checked='checked'":"checked='checked'"; ?>>
              Company </label>
            <label for="project" class="fw-nrml">
              <input id="project" name="profile_type" class="element radio" 
				type="radio" value="2" <?php echo $_POST['profile_type']==2? "checked='checked'":""; ?>>
              Project</label>
          </div>
        </li>
        <li id="profile_name">
          <label class="type_label" for="name">Name </label>
          <input id="name" name="name" class="element text medium" 
				type="text" maxlength="150" value="<?php echo $_POST['name']; ?>" data-validation="required" />
        </li>
        <li id="profile_logo">
          <label for="logo"> Logo <span class="upload"> <span class="file-status">file name</span>
            <input id="logo" name="logo" class="element file" type="file" data-validation="required" />
            </span> </label>
        </li>
        <li id="profile_affiliated">
          <div class="main-label">Affiliated Companies <span class="help-txt" id="profileType">Provide up to 20 company names. If a company is not listed on this website, you may direct them to the following URL to submit a profile: (<a href="#">Submit a Profile webform</a>).</span></div>
          <div class="has-btn">
            <label class="type_label fw-nrml main-sub-label" for="affiliated">Company Name</label>
            <input id="affiliated" name="affiliated[]" class="element text medium" type="text" value="<?php echo $_POST['affiliated'][0]; ?>" data-validation="required" />
            <label class="type_label fw-nrml main-sub-label" for="affiliated_url">Company URL</label>
            <input id="affiliated_url" name="affiliated_url[]" class="element text medium" type="text" value="<?php echo $_POST['affiliated_url'][0]; ?>" />
          </div>
        </li>
        <div class="fw-nrml sub-label mb">
          <hr>
          <a class="add-field-btn" role="button" id="addinput" onclick="addinput(elementid='profile_affiliated',limit=21,postname='affiliated',postname2='affiliated_url')">Add Another Company</a> </div>
        <li id="profile_featured">
          <div class="main-label">Upload Featured Images (Optional) <span class="help-txt" id="profileType">Providing at least one image of your innovation is highly recommended to increase the visibility of your profile on the site.</span></div>
          <div class="has-rt-btn">
            <label><span class="upload"> <span class="file-status">file name</span>
              <input name="feauturedimage[]" type="file" id="feauturedimage" class="feauturedimage">
              </span> </label>
            <div class="fl-btn">
              <input name="feauturedimageradio[]" type="radio" id="feauturedimageradio" onclick="getElement()">
              <span class="type_label fw-nrml " for="featured_image">Featured Image</span></div>
          </div>
        </li>
        <div class="fw-nrml sub-label mb">
          <hr>
          <a class="add-field-btn" role="button" id="add_featuredimage" onclick="addfeaturedimage(limit=9)">Add Another</a>
          <input type="hidden" value="" id="feauturedimagevalue" name="feauturedimagevalue"/>
        </div>
        <li id="profile_tags">
          <div class="main-label">Categories</div>
          <div id="level1">
            <div class="sub-label">Level 1</div>
            <?php
  				//Display all Parent Category
  				$args = array(
     					 'parent'         => 8, //Get all category of profile category ID=8
     					 'hide_empty'    => false,
  				); 
  				$parentcategory = get_categories($args);
          $qty=1;
  				foreach ($parentcategory as $catvalue) {
  				?>
              <label class="type_label fw-nrml" for="item1">
                <input id="parent_cat" name="term_taxonomy_id[]" class="element checkbox" type="checkbox" value="<?php echo $catvalue->cat_ID; ?>" data-validation="checkbox_group" <?php echo $qty==1 ? 'data-validation-qty="min1"':""; ?>>
                <?php echo $catvalue->cat_name; ?>
              </label>

          <?php $qty++;
  				}
  				?>
            
          </div>
          <div id="level2">
            <div class="sub-label">Level 2</div>
          </div>
          <div id="level3">
            <div class="sub-label">Level 3</div>
          </div>
        </li>
        <li id="profile_suggesttags">
          <label class="sub-label" for="suggesttags">Suggest New Tags (Optional)
            <textarea id="suggesttags" name="suggesttags" class="element textarea small"><?php echo $_POST['suggesttags']; ?></textarea>
          </label>
        </li>
        <li id="profile_region">
          <div class="main-label">Region</div>
          <div class="mb">
            <label class="fw-nrml" for="ontario">
              <input id="ontario" name="region" class="element radio" type="radio" value="1" <?php echo $_POST['region']==1 ? "checked='checked'":"checked='checked'"; ?>>
              Ontario</label>
            <label class="fw-nrml" for="canada">
              <input id="canada" name="region" class="element radio" type="radio" value="2" <?php echo $_POST['region']==2 ? "checked='checked'":""; ?>>
              Canada</label>
            <label class="fw-nrml" for="worldwide">
              <input id="worldwide" name="region" class="element radio" type="radio" value="3" <?php echo $_POST['region']==3 ? "checked='checked'":""; ?>>
              Worldwide</label>
          </div>
        </li>
        <li id="profile_location">
          <div class="main-label">Location(s) <span class="help-txt">At least one location is required. If you’re a Company, include your head office address. If you’re a Project, include deployed location(s).</span> </div>
          <label class="fw-nrml main-sub-label" for="streetaddress">Street Address
            <input id="streetaddress" name="streetaddress[]" class="element text large" value="<?php echo $_POST['streetaddress'][0]; ?>" type="text" data-validation="required">
          </label>
          <label class="fw-nrml main-sub-label" for="city">City
            <input id="city" name="city[]" class="element text medium" value="<?php echo $_POST['city'][0]; ?>" type="text" data-validation="required">
          </label>
          <label class="fw-nrml main-sub-label" for="state">State / Province / Region
            <input id="state" name="state[]" class="element text medium" value="<?php echo $_POST['state'][0]; ?>" type="text" data-validation="required">
          </label>
          <label class="fw-nrml main-sub-label" for="postalcod">Postal / Zip Code
            <input id="postalcode" name="postalcode[]" class="element text medium" value="<?php echo $_POST['postalcode'][0]; ?>" type="text" data-validation="required">
          </label>
          <label class="fw-nrml main-sub-label" for="country">Country
            <input id="country" name="country[]" class="element text medium" value="<?php echo $_POST['country'][0]; ?>" type="text" data-validation="required">
          </label>
        </li>
        <div class="fw-nrml sub-label mb">
          <hr>
          <a id="add_address" onclick="add_address(limit=19)" class="add-field-btn">Add Another Location</a> </div>
        <li id="profile_description">
          <label for="description">Description
            <textarea id="description" name="description" class="element textarea medium mar-no" data-validation="required" maxlength="250"><?php echo $_POST['description']; ?></textarea>
            <span class="sub-label">250 maximum characters</span> </label>
        </li>
        <li id="profile_projectfunders" style="display:none">
          <div class="main-label">Project Funders <span class="help-txt">Provide up to 20 company names. If a company is not listed on this website, you may direct them to the following URL to submit a profile: (<a href="#">Submit a Profile webform</a>)</span> </div>
          <div class="has-btn">
            <label for="project_funders" class="type_label fw-nrml main-sub-label">Company Name</label>
            <input id="project_funders" name="project_funders[]" class="element text medium" type="text" value="<?php echo $_POST['project_funders'][0]; ?>">
            <label for="roject_fundersurl" class="type_label fw-nrml main-sub-label">Company URL</label>
            <input id="project_fundersurl" name="project_fundersurl[]" class="element text medium" type="text" value="<?php echo $_POST['project_fundersurl'][0]; ?>">
          </div>
        </li>
        <div class="fw-nrml sub-label mb" id="projectaddmore" style="display:none">
          <hr>
          <a id="addinput" onclick="addinput(elementid='profile_projectfunders',limit=21,postname='project_funders',postname2='project_fundersurl')" class="add-field-btn">Add Another Company</a> </div>
        <li id="profile_investors">
          <div class="main-label">Investors <span class="help-txt">Provide up to 20 company names. If a company is not listed on this website, you may direct them to the following URL to submit a profile: (<a href="#">Submit a Profile webform</a>)</span> </div>
          <div class="has-btn">
            <label for="investors" class="type_label fw-nrml main-sub-label">Company Name</label>
            <input id="investors" name="investors[]" class="element text medium" type="text" value="<?php echo $_POST['investors'][0]; ?>">
            <label for="investorsurl" class="type_label fw-nrml main-sub-label">Company URL</label>
            <input id="investorsurl" name="investorsurl[]" class="element text medium" type="text" value="<?php echo $_POST['investorsurl'][0]; ?>">
          </div>
        </li>
        <div class="fw-nrml sub-label mb" id="companyaddmore">
          <hr>
          <a id="addinput" onclick="addinput(elementid='profile_investors',limit=21,postname='investors',postname2='investorsurl')" class="add-field-btn">Add Another Company</a> </div>
        <li id="profile_email">
          <label for="email">Contact Email
            <input id="email" name="email" class="element text medium mar-no" type="text" value="<?php echo $_POST['email']; ?>" data-validation="email">
          </label>
          <label class="small-txt addn-txt" for="terms">
            <input type="checkbox" id="terms" class="cb" name="terms" data-validation="required" data-validation-error-msg="You must agree to the terms and conditions">
            By submitting your email, you have read and agree to the <a href="#" title="">terms of use</a>.</label>
        </li>
        <li id="profile_website">
          <label for="website">Website
            <input id="website" name="website" class="element text medium" type="text" value="<?php echo $_POST['website']?$_POST['website']:""; ?>" data-validation="url" data-validation-error-msg="Please enter correct website URL e.g. http://aec.com" placeholder="http://">
          </label>
        </li>
        <div class="main-label">Social Media <span class="help-txt">Users will be able to follow you on social media using the links provided</span> </div>
        <li id="profile_twitter">
          <label class="fw-nrml main-sub-label" for="twitter">Twitter
            <input id="twitter" name="twitter" class="element text medium" type="text" maxlength="150" value="<?php echo $_POST['twitter']; ?>">
          </label>
        </li>
        <li id="profile_facebook">
          <label class="fw-nrml main-sub-label" for="facebook">Facebook
            <input id="facebook" name="facebook" class="element text medium" type="text" maxlength="150" value="<?php echo $_POST['facebook']; ?>">
          </label>
        </li>
        <li id="profile_linkedin">
          <label class="fw-nrml main-sub-label" for="linkedin">LinkedIn
            <input id="linkedin" name="linkedin" class="element text medium" type="text" maxlength="150" value="<?php echo $_POST['linkedin']; ?>">
          </label>
        </li>
        <li id="profile_awards">
          <label class="type_label" for="awards">Awards and Recognitions</label>
           <?php $settings = array( 'media_buttons' => false,'quicktags' => false );
                $content = $_POST['awards'];                     
                $editor_id = 'awards';
                wp_editor( $content, $editor_id,$settings ); ?>
          <!-- <textarea id="awards" name="awards" class="element textarea medium" maxlength="250"><?php echo $_POST['awards']; ?></textarea> -->
        </li>
        <li id="profile_videos">
          <div class="main-label">Videos</div>
          <div class="has-btn">
            <input id="videos" name="videos[]" class="element text medium" type="text" value="<?php echo $_POST['videos'][0]; ?>">
          </div>
        </li>
        <div class="fw-nrml sub-label mb">
          <hr>
          <a class="add-field-btn" id="addsingleinput" onclick="addsingleinput(elementid='profile_videos',limit=6,postname='videos')">Add Another</a> </div>
        <li id="profile_featured">
          <div class="main-label">Is featured? </div>
          <div class="mb">
            <label for="featured_yes" class="fw-nrml">
              <input id="featured_yes" name="featured" class="element radio" type="radio" value="1" <?php echo $_POST['featured']==1 ? "checked='checked'":""; ?>>
              Yes</label>
            <label for="featured_no" class="fw-nrml">
              <input id="featured_no" name="featured" class="element radio" type="radio" value="0" <?php echo $_POST['featured']==0 ? "checked='checked'":""; ?>>
              No</label>
          </div>
        </li>
        <li id="profile_status">
          <div class="main-label">Status </div>
          <div class="mb">
            <label for="status_approved" class="fw-nrml">
              <input id="status_approved" name="status" class="element radio" type="radio" value="1" <?php echo $_POST['status']==1 ? "checked='checked'":""; ?>>
              Approved</label>
            <label for="status_unapproved" class="fw-nrml">
              <input id="status_unapproved" name="status" class="element radio" type="radio" value="0" <?php echo $_POST['status']==0 ? "checked='checked'":""; ?>>
              Unapproved</label>
          </div>
        </li>
        <li class="profile_buttons">
          <input type="hidden" name="form_id" value="">
          <input id="saveForm" class="button_text sub-btn" type="submit" name="submit" value="Submit">
        </li>
      </ul>
    </form>
  </div>
</div>
<!-- jQuery Validation --> 
<script src="<?php echo plugins_url( 'inc/assets/jquery.form-validator.min.js' , dirname(__FILE__) ); ?>"></script> 
<script>
jQuery("[name='term_taxonomy_id[]']:eq(0)")
  .valAttr('','validate_checkbox_group')
  .valAttr('qty','1-100')
  .valAttr('error-msg','At least one category is required. ');
jQuery.validate({
  form : '#adminprofile',
  errorMessagePosition : 'top',
  validateOnBlur : false,
});
</script> 
