<?php
/**
 * Template Name: Profile Details
 *
 *
 * @package Marsaec
 * 
 */

get_header();
require get_template_directory() . '/inc/detail-profile.php';
$profileVar = get_query_var('profile');
if( ctype_digit( $profileVar ) )  //Check if variable is ID
{
	$profileId=$profileVar;
} else { //Get Profile ID
	$profileId=get_profileId($profileVar);
}

if($profileId) {
$getProfile= get_profileDetail($profileId);
?>
<link href="<?php bloginfo('template_directory'); ?>/css/carosuel.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<?php bloginfo('template_directory'); ?>/css/jquery.fancybox.css?v=2.1.5" media="screen" />
<!--Banner section starts-->

<?php get_template_part( 'toggle' ); ?>

<!--Company Detail section starts-->
<div class="row">
  <div class="profile-sec">
    <div class="large-12 columns text-center"> <a href="#" class="share-btn" title=""><img src="<?php bloginfo('template_directory'); ?>/img/share-icon.jpg" alt="image"/></a> </div>
    <!--Left Column-->
    <div class="comp-detail-sec">
      <div class="large-6 columns pad-no">
        <div class="row prof-cont prof-cont-inner">
          <div class="small-3 columns">
            <div class="comp-thumb"><img class="th radius" alt="image" src="<?php echo $getProfile->logo; ?>"> </div>
          </div>
          <div class="small-9 columns"> <span class="comp-name-detail"><?php echo $getProfile->name; ?></span> </div>
        </div>
        <div class="row prof-cont comp-short prof-cont-inner">
          <p><?php echo $getProfile->description; ?></p>
        </div>
     
          	<?php 
          	//Get Featured Image
          	$getfetauredImage=GetSingleFront($metaid=8,$profileId);
          	if(!empty($getfetauredImage)){ ?>
		     <div class="row prof-cont comp-short prof-cont-inner">
		      <div class="sub-head">PHOTOS</div>
	          <ul id="profileCarousel">
                <?php foreach ($getfetauredImage as $FeaValue) { ?>
	               <li>
	            	<a class="fancybox" href="<?php echo $featuredimgurl[]=$FeaValue->value; ?>" data-fancybox-group="gallery" title="">
	            		<img src="<?php echo $featuredimgurl[]=$FeaValue->value; ?>" alt="image">
	            	</a>
	            	</li>
                <?php } ?>
              </ul>
       		</div>
           <?php }
          	 ?>
            
          
         <?php
        //Videos ID=14
        $getVideos=GetSingleFront($metaid=14,$profileId); //Get All Videos
        if(!empty($getVideos)){
        ?>
        <div class="row prof-cont comp-short prof-cont-inner">
          <div class="sub-head">VIDEO</div>
          <div class="clearfix"></div>
          <div class=""> 
           <ul id="profileVideos">
            <?php  foreach ($getVideos as $VideosValue) { ?>
            <li>
                  <iframe src="<?php echo $VideosValue->value; ?>" width="400" height="225" allowfullscreen="" title="video"></iframe>
            </li>
             <?php } ?>
          </ul>
          </div>
        </div>
        <?php } ?>


      </div>
      
      <!--Right Sidebar-->
      <div class="large-5 large-offset-1 columns"> 
        <!--Company Links box-->
        <ul class="small-block-grid-2 comp-btn">
          <li>
            <form action="<?php echo get_permalink( 20 ); ?>" method="post" id="contactProfile">
            <input type="hidden" name="profile" value="<?php echo $getProfile->profile_type; ?>" />
            <input type="submit" value="Contact this Profile" class="button expand radius more-btn big-btn cont-comp" />
          </form>
          </li>
          <?php $website=$getProfile->website; 
          if($website) {
          ?>
          <li><a href="<?php echo $website; ?>" class="button expand radius more-btn big-btn" role="button" title="Visit Website" target="_blank"><img src="<?php bloginfo('template_directory'); ?>/img/website-icon.jpg" alt="image"/> Visit Website</a></li>
          <?php } ?>
        </ul>
        <a href="mailto:advancedenergycentre@marsdd.com?subject=Request Translation for a Profile from Visible AEC website&body=Translation of this page is available on request in the following languages:%0D%0A%0D%0A- German%0D%0A- French%0D%0A- Mandarin%0D%0A- Spanish%0D%0A%0D%0A<?php echo get_site_url().$_SERVER['REQUEST_URI']; ?>%0D%0A%0D%0APlease let us know how we can help you.%0D%0A%0D%0AThanks,%0D%0AVisible AEC Administration" class="button expand radius more-btn more-btn-inner req-link" role="button" title="">Request Translation</a> 
        
        <!--Follow box-->
        <div class="show-for-large-only">
          <div class="sub-head side-bar-subhead">Follow</div>
          <div class="sidebar-social"> 
            <?php if($getProfile->facebook){ ?>
           <a href="<?php echo $getProfile->facebook; ?>" title="" target="_blank"> <img src="/wp-content/themes/marsaec/img/fb-icon.png" alt="facebook link"> </a>
            <?php }
            if($getProfile->twitter){ ?>
            <a href="<?php echo $getProfile->twitter; ?>" title="" target="_blank"> <img src="/wp-content/themes/marsaec/img/twitter-icon.png" alt="twitter link"> </a>
            <?php }
            if($getProfile->linkedin){ ?>
           <a href="<?php echo $getProfile->linkedin; ?>" title="" target="_blank"> <img src="/wp-content/themes/marsaec/img/in-icon.png" alt="linkedin link"> </a>
            <?php } ?>
          </div>
        </div>
        <div class="hide-for-large-only">
          <hr>
          <ul class="accordion" data-accordion="myAccordionGroup">
            <li class="accordion-navigation"> <a href="#panelFollow" aria-expanded="false" title="">Follow Company / Project<i class="fa fa-caret-right"></i></a>
              <div id="panelFollow" class="content">
                <div class="sidebar-social">
                  <?php if($getProfile->facebook){ ?>
                 <a href="<?php echo $getProfile->facebook; ?>" title="" target="_blank"> <img src="/wp-content/themes/marsaec/img/fb-icon.png" alt="facebook link"> </a> 
                   <?php }
                  if($getProfile->twitter){ ?>
                 <a href="<?php echo $getProfile->twitter; ?>" title="" target="_blank"> <img src="/wp-content/themes/marsaec/img/twitter-icon.png" alt="twitter link"> </a>  
                  <?php }
                  if($getProfile->linkedin){ ?>
                 <a href="<?php echo $getProfile->linkedin; ?>" title="" target="_blank"> <img src="/wp-content/themes/marsaec/img/in-icon.png" alt="linkedin link"> </a> 
                  <?php } ?>
               </div>
              </div>
            </li>
          </ul>
          <hr>
        </div>

        <!--Map box-->
        <div class="comp-map show-for-large-only">
        <iframe src="<?php echo get_addressMap($profileId); ?>" width="305" height="180"></iframe>
        </div>
        
        <!--Award box-->
         <?php if($getProfile->awards){ ?>
        <div class="show-for-large-only">
          <div class="sub-head side-bar-subhead">AWARDS & RECOGNITIONS</div>
          <div class="links-list">
          <?php echo $getProfile->awards; ?>
        </div></div>
       
        <div class="hide-for-large-only">
          <ul class="accordion" data-accordion="myAccordionGroup">
            <li class="accordion-navigation"> <a href="#panelAward" aria-expanded="false" title="">Awards & Recognitions<i class="fa fa-caret-right up"></i></a>
            <div class="content" id="panelAward">
              <div class="links-list">
                <?php echo $getProfile->awards; ?>
              </div>
            </div>
            </li>
          </ul>
          <hr>
        </div>
         <?php } ?>
        
        <!--Affiliation box-->
         <?php
        //Affiliated Company Name Id=1, URL id=2
        $getAffCompany=GetSingleFront($metaid=1,$profileId);
        if(!empty($getAffCompany)){
        ?>
        <div class="show-for-large-only">
          <div class="sub-head side-bar-subhead">Affiliated Companies</div>
          <ul class="links-list">
            <?php foreach ($getAffCompany as $AffValue) { ?>
            <li><a href="<?php echo GetSet($metaid=2, $fieldid=$AffValue->fieldid,$profileId); ?>" title="<?php  echo $AffValue->value; ?>"><?php  echo $AffValue->value; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <div class="hide-for-large-only">
          <ul class="accordion" data-accordion="myAccordionGroup">
            <li class="accordion-navigation"> <a href="#panelAffliation" aria-expanded="false" title="">Affiliated Companies<i class="fa fa-caret-right up"></i></a>
              <div id="panelAffliation" class="content">
                <ul class="links-list">
                   <?php foreach ($getAffCompany as $AffValue) { ?>
                  <li><a href="<?php echo GetSet($metaid=2, $fieldid=$AffValue->fieldid,$profileId); ?>" title="<?php  echo $AffValue->value; ?>"><?php  echo $AffValue->value; ?></a></li>
                 <?php } ?>
                </ul>
              </div>
            </li>
          </ul>
          <hr>
        </div>
        <?php } ?>
        <!--Funders box-->
         <?php
        //Project Funder name ID=10, URL=11
        $getFunders=GetSingleFront($metaid=10,$profileId);
        if(!empty($getFunders) && $getProfile->profile_type==2){
        ?>
        <div class="show-for-large-only">
          <div class="sub-head side-bar-subhead">Project Funders</div>
          <ul class="links-list">
            <?php  foreach ($getFunders as $FundersValue) { //Get all investors ?>
            <li><a href="<?php echo GetSet($metaid=11, $fieldid=$InvestorsValue->fieldid,$profileId); ?>" title="<?php echo $FundersValue->value; ?>"><?php echo $FundersValue->value; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <div class="hide-for-large-only">
          <ul class="accordion" data-accordion="myAccordionGroup">
            <li class="accordion-navigation"> <a href="#paneFunders" aria-expanded="false" title="">Project Funders<i class="fa fa-caret-right up"></i></a>
              <div id="paneFunders" class="content">
                <ul class="links-list">
                   <?php  foreach ($getFunders as $FundersValue) { //Get all investors ?>
                  <li><a href="<?php echo GetSet($metaid=11, $fieldid=$InvestorsValue->fieldid,$profileId); ?>" title="<?php echo $FundersValue->value; ?>"><?php echo $FundersValue->value; ?></a></li>
                  <?php } ?>
                </ul>
              </div>
            </li>
          </ul>
          <hr>
        </div>
        <?php } ?>
        <!--Investors box-->
          <?php
        //Investors ID=12, URL=13
        $getInvestors=GetSingleFront($metaid=12,$profileId);
        if(!empty($getInvestors) && $getProfile->profile_type==1){
        ?>
        <div class="show-for-large-only">
          <div class="sub-head side-bar-subhead">Investors</div>
          <ul class="links-list">
             <?php  foreach ($getInvestors as $InvestorsValue) { //Get all investors ?>
            <li><a href="<?php echo GetSet($metaid=13, $fieldid=$InvestorsValue->fieldid,$profileId); ?>" title="<?php echo $InvestorsValue->value; ?>"><?php echo $InvestorsValue->value; ?></a></li>
           <?php } ?>
          </ul>
        </div>
        <div class="hide-for-large-only">
          <ul class="accordion" data-accordion="myAccordionGroup">
            <li class="accordion-navigation"> <a href="#paneInvestors" aria-expanded="false" title="">Investors<i class="fa fa-caret-right up"></i></a>
              <div id="paneInvestors" class="content">
                <ul class="links-list">
                   <?php  foreach ($getInvestors as $InvestorsValue) { //Get all investors ?>
                  <li><a href="<?php echo GetSet($metaid=13, $fieldid=$InvestorsValue->fieldid,$profileId); ?>" title="<?php echo $InvestorsValue->value; ?>"><?php echo $InvestorsValue->value; ?></a></li>
                  <?php } ?>
                </ul>
              </div>
            </li>
          </ul>
        </div>
        <?php } ?>
      </div>
    </div>
    <!-- Company detail section ends--> 
    
    <!-- Similar Profile section starts-->
    <div class="large-12 columns">
      <div class="profile-head">Similar Profiles</div>
    </div>
    <div id="appendsimilar">
    <?php 
      $i=1;
      foreach(get_similarProfile($profileId) as $similarId) { 
        $getSimilarID=$similarId->id;
        $getSimilarProfile= get_profileDetail($getSimilarID);
      ?>

    <div class="large-5 <?php echo $i%2==0? "large-offset-2":""; ?> columns prof-col">
      <div class="panel">
        <?php
        $featuredimage=feautured_image($similarId->id);
        if(!empty($featuredimage) && $i<=2) { ?>
          <div class="th radius feat-img"><img src="<?php echo wpse_resizeimage($featuredimage,291); ?>" alt="image"/>
             </div>
        <?php } ?> 


        <div class="row prof-cont">
          <div class="small-3 columns">
            <div class="comp-thumb"><img src="<?php echo $getSimilarProfile->logo; ?>" alt="image" class="th radius"/> </div>
          </div>
          <div class="small-9 columns"> <a href="" class="comp-name" title=""><?php echo $getSimilarProfile->name; ?></a>
            <div class="comp-short"><?php echo $getSimilarProfile->description; ?></div>
          </div>
        </div>
      </div>
    </div>
    <?php echo $i%2==0 ? "<div class='clearfix'></div>":""; 
    $i++;
    } ?>
   </div>
    <div class="large-12 columns text-center" id="load_more_<?php echo $getSimilarID; ?>"> <a role="button" class="button tiny radius more-btn more-btn-inner more_button" href="#" title="" id="<?php echo $getSimilarID; ?>">Load More</a> </div>
  </div>
</div>
<!--Similar Profiles section ends--> 
<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/jquery.flexisel.js"></script> 
<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/jquery.fancybox.js"></script> 
<script type="text/javascript">
jQuery(document).ready(function($) {	
	 $("#profileCarousel").flexisel({
    	visibleItems: 4,
    	enableResponsiveBreakpoints: true,
      clone:false,
    	responsiveBreakpoints: {
      	portrait: {
        changePoint:480,
        visibleItems: 1
      	}, 
      	landscape: {
        changePoint:640,
        visibleItems: 1
      	},
      	tablet: {
        changePoint:768,
        visibleItems: 1
      	}
    }
	});
    $("#profileVideos").flexisel({
      visibleItems: 1,
      enableResponsiveBreakpoints: true,
      clone:false,
      responsiveBreakpoints: {
        portrait: {
        changePoint:480,
        visibleItems: 1
        }, 
        landscape: {
        changePoint:640,
        visibleItems: 1
        },
        tablet: {
        changePoint:768,
        visibleItems: 1
        }
    }
  });


	$(".fancybox").fancybox({
		openEffect	: 'none',
		closeEffect	: 'none'
	});

//Ajax Load more

$('.more_button').live("click",function() 
  {
    var getId = $(this).attr("id");
    if(getId)
    {
      $("#load_more_"+getId).html('<img src="<?php bloginfo('template_directory'); ?>/img/load_img.gif" style="padding:10px 0 0 100px;"/>');  
      $.ajax({
      type: "POST",
      url: "<?php echo admin_url('admin-ajax.php'); ?>",
      data:'action=get_similar_profile&getLastContentId='+getId+"&getParentId=<?php echo $profileId; ?>",
      success: function(html){
          $("#appendsimilar").append(html);
          $("#load_more_"+getId).remove();
        }
      });
    }
    return false;
  });

});
</script>


<?php } else { ?>
<div class="row">
  <div class="banner"> <img src="<?php bloginfo('template_directory'); ?>/img/profile-banner.jpg" alt="image"/> </div>
</div>
</div>
<div class='row'>
	<div class='profile-sec'>
    	<div class='large-12 columns'>No profile found. Click here to 
    		<a href='/submit-a-profile'>submit the form</a>
    	</div>
    </div>
</div>
<?php }
get_footer(); ?>
