<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="computerISBN" required = "true" %>
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
	String uri="jdbc:sqlserver://localhost:1433;DatabaseName=computershop";
	try{
		con = DriverManager.getConnection(uri,"sa","rui805509");
		sql = con.createStatement();
		String s = "select * from computerForm where computerISBN='"+computerISBN+"'";
		rs = sql.executeQuery(s);
		str.append("<table id=\"customers\" border=1>");
		str.append("<tr>");
		str.append("<th>商品名</th>");
		str.append("<th>商品信息</th>");
		str.append("</tr>");
		while(rs.next()){
			str.append("<tr>");
			str.append("<td>"+rs.getString("computerName")+"</td>");
			str.append("<td><TextArea Rows=8 Cols=40>"+rs.getString("computerAbstract")+"</TextArea></td>");
			str.append("</tr>");
		}
		str.append("</table>");
		jspContext.setAttribute("giveResult", str);
		con.close();
	}
	catch(SQLException e){
		jspContext.setAttribute("giveResult", new StringBuffer(""+e));
	}
%>