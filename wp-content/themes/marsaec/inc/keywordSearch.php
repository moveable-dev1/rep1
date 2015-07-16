<?php 
//Get Search by keyword
function search_keyword($searchterm)
{
	global $wpdb;
	$searchFieldName= "name";
	$searchCondition = "$searchFieldName LIKE '%" . $searchterm . "%'";
	//$query="SELECT * FROM aec_profile WHERE $searchCondition AND status=1 ORDER BY id DESC";
	$query="SELECT * FROM aec_profile WHERE status=1 ORDER BY id DESC LIMIT 6";
	$getsearch=$wpdb->get_results($query);
	return $getsearch;
}

//
function search_count($searchterm)
{
	global $wpdb;
	$searchFieldName= "name";
	$searchCondition = "$searchFieldName LIKE '%" . $searchterm . "%'";
	//$query="SELECT COUNT(*) FROM aec_profile WHERE $searchCondition AND status=1 ORDER BY id DESC";
    $query="SELECT COUNT(*) FROM aec_profile WHERE status=1 ORDER BY id DESC LIMIT 6";
	$getsearch=$wpdb->get_var($query);
	return $getsearch;
}

//Load More
function getSearchLoadMoreProfile() {
    if(isset($_POST['getLastContentId']))
		{
		  $pID=$_POST['getLastContentId'];
	      $i=1;
	      global $wpdb;
	      $query="SELECT * FROM aec_profile WHERE status=1 AND id<$pID ORDER BY id DESC LIMIT 6";
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
			       <div class="large-12 columns text-center items isoShow loadSection" id="load_more_<?php echo $getSimilarID; ?>"> <a role="button" class="button tiny radius more-btn more-btn-inner searchmore_button" href="#" title="" id="<?php echo $getSimilarID; ?>">Load More</a> 
			       </div>
		       <?php } ?>
		<?php }
    die();
    } // end if
}
add_action('wp_ajax_get_searchloadmore_profile', 'getSearchLoadMoreProfile');
add_action('wp_ajax_nopriv_get_searchloadmore_profile', 'getSearchLoadMoreProfile');
?>