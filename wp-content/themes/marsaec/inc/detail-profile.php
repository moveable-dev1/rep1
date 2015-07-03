<?php 
/**
 * @package Profile\Detail Profile
 */

//Get Profile ID by permalink
function get_profileId($var)
{
	global $wpdb;
	$getID = $wpdb->get_var( $wpdb->prepare(
    "SELECT id FROM aec_profile WHERE permalink=%s", "$var"
 	 ) );
	return $getID;
}

//Get Profile detail by ID
function get_profileDetail($ID)
{
	global $wpdb;
	$getDetail = $wpdb->get_row("SELECT * FROM aec_profile WHERE id=$ID");
	return $getDetail;
}

//Get Meta Details
function GetSingle($metaid,$profileId) 
{
	global $wpdb;
	$profileFields=$wpdb->get_results( "SELECT * FROM aec_profilevalue WHERE id=$profileId AND metaid=$metaid");
	return $profileFields;
}


//Get Address for Map
function get_addressMap($ID)
{
	global $wpdb;
	$getDetail = $wpdb->get_row("SELECT * FROM aec_profile WHERE id=$ID");
	return $getDetail;
}

//Get Similar Profiles
function get_similarProfile($ID)
{
	global $wpdb;
	$getDetail = $wpdb->get_row("SELECT * FROM aec_profile WHERE id=$ID");
	return $getDetail;
}

?>