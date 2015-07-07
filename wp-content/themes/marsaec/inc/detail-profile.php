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

//Get Add more set values i.e. Affiliated company URL, Project Funders Url
function GetSet($metaid,$fieldid,$profileId)
{
	global $wpdb;
	$profileFieldsUrl=$wpdb->get_row( "SELECT * FROM aec_profilevalue WHERE id=$profileId AND metaid=$metaid AND fieldid=$fieldid");
	return $profileFieldsUrl->value;
}

//Get Address for Map
function get_addressMap($ID)
{
	global $wpdb;
	$getStreet = $wpdb->get_var( $wpdb->prepare(
    "SELECT value FROM aec_profilevalue WHERE metaid='3' AND id=%s", "$ID"
 	 ) );
	$getState = $wpdb->get_var( $wpdb->prepare(
    "SELECT value FROM aec_profilevalue WHERE metaid='4' AND id=%s", "$ID"
 	 ) );
	$getCity = $wpdb->get_var( $wpdb->prepare(
    "SELECT value FROM aec_profilevalue WHERE metaid='5' AND id=%s", "$ID"
 	 ) );
	$getZip = $wpdb->get_var( $wpdb->prepare(
    "SELECT value FROM aec_profilevalue WHERE metaid='7' AND id=%s", "$ID"
 	 ) );
	$getCountry = $wpdb->get_var( $wpdb->prepare(
    "SELECT value FROM aec_profile WHERE metaid='6' AND id=%s", "$ID"
 	 ) );
	$address=$getStreet." ".$getState." ".$getCity." ".$getZip." ".$getCountry;
	$gMap="http://maps.google.com/?q=$address&output=embed";
	return $gMap;
}

//Get Similar Profiles
function get_similarProfile($ID)
{
	global $wpdb;
	$getDetail = $wpdb->get_row("SELECT * FROM aec_profile WHERE id=$ID");
	return $getDetail;
}

?>