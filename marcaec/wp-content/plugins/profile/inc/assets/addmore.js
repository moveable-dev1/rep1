/**
 * addmore.js included in Add and Edit page
 */


/**
 * Add multiple input by add more button e.g. Affiliated Companies, Project Funders, Investors
 */
function addinput(elementid,limit,postname,postname2)
{     
        var n = jQuery("#"+elementid+" div").length;
        if (n <=limit) {
               jQuery("#"+elementid).append('<div class="has-btn"><label class="type_label fw-nrml main-sub-label" for="affiliated">Company Name</label><input type="text" name="'+postname+'[]"><label class="type_label fw-nrml main-sub-label" for="affiliated">Company URL</label><input type="text" name="'+postname2+'[]"><button class="delete remove-field-btn">Remove Company</button></div>');
        }
        else{
                alert("No more additional fields are allowed!");
        }
}

/**
 * Add multiple single input by add more button e.g. Video
 */
function addsingleinput(elementid,limit,postname)
{     
        var n = jQuery("#"+elementid+" div").length;
        if (n <=limit) {
               jQuery("#"+elementid).append('<div class="has-btn"><input type="text" name="'+postname+'[]"><button class="delete remove-field-btn">Remove</button></div>');
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
        var n = jQuery("#profile_featured div#FimageBox").length;
		
        if (n <=limit) {
               jQuery("#profile_featured").append('<div class="has-rt-btn mb" id="FimageBox"><div class="has-rt-btn"><input name="feauturedimage[]" type="file" id="feauturedimage" class="feauturedimage"><div class="fl-btn"><input name="feauturedimageradio[]" type="radio" id="feauturedimageradio" onclick="getElement()"><span class="type_label fw-nrml " for="featured_image">Featured Image</span></div><button class="delete remove-field-btn">Remove</button></div></div>');
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
        var n = jQuery("#profile_location div#ProfLoc").length;
        if (n <=limit) {
               jQuery("#profile_location").append("<div id='ProfLoc' class='has-btn'><label for='streetaddress' class='fw-nrml main-sub-label'>Street Address<input id='streetaddress' name='streetaddress[]' class='element text large' value='' type='text'></label><label for='streetaddress' class='fw-nrml main-sub-label'>City<input id='city' name='city[]' class='element text medium' value='' type='text'></label><label for='state' class='fw-nrml main-sub-label'>State / Province / Region<input id='state' name='state[]' class='element text medium' value='' type='text'></label><label for='postalcode' class='fw-nrml main-sub-label'>Postal / Zip Code<input id='postalcode' name='postalcode[]' class='element text medium' value='' type='text'></label><label for='country' class='fw-nrml main-sub-label'>Country<input id='country' name='country[]' class='element text medium' value='' type='text'></label><button class='delete remove-field-btn'>Remove Address</button></div>");
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
$("body").on("click", ".delete", function (e) {
         $(this).parent("div").remove();
});

//Get Level 2 Category
    $('#level1').on("change", ":checkbox", function () {
        if (this.checked) {
         var parentCat=this.value;
            // call ajax add_action declared in functions.php
            $.ajax({
                url:ajaxurl,
                type:'POST',
                data:'action=category_select_action&parent_cat_ID=' + parentCat,
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
                url:ajaxurl,
                type:'POST',
                data:'action=category_select_action&parent_cat_ID=' + parentCat,
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

//Get file information for logo
jQuery('#logo').bind('change', function($) {
		var $j=jQuery.noConflict();
        var filename = $j(this).val();
		//var filesize = $(this)[0].files[0].size;		
		var filesize = ($j(this)[0].files[0].size / 1024); 
			if (filesize / 1024 > 1) { 
				if (((filesize / 1024) / 1024) > 1) { 
					filesize = (Math.round(((filesize / 1024) / 1024) * 100) / 100);
					$j(this).prev($j('.file-status')).css('display' , 'block');
					$j(this).prev($j('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'GB');
				}
				else{ 
					filesize = (Math.round((filesize / 1024) * 100) / 100);
					$j(this).prev($j('.file-status')).css('display' , 'block');
					$j(this).prev($j('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'MB');
				} 
				} 
				else {
					filesize = (Math.round(filesize * 100) / 100);
					$j(this).prev($j('.file-status')).css('display' , 'block');
					$j(this).prev($j('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'KB');
				}	
        //filename=filename.substring(filename.lastIndexOf('\\')+1);
		//$(this).prev($('.file-status')).css('display' , 'block');
        //$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'bytes');
});

//Get file information for featured Image
jQuery('.feauturedimage').bind('change', function($) {
		var $j=jQuery.noConflict();
        var filename = $j(this).val();
		//var filesize = $(this)[0].files[0].size;		
		var filesize = ($j(this)[0].files[0].size / 1024); 
			if (filesize / 1024 > 1) { 
				if (((filesize / 1024) / 1024) > 1) { 
					filesize = (Math.round(((filesize / 1024) / 1024) * 100) / 100);
					$j(this).prev($j('.file-status')).css('display' , 'block');
					$j(this).prev($j('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'GB');
				}
				else{ 
					filesize = (Math.round((filesize / 1024) * 100) / 100);
					$j(this).prev($j('.file-status')).css('display' , 'block');
					$j(this).prev($j('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'MB');
				} 
				} 
				else {
					filesize = (Math.round(filesize * 100) / 100);
					$j(this).prev($j('.file-status')).css('display' , 'block');
					$j(this).prev($j('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'KB');
				}	
        //filename=filename.substring(filename.lastIndexOf('\\')+1);
		//$(this).prev($('.file-status')).css('display' , 'block');
        //$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'bytes');
});
