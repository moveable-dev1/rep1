<?php 
/**
 * @package Profile\Edit profile
 */
session_start();
if($_SESSION['success_messages']) {
	echo $_SESSION['success_messages'];
}
wp_enqueue_style( 'profile', plugins_url( 'inc/assets/profile.css' , dirname(__FILE__) ) );
wp_enqueue_script('profile', plugins_url( 'inc/assets/addmore.js' , dirname(__FILE__) ));

/**
  * Register our path override. Set logo directory
 */
function upload_dirimg( $dir ) {
    return array(
        'path'   => $dir['basedir'] . '/profile',
        'url'    => $dir['baseurl'] . '/profile',
        'subdir' => '/profile',
    ) + $dir;
}
//Set Featured Image directory
function upload_dirlogo( $dir ) {
    return array(
        'path'   => $dir['basedir'] . '/profile/logo',
        'url'    => $dir['baseurl'] . '/profile/logo',
        'subdir' => '/profile/logo',
    ) + $dir;
}
/**
  * Delete and Insert Meta Value after update
  * @param int $metaid
  * @param int $profileId 
  * @param string $url
 */
function updatemetavalue($metaid, $profileId, $postvalue)
{
    $increment=1;
    global $wpdb;
    $deleteatt=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=$metaid");
    foreach($postvalue as $pkey=>$pvalue){
        if(!empty($pvalue)){
            $wpinsertvalue=$wpdb->insert("aec_profilevalue", array("metaid" => $metaid, "id" => $profileId, "fieldid" => $pkey+1, "value"=>$pvalue ));
        }
    }
    return $wpinsertvalue;
}

/**
  * Update Featured Imag
  * @param int $metaid
  * @param int $profileId 
  * @param string $url
 */
function updatefeatured($metaid, $profileId, $postvalue)
{
    $increment=1;
    global $wpdb;
    foreach($postvalue as $pkey=>$pvalue){
        if(!empty($pvalue)){
            $wpinsertvalue=$wpdb->insert("aec_profilevalue", array("metaid" => $metaid, "id" => $profileId, "fieldid" => $pkey+1, "value"=>$pvalue ));
        }
    }
    return $wpinsertvalue;
}

/**
  * Get Add more values i.e. Affiliated company, Video, Project Funders etc.
  * @param int $metaid
  * @param int $profileId 
  * return array
 */
function GetSingle($metaid,$profileId) 
{
	global $wpdb;
	$profileFields=$wpdb->get_results( "SELECT * FROM aec_profilevalue WHERE id=$profileId AND metaid=$metaid");
	return $profileFields;
}
/**
  * Get Add more set values i.e. Affiliated company URL, Project Funders URL,Street, City etc.
  * @param int $metaid
  * @param int $fieldid 
  * @param int $profileId 
  * return row value
 */
function GetSet($metaid,$fieldid,$profileId)
{
	global $wpdb;
	$profileFieldsUrl=$wpdb->get_row( "SELECT * FROM aec_profilevalue WHERE id=$profileId AND metaid=$metaid AND fieldid=$fieldid");
	return $profileFieldsUrl->value;
}

//get ID
$profileId=$_GET['profileid'];

//Get Profile value from aec_profile
global $wpdb;
$profileName=$wpdb->get_row( "SELECT * FROM aec_profile WHERE id=$profileId");
//print_r($profileName);

//Update Profile
if($_FILES['logo']['name']) {
    add_filter( 'upload_dir', 'upload_dirlogo' );
    // WordPress will move the file to 'uploads/profile'.
    $overrides = array( 'test_form' => false);
    $filelogo=wp_handle_upload($_FILES['logo'], $overrides);
    remove_filter( 'upload_dir', 'upload_dirlogo' );
    $logourl=$filelogo['url'];
} else {
    $logourl=$profileName->logo;
}

//Move Featured Image
if($_FILES['feauturedimage']['name']) {
    //Check Existing images
    $getfetauredImage=GetSingle($metaid=8,$profileId);
            if(!empty($getfetauredImage)){
                foreach ($getfetauredImage as $FeaValue) {
                $featuredimgurl[]=$FeaValue->value;
                $deletefea=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=8 AND fieldid=$FeaValue->fieldid");
                }
            }
    foreach ($_FILES['feauturedimage']['name'] as $key=>$file) {    
        $filesfeatured = array(
          'name'     => $_FILES['feauturedimage']['name'][$key],
          'type'     => $_FILES['feauturedimage']['type'][$key],
          'tmp_name' => $_FILES['feauturedimage']['tmp_name'][$key],
          'error'    => $_FILES['feauturedimage']['error'][$key],
          'size'     => $_FILES['feauturedimage']['size'][$key]
        );
    add_filter( 'upload_dir', 'upload_dirimg' );
    $overridesfeatured = array( 'test_form' => false);
    $filefeatured=wp_handle_upload($filesfeatured, $overridesfeatured);
    remove_filter( 'upload_dir', 'upload_dirimg' );
    $featuredimgurl[]=$filefeatured['url'];
    }
}

//Update fields in aec_profile table
if(isset($_POST['update'])) {
    //Save Permalink
        if(!empty($_POST['permalink'])) {
            $ispermalink=$_POST['permalink'];
            $newpermalink = sanitize_title($ispermalink);
        } else {
            $newpermalink= sanitize_title($_POST['name']);
        }

        //Check duplicate value
        $exists = $wpdb->get_var( $wpdb->prepare(
    "SELECT COUNT(*) FROM aec_profile WHERE permalink = %s AND id!=$profileId", "$newpermalink"
     ) );

        if($exists>=1)
        {
            $newpermalink= $newpermalink."_".$exists;
        } 

    $result = $wpdb->update('aec_profile', array('profile_type' => $_POST['profile_type'],
    'name' => $_POST['name'],
    'logo' => $logourl,
    'region' => $_POST['region'],
    'description' => $_POST['description'],
    'email' => $_POST['email'],
    'website' => $_POST['website'],
    'twitter' => $_POST['twitter'],
    'facebook' => $_POST['facebook'],
    'linkedin' => $_POST['linkedin'],
    'awards' => $_POST['awards'],
    'is_featured' => $_POST['is_featured'],
    'status' => $_POST['status'],
    'permalink' => $newpermalink,
    'updated_at' => date('Y-m-d H:i:s')), array('id' => $profileId), array('%s', '%s','%s', '%s', '%s','%s', '%s', '%s','%s', '%s', '%s','%s','%s','%s'), array('%d'));
   
    //Save Affiliated Field
    if(isset($_POST['affiliated'])) {
    $affiliated_post=$_POST['affiliated'];
    $updatemeta=updatemetavalue(1,$profileId,$affiliated_post); 
    }
    //Save Affiliated URL
    if(isset($_POST['affiliated_url'])) {
    $affiliatedurl_post=$_POST['affiliated_url'];
    $updatemeta=updatemetavalue(2,$profileId,$affiliatedurl_post);
    }

    //Save Street address
    if(isset($_POST['streetaddress'])) {
    $streetaddress_post=$_POST['streetaddress'];
    $updatemeta=updatemetavalue(3,$profileId,$streetaddress_post);
    }

    //Save City
    if(isset($_POST['city'])) {
    $city_post=$_POST['city'];
    $updatemeta=updatemetavalue(4,$profileId,$city_post);
    }

    //Save State
    if(isset($_POST['state'])) {
    $state_post=$_POST['state'];
    $updatemeta=updatemetavalue(5,$profileId,$state_post);
    }
    //Save Country
    if(isset($_POST['country'])) {
    $country_post=$_POST['country'];
    $updatemeta=updatemetavalue(6,$profileId,$country_post);
    }
 
    //Save Postal Code
    if(isset($_POST['postalcode'])) {
    $postalcode_post=$_POST['postalcode'];
    $updatemeta=updatemetavalue(7,$profileId,$postalcode_post);
    }

    //Save Project Funder 
    if(isset($_POST['project_funders'])) {
    $funders_post=$_POST['project_funders'];
    $updatemeta=updatemetavalue(10,$profileId,$funders_post);
    }

    //Save Project Funder URL
    if(isset($_POST['project_fundersurl'])) {
    $fundersurl_post=$_POST['project_fundersurl'];
    $updatemeta=updatemetavalue(11,$profileId,$fundersurl_post);
    }

    //Save Investors
    if(isset($_POST['investors'])) {
    $investors_post=$_POST['investors'];
    $updatemeta=updatemetavalue(12,$profileId,$investors_post);
    }

    //Save Investors URL
    if(isset($_POST['investorsurl'])) {
    $investorsurl_post=$_POST['investorsurl'];
    $updatemeta=updatemetavalue(13,$profileId,$investorsurl_post);
    }

    //Save Tag Value
    if(isset($_POST['suggesttags'])) {
    $suggesttags=$_POST['suggesttags'];
    $deletetag=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=15");
    $updatemeta=$wpdb->insert("aec_profilevalue", array("metaid" => 15, "id" => $profileId, "fieldid" => 1, "value"=>$suggesttags ));
    }
    //Save Videos
    if(isset($_POST['videos'])) {
    $videos_post=$_POST['videos'];
    $updatemeta=updatemetavalue(14,$profileId,$videos_post);
    }


    //Save Featured Images
    if(isset($featuredimgurl)) {
    $updatemeta=updatefeatured(8,$profileId,$featuredimgurl);
    }

    //Remove Featured Image if checked
    if(!empty($_POST['removeimage'])) {
        foreach ($_POST['removeimage'] as $removevalue) {
             $deletefea=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=8 AND fieldid=$removevalue");
        }
    //Reset All values
     $getfeaturedImages=GetSingle($metaid=8,$profileId);
            if(!empty($getfeaturedImages)){
                foreach ($getfeaturedImages as $FeaValues) {
                    $newvalue[]=$FeaValues->value;
                    $deletefeat=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=8 AND fieldid=$FeaValues->fieldid");
                }
                $updatemeta=updatefeatured(8,$profileId,$newvalue);
            }    
    }

    //Save Categories
    if(isset($_POST['term_taxonomy_id'])) {
        $term_taxonomy_id=$_POST['term_taxonomy_id'];
        $updatemeta=updatemetavalue(16,$profileId,$term_taxonomy_id);
    }


    //Set Featured Image respective to feautured image field ID
    if(isset($_POST['feauturedimagevalue']) && $_POST['feauturedimagevalue']!=0) {
    $featuredvalue=$_POST['feauturedimagevalue'];
    $deleteIsfea=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=9");
    $wpmeta=$wpfeaturedvalue=$wpdb->insert("aec_profilevalue", array("metaid" => 9, "id" => $profileId, "fieldid" => $featuredvalue, "value"=>$featuredvalue ));
    }

    //Set Featured Image respective to feautured image field ID
    // if(!empty($_POST['feauturedimagevalue'])) {
    //     $featuredvalue=$_POST['feauturedimagevalue'];
    //     $deleteIsfea=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=9");
    //     $updatemeta=$wpfeaturedvalue=$wpdb->insert("aec_profilevalue", array("metaid" => 9, "id" => $profileId, "fieldid" => $featuredvalue, "value"=>$featuredvalue ));
    //     //Reset all values
    //         $getfeaturedImages=GetSingle($metaid=8,$profileId);
    //         if(!empty($getfeaturedImages)){
    //             foreach ($getfeaturedImages as $FeaValues) {
    //                 $newvalue[]=$FeaValues->value;
    //                 $deletefeat=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=8 AND fieldid=$FeaValues->fieldid");
    //             }
    //             updatefeatured(8,$profileId,$newvalue);
    //         }
    // }
	
	//Send Approved copy to user
	if(isset($_POST['approve_confirmation']) && $_POST['status'] == 1){
		if($_POST['profile_type'] == 1){
			$supplier_type= "Company";
		}elseif($_POST['profile_type'] == 2){
			$supplier_type= "Project";	
		}
		include_once($_SERVER['DOCUMENT_ROOT']."/wp-content/themes/marsaec/email/profile_approve.php" );
		wp_mail( $_POST['email'], $subject, $approve_message, $headers);
	}
	
    if($result!=false || $updatemeta==1){ 
        $_SESSION['success_messages']="<div class='updated'>Successfully Updated ".$_POST['name']."</div>";
       wp_redirect( admin_url( "admin.php?page=edit-profile&profileid=$profileId")); exit;
    } else{
        $_SESSION['success_messages']="<div id='message' class='error'>No information Updated</div>";
        wp_redirect( admin_url( "admin.php?page=edit-profile&profileid=$profileId")); exit;
    }
    $wpdb->flush();
}

?>