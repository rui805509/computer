<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="queryOrderForm" %>
<head><%@ include file="head.txt" %>
<link rel="stylesheet" href="css/my.css">
</head>
<title>
	查看订单
</title>
<%
	String logname = (String)session.getAttribute("logname");
	if(logname == null){
		response.sendRedirect("Login.jsp");
	}
	else{
		int m = logname.indexOf(",");
		logname = logname.substring(0,m);
	}
%>
<queryOrderForm:QueryOrderForm logname="<%=logname%>"/>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<center>
<h3><%=logname %>全部订单：</h3><br>
<%=giveResult %>
</center>
</body>
</html>