<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급 등록 폼</title>
<style type="text/css">
th, td{
	border: 1px solid #444;
}
</style>
</head>
<body>
<h2>등급 등록 폼</h2>
<form action="write.jsp" method="post">
<table>
<tr>
	<th>등급번호</th>
	<td><input name="gradeNo"></td>
</tr>
<tr>
	<th>등급이름</th>
	<td><input name="gradeName"></td>
</tr>
<tr>
	<td colspan="2"><button>등록</button></td>
</tr>
</table>
</form>
</body>
</html>