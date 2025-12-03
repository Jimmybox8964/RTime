<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@include file="menu.jsp" %>
<jsp:useBean id='objDBConfig' scope='session' class='hitstd.group.tool.database.DBConfig' />
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
	<%	
	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	Connection con=DriverManager.getConnection("jdbc:ucanaccess://"+objDBConfig.FilePath()+";");
	Statement smt= con.createStatement();
	String sql = "SELECT * FROM leelab left join position on leelab.positionId=position.positionId ORDER BY positionId ";
	ResultSet rs = smt.executeQuery(sql);
	String id = request.getParameter("memberId");
	%>
 <form action="member.jsp" method="post">
  <div class="teams1 py-5 mb-3">
    <div class="container py-lg-3 pb-lg-5 pb-4">
      <div class="teams1-content">
        <span class="text text-center mb-2">Lovely team</span>
        <h3 class="title-big text-center mb-5">Meet Our Team</h3>
        <div class="owl-carousel owl-theme text-center">
          <% int num=1;
          while(rs.next()){
          %>
          <div class="item">
            <div class="d-grid team-info">
              <div class="column position-relative">
                <a href="member.jsp?memberId=<%=rs.getString("memberId")%>"><img src="<%=rs.getString("pic") %>" alt="" class="img-fluid2 rounded team-image"></a>
              </div>
              <div class="column">
                <h3 class="name-pos"><a href="member.jsp?memberId=<%=rs.getString("memberId")%>"><%=rs.getString("memberName") %></a></h3>
                <p><%=rs.getString("positionName") %></p>
              </div>
            </div>
          </div>
         <% num++;
         }%>
         </div>
        </div>
      </div>
    </div>
  </form>
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
  
  <!-- //script for customers -->
  <!-- for tesimonials carousel slider -->
  <script>
    $(document).ready(function() {
      $("#owl-demo1").owlCarousel({
        loop: true,
        margin: 20,
        responsiveClass: true,
        responsive: {
          0: {
            items: 1,
            nav: true
          },
          736: {
            items: 2,
            nav: false
          },
          1000: {
            items: 2,
            nav: true,
            loop: false
          }
        }
      })
    })
  </script>
  <!-- //script -->
  <!-- script for teams -->
  <script>
    $(document).ready(function() {
      $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 0,
        responsiveClass: true,
        responsive: {
          0: {
            items: 1,
            nav: true
          },
          415: {
            items: 2,
            nav: true,
            margin: 20
          },
          667: {
            items: 3,
            nav: true,
            margin: 20
          },
          1000: {
            items: 4,
            nav: true,
            loop: true,
            margin: 25
          }
        }
      })
    })
  </script>
  <!-- //script for teams-->
  </body>
</html>