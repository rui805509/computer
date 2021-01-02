<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="register"%>
<title>注册页面</title>
<head><link rel="stylesheet" href="css/my.css">
<style>
.btn{
background:url("img/submit.jpg");background-size:100% 100% ; background-attachment: fixed";text-align:center;}
</style></head>
<html>
<body  style="background:url(img/9999.gif);;background-size:100% 100% ; background-attachment: fixed">
<br><br><br>
<center>
<h2>用户注册</h2>
<form action="" name=form>
<table id="customers">
	<tr><th>输入您的信息，用户名中不能包含<br>逗号,带*号项必须填。</th></tr>
	<tr><td>用户姓名：<input type="text" name="logname">*</td></tr>
	<tr class="alt"><td>设置密码：<input type="text" name="password">*</td></tr>
	<tr><td>电子邮件：<input type="text" name="email"></td></tr>
	<tr class="alt"><td>真实姓名：<input type="text" name="realname"></td></tr>
	<tr><td>联系电话：<input type="text" name="phone"></td></tr>
	<tr class="alt"><td>收货地址：<input type="text" name="address"></td></tr>
	<tr><td>账号密保：<input type="text" name="passwordquestion"></td></tr>
	<tr class="alt"><td>密保内容：<input type="text" name="passwordanswer"></td></tr>
	<tr><td align="center"><input type="submit" name="g" class="btn" value="		提			交		"></td></tr>
</table>
</form>
<%
	String logname = request.getParameter("logname");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String realname = request.getParameter("realname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String passwordquestion = request.getParameter("passwordquestion");
	String passwordanswer = request.getParameter("passwordanswer");
%>
<register:Register logname="<%=logname%>" password="<%=password%>" email="<%=email%>"  realname="<%=realname%>" phone="<%=phone%>" address="<%=address%>" passwordquestion="<%=passwordquestion %>" passwordanswer="<%=passwordanswer %>"/>
</center>
</body>
</html>