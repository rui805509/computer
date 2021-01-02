<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getQuestion" %>
<title>验证密保</title>
<head><link rel="stylesheet" href="css/my.css">
<style>
.btn{
background:url("img/submit.jpg");background-size:100% 100% ; background-attachment: fixed";text-align:center;}
</style></head>
<html>
<body style="background:url(img/9999.gif);;background-size:100% 100% ; background-attachment: fixed">
<br><br><br><br><br>
<center>
<h2>验证密保</h2>
<table id="customers">
<form action="">
<tr><td>请输入账号：<input type="text" name="logname"></td></tr>
<tr class="alt"><td>请输入问题：<input type="text" name="passwordquestion"></td></tr>
<tr><td>请输入答案：<input type="text" name="passwordanswer"></td></tr>
<tr class="alt"><td align="center"><input type="submit" class="btn" name="g" value="		提	交	验	证			"></td></tr>
</table>
</form>
</center>
<%
	String logname = request.getParameter("logname");
	if(logname == null){
		logname = "";
	}
	String passwordquestion = request.getParameter("passwordquestion");
	if(passwordquestion == null){
		passwordquestion = "";
	}
	String passwordanswer = request.getParameter("passwordanswer");
	if(passwordanswer == null){
		passwordanswer = "";
	}
%>
<getQuestion:GetQuestion passwordquestion="<%=passwordquestion %>" logname="<%=logname %>" passwordanswer="<%=passwordanswer %>" />
<center><%=giveResult %></center>
</body>
</html>