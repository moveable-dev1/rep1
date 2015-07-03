<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the "site-content" div and all content after.
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */
?>

	<!--footer starts-->
<div class="row">
  <footer class="site-footer">
    <div class="large-4 columns"> <a href="http://www.marsdd.com/systems-change/advanced-energy-centre" class="left" title=""><img src="<?php bloginfo('template_directory'); ?>/img/footer-logo.jpg" alt="image"/></a> <a href="http://www.marsdd.com" class="right" title=""><img src="<?php bloginfo('template_directory'); ?>/img/mars-logo.jpg" alt="image"/></a> </div>
    <div class="large-8 columns">
      <ul class="inline-list footer-links">
        <li><a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="Home">Home </a></li>
        <li><a href="<?php echo get_permalink( 11 ); ?>" title="About">About</a></li>
        <li><a href="<?php echo get_permalink( 14 ); ?>" title="Partners">Partners</a></li>
        <li><a href="<?php echo get_permalink( 24 ); ?>" title="RSS Feed">RSS Feed</a></li>
        <li><a href="<?php echo get_permalink( 16 ); ?>" title="Contact">Contact</a></li>
      </ul>
      <div class="footer-social"> <a href="https://www.facebook.com/MaRSCentre" title="" target="_blank"> <img src="<?php bloginfo('template_directory'); ?>/img/fb-icon.png" alt="facebook link"/> </a> <a href="https://twitter.com/MaRSDD" title="" target="_blank"> <img src="<?php bloginfo('template_directory'); ?>/img/twitter-icon.png" alt="twitter link"/> </a> <a href="http://www.linkedin.com/company/mars-discovery-district" title="" target="_blank"> <img src="<?php bloginfo('template_directory'); ?>/img/in-icon.png" alt="linkedin link"/> </a> </div>
    </div>
    <div class="large-12 columns">
      <div class="footer-copy">© 2015 COPYRIGHT MaRS DISCOVERY DISTRICT. ALL RIGHTS RESERVED.&nbsp;&nbsp; <a href="/terms-conditions/" title="">Terms & Conditions</a>.</div>
    </div>
  </footer>
</div>
<!--footer ends--> 

<?php wp_footer(); ?>

</body>
</html>
