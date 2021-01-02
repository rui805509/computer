<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="findComputer" %>
<head><%@ include file="head.txt" %>
<link rel="stylesheet" href="css/my.css">
<style type="text/css">
ul {list-style-type: none;}
ul li {list-style-type: none;float:left;width: 21.5%;margin-right: 3%;margin-bottom:2%;border: solid 1px gray;background-color:white;}
</style>
</head>
<br><br>
<html>
<body  style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<center>
<form action="">
输入查询内容：<input type="text" name="findContent" value="外星人">
	<select name="condition" size=1>
		<option Selected value="computerISBN">ISBN</option>
		<option value="computerName">商品名</option>
		<option value="computerPublish">商品厂商</option>
	</select>
	<input type="submit" value="提交">
</form>
<%
	String findContent = request.getParameter("findContent");
	String condition = request.getParameter("condition");
	if(findContent==null){
		findContent="";
	}
	if(condition==null){
		condition="";
	}
%>
<br>查询到的商品：
<findComputer:FindComputer tableName="computerForm" findContent="<%=findContent%>" dataSource="computershop" condition="<%=condition%>"/>
<br><%=giveResult%>
</center>
</body>
</html>