<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>新增學生資料</title>
</head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.container {
  padding: 16px;
}

span.memberpwd {
  float: right;
  padding-top: 16px;
}

</style>
<body>
<form action="insert_DB.jsp" style="border:1px solid #ccc">
  <div class="container">
    <h1>新增學生資料</h1>
    <hr>
    <label for="stuID"><b>學號</b></label>
    <input type="text" placeholder="學號" name="stuID" required>

    <label for="stuPersonName"><b>姓名</b></label>
    <input type="text" placeholder="姓名" name="stuPersonName" required>

  <label for="stuAddress"><b>地址</b></label>
    <input type="text" placeholder="地址" name="stuAddress" required>


    <div class="clearfix">
      <button type="submit" class="signupbtn">新增</button>
      <button type="reset" class="cancelbtn">取消</button>
    </div>
  </div>
</form>
</body>
</html>