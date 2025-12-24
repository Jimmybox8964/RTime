<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>北護修Time</title>

  <link href="//fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700;900&display=swap" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/style-starter.css">

  <style>
    .logo-group { display:flex; align-items:center; gap:8px; }
    .logo-group .logo-text { font-size:22px; font-weight:700; color:#0e3c6b; line-height:1; }
    .logo-group .logo-subtext { font-size:14px; color:#6c757d; margin-top:2px; }
  </style>
</head>

<body>
<%
  // ✅ 只宣告一次，整個 menu.jsp 都用這個
  Object accObj = session.getAttribute("accessId");
  String navAccessId = (accObj == null) ? null : accObj.toString();
  boolean isLogin = (navAccessId != null && !navAccessId.trim().isEmpty());
%>

<form method="post" action="logout.jsp">
<header class="w3l-header">
  <nav class="navbar navbar-expand-lg navbar-light fill px-lg-0 py-0 px-3">
    <div class="container">

      <!-- 左側 Logo -->
      <a class="navbar-brand d-flex align-items-center" href="index.jsp">
        <div class="logo-group">
          <i class="fas fa-wrench" style="color:#f6c400;font-size:26px;"></i>
          <div>
            <div class="logo-text">北護修Time</div>
            <div class="logo-subtext">RTime</div>
          </div>
        </div>
      </a>

      <!-- 漢堡 -->
      <button class="navbar-toggler collapsed" type="button"
              data-toggle="collapse" data-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false"
              aria-label="Toggle navigation">
        <span class="fa icon-expand fa-bars"></span>
        <span class="fa icon-close fa-times"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">

          <li class="nav-item">
            <a class="nav-link" href="index.jsp">首頁</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="Rtimesheet.jsp">校園修繕表單</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="repair_requests.jsp?page=1">修繕追蹤平台</a>
          </li>

          <%-- ✅ 登入才顯示帳號專屬頁 --%>
          <% if (isLogin) { %>
            <li class="nav-item">
              <a class="nav-link" href="member.jsp?memberId=<%= navAccessId %>"><%= navAccessId %></a>
            </li>
          <% } %>

        </ul>

        <div class="ml-lg-3">
          <% if (isLogin) { %>
            <input type="submit" value="登出" name="logout" class="btn btn-style btn-effect">
          <% } else { %>
            <a href="login.jsp" class="btn btn-style btn-effect">登入</a>
          <% } %>
        </div>

      </div>
    </div>
  </nav>
</header>
</form>

</body>
</html>
