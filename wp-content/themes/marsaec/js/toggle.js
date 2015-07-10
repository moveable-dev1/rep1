jQuery(function($) {
//Get Level 2 Category
    $('#level1').on("change", ":checkbox", function () {
        if (this.checked) {
         var parentCat=this.value;
            // call ajax add_action declared in functions.php
            $.ajax({
                url: "/wp-admin/admin-ajax.php",
                type:'POST',
                data:'action=home_category_select_action&parent_cat_ID=' + parentCat,
                success:function(results)
                {
                //Append all child element in level 2
                $("#level2").append(results);
                }
             });
        } else
        {
          //Remove all level 2 element if unchecked
          $("#getallcat"+this.value).remove();
        }
    });

//Get Level 3 Category
    $('#level2').on("change", ":checkbox", function () {
        if (this.checked) {
         var parentCat=this.value;
         var parentvalue = $('#parent_id'+parentCat).val();
            // call ajax
            $.ajax({
                url: "/wp-admin/admin-ajax.php",
                type:'POST',
                data:'action=home_category_select_action&parent_cat_ID=' + parentCat,
                success:function(results)
                {
                 //Append all child element in level 3
                $("#level3").append(results);
                 //Disable parent category
                $("#level1 input[value='"+parentvalue+"']").prop("disabled", true);
               // removeChild.push(parentCat);
                }
             });
        } else {
            var parentvalue = $('#parent_id'+this.value).val();
            var checkcheckbox=$('#getallcat'+parentvalue+' #parent_cat2').is(':checked');
            //check if any child category is checked
            if(checkcheckbox==false) {
            //Enable the parent checkbox if unchecked all child element
            $("#level1 input[value='"+parentvalue+"']").prop("disabled", false);
            }
             //Remove all level 3 element if unchecked
            $("#getallcat"+this.value).remove();
        }
    });

    //Load Profile based on tags
    var list = new Array();
    var $container = $('#getTagProfiles');
    var $checkboxes = $('#levelContainer input.cb');
    $('#levelContainer').on("change", ":checkbox", function () {
        if (this.checked) {
         list.push(this.value);
         $("#getAllCatId").val(list);
            // call ajax add_action declared in functions.php
            $.ajax({
                url: "/wp-admin/admin-ajax.php",
                type:'POST',
                data:'action=home_tag_select_action&All_cat_ID=' + list+'&listlength='+list.length,
                success:function(results)
                {
                $container.html(results);
                //$container.append( results ).isotope( 'appended', results );
                $("#contentSection").remove();
                }
             });
        } else
        {
          list.splice( $.inArray(this.value,list) ,1 );
           $("#getAllCatId").val(list);
              $.ajax({
                url: "/wp-admin/admin-ajax.php",
                type:'POST',
                data:'action=home_tag_select_action&All_cat_ID=' + list+'&listlength='+list.length,
                success:function(results)
                {
                  $("#getTagProfiles").html(results);
                }
             });
        }
    });

    //Load more
$('.more_button').live("click",function() 
  {
    var getId = $(this).attr("id");
    var getCat= $("#getAllCatId").val();
    if(getId)
    { 
      $("#load_more_"+getId).html('<img src="/wp-content/themes/marsaec/img/load_img.gif" style="padding:10px 0 0 100px;"/>');  
      $.ajax({
        type: "POST",
        url: "/wp-admin/admin-ajax.php",
        data:'action=get_loadmore_profile&getLastContentId='+getId+'&getParentId='+getCat+'&listlength='+getCat.length,
        success: function(html){
            $(".profile-sec").append(html);
            $("#load_more_"+getId).remove();
          }
      });
    }
    return false;
  });

});