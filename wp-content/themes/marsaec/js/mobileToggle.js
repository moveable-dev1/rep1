//Search by tags for mobile
jQuery(function($) {
//Get Level 2 Category
    $('#mlevel1').on("change", ":checkbox", function () {
      $("#mimageloader").show(); //Show Loader
        if (this.checked) {
         var parentCat=this.value;
            // call ajax add_action declared in functions.php
            $.ajax({
                url: "/wp-admin/admin-ajax.php",
                type:'POST',
                data:'action=home_category_select_action&parent_cat_ID=' + parentCat,
                success:function(results)
                {
                $(".mlev1.cat-col").removeClass('dsbl'); //Bold refine heading
                $("#mlevel2help").hide(); //Remove refine help text
                $("#mimageloader").hide(); //Hide Loader
                //Append all child element in level 2
                $("#mlevel2").append(results);
                }
             });
        } else
        {
          $("#mimageloader").hide(); //Hide Loader
          //Remove all level 2 element if unchecked
          $("#getallcat"+this.value).remove();
        }
    });

//Get Level 3 Category
    $('#mlevel2').on("change", ":checkbox", function () {
      $("#mimageloader2").show(); //Show loader
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
                $(".mlev2.cat-col").removeClass('dsbl');
                $("#mlevel3help").hide(); //Hide refine help text
                $("#mimageloader2").hide();    
                 //Append all child element in level 3
                $("#mlevel3").append(results);
                 //Disable parent category
                $("#level1 input[value='"+parentvalue+"']").prop("disabled", true);
               // removeChild.push(parentCat);
                }
             });
        } else {
            $("#mimageloader2").hide(); //Hide loader
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
var list = new Array();
var $container = $('#getTagProfiles');
var $checkboxes = $('#mlevelContainer input.cb');
$('#mlevelContainer').on("change", ":checkbox", function () {
        if (this.checked) {
          var filterclass=".isoShow";
          list.push(this.value);
          $("#getAllCatId").val(list);
          //Isotope
          $container.isotope({
            itemSelector: '.items',
            masonry: {
              columnWidth: 40,
              isFitWidth: true
            }
          });
          $.post("/wp-admin/admin-ajax.php", 'action=home_tag_select_action&All_cat_ID=' + list+'&listlength='+list.length, function(response) 
          {
                $("#contentSection").remove();
                $container.html(response);
                //Check isotope section
                if(!$container.hasClass('isotope')){
                  $container.isotope({ filter: filterclass });
                } else {
                  $container.isotope('reloadItems');
                  $container.isotope({
                  itemSelector: '.items',
                  masonry: {
                      columnWidth: 40,
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
              isFitWidth: true
              }
          });
          $.post("/wp-admin/admin-ajax.php", 'action=home_tag_select_action&All_cat_ID=' + list+'&listlength='+list.length, function(response) 
          {
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
                    isFitWidth: true
                    }
                });
                $container.isotope({ filter: filterclass });
                }
          });
        }
    });


});