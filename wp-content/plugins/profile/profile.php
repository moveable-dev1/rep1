<?php
/*
Plugin Name: Company/Project Profile
Description: Manages Company/Project Profile
Author: IDS Logic
Version: 1.0.0
Author URI: http://idslogic.com/

*/
//error_reporting(0);
add_action('admin_menu', 'profile');

/**
 * Register the Profile menu item and its sub menu's.
 */
function profile() 
{
	add_menu_page('','Manage Profile','administrator','list-profile','profile_display','',3);
	add_submenu_page('list-profile','Add Company/Project Profile', 'Add Profile', 'administrator'
	,'add-profile','add_profile');
	add_submenu_page('list-profile','Manage Category', 'Manage Category', 'administrator',
	'edit-tags.php?taxonomy=category','');
	add_submenu_page('list-profile','', '', 'administrator','edit-profile','edit_profile');
}
function profile_display()
{
	include 'inc/list_profile.php';
}
function add_profile()
{
	include 'inc/add_profile.php';
}
function edit_profile()
{
	
	include 'inc/edit_profile.php';
}

?>