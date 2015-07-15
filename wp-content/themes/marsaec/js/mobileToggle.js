jQuery(function($) {
//Get Level 2 Category
    $('#mlevel1').on("change", ":checkbox", function () {
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
                $("#mlevel2").append(results);
                }
             });
        } else
        {
          //Remove all level 2 element if unchecked
          $("#getallcat"+this.value).remove();
        }
    });

//Get Level 3 Category
    $('#mlevel2').on("change", ":checkbox", function () {
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
                $("#mlevel3").append(results);
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

});