<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="email" required="true" %>
<%@ attribute name="address" required="true" %>
<%@ attribute name="realname" required="true" %>
<%@ attribute name="phone" required="true" %>
<%@ attribute name="passwordquestion" required="true" %>
<%@ attribute name="passwordanswer" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
	}
	catch(ClassNotFoundException e){
		out.print(e);
	}
	StringBuffer str = new StringBuffer();
	Connection con;
	Statement sql;
	ResultSet rs;
	String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=computershop";
	try{
		con = DriverManager.getConnection(uri,"sa","rui805509");
		String updateCondition = "update [user] set phone='"+phone+"',email='"+email+"',address='"+address+"',realname='"+realname+"',passwordquestion='"+passwordquestion+"',passwordanswer='"+passwordanswer+"' where logname='"+logname+"'";
		sql = con.createStatement();
		int m = sql.executeUpdate(updateCondition);
		if(m==1){
			str.append("<a href=PersonalCenter.jsp>修改信息成功！请返回个人中心</a>");
		}
		else{
			str.append("更新失败！");
		}
		con.close();
	}
	catch(SQLException e){
		out.print(e);
	}
	jspContext.setAttribute("giveResult", str);
%>