<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyPassword" %>
<head><%@ include file="head.txt"%><link rel="stylesheet" href="css/my.css">
<style>
.btn{
background:url("img/submit.jpg");background-size:100% 100% ; background-attachment: fixed";text-align:center;}
</style></head>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<br><br>
<center>
<h2>请输入您的当前密码和新密码：</h2>
<table id="customers">
<form action="" method="post">
<tr><td>当前密码：<input type="password" name="oldPassword" ></td></tr>
<tr class="alt"><td>新的密码：<input type="password" name="newPassword" ></td></tr>
<tr><td align="center"><input type="submit" name="g" class="btn" value="		修		改			"></td></tr>
</form>
</table>
</center>
</body>
</html>
<%
	boolean isModify = false;
	String logname = (String)session.getAttribute("logname");
	if(logname!=null){
		int m = logname.indexOf(",");
		logname = logname.substring(0,m);
		isModify = true;
	}
	String oldPassword = request.getParameter("oldPassword");
	String newPassword = request.getParameter("newPassword");
	boolean ok = oldPassword!=null&&newPassword!=null;
	if(ok&&isModify){
%>
<modifyPassword:ModifyPassword logname="<%=logname %>" oldPassword="<%=oldPassword %>" newPassword="<%=newPassword %>"/>
<center><h2><%=giveResult %></h2></center>
<%}%>