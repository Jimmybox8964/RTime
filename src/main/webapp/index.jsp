<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file ="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>LeeLab Web</title>
  <link href="//fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700;900&amp;display=swap" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900&amp;display=swap" rel="stylesheet">
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-starter.css">
  <meta name="keywords" content="leelab">
  <meta name="description" content="This is for example.">
</head>
<body>
<section class="w3l-aboutblock py-5" id="about">
    <div class="midd-w3">
      <div class="container py-lg-5 py-md-3">
        <div class="row">
          <div class="col-lg-6 left-wthree-img text-righ">
            <div class="position-relative">
              <img src="assets/images/about.png" alt="" class="img-fluid">
              <a href="#small-dialog" class="popup-with-zoom-anim play-view text-center position-absolute"></a>
              <!-- dialog itself, mfp-hide class is required to make dialog hidden -->
              
            </div>
          </div>
          <div class="col-lg-6 mt-lg-0 mt-5 about-right-faq align-self">
            <span class="text mb-2">About us</span>
            <h3 class="title-big">熱血．助人．專業．成長</h3>
            <p class="mt-4">Lorem ipsum viverra feugiat. Pellen tesque libero ut justo, ultrices in ligula. Semper at tempufddfel. Lorem ipsum dolor sit amet consectetur adipisicing elit. Non quae, fugiat ad.</p>
            <ol class="w3l-right mt-4">
              <li>Latest Bootstrap framework</li>
              <li>Highly Responsive</li>
              <li>Easy to Customize</li>
            </ol>
            <h3 class="title-big">誠徵資訊志工！</h3>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <!-- //Header -->
  <!-- banner section -->
  <!-- //banner section -->
  <section class="w3l-index3" id="about"></section>
  <!-- /bottom-grids-->
  <!-- //bottom-grids-->
  <section class="w3l-index3" id="about"> </section>
  <section class="w3l-technologies"></section>
  <!-- stats -->
  <section class="w3l-stats py-5" id="stats">
    <div class="gallery-inner container py-md-5 py-4">
      <div class="row stats-con">
        <div class="col-md-4 col-6 stats_info counter_grid">
          <h3>成立於</h3>
          <p class="counter">2020</p>
          <span>Year we Founded</span>
        </div>
        <div class="col-md-4 col-6 stats_info counter_grid1">
          <h3>獲得獎項</h3>
          <p class="counter">12</p>
          <span>No: of Awards</span>
        </div>
        <div class="col-md-4 col-6 stats_info counter_grid mt-md-0 mt-5">
          <h3 style="">研究發表</h3>
          <p class="counter">15</p>
          <span>Papers</span>
        </div>
      </div>
    </div>
  </section>
  <!-- //stats -->
  <!-- Quote -->
  <!-- //Quote -->
  <!-- footer -->
  <section class="w3l-footer-29-main"></section>
  <!-- //footer -->
  <!-- copyright -->
  <section class="w3l-footer-29-main w3l-copyright">
    <div class="container">
      <div class="row bottom-copies">
        <p class="col-lg-8 copy-footer-29">All rights reserved. Design by LeeLab.</p>
        <div class="col-lg-4 main-social-footer-29">
          <a href="#facebook" class="facebook"><span class="fa fa-facebook"></span></a>
          <a href="#twitter" class="twitter"><span class="fa fa-twitter"></span></a>
          <a href="#instagram" class="instagram"><span class="fa fa-instagram"></span></a>
          <a href="#linkedin" class="linkedin"><span class="fa fa-linkedin"></span></a>
        </div>
      </div>
    </div>
    <!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">↑</button>
    <script>
      // When the user scrolls down 20px from the top of the document, show the button
      window.onscroll = function() {
        scrollFunction()
      };
      function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
          document.getElementById("movetop").style.display = "block";
        } else {
          document.getElementById("movetop").style.display = "none";
        }
      }
      // When the user clicks on the button, scroll to the top of the document
      function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
      }
    </script>
    <!-- /move top -->
  </section>
  <!-- //copyright -->
  <!-- Template JavaScript -->
  <script src="assets/js/jquery-3.3.1.min.js"></script>
  <!-- script for customers -->
  <script src="assets/js/owl.carousel.js"></script>
  <script>
    $(document).ready(function() {
      $('.owl-three').owlCarousel({
        loop: true,
        margin: 0,
        nav: false,
        responsiveClass: true,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplaySpeed: 1000,
        autoplayHoverPause: false,
        responsive: {
          0: {
            items: 3,
            nav: false
          },
          480: {
            items: 3,
            nav: false
          },
          667: {
            items: 4,
            nav: false
          },
          800: {
            items: 5,
            nav: false
          },
          1280: {
            items: 6,
            nav: false
          }
        }
      })
    })
  </script>
  <!-- //script for customers -->
  <!-- stats number counter-->
  <script src="assets/js/jquery.waypoints.min.js"></script>
  <script src="assets/js/jquery.countup.js"></script>
  <script>
    $('.counter').countUp();
  </script>
</body>
</html>