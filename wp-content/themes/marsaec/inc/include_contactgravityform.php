<?php
add_filter( 'gform_validation_message', 'change_message', 10, 2 );
function change_message( $message, $form ) {
    return '<div class="validation_error">Required information is missing or incorrect. Please review.</div>';
}
?>