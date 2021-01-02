<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true" %>
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
		sql = con.createStatement();
		String s = "select * from [user] where logname='"+logname+"'";
		rs = sql.executeQuery(s);
		str.append("<table id=\"customers\">");
		while(rs.next()){
			str.append("<tr><td width=100px>用户名</td><td width=150px>"+rs.getString(1)+"</td></tr>");
			str.append("<tr class=\"alt\"><td>手机号</td><td>"+rs.getString(3)+"</td></tr>");
			str.append("<tr><td>电子邮箱</td><td>"+rs.getString(4)+"</td></tr>");
			str.append("<tr class=\"alt\"><td>收货地址</td><td>"+rs.getString(5)+"</td></tr>");
			str.append("<tr><td>真实姓名</td><td>"+rs.getString(6)+"</td></tr>");
			str.append("<tr class=\"alt\"><td>密保问题</td><td>"+rs.getString(7)+"</td></tr>");
			str.append("<tr><td>密保答案</td><td>"+rs.getString(8)+"</td></tr>");
		}
		str.append("</table>");
		jspContext.setAttribute("giveResult", str);
		con.close();
	}
	catch(SQLException e){
		out.print(e);
		jspContext.setAttribute("giveResult", new StringBuffer("出现错误"));
	}
%>