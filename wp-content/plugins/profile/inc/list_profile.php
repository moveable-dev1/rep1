<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Manage Profile</title>
</head>
<body>
<?php include( plugin_dir_path( __FILE__ ) . 'ListProfileInclude.php'); ?>
<div class="wrap">
	<div class="icon32 icon32-posts-page" id="icon-edit-pages"><br></div>
 	<h2>Manage Profiles</h2>
 	<form action="admin.php?page=list-profile" id="searchreguser" method="get" style="float:right;">
		<label for="all"></label> 
		<input type="hidden" name="page" value="list-profile"/>
		<input type="text" placeholder="Enter Name, Email" id="all" name="all" class="field" style="width:180px; display:inline-block;">
		<input type="submit" id="searchregusersubmit" value="Submit" class="btn">
	</form>

 	<form name="frm" action="" method="get" enctype="multipart/form-data" >
 		<div class="tablenav top">
        	<div class="alignleft actions">
				<select name="searchUsers" id="searchUsers">
                    <option value="">[Select Profile Type]</option>
                    <option value="1" <?php if($_GET['s'] == '1'){echo 'selected="selected"';}?>>Company</option>
                    <option value="2" <?php if($_GET['s'] == '2'){echo 'selected="selected"';}?>>Project</option>
                </select>
            </div>   

			<div class="tablenav-pages">
				<span class="pagination-links">
				<?php $str="page=list-profile";
				paging_2($str,"50%");?>
				</span>
			</div>
		</div>

		<table align="center" cellpadding="0" cellspacing="0" border="0" class="wp-list-table widefat fixed pages" >
			<thead>
				<tr class="head">
					<th width="1%"></th>
		            <th width="15%"><strong>Name</strong></th>
		            <th width="20%"><strong>Email</strong></th>
		            <th width="10%"><strong>Profile Type</strong></th>
		            <th width="10%"><strong>Region</strong></th>
		            <th width="10%"><strong>Status</strong></th>
					<th width="10%"><strong>Is Featured</strong></th>
				</tr>
	        </thead>
	         <?php if($AllProfileName) { //Get result value
		       	foreach ($AllProfileName as $ProfileValue) { ?>

				<tr>
					<td><?php/* <input name="checkbox[]" type="checkbox" id="checkbox[]" value="<?php echo $ProfileValue->id; ?>"> */?></td>
		            <td>
		            	<strong>
		            		<a class="row-title" href="admin.php?page=edit-profile&profileid=<?php echo $ProfileValue->id; ?>"><?php echo $ProfileValue->name; ?>
		            		</a>
		            	</strong>
		                <div class="row-actions">
							<span class="edit">
								<?php 
								$profileStatus=$ProfileValue->status; 
								if($profileStatus == 1){?>
		                        <a href="admin.php?page=list-profile&status=1&profileid=<?php echo $ProfileValue->id; ?>">Unapproved</a>
		                        <?php } else {?>
		                        <a href="admin.php?page=list-profile&status=0&profileid=<?php echo $ProfileValue->id; ?>">Approved</a>
		                        <?php } ?> | </span>
		                        <span class="edit">
		                        	<a href="admin.php?page=edit-profile&profileid=<?php echo $ProfileValue->id; ?>">Edit
		                        	</a> | 
		                        </span>
		                         <span class="view"> 
		                        	<a href="/profile/<?php echo $ProfileValue->permalink; ?>" target="_blank">View
		                        	</a> | 
		                        </span>
		                        <span class="trash">
		                        	<a href="admin.php?page=list-profile&delete=1&profileid=<?php echo $ProfileValue->id; ?>" onClick="return confirm('Are you sure you want to delete this?');">Delete
		                        	</a> 
		                        </span>
		                    </div>
		            </td>
		            <td><?php echo $ProfileValue->email; ?></td>
		            <td><?php $profileType=$ProfileValue->profile_type; 
		            	 echo $profileType==1? "Company":"Project"; ?>
		            </td>
		            <td><?php $profileRegion=$ProfileValue->region;
		            		  if($profileRegion==1){
		            		  	echo "Ontario";
		            		  } elseif($profileRegion==2){
		            		  	echo "Canada";
		            		  } elseif($profileRegion==3){
		            		  	echo "Worldwide";
		            		  }

		            	 ?>
		            </td>
		            <td><?php echo $profileStatus==1? "Approved":"Unapproved"; ?>
		            </td>
					 <td><?php $profileIsfeatured=$ProfileValue->is_featured; 
		            	 echo $profileIsfeatured==1? "Yes":"No"; ?>
		            </td>
				</tr>
				<?php } //End foreach
			} else {  
				echo "<tr><td></td><td>No profile found</td></tr>"; 
			}?>
					<div id="dialog" title="Company Members"></div> 
        </table>
	</form>
    <div class="tablenav bottom">
		<div class="tablenav-pages">
			<span class="pagination-links">
			</span>
		</div>
	</div>
</div>
<?php session_destroy(); ?>
</body>
</html>