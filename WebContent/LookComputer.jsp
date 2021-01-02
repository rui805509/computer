<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="showComputerByPage" %>
<head><%@ include file="head.txt" %>
<link rel="stylesheet" href="css/my.css">
<style type="text/css">
ul {list-style-type: none;}
ul li {list-style-type: none;float:left;width: 21.7%;margin-right: 3%;margin-bottom:2%;border: solid 1px gray;background-color:white;}
</style>
</head>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">

<center>
<%
	String number=request.getParameter("page");
	if(number==null){
		number = "1";
	}
%>
<br>每页最多显示8台电脑
<showComputerByPage:ShowComputerByPage tableName="computerForm" zuduanAmount="6" computerAmountInPage="8" page="<%=number %>" dataSource="computershop"/>
<div>
<br>共有<%=pageAllCount%>页，当前显示第<%=showPage %>页
<br><%=giveResult%>
</div>
<div>
<%
	int m =showPage.intValue();
%>
<br>
<a href = "LookComputer.jsp?page=<%=m+1 %>">下一页</a>
<a href = "LookComputer.jsp?page=<%=m-1 %>">上一页</a>
<form action="">
输入页码：<input type="text" name="page">
<input type="submit" name="g" value="提交">
</div>
</form>
</center>
</body>
</html>