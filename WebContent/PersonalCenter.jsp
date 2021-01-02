<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="personalCenter" %>
<head><%@ include file="head.txt" %><link rel="stylesheet" href="css/my.css"></head>
<html>
<body  style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<br>
<%
	String logname = (String)session.getAttribute("logname");
	if(logname!=null){
			int m = logname.indexOf(",");
			logname = logname.substring(0,m);
		}
	else{
		response.sendRedirect("Login.jsp");
	}
%>
<center>
<h1>个人中心</h1>
<personalCenter:PersonalCenter logname="<%=logname %>"></personalCenter:PersonalCenter>
<%=giveResult %>
<br>
<a href=ModifyRegister.jsp>修改个人信息</a>
<br><br>
<a href=ModifyPassword.jsp>修改密码</a>
<br><br>
<a href=downloadFile.jsp>下载网站注意事项</a>
<br><br>
<a href=ExitLogin.jsp>退出登录</a>
</center>
</body>
</html>