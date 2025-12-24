<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id='objDBConfig' scope='session' class='hitstd.group.tool.database.DBConfig' />

<%
/* =========================
   登入檢查：未登入不可填寫
   ========================= */
String accessId = (String) session.getAttribute("accessId");
if (accessId == null) {
    response.sendRedirect("login.jsp?status=needlogin&returnUrl=Rtimesheet.jsp");
    return;
}
%>

<%@include file ="menu.jsp" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>北護修Time - 維修申請單</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        body {
            font-family: "Microsoft JhengHei", sans-serif;
            background:#f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 30px auto;
            background:#fff;
            padding: 0px 28px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,.08);
        }
        h2 {
            text-align:center;
            margin-bottom: 12px;
        }
        .form-group {
            margin-bottom: 16px;
        }
        label {
            display:block;
            font-weight:bold;
            margin-bottom: 4px;
        }
        input[type=text],
        input[type=tel],
        select,
        textarea {
            width:100%;
            padding:8px 10px;
            border:1px solid #ccc;
            border-radius:4px;
            box-sizing:border-box;
        }
        textarea {
            resize: vertical;
            min-height: 90px;
        }
        .btn-submit {
            display:block;
            width:100%;
            margin-top: 20px;
            padding:10px 0;
            border:none;
            border-radius:4px;
            background:#0e3c6b;
            color:#fff;
            font-size:16px;
            cursor:pointer;
        }
        .btn-submit:hover {
            background:#154a82;
        }
        .hint {
            font-size: 12px;
            color:#777;
        }
        .note-box {
            background:#f9fafc;
            border:1px solid #d0d7e2;
            border-radius:6px;
            padding:10px 12px;
            font-size:13px;
            line-height:1.6;
            color:#444;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>校園修繕報修單</h2>

    <form action="submitRepair.jsp" method="post" enctype="multipart/form-data">

        <!-- 修繕類別 -->
        <div class="form-group">
            <label for="repairType">修繕類別</label>
            <select id="repairType" name="repairType" required>
                <option value="">請選擇修繕類別</option>
                <option>城區部水電+木工</option>
                <option>校本部電工</option>
                <option>校本部木工</option>
            </select>
        </div>
        <!-- 修繕位置 -->
        <div class="form-group">
            <label for="location">修繕位置</label>
            <select id="location" name="location" required>
                <option value="">請選擇修繕位置</option>
                <option>校長室</option>
                <option>秘書室（行政大樓三樓）</option>
                <option>人事室（行政大樓三樓）</option>
                <option>教務處（行政大樓二樓）</option>
                <option>教務處（教學大樓）</option>
                <option>研發處（行政大樓二樓）</option>
                <option>學務處（行政大樓一樓）</option>
                <option>軍訓室（行政大樓一樓）</option>
                <option>健康中心</option>
                <option>輔導中心</option>
                <option>總務處（行政大樓一樓）</option>
                <option>營繕組</option>
                <option>出納組</option>
                <option>會計室</option>
                <option>圖書館</option>
                <option>電算中心（科技大樓一樓）</option>
                <option>電算中心（城區部文教大樓四樓）</option>
                <option>體育室</option>
                <option>進修推廣部（親仁樓一樓）</option>
                <option>進修推廣部（親仁樓二樓）</option>
                <option>護理系所（科技大樓三樓及親仁樓六樓）</option>
                <option>學生宿舍（蘭心樓）</option>
                <option>學生宿舍（蕙質樓）</option>
                <option>學生宿舍（爾雅樓）</option>
            </select>
        </div>



        <!-- 單位代碼 -->
        <div class="form-group">
            <label for="unitCode">室別代碼</label>
            <input type="text" id="unitCode" name="unitCode" placeholder="例:S104、F608"required>
        </div>

        <!-- 聯絡電話 -->
        <div class="form-group">
            <label for="phone">聯絡電話</label>
            <input type="tel" id="phone" name="phone" required>
        </div>

        <!-- 故障描述 -->
        <div class="form-group">
            <label for="description">故障文字描述</label>
            <textarea id="description" name="description" required></textarea>
        </div>

        <!-- 希望維修時間 -->
        <div class="form-group">
            <label for="expectedTime">希望的維修時間範圍</label>
            <select id="expectedTime" name
