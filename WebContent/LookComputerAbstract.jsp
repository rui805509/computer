<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="computerAbstract" %>
<head><%@ include file="head.txt" %><link rel="stylesheet" href="css/my.css"></head>
<br><br>
<title>
	商品信息
</title>

<%
	String computerISBN = request.getParameter("computerISBN");
%>
<computerAbstract:ComputerAbstract computerISBN="<%=computerISBN %>"/>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<center>
<%=giveResult %>
</center>
</body>
</html>