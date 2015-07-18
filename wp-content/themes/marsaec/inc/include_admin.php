<?php //Ajax Request for profile category
function implement_ajax() {
    $parent_cat_ID = $_POST['parent_cat_ID'];
    $args = array(
   					 'parent'         => $parent_cat_ID, //Get all category of profile
   					 'hide_empty'    => false,
				); 
				$parentcategory = get_categories($args);
				if($parentcategory){
				?>
				<div id="getallcat<?php echo $parent_cat_ID; ?>">
					<?php
					foreach ($parentcategory as $catvalue) {
					?>
	               	<label class="type_label fw-nrml" for="item1">
	             	<input id="parent_cat2" name="term_taxonomy_id[]" class="element checkbox" type="checkbox" value="<?php echo $catvalue->cat_ID; ?>">
	             	<?php echo $catvalue->cat_name; ?>
	             	<input id="parent_id<?php echo $catvalue->cat_ID; ?>" name="parent_id" type="hidden" value="<?php echo $parent_cat_ID; ?>">
	             	</label> 
	             	<?php
					}
					?> 
				</div>
				<?php }
        die();
    } // end if

add_action('wp_ajax_category_select_action', 'implement_ajax');

//For Admin Redirects
add_action('init', 'start_buffer_output');
function start_buffer_output() {
        ob_start();
}

//Add Fields in settings
$new_general_setting = new new_general_setting();

class new_general_setting {
    function new_general_setting( ) {
        add_filter( 'admin_init' , array( &$this , 'register_fields' ) );
    }
    function register_fields() {
    	//Field for Vimeo
        register_setting( 'general', 'vimeo_url', 'esc_attr' );
        add_settings_field('vimeo_url', '<label for="vimeo_url">'.__('Vimeo URL (Home Page)' , 'vimeo' ).'</label>' , array(&$this, 'fields_html') , 'general' );
        register_setting( 'general', 'profile_email', 'esc_attr' );
        add_settings_field('profile_email', '<label for="profile_email">'.__('Email Copy to (Submit a Profile)' , 'profile' ).'</label>' , array(&$this, 'fields_html_email') , 'general' );
    }
    function fields_html() {
        $value = get_option( 'vimeo_url', '' );
        echo '<input type="text" id="vimeo_url" name="vimeo_url" value="' . $value . '" />';
    }

    function fields_html_email() {
        $value = get_option( 'profile_email', '' );
        echo '<input type="text" id="profile_email" name="profile_email" value="' . $value . '" />';
    }
}

?>