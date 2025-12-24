<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.sql.*"%>
<jsp:useBean id="objDBConfig" scope="session" class="hitstd.group.tool.database.DBConfig" />
<%@include file="menu.jsp" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>北護修Time－報修單列表</title>

  <link rel="stylesheet" href="assets/css/style-starter.css">

  <style>
    .pagination { display: inline-block; }
    .pagination a {
      color: #668cff;
      float: left;
      padding: 8px 16px;
      text-decoration: none;
    }
    .pagination a.active {
      background-color: #0099E5;
      color: white;
      border-radius: 10px;
    }
    .pagination a:hover {
      background-color: #ddd;
      border-radius: 5px;
    }
  </style>
</head>

<body>
<%
/* ======================
   1) DB 連線
   ====================== */
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con = null;
Statement smt = null;
ResultSet rs = null;

int pageSize = 5;
int nowpage = 1;
int lastpage = 1;
int prepage = 1;
int nextpage = 1;

try {
    con = DriverManager.getConnection("jdbc:ucanaccess://" + objDBConfig.FilePath() + ";");
    smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

    /* ======================
       2) 分頁設定：算總筆數
       ====================== */
    String sql = "SELECT * FROM repair_requests ORDER BY reported_at DESC";
    rs = smt.executeQuery(sql);

    if (rs.last()) {
        int total = rs.getRow();
        lastpage = (int)Math.ceil((double)total / pageSize);
        if (lastpage < 1) lastpage = 1;
    } else {
        lastpage = 1;
    }

    if (request.getParameter("page") != null) {
        try { nowpage = Integer.parseInt(request.getParameter("page")); }
        catch(Exception ignore) { nowpage = 1; }
    }
    if (nowpage < 1) nowpage = 1;
    if (nowpage > lastpage) nowpage = lastpage;

    prepage = (nowpage > 1) ? nowpage - 1 : 1;
    nextpage = (nowpage < lastpage) ? nowpage + 1 : lastpage;

    int nostart = nowpage * pageSize - (pageSize - 1);
    int noend   = nowpage * pageSize;

    /* ======================
       3) 查詢本頁資料
       ====================== */
    // 注意：BETWEEN 分頁假設 id 大致連續；若你會刪資料，某些頁可能會少筆
    sql = "SELECT * FROM repair_requests " +
          "WHERE id BETWEEN " + nostart + " AND " + noend +
          " ORDER BY reported_at DESC";

    rs = smt.executeQuery(sql);
%>

<section class="w3l-aboutblock py-5">
  <div class="container py-lg-5 py-md-3">

    <div style="display:flex;justify-content:space-between;align-items:center;gap:10px;flex-wrap:wrap;">
      <h3 style="margin:0;">報修單列表（<%=nowpage%>/<%=lastpage%>）</h3>

      <!-- ✅ 任何人都能看列表，但「新增報修單」仍建議讓使用者登入後才能填 -->
      <a class="btn btn-primary" href="Rtimesheet.jsp">＋ 新增報修單</a>
    </div>

    <div class="table-responsive mt-3">
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>報修單編號</th>
            <th>故障描述</th>
            <th>單位代碼</th>
            <th>聯絡電話</th>
            <th>報修時間</th>
            <th>預計維修時間</th>
            <th>維修進度</th>
          </tr>
        </thead>
        <tbody>
        <%
          while (rs.next()) {
        %>
          <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("fault_desc") %></td>
            <td><%= rs.getString("unit_code") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("reported_at") %></td>
            <td><%= rs.getString("expected_time") %></td>
            <td><%= rs.getString("status") %></td>
          </tr>
        <%
          }
        %>
        </tbody>
      </table>
    </div>

    <table class="table">
      <tr>
        <td class="pagination"><a href="repair_requests.jsp?page=1">&laquo;</a></td>
        <td class="pagination"><a href="repair_requests.jsp?page=<%=prepage%>">&lt;</a></td>

        <%
          for (int p = 1; p <= lastpage; p++) {
        %>
          <td class="pagination">
            <a href="repair_requests.jsp?page=<%=p%>" <%= (p == nowpage ? "class='active'" : "") %>><%=p%></a>
          </td>
        <%
          }
        %>

        <td class="pagination"><a href="repair_requests.jsp?page=<%=nextpage%>">&gt;</a></td>
        <td class="pagination"><a href="repair_requests.jsp?page=<%=lastpage%>">&raquo;</a></td>
      </tr>
    </table>

  </div>
</section>

<%
} catch (Exception e) {
    out.println("<h3>讀取報修單失敗：</h3>");
    out.println("<pre>" + e.getMessage() + "</pre>");
} finally {
    try { if (rs != null) rs.close(); } catch(Exception ignore){}
    try { if (smt != null) smt.close(); } catch(Exception ignore){}
    try { if (con != null) con.close(); } catch(Exception ignore){}
}
%>

</body>
</html>
