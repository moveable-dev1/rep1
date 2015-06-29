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
  * Resize Images
  * @param string $url
  * @param int $width 
  * return $image resized image URL
 */
function wpse_resizeimage($url, $width, $height = null, $crop = null, $single = true) {
//validate inputs
    if (!$url OR !$width)
        return false;

//define upload path & dir
    $upload_info = wp_upload_dir();
    $upload_dir = $upload_info['basedir'];
    $upload_url = $upload_info['baseurl'];

//check if $img_url is local
    if (strpos($url, $upload_url) === false)
        return false;

//define path of image
    $rel_path = str_replace($upload_url, '', $url);
    $img_path = $upload_dir . $rel_path;

//check if img path exists, and is an image indeed
    if (!file_exists($img_path) OR !getimagesize($img_path))
        return false;

//get image info
    $info = pathinfo($img_path);
    $ext = $info['extension'];
    list($orig_w, $orig_h) = getimagesize($img_path);

//get image size after cropping
    $dims = image_resize_dimensions($orig_w, $orig_h, $width, $height, $crop);
    $dst_w = $dims[4];
    $dst_h = $dims[5];

//use this to check if cropped image already exists, so we can return that instead
    $suffix = "{$dst_w}x{$dst_h}";
    $dst_rel_path = str_replace('.' . $ext, '', $rel_path);
    $destfilename = "{$upload_dir}{$dst_rel_path}-{$suffix}.{$ext}";

    if (!$dst_h) {
//can't resize, so return original url
        $img_url = $url;
        $dst_w = $orig_w;
        $dst_h = $orig_h;
    }
//else check if cache exists
    elseif (file_exists($destfilename) && getimagesize($destfilename)) {
        $img_url = "{$upload_url}{$dst_rel_path}-{$suffix}.{$ext}";
    }
//else, we resize the image and return the new resized image url
    else {

// Note: pre-3.5 fallback check 
        if (function_exists('wp_get_image_editor')) {

            $editor = wp_get_image_editor($img_path);

            if (is_wp_error($editor) || is_wp_error($editor->resize($width, $height, $crop)))
                return false;

            $resized_file = $editor->save();

            if (!is_wp_error($resized_file)) {
                $resized_rel_path = str_replace($upload_dir, '', $resized_file['path']);
                $img_url = $upload_url . $resized_rel_path;
            } else {
                return false;
            }
        } else {

            $resized_img_path = image_resize($img_path, $width, $height, $crop);
            if (!is_wp_error($resized_img_path)) {
                $resized_rel_path = str_replace($upload_dir, '', $resized_img_path);
                $img_url = $upload_url . $resized_rel_path;
            } else {
                return false;
            }
        }
    }

//return the output
    if ($single) {
//str return
        $image = $img_url;
    } else {
//array return
        $image = array(
            0 => $img_url,
            1 => $dst_w,
            2 => $dst_h
        );
    }

    return $image;
}
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
    'status' => $_POST['status']), array('id' => $profileId), array('%s', '%s','%s', '%s', '%s','%s', '%s', '%s','%s', '%s', '%s','%s','%s'), array('%d'));
   
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

    //Save Featured Images
    if(isset($featuredimgurl)) {
    $updatemeta=updatefeatured(8,$profileId,$featuredimgurl);
    }

    //Save Categories
    if(isset($_POST['term_taxonomy_id'])) {
        $term_taxonomy_id=$_POST['term_taxonomy_id'];
        $updatemeta=updatemetavalue(16,$profileId,$term_taxonomy_id);
    }


    //Set Featured Image respective to feautured image field ID
    if(!empty($_POST['feauturedimagevalue'])) {
        $featuredvalue=$_POST['feauturedimagevalue'];
        $deleteIsfea=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=9");
        $updatemeta=$wpfeaturedvalue=$wpdb->insert("aec_profilevalue", array("metaid" => 9, "id" => $profileId, "fieldid" => $featuredvalue, "value"=>$featuredvalue ));
        //Reset all values
            $getfeaturedImages=GetSingle($metaid=8,$profileId);
            if(!empty($getfeaturedImages)){
                foreach ($getfeaturedImages as $FeaValues) {
                    $newvalue[]=$FeaValues->value;
                    $deletefeat=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId AND metaid=8 AND fieldid=$FeaValues->fieldid");
                }
                updatefeatured(8,$profileId,$newvalue);
            }
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