<?php
/**
 * The template used for displaying toggle section i.e. Infographics and tags
 *
 * @package marsaec
 */
?>
<!--toggle section starts-->

<form class="custom" action="<?php echo get_permalink( 28 ); ?>" method="get">
  <div class="row">
    <div class="toggle-sec show-for-large-only">
      <div class="toggle-head">
        <div class="large-8 columns"> <span class="left toggle-title">Browse by:</span>
          <ul class="tabs button-group radius" data-tab role="tablist">
            <li class="tab-title active"><a href="#panel2-1" tabindex="0" aria-selected="true" title="" role="tab">INFOGRAPHIC</a></li>
            <li class="tab-title"><a href="#panel2-2" tabindex="0" aria-selected="false" title="" role="tab">CATEGORY</a></li>
          </ul>
        </div>
        <div class="large-4 columns">
          <div class="row collapse postfix-radius search-box">
            <div class="small-10 columns">
              <input type="text" placeholder="Search all profiles" title="search" name="q">
            </div>
            <div class="small-2 columns">
              <input type="submit" value="" class="search-sub">
              <!--<a href="#" class="postfix" aria-label="submit form" title=""><img src="<?php //bloginfo('template_directory'); ?>/img/search-icon.png" alt="search"/></a> --></div>
          </div>
        </div>
      </div>
      <div class="tabs-content">
        <div aria-hidden="false" class="content active text-center" id="panel2-1">
          <div class="infographic"> <img src="<?php bloginfo('template_directory'); ?>/img/infographic.jpg" alt="image"/> </div>
        </div>
        <div aria-hidden="true" class="content" id="panel2-2">
          <div class="small-4 columns cat-col">
            <h4 class="cat-head">Select Categories</h4>
            <div class="cat-cont-new" id="level1">
                <?php
                //Display all Parent Category
                $args = array(
                     'parent'         => 8, //Get all category of profile category ID=8
                     'hide_empty'    => false,
                ); 
                $parentcategory = get_categories($args);
                $qty=1;
                foreach ($parentcategory as $catvalue) {
                ?>
                <div>
                 <input type="checkbox" class="cb" id="parent_cat" value="<?php echo $catvalue->cat_ID; ?>">
                 <label for="<?php echo $catvalue->cat_name; ?>"><?php echo $catvalue->cat_name; ?></label>
                </div>
                <?php $qty++;
                }
                ?>
            </div>
          </div>
          <div class="small-4 columns cat-col dsbl">
            <h4 class="cat-head">Refine</h4>
            <div id="level2">  </div>
          </div>
          <div class="small-4 columns cat-col dsbl">
            <h4 class="cat-head">Refine</h4>
            <div id="level3"></div>
          </div>
        </div>
      </div>
    </div>
    
    <!--for devices only-->
    <div class="toggle-sec hide-for-large-only">
      <ul class="accordion" data-accordion="myAccordionGroup">
        <li class="accordion-navigation"> <a href="#panel4c" aria-expanded="false" title="">Search Site <i class="fa fa-caret-right up"></i></a>
          <div id="panel4c" class="content">
            <div class="cat-col">
              <h4 class="cat-head">Select Categories</h4>
              <div class="cat-cont">
                <label for="category1a">
                  <input type="checkbox" class="cb" id="category1a">
                  <span class="custom checkbox"></span>Centralized Generation</label>
                <label for="category2a">
                  <input type="checkbox" class="cb" id="category2a">
                  <span class="custom checkbox"></span>Transmission</label>
                <label for="category3a">
                  <input type="checkbox" class="cb" id="category3a">
                  <span class="custom checkbox"></span>Distribution</label>
                <label for="category4a">
                  <input type="checkbox" class="cb" id="category4a">
                  <span class="custom checkbox"></span>Customer Technologies</label>
                <label for="category5a">
                  <input type="checkbox" class="cb" id="category5a">
                  <span class="custom checkbox"></span>Microgrid</label>
                <label for="category6a">
                  <input type="checkbox" class="cb" id="category6a">
                  <span class="custom checkbox"></span>Grid Operation</label>
              </div>
            </div>
            <div class="cat-col dsbl">
              <h4 class="cat-head">Refine</h4>
              <div class="cat-cont"> Please select at least one category from level one. </div>
            </div>
            <div class="cat-col dsbl">
              <h4 class="cat-head">Refine</h4>
              <div class="cat-cont"> Please select at least one category from level one. </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</form>
<script type="text/javascript">
jQuery(function($) {
//Get Level 2 Category
    $('#level1').on("change", ":checkbox", function () {
        if (this.checked) {
         var parentCat=this.value;
            // call ajax add_action declared in functions.php
            $.ajax({
                url: "<?php echo admin_url('admin-ajax.php'); ?>",
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
                url: "<?php echo admin_url('admin-ajax.php'); ?>",
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
 });
</script>
<!--toggle section ends--> 