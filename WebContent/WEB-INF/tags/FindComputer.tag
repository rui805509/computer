<%@ tag import="java.sql.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="findContent" required="true" %>
<%@ attribute name="condition" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END"%>
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
	StringBuffer queryResult = new StringBuffer();
	String uri="jdbc:sqlserver://localhost:1433;DatabaseName="+dataSource;
	try{
		con = DriverManager.getConnection(uri,"sa","rui805509");
		sql = con.createStatement();
		String s = "";
		s = "select * from "+tableName+" where "+condition+" Like'%"+findContent+"%'";
		rs = sql.executeQuery(s);
		queryResult.append("<ul>");
		int 字段个数=5;
		while(rs.next()){
			queryResult.append("<li>");
			String computerISBN="";
			for(int k=1;k<=字段个数;k++){
				if(k==1){
					String computerPic="<image src=img/"+rs.getString(k)+".jpg width=200 height=200/>";
					queryResult.append("<div>"+computerPic+"</div>");
				}
				else if(k==2){
					computerISBN = rs.getString(k);
					String computerISBNLink = "<a href=\"LookComputerAbstract.jsp?computerISBN="+computerISBN+"\">"+computerISBN+"</a>";
					queryResult.append("<div>"+computerISBNLink+"</div>");
				}
				else if(k==3){
					String computerName = rs.getString(k);
					String computerNameLink = "<a href=\"LookComputerAbstract.jsp?computerISBN="+computerISBN+"\">"+computerName+"</a>";
					queryResult.append("<div>"+computerNameLink+"</div>");
				}
				else if(k==4){
					queryResult.append("<div><font color=red><b>¥"+rs.getString(k)+"</b></font></div>");
				}
				else{
					queryResult.append("<div>"+rs.getString(k)+"</div>");
				}	
			}
			String buy = "<a href=\"LookPurchase.jsp?buyISBN="+computerISBN+"\">加入购物车</a>";
			queryResult.append("<div>"+buy+"</div>");
			queryResult.append("</li>");
		}
		queryResult.append("</ul>");
		jspContext.setAttribute("giveResult", queryResult);
		con.close();
	}
	catch(SQLException exp){
		jspContext.setAttribute("giveResult", new StringBuffer("请给出查询条件！"));
	}
%>