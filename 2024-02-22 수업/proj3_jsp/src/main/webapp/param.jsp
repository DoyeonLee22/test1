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
	String id = request.getParameter("id");
	String id2 = (String)request.getAttribute("id2");
	String id3 = (String)request.getAttribute("id3");
	List list = (List) request.getAttribute("list");
%>

아이디  : <%= id %><br>
아이디2 : <%= id2 %><br>
아이디3 : <%= id3 %><br>
리스트 사이즈 : <%= list.size() %><br>

<%
for(int i=0; i<list.size(); i++) {
	out.println(list.get(i));
}
%>
</body>
</html>