/**
 * Add multiple input by add more button e.g. Affiliated Companies, Project Funders, Investors
 */
function addinput(elementid,limit,postname)
{     
        var n = jQuery("#"+elementid+" div#length").length;
        if (n <limit) {
                jQuery("#"+elementid).append("<div class='has-btn' id='length'><label for='affiliated' class='fw-nrml main-sub-label'>Company Name</label><input type='text' name='"+postname+"[]' id='"+postname+"'><a class='remove-field-btn' alt='remove-company' id='delete'>Remove Company</a></div>");
        }
        else{
                alert("No more additional fields are allowed!");
        }
        
}

/**
 * Add multiple featured image by add more button
 */
function addfeaturedimage(limit)
{     
        var n = jQuery("#profile_featured div#length").length;
		
        if (n <limit) {
               jQuery("#profile_featured").append('<div id="length"><div class="has-rt-btn"><label><span class="upload"> <span class="file-status">file name</span><input type="file" name="feauturedimage[]" id="feauturedimage"/></span></label><div class="fl-btn"><input name="feauturedimageradio[]" type="radio" id="feauturedimageradio" onclick="getElement()"><label class="type_label fw-nrml ">Featured Image</label></div><a class="remove-field-btn" alt="remove-company" id="delete">Remove Image</a></div></div>');
        }
        else{
                alert("No more additional fields are allowed!");
        }
}
/**
 * Add multiple address by add more button
 */
function add_address(limit)
{     
        var n = jQuery("#profile_location div#LengthLoc").length;
        if (n <limit) {
               jQuery("#profile_location").append('<div id="LengthLoc"><div class="has-btn"><label for="address" class="fw-nrml main-sub-label">Street Address</label><input id="streetaddress" name="streetaddress[]" type="text"></div><span class="fw-nrml sub-label" id="delete"><a class="remove-field-btn" alt="remove-address"><img src="/wp-content/themes/marsaec/img/remove-field.jpg" alt="remove-field" /></a>Remove Address</span><label for="city" class="fw-nrml main-sub-label">City<input type="text" id="city" name="city[]"></label><label for="state" class="fw-nrml main-sub-label">State / Province / Region<input type="text" id="state" name="state[]"></label><label for="zip" class="fw-nrml main-sub-label">ZIP / Postal Code<input type="text" id="postalcode" name="postalcode[]"></label><label for="country" class="fw-nrml main-sub-label">Country<input type="text" id="country" name="country[]"></label></div>');
        }
        else{
                alert("No more additional fields are allowed!");
        }
}

/**
 * Set Featured image
 */
function getElement() {
    var options = document.getElementsByName('feauturedimageradio[]');
    for(i = 0; i < options.length; i++)
    {
        var opt = options[i];
        if(opt.type=="radio")
        {              
            if(opt.checked)
            {
                //Set value for featured image if checked
                document.getElementById('feauturedimagevalue').value = i+1;
            }                  
        }
    }
}     


jQuery(function($) {
//Delete Add more elements
$("body").on("click", "#delete", function (e) {
       $(this).parent("div").remove();
});

//Get Level 2 Category
    $('#level1').on("change", ":checkbox", function () {
        if (this.checked) {
         var parentCat=this.value;
            // call ajax add_action declared in functions.php
            $.ajax({
                url:"/wp-admin/admin-ajax.php",
                type:'POST',
                data:'action=category_select_frontend&parent_cat_ID=' + parentCat,
                success:function(results)
                {
                //Append all child element in level 2
                $("#level2 ul").append(results);
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
                url:"/wp-admin/admin-ajax.php",
                type:'POST',
                data:'action=category_select_frontend&parent_cat_ID=' + parentCat,
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

    //Remove Disabled attribute on save
    $("form").submit(function() {
             $("input").removeAttr("disabled");
    });
    
    //Check Profile type
    $('#profile_type input:radio[name="profile_type"]').change(function(){
       var checkprofile=$(this).val();
       if(checkprofile==1) { //If profile type is company
        $('#profile_projectfunders').hide();
        $('#projectaddmore').hide();
        $('#ProfHTxt').hide();
        $('#CompHTxt').show();
        $('#profile_investors').show();
        $('#companyaddmore').show();
       }
       else {
        $('#profile_projectfunders').show();
        $('#projectaddmore').show();
        $('#ProfHTxt').show();
        $('#CompHTxt').hide();
        $('#profile_investors').hide();
        $('#companyaddmore').hide();
       }
    });
});




