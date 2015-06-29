 jQuery(document).ready(function($) {
        //  $(".widefat tr:even").addClass('alternate')
		 $("#searchUsers").change(function(){
			 var srch = $("#searchUsers").val();
			 if(srch!=""){
			 	srchquery="&s="+srch;
			 } else {
			 	srchquery="";
			 }
			 window.location.href="admin.php?page=list-profile"+srchquery;
			 });
    });