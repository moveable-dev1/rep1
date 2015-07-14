<?php 
//Ajax Request for frontend Search Category Checkbox
function homeCheckAjax() {
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
					<div>
                	 <input type="checkbox" class="cb" id="parent_cat2" value="<?php echo $catvalue->cat_ID; ?>">
                	 <label for="<?php echo $catvalue->cat_name; ?>"><?php echo $catvalue->cat_name; ?></label>
                	 <input id="parent_id<?php echo $catvalue->cat_ID; ?>" name="parent_id" type="hidden" value="<?php echo $parent_cat_ID; ?>">
                	</div>
	             	<?php
					} 
					?> 
				</div>
				<?php }
        die();
    } // end if

add_action('wp_ajax_home_category_select_action', 'homeCheckAjax');
add_action('wp_ajax_nopriv_home_category_select_action', 'homeCheckAjax');


//Display profiles by tags
function homeDisplayProfile() {
	$All_cat_ID = $_POST['All_cat_ID'];
	$listlen=$_POST['listlength'];
	global $wpdb;
	$query="SELECT COUNT(*) AS total, id FROM aec_profilevalue WHERE value IN ($All_cat_ID) and metaid=16 GROUP BY id HAVING total >= $listlen ORDER BY id DESC LIMIT 6";
	//echo $query="Select DISTINCT(id) from aec_profilevalue where value in ($All_cat_ID) AND metaid=16 ORDER BY id DESC LIMIT 6";
	$profileIds=$wpdb->get_results($query); 
	$i=1;
	$countrows=$wpdb->num_rows; 
	if(!empty($profileIds)) {
	?>
	    <div class="large-12 columns items isoShow">
	      <div class="search-status">
	        <div class="left">You searched for: <span class="Search-terms"><?php $cat=explode(',',$All_cat_ID);
	        	$count=1;
	        	foreach ($cat as $cat_id) {
	        		echo get_cat_name( $cat_id );
	        		if($count<$listlen)
	        		{
	        			echo " ,";
	        		}
	        		$count++;
	        	}

	         ?></span></div>
	        <div class="right search-count" id="<?php echo $countrows; ?>"><?php echo $countrows; ?> results</div>
	      </div>
	    </div>
	   
		<?php 
		foreach($profileIds as $IdsValue) {
		$getSimilarProfile= get_profileDetail($IdsValue->id);
		?>
		<div class="large-5 columns prof-col items isoShow">
		  <div class="panel">
		  	 <?php
		    $featuredimage=feautured_image($IdsValue->id);
		    if(!empty($featuredimage) && $i<=2) { ?>
		    <div class="th radius feat-img"><img src="<?php echo wpse_resizeimage($featuredimage,291); ?>" alt="image"/> </div>
		    <?php } ?>

		    <div class="row prof-cont">
		      <div class="small-3 columns">
		        <div class="comp-thumb"><img src="<?php echo $getSimilarProfile->logo; ?>" alt="image" class="th radius"/> </div>
		      </div>
		      <div class="small-9 columns"> <a href="" class="comp-name" title=""><?php echo $getSimilarProfile->name ?></a>
		        <div class="comp-short"><?php echo $getSimilarProfile->description; ?></div>
		      </div>
		    </div>
		  </div>
		</div>	
    	<?php echo $i%2==0 ? "<div class='clearfix'></div>":"";
    	$i++; 
		}
		?><?php 
		if($countrows>=6) {
		?>
			<div class="large-12 columns text-center items isoShow loadSection" id="load_more_<?php echo $IdsValue->id; ?>"> <a role="button" class="button tiny radius more-btn more-btn-inner more_button" href="#" title="" id="<?php echo $IdsValue->id; ?>">Load More</a> 
			</div>
		<?php } ?>
	
	<?php } else { echo '<div class="large-12 columns text-center items isoShow">No records found</div>'; }
    die();
} 

add_action('wp_ajax_home_tag_select_action', 'homeDisplayProfile');
add_action('wp_ajax_nopriv_home_tag_select_action', 'homeDisplayProfile');

//Load More
function getLoadMoreProfile() {
    if(isset($_POST['getLastContentId']))
		{
		  $All_cat_ID=$_POST['getParentId'];
		  $pID=$_POST['getLastContentId'];
		  $listlen=$_POST['listlength'];
	      $i=1;
	      global $wpdb;
	      $query="SELECT COUNT(*) AS total, id FROM aec_profilevalue WHERE value IN ($All_cat_ID) and metaid=16 AND id<$pID GROUP BY id HAVING total >= $listlen ORDER BY id DESC LIMIT 6";
	      //$query="Select DISTINCT(id) from aec_profilevalue where value in ($All_cat_ID) AND id<$pID AND metaid=16 ORDER BY id DESC LIMIT 6";
		  $getRelProfile=$wpdb->get_results($query); 
		  $countrows=$wpdb->num_rows; 
	      if(!empty($getRelProfile)){
		      foreach($getRelProfile as $similarId) { 
		     	  $getSimilarID=$similarId->id;
		      	  $getSimilarProfile= get_profileDetail($getSimilarID); 
	    		?>
			    <div class="large-5 columns prof-col items isoShow">
			      <div class="panel">
			        <div class="row prof-cont">
			          <div class="small-3 columns">
			            <div class="comp-thumb"><img src="<?php echo $getSimilarProfile->logo; ?>" alt="image" class="th radius"/> </div>
			          </div>
			          <div class="small-9 columns"> <a href="" class="comp-name" title=""><?php echo $getSimilarProfile->name; ?></a>
			            <div class="comp-short"><?php echo $getSimilarProfile->description; ?></div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <?php echo $i%2==0 ? "<div class='clearfix'></div>":""; 
			    $i++;
			    }
			    if($countrows>=6) { ?>
			       <div class="large-12 columns text-center items isoShow loadSection" id="load_more_<?php echo $getSimilarID; ?>"> <a role="button" class="button tiny radius more-btn more-btn-inner more_button" href="#" title="" id="<?php echo $getSimilarID; ?>">Load More</a> 
			       </div>
		       <?php } ?>
		<?php }
    die();
    } // end if
}
add_action('wp_ajax_get_loadmore_profile', 'getLoadMoreProfile');
add_action('wp_ajax_nopriv_get_loadmore_profile', 'getLoadMoreProfile');

?>