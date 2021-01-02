<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ attribute name="email" required="true" %>
<%@ attribute name="address" required="true" %>
<%@ attribute name="realname" required="true" %>
<%@ attribute name="phone" required="true" %>
<%@ attribute name="passwordquestion" required="true" %>
<%@ attribute name="passwordanswer" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
<%  boolean boo=true;
	if(logname!=null){
		if(logname.contains(",")||logname.contains("，"))
			boo=false;
	}
	if(boo){
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
		}
		catch(Exception e){
			out.print(e);
		}
		Connection con;
		Statement sql;
		ResultSet rs;
		String condition="INSERT INTO [user] VALUES";
		condition+="("+"'"+logname;
		condition+="','"+password;
		condition+="','"+phone;
		condition+="','"+email;
		condition+="','"+address;
		condition+="','"+realname;
		condition+="','"+passwordquestion;
		condition+="','"+passwordanswer+"')";
		try{
			String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=computershop;characterEncoding=utf-8";
			con = DriverManager.getConnection(uri,"sa","rui805509");
			sql = con.createStatement();
			sql.executeUpdate(condition);
			con.close();
			String mess = logname+"注册成功<a href=Login.jsp>请前去登录</a>";
			out.print(mess);
			jspContext.setAttribute("backMess", mess);
			con.close();
		}
		catch(Exception e){
			jspContext.setAttribute("backMess", "没有填写用户名或用户名已经被注册");
			out.print("没有填写用户名或用户名已经被注册");
		}
	}
	else{
		out.print("b");
		jspContext.setAttribute("backMess", "注册失败（用户名中不能有逗号）");
		out.print("注册失败（用户名中不能有逗号）");
	}
%> 