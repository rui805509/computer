<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
<%
	String mess = "";
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
	}
	catch(ClassNotFoundException e){
		out.print(e);
	}
	Connection con;
	Statement sql;
	ResultSet rs;
	String loginMess = (String)session.getAttribute("logname");
	if(loginMess==null){
		loginMess = "*************";
	}
	String str = logname+","+password;
	if(loginMess.equals(str)){
		mess = logname+"已经登陆了<a href=LookComputer.jsp>请前往购物</a>";
	}
	else{
		String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=computershop";
		boolean boo = (logname.length()>0)&&(password.length()>0);
		try{
			con = DriverManager.getConnection(uri,"sa","rui805509");
			String condition = "select * from [user] where logname = '"+logname+"' and password = '"+password+"'";
			sql = con.createStatement();
			if(boo){
				rs = sql.executeQuery(condition);
				boolean m = rs.next();
				if(m==true){
					mess = logname+"登陆成功！<a href=LookComputer.jsp>请前往购物</a>";
					str = logname+","+password;
					session.setAttribute("logname", str);
				}
				else{
					mess ="您输入的用户名"+logname+"不存在，或密码不匹配<br><a href=Register.jsp>用户注册？？</a><br><a href=GetQuestion.jsp>忘记密码？？</a>";
				}
			}
			else{
				mess = "还没有登录或您输入的用户名不存在，或密码不般配。";
			}
			con.close();
		}
		catch(SQLException exp){
			mess="问题"+exp;
			out.print(mess);
		}
	}
	jspContext.setAttribute("backMess", mess);
%>