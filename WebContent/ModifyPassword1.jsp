<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyPassword1" %>
<head><link rel="stylesheet" href="css/my.css">
<style>
.btn{
background:url("img/submit.jpg");background-size:100% 100% ; background-attachment: fixed";text-align:center;}
</style></head>
<html>
<body style="background:url(img/9999.gif);;background-size:100% 100% ; background-attachment: fixed">
<br><br><br><br><br><br>
<center>
<h3>请输入您的新密码：</h3>
<table id="customers">
<form action="" method="post">
<tr class="alt"><td>新的密码：<input type="password" name="newPassword" ></td></tr>
<tr><td align="center"><input type="submit" class="btn" name="g" value="			提		交			"></td></tr>
</form>
</table>
</center>
</body>
</html>
<%
	String logname = (String)session.getAttribute("logname");
	if(logname==null){
		logname = "";
	}
	String newPassword = request.getParameter("newPassword");
	boolean ok = newPassword!=null;
	if(ok){
%>
<modifyPassword1:ModifyPassword1 logname="<%=logname %>" newPassword="<%=newPassword %>"/>
<center><h2><%=giveResult %></h2></center>
<%}%>