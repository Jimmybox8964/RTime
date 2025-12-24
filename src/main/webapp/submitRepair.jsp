<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.sql.*"%>
<jsp:useBean id="objDBConfig" scope="session" class="hitstd.group.tool.database.DBConfig" />

<%
request.setCharacterEncoding("utf-8");

/* =====================
   1) 登入檢查
   ===================== */
String accessId = (String) session.getAttribute("accessId");
if (accessId == null) {
    response.sendRedirect("login.jsp?status=needlogin&returnUrl=Rtimesheet.jsp");
    return;
}

/* =====================
   2) 取得表單欄位
   ===================== */
String location     = request.getParameter("location");
String repairType   = request.getParameter("repairType");
String unitCode     = request.getParameter("unitCode");
String phone        = request.getParameter("phone");
String description  = request.getParameter("description");
String expectedTime = request.getParameter("expectedTime");

/* =====================
   3) 基本驗證
   ===================== */
if (location == null || location.trim().isEmpty()
 || repairType == null || repairType.trim().isEmpty()
 || unitCode == null || unitCode.trim().isEmpty()
 || phone == null || phone.trim().isEmpty()
 || description == null || description.trim().isEmpty()
 || expectedTime == null || expectedTime.trim().isEmpty()) {

    out.println("<h3>欄位不可空白，請返回重新填寫。</h3>");
    return;
}

/* =====================
   4) 寫入資料庫
   ===================== */
Connection con = null;
PreparedStatement ps = null;

try {
    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
    con = DriverManager.getConnection(
        "jdbc:ucanaccess://" + objDBConfig.FilePath() + ";"
    );

    String sql =
        "INSERT INTO repair_requests " +
        "(location, repair_type, unit_code, phone, fault_desc, expected_time, status, reported_at, created_by) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, Now(), ?)";

    ps = con.prepareStatement(sql);
    ps.setString(1, location);
    ps.setString(2, repairType);
    ps.setString(3, unitCode);
    ps.setString(4, phone);
    ps.setString(5, description);
    ps.setString(6, expectedTime);
    ps.setString(7, "待處理");
    ps.setString(8, accessId);

    ps.executeUpdate();

    /* =====================
       5) 成功 → 回列表頁
       ===================== */
    response.sendRedirect("repair_requests.jsp?page=1");

} catch (Exception e) {
    out.println("<h3>寫入失敗：</h3>");
    out.println("<pre>" + e.getMessage() + "</pre>");
} finally {
    try { if (ps != null) ps.close(); } catch(Exception ignore) {}
    try { if (con != null) con.close(); } catch(Exception ignore) {}
}
%>