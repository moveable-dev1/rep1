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

  <div style="background-color:#ccc; padding:20px; margin-bottom:20px; ">
    <p> Primary
      <br>
      <label for="op">operational grid</label>
      <input name="op" id="op" type="checkbox" value="" class="pCheck" />
      <label for="generation">generation</label>
      <input name="generation" id="generation" type="checkbox" value="" class="pCheck" />
      <label for="microgrid">microgrid</label>
      <input name="microgrid" id="microgrid" type="checkbox" value="" class="pCheck" />
      <label for="transmission">transmission</label>
      <input name="transmission" id="transmission" type="checkbox" value="" class="pCheck" />
      <label for="distribution">distribution</label>
      <input name="distribution" id="distribution" type="checkbox" value="" class="pCheck" />
      <label for="tech">tech</label>
      <input name="tech" id="tech" type="checkbox" value="" class="pCheck" />
    </p>
    <p> Secondary
      <br>
      <label for="hydro">Hydro</label>
      <input name="hydro" id="hydro" type="checkbox" value="" class="sCheck" />
      <label for="gas">gas</label>
      <input name="gas" id="gas" type="checkbox" value="" class="sCheck" />
      <label for="nuclear">nuclear</label>
      <input name="nuclear" id="nuclear" type="checkbox" value="" class="sCheck" />
      <label for="solar">solar</label>
      <input name="solar" id="solar" type="checkbox" value="" class="sCheck" />
      <label for="wind">wind</label>
      <input name="wind" id="wind" type="checkbox" value="" class="sCheck" />
      <label for="biomass">biomass</label>
      <input name="biomass" id="biomass" type="checkbox" value="" class="sCheck" />
      <label for="other">other</label>
      <input name="other" id="other" type="checkbox" value="" class="sCheck" />
      <label for="tower">tower</label>
      <input name="tower" id="tower" type="checkbox" value="" class="sCheck" />
      <label for="generation2">generation2</label>
      <input name="generation2" id="generation2" type="checkbox" value="" class="sCheck" />
      <label for="residential">residential</label>
      <input name="residential" id="residential" type="checkbox" value="" class="sCheck" />
      <label for="ads">ads</label>
      <input name="ads" id="ads" type="checkbox" value="" class="sCheck" />
      <label for="comInd">comInd</label>
      <input name="comInd" id="comInd" type="checkbox" value="" class="sCheck" />
      <label for="cTech">cTech</label>
      <input name="cTech" id="cTech" type="checkbox" value="" class="sCheck" />
      <label for="eStorage">eStorage</label>
      <input name="eStorage" id="eStorage" type="checkbox" value="" class="sCheck" />
      <label for="ami">ami</label>
      <input name="ami" id="ami" type="checkbox" value="" class="sCheck" />
      <label for="dGeneration">dGeneration</label>
      <input name="dGeneration" id="dGeneration" type="checkbox" value="" class="sCheck" />
      <label for="es">es</label>
      <input name="es" id="es" type="checkbox" value="" class="sCheck" />
    </p>
  </div>



  <!-- END DEV CHECKBOXES -->


          <div style="width:100%;  margin:auto; position:relative" class="container">
            <!-- LOADER DIV -->
            <div class="loader">
              <img src="<?php bloginfo('template_directory'); ?>/img/bv.gif" width="80" height="80" />
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
                 <label for="<?php echo $catvalue->cat_name; ?>"><?php echo $catvalue->cat_name; ?></label>
                </div>
                <?php $qty++;
                }
                ?>
            </div>
          </div> 
          <div class="small-4 columns cat-col dsbl">
            <h4 class="cat-head">Refine</h4>
            <div id="level2" class="cat-cont-new"></div>
          </div>
          <div class="small-4 columns cat-col dsbl">
            <h4 class="cat-head">Refine</h4>
            <div id="level3" class="cat-cont-new"></div>
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
<input type="hidden" value="" id="getAllCatId">
</form>
<!--toggle section ends--> 
<div class="row" id="getTagProfiles">
</div>