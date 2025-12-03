<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id='objDBConfig' scope='application' class='hitstd.group.tool.database.DBConfig' />
<html>
<body>
	<%
	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	Connection con=DriverManager.getConnection("jdbc:ucanaccess://"+objDBConfig.FilePath()+";");
	Statement smt= con.createStatement();
	String memberId = new String(request.getParameter("memberId"));
	String memberPwd = new String(request.getParameter("memberPwd"));
	try{
		smt.executeUpdate("INSERT INTO leelab (memberId, memberPwd) VALUES('"+memberId+"','"+memberPwd+"')");
		con.close();
		response.sendRedirect("login.jsp?status=newmember");
	}catch (Exception e){
		response.sendRedirect("signUp.jsp?status=IDexist");
	}
	%>
</body>
</html>
