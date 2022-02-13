<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그아웃 처리 -> 정해진 장소(session)의 데이터(login)를 지운다.
session.removeAttribute("login");
System.out.println("logout.jsp - 로그아웃 처리가 되었습니다.");

// main이 없어서 공지사항으로 자동 이동시킨다.
response.sendRedirect("/");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>