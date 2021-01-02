<%@ page contentType="text/html; charset=utf-8" %>
<head><%@ include file="head.txt" %><link rel="stylesheet" href="css/my.css"></head>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<br><br>
<center>
<%
	String logname = (String)session.getAttribute("logname");
	if(logname!=null){
		int m = logname.indexOf(",");
		logname = logname.substring(0,m);
		session.invalidate();
		out.print("<a href=Login.jsp><h2>"+logname+"退出，返回登录界面</h2></a>");
	}
	else{
		response.sendRedirect("Login.jsp");
	}
%>
</center>
</body>
</html>