<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int a = 10;
	for (int i = 0; i < 5; i++) {
	%>
	<h1>hello JSP</h1>
	<%
	}
	%>

	<%
	out.println("<h2>subject</h2>");
	%>
	
	<%!
		int b = 5;
		void test() {
			// 메소드
			
		}
	%>
	
	a : <% out.println(a); %><br>
	a : <%= a %><br>
	<!-- a : <%= a %><br> -->
	<hr>
	
	<% 
	String id = request.getParameter("id"); 
	%>
	id = <input type="text" value="<%= id %>"><br>
	<!-- id = <input type="text" value="${id}%>"><br>-->
	<!-- HTML 주석 -->
	<%-- JSP 주석 --%>
</body>
</html>