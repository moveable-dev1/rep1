<?php
/**
 * The template used for displaying promo section i.e. About, Video and Partner
 *
 * @package marsaec
 */
?>

<!--Promo section starts-->
<link rel="stylesheet" type="text/css" href="<?php bloginfo('template_directory'); ?>/css/jquery.fancybox.css?v=2.1.5" media="screen" />
<div class="row">
  <div class="promo-sec profile-sec">
    <div class="large-3 columns"> <a href="" class="promo-head" title="">About AEC</a>
      <div class="promo-cont show-for-large-only">
      <?php 
      echo trim_words($id=11);
      ?>
      </div>
      <a href="<?php echo get_permalink( 11 ); ?>" class="button tiny radius more-btn" role="button" title="">View More</a> </div>
    <div class="large-3 large-offset-1 columns"> <a href="http://player.vimeo.com/video/60122989" class="promo-head" title="" target="_blank">Introductory Video</a>
	  <div class="flex-video widescreen vimeo  show-for-large-only">
        <a class="fancybox-media" href="https://vimeo.com/<?php echo get_option( 'vimeo_url' ); ?>" title="video"><img id="vimeo" src="" alt="Introductory Video" /></a>
		<!--<iframe src="<?php echo get_option( 'vimeo_url' ); ?>" width="400" height="225" allowfullscreen="" title="video"></iframe>-->
      </div>
      <div class="promo-cont  show-for-large-only"><?php dynamic_sidebar( 'vimeo-content' ); ?></div>
    </div>
    <div class="large-3 large-offset-1 columns"> <a href="" class="promo-head" title="">Partners</a>
      <div class="promo-cont show-for-large-only">
        <?php 
        echo trim_words($id=14);
        ?>
      </div>
      <a href="<?php echo get_permalink( 14 ); ?>" class="button tiny radius more-btn" role="button" title="">View More</a> </div>
  </div>
</div>
<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/jquery.fancybox.js"></script> 
<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/jquery.fancybox-media.js"></script> 
<script type="text/javascript">
jQuery(document).ready(function($) {
$('.fancybox-media')
	.attr('rel', 'media-gallery')
	.fancybox({
		openEffect : 'none',
		closeEffect : 'none',
		prevEffect : 'none',
		nextEffect : 'none',

		arrows : false,
		helpers : {
			media : {},
			buttons : {}
		}
	});
});
jQuery(document).ready(function($) {
var vimeoVideoID = <?php echo get_option( 'vimeo_url' ); ?>;

$.getJSON('http://www.vimeo.com/api/v2/video/' + vimeoVideoID + '.json?callback=?', {format: "json"}, function(data) {
         $("#vimeo").attr('src', data[0].thumbnail_large);
});
/*function vimeoLoadingThumb(id){    
    var url = "http://vimeo.com/api/v2/video/" + id + ".json?callback=showThumb";
      
    var id_img = "#vimeo-" + id;
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = url;

    $(id_img).before(script);
}

function showThumb(data){
    var id_img = "#vimeo-" + data[0].id;
    $(id_img).attr('src',data[0].thumbnail_medium);
}

$(function() {
    vimeoLoadingThumb(60122989);
});*/
});
/*jQuery(document).ready(function($) {
 $(".vimeo").fancybox({
  width: 400,
  height: 225,
  //type: 'iframe',
  fitToView : false
 });
});*/
</script>
<!--Promo section ends-->