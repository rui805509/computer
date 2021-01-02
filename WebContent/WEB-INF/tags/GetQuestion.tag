<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="passwordquestion" required="true" %>
<%@ attribute name="passwordanswer" required="true" %>
<%@ variable name-given="giveResult" scope="AT_END" %>
<%
	String result = new String();
	String passwordquestion1 = new String();
	String passwordanswer1 = new String();
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
	}
	catch(ClassNotFoundException e){
		out.print(e);
	}
	Connection con;
	Statement sql;
	ResultSet rs;
	String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=computershop";
	try{
		
		con = DriverManager.getConnection(uri,"sa","rui805509");
		sql = con.createStatement();
		String s = "select passwordquestion,passwordanswer from [user] where logname = '"+logname+"'";
		rs = sql.executeQuery(s);
		if(rs.next()){
			passwordquestion1 = rs.getString("passwordquestion").trim();
			passwordanswer1 = rs.getString("passwordanswer").trim();
			if(passwordquestion.equals(passwordquestion1)&&passwordanswer.equals(passwordanswer1)){
				result = "<a href=ModifyPassword1.jsp>验证成功！请前往修改密码</a>";
				session.setAttribute("logname", logname);
			}
			else{
				result = "<a href=Login.jsp>您的密保验证错误，请返回首页</a>";
			}
		}
		else{
			if(logname==""){
				result = "请输入信息！";
			}
			else{
				result = "<a href=Register.jsp>不存在此用户，请前往注册！</a>";
			}
		}
		jspContext.setAttribute("giveResult", result);
		con.close();
	}
	catch(SQLException e){
		out.print(e);
		jspContext.setAttribute("giveResult", new String("<a href=Register.jsp>不存在此用户，请前往注册！</a>"));
	}
%>
