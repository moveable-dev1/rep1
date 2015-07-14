<?php 
/**
 * @package Profile\Manage profile
 */
session_start();
if($_SESSION['success_messages']) {
	echo $_SESSION['success_messages'];
}
wp_enqueue_style( 'profile', plugins_url( 'inc/assets/profile.css' , dirname(__FILE__) ) );
wp_enqueue_script('profile', plugins_url( 'inc/assets/listprofile.js' , dirname(__FILE__) ));

/**
 * Retrieve Results from aec_profile table
 * @param string $showtype
 * @param string $paging 
 * return array
 */
function GetProfiles($showtype,$paging){
	global $wpdb;
	$queycheck= "SELECT * FROM aec_profile where ".$showtype." order by id ASC";
	if($paging == 'Y'){
		$queycheck=paging_1($queycheck,"","0%");
	}
	$SelectProfileName=$wpdb->get_results($queycheck);
	return ($SelectProfileName);
}
/**
 * Pagination
 * @param string $sql
 * return page limit e.g. limit=20
 */
function paging_1($sql,$vary="record",$width="575")
{
	global $limit,$offset,$currenttotal,$showed,$last,$align,$wpdb;
	$limit = 20;

	$showed=$_REQUEST['offset']+$limit;
	$last=$_REQUEST['offset']-$limit;

	if(empty($_REQUEST['offset']))
	$_REQUEST['offset']=0;

	$recordset1=$wpdb->get_results($sql);
	$currenttotal=$wpdb->num_rows;

	$pages=$currenttotal%$limit;
	if($pages==0)
		$pages=$currenttotal/$limit;
	else
	{
		$pages=$currenttotal/$limit;
		$pages=(int)$pages+1;
	}		
	for($i=1;$i<=$pages;$i++)
	{
		$pageoff=($i-1)*$limit;
		if($showed==($i*$limit))
			break;
	}
	if($currenttotal>0) echo @$display;

	$sql.="  Limit ".$_REQUEST['offset'].",$limit  ";

	return $sql;

}

/**
 * Display Pagination
 * @param string $str
 * return string
 */
function paging_2($str,$width)
{
	global $currenttotal,$limit,$offset,$showed,$last,$PHP_SELF,$align;
	if($currenttotal > $limit){

		print '<div id="search_pagination">';
		
		if($_REQUEST['offset']>=$limit)
		{
			echo '<span class="pagenav"><a class="prev page-numbers" href="'.$PHP_SELF.'?offset='.$last.'&currenttotal='.$currenttotal.'&'.$str.'">&laquo; Previous</a>';
			
			}
			$pages=$currenttotal%$limit;
			if($pages==0)
				$pages=$currenttotal/$limit;
			else
			{
				$pages=$currenttotal/$limit;
				$pages=(int)$pages+1;
			}		

			$m="0";
			for($i=1;$i<=$pages;$i++) {
				$pageoff=($i-1)*$limit;
				if($showed==($i*$limit))
				{
					echo '<span class="current page-numbers">'.$i.'</span>';
				}
				else
				{
					echo '<a class="page-numbers" href="'.$PHP_SELF.'?offset='.$pageoff.'&currenttotal='.$currenttotal.'&'.$str.'">'.$i.'</a>';
				}
				if($m=="29")
				{
					$m="0";
					echo "<br>";
				}
				$m++;
			}
		if($showed<$currenttotal)
		echo '<a class="next page-numbers" href="'.$PHP_SELF.'?offset='.$showed.'&currenttotal='.$currenttotal.'&'.$str.'">Next &raquo;</a>';	
		echo "</span></div>";
	}
}

/**
 * Get results by profile_type
 */
if(!empty($_GET['s'])){
	$AllProfileName = GetProfiles(" profile_type = '".$_GET['s']."'","Y");
} elseif(!empty($_GET['all'])){ //Get results by name, email input value
	
	$searchQuery = ''; // search query is empty by default
	$searchFieldName = 'name'; // name of the field to be searched
	$searchFieldEmail = 'email';
	$searchQuery =$_GET['all'];

	$searchCondition = "$searchFieldName LIKE '%" . $searchQuery . "%'";
	$searchCondition2 = "$searchFieldEmail LIKE '%" . $searchQuery . "%'"; // Forming the condition for the sql
	$AllProfileName = GetProfiles(" ($searchCondition OR $searchCondition2)","Y");
}else{
	global $wpdb;
	//Get All profiles
	$querypage="SELECT * FROM aec_profile";
	$querypage=paging_1($querypage,"","0%");
	$AllProfileName=$wpdb->get_results($querypage);
}


$profileDelete=$_GET['delete'];
$profileId=$_GET['profileid'];
$profileStatus=$_GET['status'];
/**
 * Delete Row
 */
if($profileDelete){
	if($profileDelete==1) {
		$checkdeleteatt=$wpdb->query("DELETE FROM aec_profilevalue WHERE id = $profileId");
		$checkdeletequery=$wpdb->query("DELETE FROM aec_profile WHERE id = $profileId");
		if($checkdeletequery==FALSE && $checkdeleteatt==FALSE){
			$class = "error";
			echo "<div class=\"$class\"> <p>$wpdb->last_error</p></div>";
		} else{
			$_SESSION['success_messages']="<div class='updated'>Profile has been deleted</div>";
			wp_redirect( admin_url( "admin.php?page=list-profile")); exit;
		}
		
	}
}

/**
 * Update status
 */
if(isset($profileStatus)){
	if($profileStatus==1) {
		$updateStatusTrue = $wpdb->query("UPDATE aec_profile SET status = 0 WHERE id = '".$profileId."'");
		echo "UPDATE aec_profile SET status = 1 WHERE id = '".$profileId."'";
		if($updateStatusTrue==FALSE){
			$class = "error";
			echo "<div class=\"$class\"> <p>$wpdb->last_error</p></div>";
		} else{
			$_SESSION['success_messages']="<div class='updated'>Profile has been Updated</div>";
			wp_redirect( admin_url( "admin.php?page=list-profile")); exit;
		}
	}
	elseif($profileStatus==0){
		$updateStatusFalse = $wpdb->query("UPDATE aec_profile SET status = 1 WHERE id = '".$profileId."'");
		echo "UPDATE aec_profile SET status = 1 WHERE id = '".$profileId."'";
		
		//Send Approved copy to user
		$getProfile= get_profileDetail($profileId);
		$newpermalink = $getProfile->permalink;
		
		if($getProfile->profile_type == 1){
			$supplier_type= "Company";
		}elseif($getProfile->profile_type == 2){
			$supplier_type= "Project";	
		}
		include_once($_SERVER['DOCUMENT_ROOT']."/wp-content/themes/marsaec/email/profile_approve.php" );
		wp_mail( $getProfile->email, $subject, $approve_message, $headers);
		
		
		if($updateStatusFalse==FALSE){
			$class = "error";
			echo "<div class=\"$class\"> <p>$wpdb->last_error</p></div>";
		} else{
			$_SESSION['success_messages']="<div class='updated'>Profile has been Updated</div>";
			wp_redirect( admin_url( "admin.php?page=list-profile")); exit;
		}
	}
}
?>
