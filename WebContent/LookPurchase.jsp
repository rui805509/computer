<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix = "lookPurchase" %>
<head><%@ include file="head.txt" %>
<link rel="stylesheet" href="css/my.css">
</head>
<title>
	查看购物车
</title>
<br><br>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<%
	boolean isAdd = false;
	String logname = (String)session.getAttribute("logname");
	if(logname!=null){
		int m = logname.indexOf(",");
		logname = logname.substring(0,m);
		isAdd = true;
	}
	else{
		response.sendRedirect("Login.jsp");
	}
	String buyISBN = request.getParameter("buyISBN");
	if((buyISBN!=null)&&isAdd){
		session.setAttribute(buyISBN+","+logname,buyISBN);
	}
	String deletedISBN = request.getParameter("deletedISBN");
	if((deletedISBN!=null)&&isAdd){
		session.removeAttribute(deletedISBN+","+logname);
	}
%>
<center>
	<lookPurchase:LookPurchase logname="<%=logname%>" />
	<h2><%=logname %>购物车中有如下商品：</h2>
	<%=giveResult %>
	<br>
	商品价格总计：
	<%=price %>
	<form action="PreviewOrderForm.jsp">
	生成订单：<input type="submit" name="g" value="提交">
	</form>
</center>
</body>
</html>