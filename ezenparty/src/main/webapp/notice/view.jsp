<%@page import="com.ezenparty.member.vo.LoginVO"%>
<%@page import="com.ezenparty.notice.vo.NoticeVO"%>
<%@page import="com.ezenparty.notice.service.NoticeViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%// 자바
// DB에서 데이터를 꺼내온다. 글번호가 넘어온다.
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);

System.out.println("list no - " + no);

// 데이터 불러오기 [Controller - JSP] - service - dao
NoticeViewService service = new NoticeViewService();
NoticeVO vo = service.service(no);

// 내용은 엔터를 적용시키기 위해서 줄바꿈 데이터(\n)를 <br> 태그로 바꿔준다.
vo.setContent(vo.getContent().replace("\n", "<br>"));

// 로그인 정보 꺼내 오기
// LoginVO loginVO = (LoginVO)session.getAttribute("login");
// 데이터 확인
//System.out.println("view vo - " + vo);

request.setAttribute("vo", vo);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세글보기</title>
<style type="text/css">
/* th{	 */
/* 	text-align: right; */
/* 	background: black; */
/* 	color: white; */
/* } */
</style>
</head>
<body>
<div class="container">
<h2>상세글보기</h2>
<table class="table">
	<tr>
		<th>번호</th>
		<td>${vo.no}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${vo.title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${vo.content}</td>
	</tr>
	<tr>
		<th>시작 ~ 종료일</th>
		<td>${vo.startDate} ~ ${vo.endDate}</td>
	</tr>
	<tr>
		<th>등록일</th>
		<td>${vo.writeDate}</td>
	</tr>
	<tr>
		<td colspan="2">
<%-- 		<% if (loginVO != null && loginVO.getGradeNo() == 9) { %> --%>

<%-- 	<c:if test="${!empty login && login.getGradeNo() == 9}"> --%>

		<a href="updateForm.jsp?no=${vo.no}" class="btn btn-default">수정</a>
		<a href="delete.jsp?no=${vo.no}" class="btn btn-default">삭제</a>

<%--	</c:if> --%>

		<a href="list.jsp?pt=${param.pt }&page=${param.page }&perPageNum=${param.perPageNum }" class="btn btn-default">리스트</a>
		</td>
	</tr>
		</table>
	</div>
</body>
</html>