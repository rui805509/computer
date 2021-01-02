<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getRegister" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyRegister" %>
<head><%@ include file="head.txt" %><link rel="stylesheet" href="css/my.css">
<style>
.btn{
background:url("img/submit.jpg");background-size:100% 100% ; background-attachment: fixed";text-align:center;}
</style></head>
<br><br>
<%
	boolean isModify = false;
	String logname = (String)session.getAttribute("logname");
	if(logname!=null){
		int m = logname.indexOf(",");
		logname = logname.substring(0,m);
		isModify = true;
	}
	else{
		response.sendRedirect("Login.jsp");
	}
%>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<center>
<getRegister:GetRegister logname="<%=logname%>"/>
<form action="" name="form">
<table id="customers">
	<h2>请输入您的新信息：</h2>
	<tr><td>电子邮件：</td><td><input type="text" name="email" value="<%=oldEmail%>"></td></tr>
	<tr class="alt"><td>真实姓名：</td><td><input type="text" name="realname" value="<%=oldRealname%>"></td></tr>
	<tr><td>联系电话：</td><td><input type="text" name="phone" value="<%=oldPhone%>"></td></tr>
	<tr class="alt"><td>收货地址：</td><td><input type="text" name="address" value="<%=oldAddress%>"></td></tr>
	<tr><td>密保问题：</td><td><input type="text" name="passwordquestion" value="<%=oldPasswordquestion%>"></td></tr>
	<tr class="alt"><td>密保答案：</td><td><input type="text" name="passwordanswer" value="<%=oldPasswordanswer%>"></td></tr>
	<tr><td>操作</td><td align="center"><input type="submit" class="btn" name="enter" value="		修	改		"></td></tr>
</table>
</form>
</center>
</body>
</html>
<%
	String enter = request.getParameter("enter");
	String email = request.getParameter("email");
	String realname = request.getParameter("realname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String passwordquestion = request.getParameter("passwordquestion");
	String passwordanswer = request.getParameter("passwordanswer");
	boolean ok = (enter!=null);
	if(ok&&isModify){
%>
<modifyRegister:ModifyRegister phone="<%=phone %>" address="<%=address %>" email="<%=email %>" logname="<%=logname %>" realname="<%=realname %>"
passwordquestion="<%=passwordquestion %>" passwordanswer="<%=passwordanswer %>"/>
<center><%=giveResult %></center>
<%}%>