<%@page import="com.webjjang.util.PageObject"%>
<%@page import="com.ezenparty.member.vo.LoginVO"%>
<%@page import="com.ezenparty.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ezenparty.member.service.MemberListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<%
// 여기가 자바의 처리 부분입니다.
// DB 클래스 확인
Class.forName("com.ezenparty.util.db.DB");

// 페이지 정보 받기
PageObject pageObject = PageObject.getInstance(request);
// 데이터 가져오기 - 생성 호출한다.
// [Controller(JSP)] - Service - DAO
MemberListService service = new MemberListService();
List<MemberVO> list = service.service(pageObject);

// LoginVO loginVO = (LoginVO)session.getAttribute("login");

// el 객체나 JSTL을 사용하기 위해서 request 객체에 담기
request.setAttribute("list", list);
request.setAttribute("pageObject", pageObject);
%>
<!DOCTYPE html>
<html>
<!-- 페이지 정보 -->
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<style type="text/css">
.dataRow:hover {/* 클래스 선택*/
	cursor: pointer;
	background: #eee;
}

</style>
</head>

<script type="text/javascript">
//alert("경고 메시지 입니다.")
</script>
<!-- 데이터 표시부분 -->
<body>
<div class="container">
	<h2>회원 리스트</h2>
	<table class="table">
		<tr>
			<th>사진</th>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>전화번호</th>
			<th>권한번호</th>
			<th>권한이름</th>
			<th>최종접속</th>
		</tr>
		<!-- 데이터 있는 만큼 반복 처리해서 줄을 만들어 낸다. -->
		<c:forEach items="${list }" var="vo">
		<!-- id : 보여줄 회원정보 -->
			<tr onclick="document.location='view.jsp?id=${vo.id}&page=${pageObject.page }&perPageNum=${pageObject.perPageNum }'" class="dataRow">
				<td><img src="${vo.photo}" style="width: 40px; height: 50px;"></td>
				<td>${vo.id}</td>
				<td>${vo.name}</td>
				<td>${vo.birth}</td>
				<td>${vo.tel}</td>
				<td>${vo.gradeNo}</td>
				<td>${vo.gradeName}</td>
				<td>${vo.conDate}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8">
			<pageNav:pageNav listURI="list.jsp" pageObject="${pageObject }"/>
			</td>
		</tr>
		<tr>
			<td colspan="8">
			<a href = "writeForm.jsp" class="btn btn-default">회원등록</a>
			<a href="/grade/list.jsp" class="btn btn-default">등급 관리</a>
			</td>
		</tr>
	</table>
</div>
</body>
</html>