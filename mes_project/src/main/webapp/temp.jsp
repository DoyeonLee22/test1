<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List list = (List)request.getAttribute("list");
System.out.println("list사이즈 : " + list.size());
for(int i=0; i<list.size(); i++) {
%>
	<%=list.get(i) %><br>
	
<%
}
%>
</body>
</html>