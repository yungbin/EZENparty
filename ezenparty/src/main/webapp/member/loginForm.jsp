<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
th, td{
	border: 1px solid black;
}
#loginBtnTd{
	text-align: right;
}
</style>
</head>
<body>
<h2 style="text-align: center;">로그인</h2>
<form action="login.jsp" method="post">
<table style="margin: 5px auto;">
	<tr>
		<th>아이디</th>
		<td>
		<input name="id" placeholder="아이디 입력" required="required" 
		pattern="\a\w{3, 19}" maxlength="20">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
		<input name="pw" placeholder="비밀번호 입력" required="required" 
		pattern=".{4,20}" maxlength="20" type="password">
		</td>
	</tr>
	<tr>
		<td colspan="2" id="loginBtnTd">
			<button>로그인</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>