<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id='objDBConfig' scope='session' class='hitstd.group.tool.database.DBConfig' />
<%@include file = "menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>LeeLab Web</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	String sql = "SELECT * FROM leelab left join position on leelab.positionId=position.positionId WHERE memberId ='" +request.getParameter("memberId")+"'";
	String option="SELECT * FROM position";
	ResultSet rs = smt.executeQuery(sql);
	ResultSet rs2 = smt.executeQuery(option);
	rs.next();
	%>
 <form action="memberEdit_DBUpdate_info.jsp?memberId=<%=request.getParameter("memberId")%>" method="post" name="form" >
  <section class="w3l-aboutblock py-5" id="about">
    <div class="midd-w3">
      <div class="container py-lg-5 py-md-3">
        <div class="row">
          <div class="col-lg-4 left-wthree-img text-righ">
            <div class="position-relative">
            <img src="<%=rs.getString("pic") %>" alt="">
            <h3>選擇要上傳的文件:</h3>
            <input type="file" name="theFirstFile" size="50" />
            <input type="button" onClick="javascript:del();" name=submitButton value="上傳" />
			<script language="javascript">  
			//點選提交按鈕觸發下面的函式
			function del(){  
				document.form.action="memberEdit_DBUpdate_pic.jsp";
				document.form.enctype="multipart/form-data";
				document.form.submit();
			}  
			</script>         
         </div>
          </div>
          <div class="col-lg-8 mt-lg-0 mt-5 about-right-faq align-self">
          <h3 class="title-big"><%=rs.getString("memberName") %></h3>
            <p><%=rs.getString("positionName") %></p>
            <select name="position" class="btn btn-select">
            	<option value="<%=rs.getString("positionId") %>" style="display: none">更改職位</option>
            	<%  while(rs2.next()){ %>
            	<option value="<%=rs2.getString("positionId")%>"><%=rs2.getString("positionName")%></option>
        		<% } %>
            </select>
            <p class="mt-4"><b>專長及研究領域：</b></p>
            <ol class="w3l-right mt-4">
              <li><%=rs.getString("skill1") %></li>
              <%if (rs.getString("skill2")== null){
            	  }else{%><li><%=rs.getString("skill2") %></li>
              <%} %>
              <%if (rs.getString("skill3")== null){
            	  }else{%><li><%=rs.getString("skill3") %></li>
              <%} %>
            </ol>
            <p>修改專長及研究領域：</p>
            <input type="text" name="skill1" value="<%=rs.getString("skill1") %>" /><br>
            <input type="text" name="skill2" value="<%=rs.getString("skill2") %>"/><br>
            <input type="text" name="skill3" value="<%=rs.getString("skill3") %>"/><br><br>
            <input type="submit" name=submitButton class="btn btn-style btn-effect" value="確認修改" />
          </div>
        </div>
      </div>
    </div>
  </section>
</form>
  
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
  </body>
</html>