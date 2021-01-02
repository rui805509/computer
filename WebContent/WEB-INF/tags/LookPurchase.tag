<%@ tag import="java.sql.*" %>
<%@ tag import="java.util.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="logname" required="true"%>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%@ variable name-given="price" variable-class="java.lang.Float" scope="AT_END" %>
<%
	float totalPrice = 0;
	String computerPic;
	String computerISBN;
	String computerName;
	String computerPublish;
	float computerPrice;
	String uri="jdbc:sqlserver://localhost:1433;DatabaseName=computershop";
	Connection con;
	Statement sql;
	ResultSet rs;
	StringBuffer str = new StringBuffer();
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
	}
	catch(ClassNotFoundException e){
		out.print(e);
	}
	Enumeration keys = session.getAttributeNames();
	str.append("<table id=\"customers\" border=1>");
	str.append("<tr>");
	str.append("<th>商品图</th>");
	str.append("<th>商品编号</th>");
	str.append("<th>商品名称</th>");
	str.append("<th>商品厂商</th>");
	str.append("<th>商品单价</th>");
	str.append("<th>操作</th>");
	str.append("</tr>");
	while(keys.hasMoreElements()){
		String key = (String)keys.nextElement();
		boolean isTrue = (!(key.equals("logname")))&&(key.endsWith(logname));
		if(isTrue){
			computerISBN = (String)session.getAttribute(key);
			String sqlStatement = "select * from computerForm where computerISBN = '"+computerISBN+"'";
			try{
				con = DriverManager.getConnection(uri,"sa","rui805509");
				sql = con.createStatement();
				rs = sql.executeQuery(sqlStatement);
				while(rs.next()){
					computerPic = rs.getString("computerPic");
					computerISBN = rs.getString("computerISBN");
					computerName = rs.getString("computerName");
					computerPublish = rs.getString("computerPublish");
					computerPrice = rs.getFloat("computerPrice");
					totalPrice = totalPrice+computerPrice;
					str.append("<tr>");
					str.append("<td><img src=img/"+computerPic+".jpg width=100 height=100></td>");
					str.append("<td>"+computerISBN+"</td>");
					str.append("<td>"+computerName+"</td>");
					str.append("<td>"+computerPublish+"</td>");
					str.append("<td>"+computerPrice+"</td>");
					String del = "<a href=\"LookPurchase.jsp?deletedISBN="+computerISBN+"\">删除</a>";
					str.append("<td>"+del+"</td>");
					str.append("</tr>");
				}
				con.close();
			}
			catch(SQLException exp){
				str.append(exp);
			}
		}
	}
	str.append("</table>");
	jspContext.setAttribute("giveResult", str);
	jspContext.setAttribute("price", new Float(totalPrice));
	
%>