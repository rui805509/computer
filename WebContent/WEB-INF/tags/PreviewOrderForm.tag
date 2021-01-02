<%@ tag import="java.util.*" %>
<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%@ variable name-given="totalPrice" variable-class="java.lang.Float" scope="AT_END"%>
<%@ variable name-given="img" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
	}
	catch(ClassNotFoundException e){
		out.print(e);
	}
	Connection con;
	Statement sql;
	ResultSet rs;
	StringBuffer orderMess = new StringBuffer();
	StringBuffer imgMess = new StringBuffer();
	String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=computershop";
	try{
		con = DriverManager.getConnection(uri,"sa","rui805509");
		sql = con.createStatement();
		Enumeration keys = session.getAttributeNames();
		float sum = 0;
		while(keys.hasMoreElements()){
			String key = (String)keys.nextElement();
			boolean isTrue = (!(key.equals("logname")))&&(key.endsWith(logname));
			if(isTrue){
				String computerISBN = (String)session.getAttribute(key);
				String sqlStatement = "select * from computerForm where computerISBN = '"+computerISBN+"'";
				rs = sql.executeQuery(sqlStatement);
				while(rs.next()){
					String computerPic = rs.getString("computerPic");
					computerISBN = rs.getString("computerISBN");
					String computerName = rs.getString("computerName");
					String computerPublish = rs.getString("computerPublish");
					float computerPrice = rs.getFloat("computerPrice");
					sum = sum+computerPrice;
					imgMess.append("<br><img src=img/"+computerPic+".jpg width=100 height=100>");
					orderMess.append("<br>ISBN:"+computerISBN+"  商品名："+computerName+"  出产商 ："+computerPublish+"  价格："+computerPrice+"<br>");
				}
			}
		}
		jspContext.setAttribute("giveResult", orderMess);
		jspContext.setAttribute("img", imgMess);
		jspContext.setAttribute("totalPrice", new Float(sum));
	}
	catch(SQLException e){
		out.print(e);
		jspContext.setAttribute("giveResult", new StringBuffer("没有订单"));
		jspContext.setAttribute("img", new StringBuffer("没有商品图"));
		jspContext.setAttribute("totalPrice", new Float(-1));
	}
%>