<?php
if(isset($_GET['profileid'])) { 
include( plugin_dir_path( __FILE__ ) . 'EditProfileInclude.php');
?>

<div id="profilebody">
 <div class="form_description">
  <h1>Profile <?php echo $profileName->name; ?></h1>
  <h3>Lorem ipsum dummy text..</h3>
</div>
<form id="adminprofile" class="newprofile" enctype="multipart/form-data" method="post" action="admin.php?page=edit-profile&profileid=<?php echo $profileId; ?>">
  <div class="column">
  <ul>
    <li id="profile_type">
      <div class="main-label">Profile Type</div>
      <div class="mb">
        <label for="company" class="fw-nrml">
          <input id="company" name="profile_type" class="element radio" type="radio" value="1" <?php echo $profileName->profile_type==1? "checked='checked'":""; ?>>
          Company </label>
        <label for="project" class="fw-nrml">
          <input id="project" name="profile_type" class="element radio" type="radio" value="2" <?php echo $profileName->profile_type==2? "checked='checked'":""; ?>>
          Project</label>
      </div>
    </li>
    <li id="profile_name">
      <label class="type_label" for="name">Name </label>
      <input id="name" name="name" class="element text medium" type="text" value="<?php echo $profileName->name; ?>" data-validation="required" />
    </li>
    <li id="profile_logo">
      <div for="logo">
        <div class="main-label">Logo </div>
        <?php $imageUrl=$profileName->logo; ?>
        <span class="logoimage"><img src="<?php echo wpse_resizeimage($imageUrl,100); ?>" alt="logo"/></span>
        <label for="logo" class="fw-nrml main-sub-label">Change Image <span class="upload"> <span class="file-status">file name</span>
          <input id="logo" name="logo" class="element file" type="file"/>
          </span> </label>
      </div>
    </li>
    <li id="profile_affiliated">
      <div class="main-label">Affiliated Companies</div>
      <div class="has-btn">
        <?php
        //Affiliated Company Name Id=1, URL id=2
        $getAffCompany=GetSingle($metaid=1,$profileId);
        if(!empty($getAffCompany)){
          foreach ($getAffCompany as $AffValue) {
            ?>
        <hr>
        <label class="type_label fw-nrml main-sub-label" for="affiliated">Company Name</label>
        <input id="affiliated" name="affiliated[]" class="element text medium" 
            type="text" value="<?php  echo $AffValue->value; ?>" />
        <label class="type_label fw-nrml main-sub-label" for="affiliated_url">Company URL</label>
        <input id="affiliated_url" name="affiliated_url[]" class="element text medium" 
            type="text" value="<?php echo GetSet($metaid=2, $fieldid=$AffValue->fieldid,$profileId); ?>" />
        <?php   
          } //endforeach
        } //endif isset
      else { //If No Field found display input fields ?>
        <label class="type_label fw-nrml main-sub-label" for="affiliated">Company Name</label>
        <input id="affiliated" name="affiliated[]" class="element text medium" 
          type="text" value="" data-validation="required" />
        <label class="type_label fw-nrml main-sub-label" for="affiliated_url">Company URL</label>
        <input id="affiliated_url" name="affiliated_url[]" class="element text medium" 
          type="text" value="" />
        <?php }
       ?>
      </div>
    </li>
    <div class="fw-nrml sub-label mb">
      <hr>
      <a class="add-field-btn" role="button" id="addinput" onclick="addinput(elementid='profile_affiliated',limit=21,postname='affiliated',postname2='affiliated_url')">Add Another Company</a> </div>
    <li id="profile_featured">
      <?php
      //Featured Image ID=8
      $getfetauredImage=GetSingle($metaid=8,$profileId);
      if(!empty($getfetauredImage)){
        $Checkfeatured=1;
        foreach ($getfetauredImage as $FeaValue) {
            // Get Featured Image Is_Featured ID=9;
            $getIsfetaured=GetSet($metaid=9, $fieldid=$FeaValue->fieldid,$profileId);
            if(!empty($getIsfetaured)){
              if($getIsfetaured==$Checkfeatured){ 
                $CheckIsFeatured="checked=checked"; //Set Featured Image
              }
            }
          ?>
      <div class="main-label">Featured Image</div>
      <div class="has-rt-btn mb">
        <hr>
        <label> <span class="logoimage"><img src="<?php echo wpse_resizeimage($FeaValue->value,100); ?>"/></span> </label>
        <div class="fl-btn">
          <input name="removeimage[]" type="checkbox" id="removeimage" value="<?php echo $Checkfeatured; ?>">
          <span for="featured_image" class="type_label fw-nrml ">Remove Image</span>
          <input name="feauturedimageradio[]" type="radio" id="feauturedimageradio" onclick="getElement()" <?php echo $CheckIsFeatured; ?>>
          <span for="featured_image" class="type_label fw-nrml ">Featured Image</span></div>
      </div>
      <?php 
            unset($CheckIsFeatured);
            $Checkfeatured++; 
          } //endforach
      } else{ //elseIf featured image not found ?>
      <div class="main-label">Featured Image</div>
      <div class="has-rt-btn mb">
        <input name="feauturedimage[]" type="file" id="feauturedimage">
        <div class="fl-btn">
          <input name="feauturedimageradio[]" type="radio" id="feauturedimageradio" onclick="getElement()">
          <span class="type_label fw-nrml" for="feauturedimageradio">Featured Image</span> </div>
      </div>
      <?php }
       ?>
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
             'parent'         => 8, //Get all category of profile
             'hide_empty'    => false,
        ); 
        $parentcategory = get_categories($args); 
        $getSelectedCat=GetSingle($metaid=16,$profileId); //Get all taxanomy for user, ID=16

        foreach ($parentcategory as $catvalue) {
          if(!empty($getSelectedCat)){
            foreach ($getSelectedCat as $Selectedvalue) {
              $checkedvalue=$Selectedvalue->value;
              $taxanomyid=$catvalue->cat_ID;
              if($checkedvalue==$taxanomyid){
                $level2checks[]=$checkedvalue; //Add into array parent category in level 2
              } else{
                  $level2checks[]="";
                }
            }
          }
         //Select category checkbox
         if (is_array($level2checks) && in_array($catvalue->cat_ID, $level2checks)) {
            $selectchecbox="checked=checked"; //Check category
         } else {
          $selectchecbox="";
         } ?>
        <label class="type_label fw-nrml" for="parent_cat">
          <input id="parent_cat" name="term_taxonomy_id[]" class="element checkbox" type="checkbox" value="<?php echo $catvalue->cat_ID; ?>" <?php echo $selectchecbox; ?> />
          <?php echo $catvalue->cat_name; ?></label>
        <?php
        }
        ?>
      </div>
      <div id="level2">
        <div class="sub-label">Level 2</div>
        <?php 
          //Display all level 2 category if selected in level 1 category
          if(is_array($level2checks)) {
           
            foreach($level2checks as $level2values){
              if(!empty($level2values)) {
              $argsLevel2 = array(
                   'parent'         => $level2values, //Get all category of profile
                   'hide_empty'    => false,
              ); 
              $parentcategoryLevel2 = get_categories($argsLevel2);
              $getSelectedCatLevel2=GetSingle($metaid=16,$profileId); //taxanomy ID=16
               echo "<div id='getallcat".$level2values."'>";
              foreach ($parentcategoryLevel2 as $catvalueLevel2) {
                if(!empty($getSelectedCatLevel2)){
                  foreach ($getSelectedCatLevel2 as $SelectedvalueLevel2) {
                    $checkedvalueLevel2=$SelectedvalueLevel2->value;
                    $taxanomyidLevel2=$catvalueLevel2->cat_ID;
                    if($checkedvalueLevel2==$taxanomyidLevel2){
                      $level3checks[]=$checkedvalueLevel2;
                    }
                    else{
                      $level3checks[]="";
                    }
                  }
                }
               //Select category
               if (in_array($catvalueLevel2->cat_ID, $level3checks)) {
                  $selectchecboxLevel2="checked=checked";
              } else {
                $selectchecboxLevel2="";
              } ?>
        <label class="type_label fw-nrml" for="parent_cat">
          <input id="parent_cat" name="term_taxonomy_id[]" class="element checkbox" type="checkbox" value="<?php echo $catvalueLevel2->cat_ID; ?>" <?php echo $selectchecboxLevel2; ?> />
          <?php echo $catvalueLevel2->cat_name; ?></label>
        <?php
              } ?>
        <input id="parent_id" name="parent_id" type="hidden" value="<?php echo $level2values; ?>">
      </div>
      <?php } 
          }//enforeach

        }//endif
          ?>
    </div>
    <div id="level3">
      <div class="sub-label">Level 3</div>
      <?php
          //Display all level 3 category if selected in level 2 category
        if(isset($level3checks)){
          foreach($level3checks as $level3values){
            if(!empty($level3values)) {
              $argsLevel3 = array(
                   'parent'         => $level3values, //Get all category of profile
                   'hide_empty'    => false,
              ); 
              $parentcategoryLevel3 = get_categories($argsLevel3);
              $getSelectedCatLevel3=GetSingle($metaid=16,$profileId); //taxanomy ID=16
              echo "<div id='getallcat".$level3values."'>";
              foreach ($parentcategoryLevel3 as $catvalueLevel3) {
                  if(!empty($getSelectedCatLevel3)){
                    foreach ($getSelectedCatLevel3 as $SelectedvalueLevel3) {
                      $checkedvalueLevel3=$SelectedvalueLevel3->value;
                      $taxanomyidLevel3=$catvalueLevel3->cat_ID;
                      if($checkedvalueLevel3==$taxanomyidLevel3){
                        $level4checks[]=$checkedvalueLevel3;
                      }
                      else{
                        $level4checks[]="";
                      }
                    }
                  }
                //Select category
                if (in_array($catvalueLevel3->cat_ID, $level4checks)) {
                    $selectchecboxLevel3="checked=checked";
                } else {
                  $selectchecboxLevel3="";
                } ?>
      <label class="type_label fw-nrml" for="parent_cat">
        <input id="parent_cat" name="term_taxonomy_id[]" class="element checkbox" type="checkbox" value="<?php echo $catvalueLevel3->cat_ID; ?>" <?php echo $selectchecboxLevel3; ?> />
        <?php echo $catvalueLevel3->cat_name; ?></label>
      <?php
              }
               ?>
      <input id="parent_id" name="parent_id" type="hidden" value="<?php echo $level3values; ?>">
    </div>
    <?php
            }
          } //enforeach
        } //endif
          ?>
    </div>
    </li>
    <li id="profile_suggesttags">
      <?php
        //Tags ID=15
        $getTags=GetSingle($metaid=15,$profileId); //Get Tag Value
        if(!empty($getTags)){
          foreach ($getTags as $TagsValue) {
            $gettagvalue=$TagsValue->value;
          } 
        } else {
            $gettagvalue="";
        }
        
        ?>
      <label class="type_label" for="suggesttags">Suggest New Tags
        <textarea id="suggesttags" name="suggesttags" class="element textarea small fw-nrml"><?php echo $gettagvalue; ?></textarea>
      </label>
    </li>
    <li id="profile_region">
      <div class="main-label">Region</div>
      <div class="mb">
      <label class="fw-nrml" for="ontario">
        <input id="ontario" name="region" class="element radio" type="radio" value="1" <?php echo $profileName->region==1 ? "checked='checked'":""; ?>>
        Ontario</label>
      <label class="fw-nrml" for="canada">
        <input id="canada" name="region" class="element radio" type="radio" 
        value="2" <?php echo $profileName->region==2 ? "checked='checked'":""; ?>>
        Canada</label>
      <label class="fw-nrml" for="worldwide">
        <input id="worldwide" name="region" class="element radio" type="radio" 
        value="3" <?php echo $profileName->region==3 ? "checked='checked'":""; ?>>
        Worldwide</label>
    </li>
    <li id="profile_location">
      <div class="main-label">Location(s)</div>
      <?php
        //Street Address= 3, City=4, state=5, country=6, postal code=7
        $getStreet=GetSingle($metaid=3,$profileId);
        if(!empty($getStreet)){
          foreach ($getStreet as $StreetValue) { //Get All Address
            ?>
      <hr>
      <label class="fw-nrml main-sub-label" for="streetaddress">Street Address
        <input id="streetaddress" name="streetaddress[]" class="element text large" 
          value="<?php echo $StreetValue->value; ?>" type="text">
      </label>
      <label class="fw-nrml main-sub-label" for="city">City
        <input id="city" name="city[]" class="element text medium" value="<?php echo GetSet($metaid=4, $fieldid=$StreetValue->fieldid,$profileId); ?>" type="text">
      </label>
      <label class="fw-nrml main-sub-label" for="state">State / Province / Region
        <input id="state" name="state[]" class="element text medium" value="<?php echo GetSet($metaid=5, $fieldid=$StreetValue->fieldid,$profileId); ?>" type="text">
      </label>
      <label class="fw-nrml main-sub-label" for="postalcod">Postal / Zip Code
        <input id="postalcode" name="postalcode[]" class="element text medium" 
          value="<?php echo GetSet($metaid=7, $fieldid=$StreetValue->fieldid,$profileId); ?>" type="text">
      </label>
      <label class="fw-nrml main-sub-label" for="country">Country
        <input id="country" name="country[]" class="element text medium" 
          value="<?php echo GetSet($metaid=6, $fieldid=$StreetValue->fieldid,$profileId); ?>" type="text">
        <?php 
          } 
        } else { //If address not found?>
      </label>
      <label class="fw-nrml main-sub-label" for="streetaddress">Street Address
        <input id="streetaddress" name="streetaddress[]" class="element text large" 
          value="" type="text" data-validation="required">
      </label>
      <label class="fw-nrml main-sub-label" for="city">City
        <input id="city" name="city[]" class="element text medium" value="" 
          type="text" data-validation="required">
      </label>
      <label class="fw-nrml main-sub-label" for="state">State / Province / Region
        <input id="state" name="state[]" class="element text medium" value="" 
          type="text" data-validation="required">
      </label>
      <label class="fw-nrml main-sub-label" for="postalcode">Postal / Zip Code
        <input id="postalcode" name="postalcode[]" class="element text medium" 
          value="" type="text" data-validation="required">
      </label>
      <label class="fw-nrml main-sub-label"for="country">Country
        <input id="country" name="country[]" class="element text medium" 
          value="" type="text" data-validation="required">
        <?php
        }
        
        ?>
      </label>
    </li>
    <div class="fw-nrml sub-label mb">
      <hr>
      <a id="add_address" onclick="add_address(limit=19)" role="button" class="add-field-btn">Add Another Location</a> </div>
    <li id="profile_description">
      <label class="type_label" for="description">Description
        <textarea id="description" name="description" class="element textarea medium" data-validation="required" maxlength="250"><?php echo $profileName->description; ?></textarea>
      </label>
    </li>
    <li id="profile_projectfunders">
      <div class="main-label">Project Funders</div>
      <?php
        //Project Funder name ID=10, URL=11
        $getFunders=GetSingle($metaid=10,$profileId);
        if(!empty($getFunders)){
          foreach ($getFunders as $FundersValue) { //Get all project funders
        ?>
      <hr>
      <label class="type_label fw-nrml main-sub-label" for="project_funders">Company Name</label>
      <input id="project_funders" name="project_funders[]" class="element text medium" 
        type="text" value="<?php echo $FundersValue->value; ?>">
      <label class="type_label fw-nrml main-sub-label" for="project_fundersurl">Company URL</label>
      <input id="project_fundersurl" name="project_fundersurl[]" class="element text medium" 
        type="text" value="<?php echo GetSet($metaid=11, $fieldid=$FundersValue->fieldid,$profileId); ?>">
      <?php 
          } 
        } else { //if project funders not found ?>
      <label class="type_label fw-nrml main-sub-label" for="project_funders">Company Name</label>
      <input id="project_funders" name="project_funders[]" class="element text medium" 
        type="text" value="">
      <label class="type_label fw-nrml main-sub-label" for="project_fundersurl">Company URL</label>
      <input id="project_fundersurl" name="project_fundersurl[]" class="element text medium" 
        type="text" value="">
      <?php
        }
        
      ?>
    </li>
    <div class="fw-nrml sub-label mb">
      <hr>
      <a class="add-field-btn" id="addinput" onclick="addinput(elementid='profile_projectfunders',limit=21,postname='project_funders',postname2='project_fundersurl')">Add Another Company</a> </div>
    <li id="profile_investors">
      <div class="main-label">Investors</div>
      <?php
        //Project Funder name ID=12, URL=13
        $getInvesters=GetSingle($metaid=12,$profileId);
        if(!empty($getInvesters)){
          foreach ($getInvesters as $InvestersValue) { //Get all investors
        ?>
      <hr>
      <label class="type_label fw-nrml main-sub-label" for="investors">Company Name</label>
      <input id="investors" name="investors[]" class="element text medium" 
        type="text" value="<?php echo $InvestersValue->value; ?>">
      <label class="type_label fw-nrml main-sub-label" for="investorsurl">Company URL</label>
      <input id="investorsurl" name="investorsurl[]" class="element text medium" 
        type="text" value="<?php echo GetSet($metaid=13, $fieldid=$InvestersValue->fieldid,$profileId); ?>">
      <?php 
          } 
        } else { //if investors not found ?>
      <label class="type_label fw-nrml main-sub-label" for="investors">Company Name</label>
      <input id="investors" name="investors[]" class="element text medium" 
        type="text" value="">
      <label class="type_label fw-nrml main-sub-label" for="investorsurl">Company URL</label>
      <input id="investorsurl" name="investorsurl[]" class="element text medium" 
        type="text" value="">
      <?php
        }
        
        ?>
    </li>
    <div class="fw-nrml sub-label mb">
      <hr>
      <a class="add-field-btn" id="addinput" onclick="addinput(elementid='profile_investors',limit=21,postname='investors',postname2='investorsurl')">Add Another Company</a> </div>
    <li id="profile_email">
      <label class="type_label" for="email">Contact Email
        <input id="email" name="email" class="element text medium" type="text" 
        value="<?php echo $profileName->email; ?>" data-validation="email">
      </label>
    </li>
    <li id="profile_website">
      <label class="type_label" for="website">Web Site
        <input id="website" name="website" class="element text medium" placeholder="http://"
        type="text" value="<?php echo $profileName->website; ?>" data-validation="url" data-validation-error-msg="Please enter correct website URL e.g. http://aec.com">
      </label>
    </li>
    <div class="main-label">Social Media</div>
    <li id="profile_twitter">
      <label class="fw-nrml main-sub-label" for="twitter">Twitter
        <input id="twitter" name="twitter" class="element text medium" 
        type="text" value="<?php echo $profileName->twitter; ?>">
      </label>
    </li>
    <li id="profile_facebook">
      <label class="fw-nrml main-sub-label" for="facebook">Facebook
        <input id="facebook" name="facebook" class="element text medium" 
        type="text" value="<?php echo $profileName->facebook; ?>">
      </label>
    </li>
    <li id="profile_linkedin">
      <label class="fw-nrml main-sub-label" for="linkedin">LinkedIn
        <input id="linkedin" name="linkedin" class="element text medium" 
        type="text" maxlength="150" value="<?php echo $profileName->linkedin; ?>">
      </label>
    </li>
    <li id="profile_awards">
      <label class="type_label" for="awards">Awards and Recognitions
         <?php $settings = array( 'media_buttons' => false,'quicktags' => false );
                $content = $profileName->awards;                     
                $editor_id = 'awards';
                wp_editor( $content, $editor_id,$settings ); ?>
        <!-- <textarea id="awards" name="awards" class="element textarea medium" maxlength="250"><?php //echo $profileName->awards; ?></textarea> -->
        <span class="sub-label">250 maximum characters</span>
      </label>
    </li>
    <li id="profile_videos">
      <?php
        //Videos ID=14
        $getVideos=GetSingle($metaid=14,$profileId); //Get All Videos
        if(!empty($getVideos)){
          foreach ($getVideos as $VideosValue) {
        ?>
      <label class="type_label" for="videos">Videos
         <textarea id="videos" name="videos[]" class="element textarea medium"><?php echo $VideosValue->value; ?></textarea>
     <?php /*   <input id="videos" name="videos[]" class="element text medium" type="text" 
        value="<?php echo $VideosValue->value; ?>"> */?>
      </label>
      <hr>
      <?php 
          } 
        } else { ?>
      <label class="type_label" for="videos">Videos
        <textarea id="videos" name="videos[]" class="element textarea medium"></textarea>
      </label>
      <?php
        }
        ?>
    </li>
    <div class="fw-nrml sub-label mb">
      <hr>
      <a class="add-field-btn" id="addsingleinput" onclick="addsingleinput(elementid='profile_videos',limit=6,postname='videos')">Add Another</a> </div>
    <li id="profile_featured">
      <div class="main-label">Is featured? </div>
      <div class="mb">
        <label class="fw-nrml" for="featured_yes">
          <input id="featured_yes" name="featured" class="element radio" type="radio" 
        value="1" <?php echo $profileName->is_featured==1? "checked='checked'":""; ?>>
          Yes</label>
        <label class="fw-nrml" for="featured_no">
          <input id="featured_no" name="featured" class="element radio" type="radio" 
        value="0" <?php echo $profileName->is_featured==0? "checked='checked'":""; ?>>
          No</label>
      </div>
    </li>
    <li id="profile_status">
      <div class="main-label">Status </div>
      <div class="mb">
        <label class="fw-nrml" for="status_approved">
          <input id="status_approved" name="status" class="element radio" type="radio" 
        value="1" <?php echo $profileName->status==1? "checked='checked'":""; ?>>
          Approved</label>
        <label class="fw-nrml" for="status_unapproved">
          <input id="status_unapproved" name="status" class="element radio" type="radio" 
        value="0" <?php echo $profileName->status==0? "checked='checked'":""; ?>>
          Unapproved</label>
      </div>
    </li>

     <li id="profile_permalink">
          <div class="main-label">Permalink</div>
          <div class="has-btn">
            <input id="permalink" name="permalink" class="element text medium" type="text" value="<?php echo $profileName->permalink; ?>">
          </div>
        </li>

    <li class="profile_buttons">
      <input type="hidden" name="form_id" value="">
      <input id="saveForm" class="button_text button_text sub-btn" type="submit" name="update" value="Update">
    </li>
  </ul>
</form>
</div>
</div>
<?php } else { //If wrong URL
  $class = "error";
  $message = "No Profile Found";
  echo "<div class=\"$class\"> <p>$message</p></div>";
}
?>
<!-- jQuery Validation --> 
<script src="<?php echo plugins_url( 'inc/assets/jquery.form-validator.min.js' , dirname(__FILE__) ); ?>"></script> 
<script>
jQuery.validate({
  form : '#adminprofile',
  errorMessagePosition : 'top',
  validateOnBlur : false,
});
</script>
<?php session_destroy(); ?>
