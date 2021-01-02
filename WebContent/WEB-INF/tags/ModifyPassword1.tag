<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="newPassword" required="true" %>
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
		if(rs.next()){
			String updateString = "update [user] set password='"+newPassword+"' where logname='"+logname+"'";
			int m = sql.executeUpdate(updateString);
			if(m==1){
				str.append("<a href=Login.jsp>密码修改成功！请前往首页登录</a>");
			}
			else{
				str.append("<a href=Login.jsp>密码修改失败！请前往首页</a>");
			}
		}
		else{
			str.append("<a href=Login.jsp>密码修改失败！请前往首页</a>");
		}
		con.close();
	}
	catch(SQLException e){
		str.append("<a href=Login.jsp>密码修改失败！请前往首页</a>");
	}
	jspContext.setAttribute("giveResult", str);
%>