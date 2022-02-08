<%@ page import="com.ezenparty.notice.service.NoticeDeleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%//java
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);

System.out.println("delete.jsp - no : " + no);

// DB 삭제
NoticeDeleteService service = new NoticeDeleteService();
int result = service.service(no);

response.sendRedirect("list.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제</title>
</head>
<body>
<h2>글삭제</h2>
</body>
</html>