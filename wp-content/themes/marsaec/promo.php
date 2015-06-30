<?php
/**
 * The template used for displaying promo section i.e. About, Video and Partner
 *
 * @package marsaec
 */
?>

<!--Promo section starts-->
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
        <iframe src="<?php echo get_option( 'vimeo_url' ); ?>" width="400" height="225" allowfullscreen="" title="video"></iframe>
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
<!--Promo section ends-->