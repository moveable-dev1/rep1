jQuery(function($) {
  var $containerSearch = $('#getSearchProfiles');
  $('.searchmore_button').live("click",function() 
  {
    //var $container2 = $('#getTagProfiles .profile-sec');
    var getId = $(this).attr("id");
    var filterclass=".isoShow";
    if(getId)
    { 
     $("#load_more_"+getId).html('<img src="/wp-content/themes/marsaec/img/load_img.gif" style="padding:10px 0 0 100px;"/>');
         $containerSearch.isotope({
            itemSelector: '.items',
             masonry: {
              columnWidth: 40,
              isFitWidth: true
              }
          });
          $.post("/wp-admin/admin-ajax.php", 'action=get_searchloadmore_profile&getLastContentId='+getId, function(response) 
            {
                
                $containerSearch.append(response);
                if(!$containerSearch.hasClass('isotope')){
                  $("#load_more_"+getId).remove();
                  $containerSearch.isotope({ filter: filterclass });
                } else {
                  $("#load_more_"+getId).remove();
                  $containerSearch.isotope('reloadItems');
                  $containerSearch.isotope({
                  itemSelector: '.items',
                   masonry: {
                    columnWidth: 40,
                    isFitWidth: true
                    }
                  });
                  $containerSearch.isotope({ filter: filterclass });
                }
          });
    }
    return false;
  });
});