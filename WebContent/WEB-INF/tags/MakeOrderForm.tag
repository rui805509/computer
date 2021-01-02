<%@ tag import="java.util.*" %>
<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="orderContent" required="true" %>
<%@ attribute name="totalPrice" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%@ variable name-given="dingdanNumber" variable-class="java.lang.Long" scope="AT_END"%>
<%
	String user = (String)session.getAttribute("logname");
	if(user==null){
		response.sendRedirect("Login.jsp");
	}
	float sum = Float.parseFloat(totalPrice);
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
	int orderNumber = 2010;
	int max = orderNumber;
	String sqlStatement="";
	try{
		con = DriverManager.getConnection(uri,"sa","rui805509");
		sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		rs = sql.executeQuery("select * from orderForm");
		while(rs.next()){
			int n = rs.getInt("orderNumber");
			if(n>=max){
				max = n;
			}
		}
		orderNumber = max+1;
		sqlStatement = "insert into orderForm values("+orderNumber+",'"+logname+"','"+orderContent+"',"+sum+")";
		sql.executeUpdate(sqlStatement);
		StringBuffer strMess = new StringBuffer();
		sqlStatement = "select * from orderForm where orderNumber = "+orderNumber;
		rs = sql.executeQuery(sqlStatement);
		strMess.append("<table id=\"customers\" border=2>");
		strMess.append("<tr>");
		strMess.append("<th>订单号</th>");
		strMess.append("<th>订单内容</th>");
		strMess.append("<th>总价格</th>");
		strMess.append("</tr>");
		while(rs.next()){
			String idNumber = rs.getString("orderNumber");
			String orderMess = rs.getString("orderMess");
			float priceSum = rs.getFloat("sum");
			strMess.append("<tr>");
				strMess.append("<td>"+idNumber+"</td>");
				strMess.append("<td>"+orderMess+"</td>");
				strMess.append("<td>"+priceSum+"</td>");
			strMess.append("</tr>");
		}
		strMess.append("</table>");
		jspContext.setAttribute("giveResult", strMess);
		jspContext.setAttribute("dingdanNumber", new Long(orderNumber));
		con.close();
	}
	catch(SQLException e){
		out.print(e);
		jspContext.setAttribute("giveResult", new StringBuffer(""+e));
		jspContext.setAttribute("dingdanNumber", new Long(-1));
	}
%>