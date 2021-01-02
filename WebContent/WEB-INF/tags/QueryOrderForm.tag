<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true"%>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END"%>
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
		String s = "select * from orderForm where logname='"+logname.trim()+"'";
		rs =sql.executeQuery(s);
		str.append("<table id=\"customers\" border=1>");
		str.append("<tr>");
		str.append("<th>订单号</th>");
		str.append("<th>订单用户</th>");
		str.append("<th>订单信息</th>");
		str.append("<th>总价格</th>");
		str.append("</tr>");
		while(rs.next()){
			str.append("<tr>");
			str.append("<td>"+rs.getString(1)+"</td>");
			str.append("<td>"+rs.getString(2)+"</td>");
			str.append("<td>"+rs.getString(3)+"</td>");
			str.append("<td>"+rs.getString(4)+"</td>");
			str.append("</tr>");
		}
		str.append("</table>");
		jspContext.setAttribute("giveResult", str);
	}
	catch(SQLException e){
		out.print(e);
		jspContext.setAttribute("giveResult", new StringBuffer(""+e));
	}
%>