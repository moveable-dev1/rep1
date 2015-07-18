jQuery(function($) {
//Get Level 2 Category
    $('#level1').on("change", ":checkbox", function () {
      $("#imageloader").show();
        if (this.checked) {
         var parentCat=this.value;
            // call ajax add_action declared in functions.php
            $.ajax({
                url: "/wp-admin/admin-ajax.php",
                type:'POST',
                data:'action=home_category_select_action&parent_cat_ID=' + parentCat,
                success:function(results)
                {
                  
                $("#level2help").hide();
                $("#imageloader").hide();
                $(".lev1.cat-col").removeClass('dsbl');
                //Append all child element in level 2
                $("#level2").append(results);
                }
             });
        } else
        {
          //Remove all level 2 element if unchecked
          $("#imageloader").hide();
          $("#getallcat"+this.value).remove();
        }
    });

//Get Level 3 Category
    $('#level2').on("change", ":checkbox", function () {
       $("#imageloader2").show();
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
                 $("#level3help").hide();
                 $(".lev2.cat-col").removeClass('dsbl');
                 $("#imageloader2").hide();
                 //Append all child element in level 3
                $("#level3").append(results);
                 //Disable parent category
                $("#level1 input[value='"+parentvalue+"']").prop("disabled", true);
               // removeChild.push(parentCat);
                }
             });
        } else {
            $("#imageloader2").hide();
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
          var filterclass=".isoShow";
          list.push(this.value);
          $("#getAllCatId").val(list);
          $container.isotope({
            itemSelector: '.items',
            masonry: {
              columnWidth: 40,
			  rowHeight: 107,
              isFitWidth: true
            }
          });
          $.post("/wp-admin/admin-ajax.php", 'action=home_tag_select_action&All_cat_ID=' + list+'&listlength='+list.length, function(response) 
          {
                $(".firstsearch").remove();
                $("#contentSection").remove();
                $container.html(response);
                if(!$container.hasClass('isotope')){
                  $container.isotope({ filter: filterclass });
                } else {
                  $container.isotope('reloadItems');
                  $container.isotope({
                  itemSelector: '.items',
				          masonry: {
                      columnWidth: 40,
					  rowHeight: 107,
                      isFitWidth: true
                    }
                });
                $container.isotope({ filter: filterclass });
                }
          });
        } else //If unchecked
        {
          var filterclass=".isoShow";
          list.splice( $.inArray(this.value,list) ,1 );
          $("#getAllCatId").val(list);
          $container.isotope({
            itemSelector: '.items',
            masonry: {
              columnWidth: 40,
			  rowHeight: 107,
              isFitWidth: true
              }
          });
          $.post("/wp-admin/admin-ajax.php", 'action=home_tag_select_action&All_cat_ID=' + list+'&listlength='+list.length, function(response) 
          {
                $(".firstsearch").remove();
                $("#contentSection").remove();
                $container.html(response);
                if(!$container.hasClass('isotope')){
                  $container.isotope({ filter: filterclass });
                } else {
                  $container.isotope('reloadItems');
                  $container.isotope({
                  itemSelector: '.items',
                  masonry: {
                    columnWidth: 40,
					rowHeight: 107,
                    isFitWidth: true
                    }
                });
                $container.isotope({ filter: filterclass });
                }
          });
        }
    });

    //Load more
$('.more_button').live("click",function() 
  {
    //var $container2 = $('#getTagProfiles .profile-sec');
    var getId = $(this).attr("id");
    var getCat= $("#getAllCatId").val();
    var filterclass=".isoShow";
    if(getId)
    { 
      $("#load_more_"+getId).html('<img src="/wp-content/themes/marsaec/img/load_img.gif" style="padding:10px 0 0 100px;"/>');
         $container.isotope({
            itemSelector: '.items',
             masonry: {
              columnWidth: 40,
			  rowHeight: 107,
              isFitWidth: true
              }
          });
          $.post("/wp-admin/admin-ajax.php", 'action=get_loadmore_profile&getLastContentId='+getId+'&getParentId='+getCat+'&listlength='+getCat.length, function(response) 
            {
                
                $container.append(response);
                if(!$container.hasClass('isotope')){
                  $("#load_more_"+getId).remove();
                  $container.isotope({ filter: filterclass });
                } else {
                  $("#load_more_"+getId).remove();
                  $container.isotope('reloadItems');
                  $container.isotope({
                  itemSelector: '.items',
                   masonry: {
                    columnWidth: 40,
					rowHeight: 107,
                    isFitWidth: true
                    }
                  });
                  $container.isotope({ filter: filterclass });
                }
          });
      // $.ajax({
      //   type: "POST",
      //   url: "/wp-admin/admin-ajax.php",
      //   data:'action=get_loadmore_profile&getLastContentId='+getId+'&getParentId='+getCat+'&listlength='+getCat.length,
      //   success: function(html){
      //       $container2.append(html);
      //       $("#load_more_"+getId).remove();
      //     }
      // });
    }
    return false;
  });

});