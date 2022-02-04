<%@page import="com.ezenparty.member.vo.MemberVO"%>
<%@page import="com.ezenparty.member.service.MemberViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 자바 부분입니다.
// 데이터 수집 - 아이디 --> 내 정보 보기 : view.jsp
// DB 글번호에 맞는 데이터 가져오기 - MemberViewService 생성 - 호출(vo)
String id = request.getParameter("id");

System.out.println("updateForm.jsp - id : " + id);
MemberViewService service = new MemberViewService();
MemberVO vo = service.service(id);
System.out.println("vo = " + vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<h2>회원 정보 수정</h2>
<!-- 사용자에게 데이터를 입력하도록 한다. : form, input, select, textarea tag -->
<!-- action : 데이터를 받을 URL, method : get - URL 뒤에 데이터, post - 따로 보이지 않게 데이터
			- 수정항목 : 이름, 성별, 생년월일, 전화번호, 이메일. 본인확인 입력 정보 : 아이디(변경불가), 비밀번호(입력) 
			- 회원 등록과 화면이 비슷함. -->
<form action="update.jsp" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td><input type="text" name="id" maxlength="20" value="<%= vo.getId() %>"
				readonly="readonly" onclick="alert('아이디는 수정할 수 없습니다.')"/></td>
		</tr>
		<tr>
			<th>비밀번호(본인 확인용)</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력
			 type="password" : 입력한 문자를 대체문자로 보여준다. 동그라미로 보여준다.-->
			<td><input type="password" name="pw" maxlength="20"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td><input type="text" name="name" maxlength="10"
			value="<%= vo.getName()%>"/></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력
			 xxxx-xx-xx placeholder : 입력 형식 예를 데이터가 입력이 안 되었을 때 백그라운드로 표시-->
			<td><input type="text" name="birth" maxlength="10" placeholder="예)1900-01-01"
			value="<%= vo.getBirth()%>"/></td>
		</tr>
		<tr>
			<th>연락처</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td><input type="text" name="tel" maxlength="13" placeholder="예)010-1111-2222"
			value="<%= vo.getTel()%>"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td><input type="text" name="email" maxlength="50" placeholder="예)test@naver.com"
			value="<%= vo.getEmail()%>"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- button이 form tag 안에 있으면 데이터를 전달하는 동작을 하게 된다. -->
				<button type="submit">수정</button>
				<button type="reset">다시입력</button>
				<button type="button" onclick="history.back()">취소</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>