<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="makeOrderForm" %>
<head><%@ include file="head.txt" %>
<link rel="stylesheet" href="css/my.css">
</head>
<title>
	订单确认
</title>
<%
	String logname = (String)session.getAttribute("logname");
	if(logname==null){
		response.sendRedirect("Login,jsp");
	}
	else{
		int m = logname.indexOf(",");
		logname = logname.substring(0,m);
	}
	String confirm = request.getParameter("confirm");
	String orderContent = request.getParameter("orderContent");
	String totalPrice = request.getParameter("totalPrice");
	if(confirm==null){
		confirm = "";
	}
	if(orderContent==null){
		orderContent = "";
	}
	if(totalPrice==null){
		totalPrice = "";
	}
	if(confirm.equals("buy")){%>
<makeOrderForm:MakeOrderForm totalPrice="<%=totalPrice %>" logname="<%=logname %>" orderContent="<%=orderContent %>"/>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<center>
	<h3>付款后发货</h3>
	<%=logname %>当前得订单号：<%=dingdanNumber %><br>
	订单信息：<br>
	<%=giveResult %>
<% }%>
</center>
</body>
</html>