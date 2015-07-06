<?php 
/**
 * @package Profile\Add profile
 */
wp_enqueue_style( 'profile', plugins_url( 'inc/assets/profile.css' , dirname(__FILE__) ) );
wp_enqueue_script('profile', plugins_url( 'inc/assets/addmore.js' , dirname(__FILE__) ));

/**
 * Insert Value in aec_profilevalue table
  * @param int $metaid 
  * @param int $last_inserted_id 
  * @param string $postvalue 
 */
function addmetavalue($metaid, $last_inserted_id, $postvalue)
{
	$increment=1;
	global $wpdb;
	foreach($postvalue as $pkey=>$pvalue){
		if(!empty($pvalue)){
			$wpinsertvalue=$wpdb->insert("aec_profilevalue", array("metaid" => $metaid, "id" => $last_inserted_id, "fieldid" => $pkey+1, "value"=>$pvalue ));
		}
	}
	return $wpinsertvalue;
}
/**
 * Set Directory path for featured image
 */
function upload_dirimg( $dir ) {
    return array(
        'path'   => $dir['basedir'] . '/profile',
        'url'    => $dir['baseurl'] . '/profile',
        'subdir' => '/profile',
    ) + $dir;
}
/**
 * Set Directory path for logo
 */
function upload_dirlogo( $dir ) {
    return array(
        'path'   => $dir['basedir'] . '/profile/logo',
        'url'    => $dir['baseurl'] . '/profile/logo',
        'subdir' => '/profile/logo',
    ) + $dir;
}

if(isset($_POST["submit"])){
	/**
	* Required field name
	*/
	$required = array('name','profile_type','email','description','website');
	// Loop over field names, make sure each one exists and is not empty
	$error = false;
	foreach($required as $field) {
	  if (empty($_POST[$field])) {
	  	$error = true;
	  }
	}
	//Check for logo
	if($_FILES['logo']['size'] == 0) {
		$error = true;
	}

	//Check for Add more fields
	$requiredaddmore=array('affiliated','term_taxonomy_id','streetaddress','city','state', 'postalcode','country');
	foreach($requiredaddmore as $fieldchecks) {
		if (empty($_POST[$fieldchecks][0])) {
		    $error = true;
		}
	}

	//If fields are not empty
	if($error==false) {

		//Register our path override.
		if($_FILES['logo']['name']) {
			add_filter( 'upload_dir', 'upload_dirlogo' );
			// WordPress will move the file to 'uploads/profile'.
			$overrides = array( 'test_form' => false);
			$filelogo=wp_handle_upload($_FILES['logo'], $overrides);
			remove_filter( 'upload_dir', 'upload_dirlogo' );
			$logourl=$filelogo['url'];
		}
		/**
		 * Move Featured Image
		 */
		if($_FILES['feauturedimage']['name']) {
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

		global $wpdb;

		//Save Permalink
		if(!empty($_POST['permalink'])) {
			$ispermalink=$_POST['permalink'];
			$newpermalink = sanitize_title($ispermalink);
		} else {
			$newpermalink= sanitize_title($_POST['name']);
		}
		//Check duplicate value
		$exists = $wpdb->get_var( $wpdb->prepare(
    "SELECT COUNT(*) FROM aec_profile WHERE permalink = %s", "$newpermalink"
 	 ) );

		if($exists>=1)
		{
			$newpermalink= $newpermalink."_".$exists;
		} 

		//Get Auhor ID
		$user_ID = get_current_user_id();
		
		$wpinsertprofile=$wpdb->insert("aec_profile", array("profile_type" => $_POST['profile_type'],
					   "name" => $_POST['name'],
					   "logo" => $logourl,
					   "region" => $_POST['region'],
					   "description" => $_POST['description'],
					   "email" => $_POST['email'],
					   "website" => $_POST['website'],
					   "twitter" => $_POST['twitter'],
					   "facebook" => $_POST['facebook'],
					   "linkedin" => $_POST['linkedin'],
					   "awards" => $_POST['awards'],
					   "is_featured" => $_POST['featured'],
					   "status" => $_POST['status'],
					   "permalink" => $newpermalink,
					   "created_at" => date('Y-m-d H:i:s'),
					   "profile_author" => $user_ID
					 ));
		$last_inserted_id = $wpdb->insert_id;

		//Save Affiliated Field
		if(isset($_POST['affiliated'])) {
		$affiliated_post=$_POST['affiliated'];
		$wpmeta=addmetavalue(1,$last_inserted_id,$affiliated_post); 
		}

		//Save Affiliated URL
		if(isset($_POST['affiliated_url'])) {
		$affiliatedurl_post=$_POST['affiliated_url'];
		$wpmeta=addmetavalue(2,$last_inserted_id,$affiliatedurl_post);
		}

		//Save Street address
		if(isset($_POST['streetaddress'])) {
		$streetaddress_post=$_POST['streetaddress'];
		$wpmeta=addmetavalue(3,$last_inserted_id,$streetaddress_post);
		}

		//Save City
		if(isset($_POST['city'])) {
		$city_post=$_POST['city'];
		$wpmeta=addmetavalue(4,$last_inserted_id,$city_post);
		}

		//Save State
		if(isset($_POST['state'])) {
		$state_post=$_POST['state'];
		$wpmeta=addmetavalue(5,$last_inserted_id,$state_post);
		}
		//Save Country
		if(isset($_POST['country'])) {
		$country_post=$_POST['country'];
		$wpmeta=addmetavalue(6,$last_inserted_id,$country_post);
		}

		//Save Postal Code
		if(isset($_POST['postalcode'])) {
		$postalcode_post=$_POST['postalcode'];
		$wpmeta=addmetavalue(7,$last_inserted_id,$postalcode_post);
		}

		//Save Project Funder 
		if(isset($_POST['project_funders'])) {
		$funders_post=$_POST['project_funders'];
		$wpmeta=addmetavalue(10,$last_inserted_id,$funders_post);
		}

		//Save Project Funder URL
		if(isset($_POST['project_fundersurl'])) {
		$fundersurl_post=$_POST['project_fundersurl'];
		$wpmeta=addmetavalue(11,$last_inserted_id,$fundersurl_post);
		}

		//Save Investors
		if(isset($_POST['investors'])) {
		$investors_post=$_POST['investors'];
		$wpmeta=addmetavalue(12,$last_inserted_id,$investors_post);
		}

		//Save Investors URL
		if(isset($_POST['investorsurl'])) {
		$investorsurl_post=$_POST['investorsurl'];
		$wpmeta=addmetavalue(13,$last_inserted_id,$investorsurl_post);
		}

		//Save Videos
		if(isset($_POST['videos'])) {
		$videos_post=$_POST['videos'];
		$wpmeta=addmetavalue(14,$last_inserted_id,$videos_post);
		}

		//Save Categories
		if(isset($_POST['term_taxonomy_id'])) {
		$term_taxonomy_id=$_POST['term_taxonomy_id'];
		$wpmeta=addmetavalue(16,$last_inserted_id,$term_taxonomy_id);
		}

		//Save Featured Images
		if(isset($featuredimgurl)) {
		$wpmeta=addmetavalue(8,$last_inserted_id,$featuredimgurl);
		}

		//Set Featured Image respective to feautured image field ID
		if(isset($_POST['feauturedimagevalue']) && $_POST['feauturedimagevalue']!=0) {
		$featuredvalue=$_POST['feauturedimagevalue'];
		$wpmeta=$wpfeaturedvalue=$wpdb->insert("aec_profilevalue", array("metaid" => 9, "id" => $last_inserted_id, "fieldid" => $featuredvalue, "value"=>$featuredvalue ));
		}

		//Save Tag Value
		if(isset($_POST['suggesttags'])) {
		$suggesttags=$_POST['suggesttags'];
		$wpmeta=$wpdb->insert("aec_profilevalue", array("metaid" => 15, "id" => $last_inserted_id, "fieldid" => 1, "value"=>$suggesttags ));
		}


		//If no error in save or upload show success message
		if( $wpinsertprofile!=false ) {
			session_start();
			$_SESSION['success_messages']="<div class='updated'>Profile created for ". $_POST['name']."</div>";
			wp_redirect( admin_url( "admin.php?page=edit-profile&profileid=$last_inserted_id")); exit;
			//echo "<div class='updated'>Profile created for ". $_POST['name']."</div>";
		}
		else {
			$class = "error";
			$message = "Required information is missing or incorrect. Please review.";
			echo "<div class=\"$class\"> <p>$message</p></div>";
		}
	} else { 
			$class = "error";
			$message = "Required information is missing or incorrect. Please review.";
			echo "<div class=\"$class\"> <p>$message</p></div>";
		} //endif $error==true
} //endif $_POST['submit']
?>