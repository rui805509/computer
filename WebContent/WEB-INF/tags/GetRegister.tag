<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true" %>
<%@ variable name-given="oldEmail" scope="AT_END" %>
<%@ variable name-given="oldAddress" scope="AT_END" %>
<%@ variable name-given="oldRealname" scope="AT_END" %>
<%@ variable name-given="oldPhone" scope="AT_END" %>
<%@ variable name-given="oldPasswordquestion" scope="AT_END" %>
<%@ variable name-given="oldPasswordanswer" scope="AT_END" %>
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
		String query = "select phone,email,address,realname,passwordquestion,passwordanswer from [user] where logname='"+logname+"'";
		sql = con.createStatement();
		rs = sql.executeQuery(query);
		if(rs.next()){
			jspContext.setAttribute("oldPhone", rs.getString("phone"));
			jspContext.setAttribute("oldEmail", rs.getString("email"));
			jspContext.setAttribute("oldAddress", rs.getString("address"));
			jspContext.setAttribute("oldRealname",rs.getString("realname"));
			jspContext.setAttribute("oldPasswordquestion", rs.getString("passwordquestion"));
			jspContext.setAttribute("oldPasswordanswer", rs.getString("passwordanswer"));
		}
		else{
			jspContext.setAttribute("oldPhone", "");
			jspContext.setAttribute("oldEmail", "");
			jspContext.setAttribute("oldAddress", "");
			jspContext.setAttribute("oldRealname", "");
			jspContext.setAttribute("oldPasswordquestion", "");
			jspContext.setAttribute("oldPasswordanswer", "");
		}
		con.close();
	}
	catch(SQLException e){
		out.print(e);
		jspContext.setAttribute("oldPhone", "");
		jspContext.setAttribute("oldEmail", "");
		jspContext.setAttribute("oldAddress", "");
		jspContext.setAttribute("oldRealname", "");
		jspContext.setAttribute("oldPasswordquestion", "");
		jspContext.setAttribute("oldPasswordanswer", "");
	}
%>