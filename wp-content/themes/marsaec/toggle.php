<?php
/**
 * The template used for displaying toggle section i.e. Infographics and tags
 *
 * @package marsaec
 */

wp_enqueue_style( 'toggleCss', get_template_directory_uri() . '/css/toggle.css', array(), '1' );
wp_enqueue_script( 'jqueryUI', get_template_directory_uri() . '/js/jquery-ui.js', array( 'jquery' ), '1.10.4', true );
wp_enqueue_script( 'infographic', get_template_directory_uri() . '/js/infographic.js', array( 'jquery' ), '1.0', true );
wp_enqueue_script( 'isotope', get_template_directory_uri() . '/js/jquery.isotope.min.js', array( 'jquery' ), '1.5.26', true );
wp_enqueue_script( 'toggle', get_template_directory_uri() . '/js/toggle.js', array( 'jquery' ), '1.0', true );
wp_enqueue_script( 'mobile-toggle', get_template_directory_uri() . '/js/mobileToggle.js', array( 'jquery' ), '1.0', true );
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
  <!-- DEV CHECKBOXES - TO BE INTEGRATED WITH WP -->

  <div id="infocheckbox" style="display:none">
      <input name="op" id="op" type="checkbox" value="77" class="pCheck" />
      <input name="generation" id="generation" type="checkbox" value="3" class="pCheck" />
      <input name="microgrid" id="microgrid" type="checkbox" value="71" class="pCheck" />
      <input name="transmission" id="transmission" type="checkbox" value="34" class="pCheck" />
      <input name="distribution" id="distribution" type="checkbox" value="9" class="pCheck" />
      <input name="tech" id="tech" type="checkbox" value="64" class="pCheck" />
      <input name="hydro" id="hydro" type="checkbox" value="20" class="sCheck" />
      <input name="gas" id="gas" type="checkbox" value="32" class="sCheck" />
      <input name="nuclear" id="nuclear" type="checkbox" value="31" class="sCheck" />
      <input name="solar" id="solar" type="checkbox" value="4" class="sCheck" />
      <input name="wind" id="wind" type="checkbox" value="16" class="sCheck" />
      <input name="biomass" id="biomass" type="checkbox" value="30" class="sCheck" />
      <input name="other" id="other" type="checkbox" value="33" class="sCheck" />
      <input name="tower" id="tower" type="checkbox" value="85" class="sCheck" />
      <input name="generation2" id="generation2" type="checkbox" value="72" class="sCheck" />
      <input name="residential" id="residential" type="checkbox" value="67" class="sCheck" />
      <input name="ads" id="ads" type="checkbox" value="45" class="sCheck" />
      <input name="comInd" id="comInd" type="checkbox" value="65" class="sCheck" />
      <input name="cTech" id="cTech" type="checkbox" value="74" class="sCheck" />
      <input name="eStorage" id="eStorage" type="checkbox" value="46" class="sCheck" />
      <input name="ami" id="ami" type="checkbox" value="15" class="sCheck" />
      <input name="dGeneration" id="dGeneration" type="checkbox" value="10" class="sCheck" />
      <input name="es" id="es" type="checkbox" value="46" class="sCheck" />
  </div>



  <!-- END DEV CHECKBOXES -->


          <div style="width:100%;  margin:auto; position:relative" class="container">
            <!-- LOADER DIV -->
            <div class="loader">
              <img src="<?php bloginfo('template_directory'); ?>/img/bv.gif" width="80" height="80" alt="loader" />
            </div>
            <!-- END LOADER DIV -->
            <!-- INFOGRAPHIC - JS CONTROLLED -->
            <div class="visualSelect"></div>
            <!-- END INFOGRAPHIC -->
          </div>
          <!-- <input type="text" value="" id="infoids"/> -->
        </div>
        <div aria-hidden="true" class="content" id="panel2-2">
          <div class="category-panel" id="levelContainer">
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
                 <label for="<?php echo sanitize_title($catvalue->cat_name); ?>"><?php echo $catvalue->cat_name; ?></label>
                </div>
                <?php $qty++;
                }
                ?>
            </div>
          </div> 
          <div class="small-4 columns cat-col lev1 dsbl">
            <h4 class="cat-head">Refine <div id="imageloader" style="display:none">
                <img src="/wp-content/themes/marsaec/img/ajax-loader.gif"/>
              </div></h4> 
            <div id="level2" class="cat-cont-new">
              <span id="level2help"> Please select at least one category from level two. </span>
            </div>
          </div>
          <div class="small-4 columns cat-col lev2 dsbl">
            <h4 class="cat-head">Refine <div id="imageloader2" style="display:none">
                <img src="/wp-content/themes/marsaec/img/ajax-loader.gif"/>
              </div> </h4>
            <div id="level3" class="cat-cont-new"><span id="level3help"> Please select at least one category from level two. </span></div>
          </div>
        </div>
        </div>
      </div>
    </div>
    
    <!--for devices only-->
    <div class="toggle-sec hide-for-large-only">
      <ul class="accordion" data-accordion="myAccordionGroup">
        <li class="accordion-navigation"> <a href="#panel4c" aria-expanded="false" title="">Search Site <i class="fa fa-caret-right up"></i></a>
          <div id="panel4c" class="content">
            <div id="mlevelContainer">
              <div class="cat-col">
                <h4 class="cat-head">Select Categories</h4>
                <div class="cat-cont" id="mlevel1">
                <?php //Show level 1 category for devices
                foreach ($parentcategory as $catvalue) {
                  ?>
                  <div>
                    
                    <input type="checkbox" class="cb" id="parent_cat" value="<?php echo $catvalue->cat_ID; ?>">
                    <label for="<?php echo $catvalue->cat_name; ?>">
                    <?php echo $catvalue->cat_name; ?></label>
                  </div>
                  <?php $qty++;
                  }
                  ?>
                </div>
              </div>
              <div class="mlev1 cat-col dsbl">
                <h4 class="cat-head">Refine  
                  <div id="mimageloader" style="display:none">
                      <img src="/wp-content/themes/marsaec/img/ajax-loader.gif"/>
                  </div>
                </h4>
                <div class="cat-cont" id="mlevel2"> 
                  <span id="mlevel2help"> Please select at least one category from level two. </span>
                </div>
              </div>
              <div class="mlev2 cat-col dsbl">
                <h4 class="cat-head">Refine
                  <div id="mimageloader2" style="display:none">
                    <img src="/wp-content/themes/marsaec/img/ajax-loader.gif"/>
                  </div> 
                </h4>
                <div class="cat-cont" id="mlevel3">
                 <span id="mlevel3help"> Please select at least one category from level two. 
                  </span>
              </div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</form>
<input type="hidden" value="" id="getAllCatId">
<!--toggle section ends--> 
<div class="row" id="getTagProfiles">
</div>