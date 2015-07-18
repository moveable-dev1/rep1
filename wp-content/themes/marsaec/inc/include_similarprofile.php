<?php
//Get Similar Profiles
function get_similarProfile($ID,$loadmore=false,$parentId=0)
{	

	   //Display all Parent Category
        $args = array(
             'parent'         => 8, //Get all category of profile
             'hide_empty'    => false,
        ); 
        $parentcategory = get_categories($args); 
        if($loadmore==false){
        	$loadID=$ID;
        } else{
        	$loadID=$parentId;
        }
        $getSelectedCat=GetSingleFront($metaid=16,$ID); //Get all taxanomy for user, ID=16

        foreach ($parentcategory as $catvalue) {
          if(!empty($getSelectedCat)){
            foreach ($getSelectedCat as $Selectedvalue) {
              $checkedvalue=$Selectedvalue->value;
              $taxanomyid=$catvalue->cat_ID;
              if($checkedvalue==$taxanomyid){
                $level2checks[]=$checkedvalue; //Add into array parent category in level 2
              } 
            }
          }
        }
        if(empty($level2checks)){
        	return false;
        }
         if(is_array($level2checks)) {
            foreach($level2checks as $level2values){
              if(!empty($level2values)) {
              $argsLevel2 = array(
                   'parent'         => $level2values, //Get all category of profile
                   'hide_empty'    => false,
              ); 
              $parentcategoryLevel2 = get_categories($argsLevel2);
              foreach ($parentcategoryLevel2 as $catvalueLevel2) {
                if(!empty($getSelectedCat)){
                  foreach ($getSelectedCat as $SelectedvalueLevel2) {
                    $checkedvalueLevel2=$SelectedvalueLevel2->value;
                    $taxanomyidLevel2=$catvalueLevel2->cat_ID;
                    if($checkedvalueLevel2==$taxanomyidLevel2){
                      $level3checks[]=$checkedvalueLevel2;
                    }
                  }
                }
              }  
          	} 
          }//enforeach  
        }//endif
        if(!empty($level3checks)){
        	$similarcategory=array_merge($level2checks,$level3checks);
        } else{
        	$similarcategory=$level2checks;
        }
        
        $comma_separated = implode(",", $similarcategory);
        global $wpdb;
        if($loadmore==false){
        	$query="Select DISTINCT(v.id) from aec_profilevalue AS v INNER JOIN aec_profile AS p ON v.id=p.id where v.value in ($comma_separated) AND v.id!=$ID AND v.metaid=16 AND p.status=1 ORDER BY v.id DESC LIMIT 4";
        } else{ //Load more content
        	$query="Select DISTINCT(v.id) from aec_profilevalue AS v INNER JOIN aec_profile AS p ON v.id=p.id where v.value in ($comma_separated) AND v.id!=$ID AND v.id<$ID AND v.id!=$parentId AND v.metaid=16 AND p.status=1 ORDER BY v.id DESC LIMIT 4";
        }
		$profileIds=$wpdb->get_results($query);
		return $profileIds;
}

//Similar profile for Load more
function loadSimilarProfile() {
    if(isset($_POST['getLastContentId']))
		{
	      $i=1;
	      $getRelProfile=get_similarProfile($_POST['getLastContentId'],$loadmore=true,$parentId=$_POST['getParentId']);
	      if(!empty($getRelProfile)){
		      foreach($getRelProfile as $similarId) { 
		     	  $getSimilarID=$similarId->id;
		      	  $getSimilarProfile= get_profileDetail($getSimilarID); 
	    		?>
			    <div class="large-5 columns prof-col">
			      <div class="panel">
			        <div class="row prof-cont">
			          <div class="small-3 columns">
			            <div class="comp-thumb"><img src="<?php echo $getSimilarProfile->logo; ?>" alt="image" class="th radius"/> </div>
			          </div>
			          <div class="small-9 columns"> <a href="<?php echo "/profile/".$getSimilarProfile->permalink; ?>" class="comp-name" title=""><?php echo $getSimilarProfile->name; ?></a>
			            <div class="comp-short">
			            	<?php echo substr($getSimilarProfile->description, 0,300); ?>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <?php echo $i%2==0 ? "<div class='clearfix'></div>":""; 
			    $i++;
			    } ?>
		       <div class="large-12 columns text-center loadSection" id="load_more_<?php echo $getSimilarID; ?>"> <a role="button" class="button tiny radius more-btn more-btn-inner more_button" href="#" title="" id="<?php echo $getSimilarID; ?>">Load More</a> </div>
		<?php }
    die();
    } // end if
}
add_action('wp_ajax_get_similar_profile', 'loadSimilarProfile');
add_action('wp_ajax_nopriv_get_similar_profile', 'loadSimilarProfile');
?>