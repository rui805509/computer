<%@ page contentType="text/html;charset=utf-8" import="com.jspsmart.upload.*" %>
<html>
<body style="background:url(img/beijing.jpg);;background-size:100% 100% ; background-attachment: fixed">
<%  String filename="warning.txt";
if(filename!=null){
SmartUpload downfile = new SmartUpload();
downfile.initialize(pageContext);
downfile.setContentDisposition(null);
downfile.downloadFile(filename);
}
out.clear();
out=pageContext.pushBody();
%>
</body>
</html>