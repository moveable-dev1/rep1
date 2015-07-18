<?php
//Get Meta Details
function GetSingleFront($metaid,$profileId) 
{
	global $wpdb;
	$profileFields=$wpdb->get_results( "SELECT * FROM aec_profilevalue WHERE id=$profileId AND metaid=$metaid");
	return $profileFields;
}

//Get Profile detail by ID
function get_profileDetail($ID)
{
	global $wpdb;
	$getDetail = $wpdb->get_row("SELECT * FROM aec_profile WHERE id=$ID");
	return $getDetail;
}

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

//SEO friendly profile detail page
function custom_rewrite_tag() {
  add_rewrite_tag('%profile%', '([^&]+)');
}
add_action('init', 'custom_rewrite_tag', 10, 0);

function custom_rewrite_rule() {
    add_rewrite_rule('^profile/([^/]*)/?','index.php?page_id=39&profile=$matches[1]','top');
  }
add_action('init', 'custom_rewrite_rule', 10, 0);

//Trim words for page
function trim_words($id)
{
	$page_data = get_page( $id );
    $content = $page_data->post_content;
    $trimmed_content = wp_trim_words( $content, 48, '' );
    return $trimmed_content;
}

//Get Newest Profile on Home Page

function newest_profile()
{
	global $wpdb;
	$query="SELECT * FROM aec_profile WHERE status=1 ORDER BY id DESC LIMIT 2";
	$newprofile=$wpdb->get_results($query);
	return $newprofile;
}

//Get Featured Image by ID
function feautured_image($id)
{
	global $wpdb;
	$query="SELECT a1.value FROM aec_profilevalue a1 INNER JOIN aec_profilevalue a2 ON a2.value=a1.fieldid AND a1.id=$id AND a1.metaid=8 AND a2.metaid=9 AND a2.id=$id";
	$getimage=$wpdb->get_row($query);
	return $getimage->value;
}

//Get Profile URL
function get_profileUrl($id)
{
	global $wpdb;
	$getURL = $wpdb->get_var( $wpdb->prepare(
    "SELECT permalink FROM aec_profile WHERE id=%s", "$id"
 	 ) );
	if(!$getURL){
		$getURL=$id;
	}
	return "/profile/".$getURL;
}

//Ajax Request for submit a profile frontend
function submit_formcategory() {
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
	               <li>
	                	<div>
			             	<input id="parent_cat2" name="term_taxonomy_id[]" class="cb" type="checkbox" value="<?php echo $catvalue->cat_ID; ?>">
			             	<label class="type_label fw-nrml" for="<?php echo $catvalue->cat_name; ?>"><?php echo $catvalue->cat_name; ?></label>
			             	<input id="parent_id<?php echo $catvalue->cat_ID; ?>" name="parent_id" type="hidden" value="<?php echo $parent_cat_ID; ?>">
			             </div>
					</li>
			             	<?php
							}
							?> 
				</div>
				<?php }
        die();
    } // end if

add_action('wp_ajax_category_select_frontend', 'submit_formcategory');
add_action('wp_ajax_nopriv_category_select_frontend', 'submit_formcategory');
//add_action('wp_ajax_nopriv_category_select_action', 'implement_ajax');//for users that are not logged in.

?>