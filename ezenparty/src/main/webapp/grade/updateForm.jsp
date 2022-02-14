<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// 데이터 수집
String strGradeNo = request.getParameter("gradeNo");
int gradeNo = Integer.parseInt(strGradeNo);
String gradeName = request.getParameter("gradeName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급 수정 폼</title>
<style type="text/css">
th, td {
	border: 1px solid #444;

}
</style>
</head>
<body>
<h2>등급 수정 폼</h2>
<form action="update.jsp" method="post">
<table>
<tr>
	<th>등급번호</th>
	<td><input name="gradeNo" value="<%= gradeNo %>" readonly="readonly"></td>
</tr>
<tr>
	<th>등급이름</th>
	<td><input name="gradeName" value="<%= gradeName %>"></td>
</tr>
<tr>
	<td colspan="2">
	<button>수정</button>
	<button type="reset">다시입력</button>
	<button type="button" onclick="history.back();">취소</button>
	</td>
</tr>
</table>
</form>
</body>
</html>