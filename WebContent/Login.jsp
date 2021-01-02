<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="login"%>
<title>登录页面</title>
<head>
<link rel="stylesheet" href="css/my.css">
<style>
.btn{
background:url("img/submit.jpg");background-size:100% 100% ; background-attachment: fixed";text-align:center;}
</style>
</head>
<html>
<body style="background:url(img/9999.gif);background-size:100% 100% ; background-attachment: fixed">
<br><br><br>
<center>
<h1 id="headers">欢迎来到恒信电脑大卖场</h1>
<h2>给电脑一颗奔腾的芯———因特尔</h2>

<table id="customers" border="2">
<tr><th>请您登录</th></tr>
<tr><td><a href=Login.jsp style="float:left">账号登录</a><a href=ScanLogin.jsp style="float:right">扫码登录</a></td></tr>
<form action="" method="post">
<tr class="alt"><td>登录名称：<input type="text" name="logname" value="username"></td></tr>
<tr><td>输入密码：<input  type="password" name="password" value="********"></td></tr>
<tr class="alt"><td align="center"><input type="submit" class="btn" name="g" value="		登				录		"></td></tr>
</table>
</form>
</center>
<%
	String logname = request.getParameter("logname");
	if(logname==null){
		logname="";
	}
	String password = request.getParameter("password");
	if(password==null){
		password="";
	}
%>
<login:Login logname="<%=logname%>" password="<%=password%>" />
<center><p><%=backMess %></p></center>
</body>
</html>