<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pname = request.getParameter("pname");
String image = request.getParameter("image");
String strPrice = request.getParameter("price");
long price = Long.parseLong(strPrice);
String strUnit = request.getParameter("unit");
long unit = Long.parseLong(strUnit);

long total = price * unit;

request.setAttribute("pname", pname);
request.setAttribute("image", image);
request.setAttribute("unit", unit);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${pname }
<img alt="none" src="${image }">
${unit }
<%= total %>
</body>
</html>