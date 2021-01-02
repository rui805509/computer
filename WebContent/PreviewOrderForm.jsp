<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="previewOrderForm" %>
<head><%@ include file="head.txt" %>
<link rel="stylesheet" href="css/my.css">
</head>
<title>当前订单（预览）</title>
<%
	String logname = (String)session.getAttribute("logname");
	if(logname!=null){
		int m = logname.indexOf(",");
		logname = logname.substring(0,m);
%>
<previewOrderForm:PreviewOrderForm logname="<%=logname %>"/>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<center>
<h3>单击“提交订单”按钮将确认订单</h3>
<form action="MakeOrderForm.jsp">
	<input type="hidden" name="confirm" value="buy">
	<input type="hidden" name="orderContent" value="<%=giveResult %>">
	<input type="hidden" name="totalPrice" value="<%=totalPrice %>">
	<center><input type="submit" name="g" value="提交"></center>
</form>
订单信息：<br>
<table id="customers" border="1">
<tr><th>商品图</th><th>订购信息</th><th>总价格</th></tr>
<tr><td><%=img %></td><td><%=giveResult %></td><td><%=totalPrice %></td></tr>
</table>
</center>
</body>
</html>
<%}
	else{
		response.sendRedirect("Login.jsp");
	}%>
