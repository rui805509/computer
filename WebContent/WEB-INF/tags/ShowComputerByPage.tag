<%@ tag import="java.sql.*" %>
<%@ tag import="com.sun.rowset.*" %>
<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="computerAmountInPage" required="true" %>
<%@ attribute name="page" required="true" %>
<%@ attribute name="zuduanAmount" required="true" %>
<%@ variable name-given="showPage" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="pageAllCount" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer"  scope="AT_END"%>
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
	int pageSize = Integer.parseInt(computerAmountInPage);
	int allPages = 0;
	int show = Integer.parseInt(page);
	StringBuffer presentPageResult;
	CachedRowSetImpl rowSet;
	presentPageResult = new StringBuffer();
	String uri = "jdbc:sqlserver://localhost:1433;DatabaseName="+dataSource;
	try{
		con = DriverManager.getConnection(uri,"sa","rui805509");
		sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		String s = "select * from "+tableName;
		rs = sql.executeQuery(s);
		rowSet = new CachedRowSetImpl();
		rowSet.populate(rs);
		con.close();
		rowSet.last();
		int m = rowSet.getRow();
		int n = pageSize;
		allPages = ((m%n)==0)?(m/n):(m/n+1);
		int p = Integer.parseInt(page);
		if(p>allPages){
			p = 1;
		}
		if(p<=0){
			p = allPages;
		}
		jspContext.setAttribute("showPage", new Integer(p));
		jspContext.setAttribute("pageAllCount", new Integer(allPages));
		presentPageResult.append("<ul>");
		rowSet.absolute((p-1)*pageSize+1);
		int 字段个数=5;
		字段个数 = Integer.parseInt(zuduanAmount);
		for(int i=1;i<=pageSize;i++){
			presentPageResult.append("<li>");
			String computerISBN="";
			for(int k=1;k<字段个数;k++){
				if(k==1){
					String computerPic="<image src=img/"+rowSet.getString(k)+".jpg width=200 height=200/>";
					presentPageResult.append("<div>"+computerPic+"</div>");
				}
				else if(k==2){
					computerISBN = rowSet.getString(k);
					String computerISBNLink = "<a href=\"LookComputerAbstract.jsp?computerISBN="+computerISBN+"\">"+computerISBN+"</a>";
					presentPageResult.append("<div>"+computerISBNLink+"</div>");
				}
				else if(k==3){
					String computerName = rowSet.getString(k);
					String computerNameLink = "<a href=\"LookComputerAbstract.jsp?computerISBN="+computerISBN+"\">"+computerName+"</a>";
					presentPageResult.append("<div>"+computerNameLink+"</div>");
				}
				else if(k==4){
					presentPageResult.append("<div><font color=red><b>¥"+rowSet.getString(k)+"</b></font></div>");
				}
				else{
					presentPageResult.append("<div>"+rowSet.getString(k)+"</div>");
				}
			}
			String buy="<a href=\"LookPurchase.jsp?buyISBN="+computerISBN+"\">加入购物车</a>";
			presentPageResult.append("<div>"+buy+"</div>");
			presentPageResult.append("</li>");
			boolean boo = rowSet.next();
			if(boo==false)break;
		}
		presentPageResult.append("</ul>");
		jspContext.setAttribute("giveResult", presentPageResult);
		con.close();
	}
	catch(SQLException exp){
		jspContext.setAttribute("showPage", new Integer(1));
		jspContext.setAttribute("pageAllCount", new Integer(1));
		jspContext.setAttribute("giveResult", new StringBuffer(""+exp));
	}
%>
