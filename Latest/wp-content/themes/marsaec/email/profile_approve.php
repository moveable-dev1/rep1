<?php
$subject = "Visible AEC Website: Your ".$supplier_type." Profile is now published / live";
$headers = 'From: <advancedenergycentre@marsdd.com>' . "\r\nReply-to: <advancedenergycentre@marsdd.com>";
$approve_message = "";
$approve_message .= "Congratulations! Your profile has been reviewed and accepted into our online listings.\n\n";
$approve_message .= "You may view your profile page at the following URL: ".get_site_url()."/profile/".$newpermalink."\n\n";
$approve_message .= "Please contact <a href='mailto:advancedenergycentre@marsdd.com'>advancedenergycentre@marsdd.com</a> if there are any changes you wish to make.\n\n";
$approve_message .= "Sincerely,\n";
$approve_message .= "Advanced Energy Centre Team at the MaRS Discovery District\n\n";
$approve_message .= "By submitting a profile to this site, you agree to allow the Advanced Energy Centre at MaRS Discovery District to share your information with potential buyers, partners and collaborators, and may be contacted by them as a result.  Please note that the contact email provided will not be made publicly available but you may be contacted by potential buyers and collaborators through the secure online webform. All connections made through this portal will be recorded by the Advanced Energy Centre. You agree to allow the Advanced Energy Centre to contact you follow-up on the status of these connections and your profile as needed.";
?>