<?php
$subject = "Visible AEC Website: Your Profile has been submitted for review";
$headers = 'From: <advancedenergycentre@marsdd.com>' . "\r\nReply-to: <advancedenergycentre@marsdd.com>";
$confirm_content = "";
$confirm_content .= "Thank you! Your profile has been submitted to the Visible AEC team for review.\n\n";
$confirm_content .= "We strive to review new submissions within 10 business days for quality control purposes only. We may contact you at ".$_POST['email']." to follow up with any questions.\n\n";
$confirm_content .= "Please contact advancedenergycentre@marsdd.com if there are any changes you wish to make.\n\n";
$confirm_content .= "Don't see your fellow innovators on the site yet? Help spread the word! Share this opportunity with other innovative Canadian energy companies or projects: ". get_page_link(20) . "\n\n";
$confirm_content .= "Sincerely,\n";
$confirm_content .= "Advanced Energy Centre team at the MaRS Discovery District\n\n";
$confirm_content .= "By submitting a profile to this site, you agree to allow the Advanced Energy Centre at MaRS Discovery District to share your information with potential buyers, partners and collaborators, and may be contacted by them as a result.  Please note that the contact email provided will not be made publicly available but you may be contacted by potential buyers and collaborators through the secure online webform. All connections made through this portal will be recorded by the Advanced Energy Centre. You agree to allow the Advanced Energy Centre to contact you follow-up on the status of these connections and your profile as needed.";

?>