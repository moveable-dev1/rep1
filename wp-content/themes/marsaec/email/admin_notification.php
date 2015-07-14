<?php
$subject = "Visible AEC Website: A new ".$supplier_type." Profile has been submitted for review";
$headers = 'From: <advancedenergycentre@marsdd.com>' . "\r\nReply-to: <no-reply@marsdd.com>";
$admin_message = "";
$admin_message .= "A supplier has submitted a profile for review. Please login to <a href='".get_admin_url()."'>Admin</a> to review the new submission:\n\n";
$admin_message .= "Supplier Type: ".$supplier_type."\n";
$admin_message .= "Supplier Name: ".$_POST['uname']."\n";
$admin_message .= "Tags: ".$_POST['suggesttags']."\n";
$admin_message .= "Region: ".$region."\n\n";
$admin_message .= "Please review for approval within 10 business days.\n";
$admin_message .= "Go Kathleen Go!\n";
$admin_message .= "Kathleen is Awesome!";
?>