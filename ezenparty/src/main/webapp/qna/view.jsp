<%@page import="com.ezenparty.qna.vo.QnaVO"%>
<%@page import="com.ezenparty.qna.service.QnaViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 자바 부분 view.jsp -> view_jsp.java(Servlet) -> view_jsp.class(실행)
// 넘어오는 데이터 수집
// 글번호를 받아서 long 타입으로 바꾼다.
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);
// 조회수 증가 변수를 받아서 int 타입으로 바꾼다.
String strInc = request.getParameter("inc");
int inc = Integer.parseInt(strInc);
// 확인용
System.out.println("view.jsp - no : " + no + "\n inc - " + inc);

// 데이터에 따른 DB 가져오기
// QnaViewService 객체 생성
QnaViewService service = new QnaViewService();
QnaVO vo = service.service(no, inc);

// 줄바꿈 바꿔치기
vo.setContent(vo.getContent().replace("\n", "<br>"));
		
System.out.println("view.jsp vo : " + vo);

// EL객체를 사용하기 위해 기본 저장 객체(request)에 vo값 저장
request.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 답변 보기</title>
<script type="text/javascript">
$(function(){
	// 삭제 버튼의 이벤트 처리
	$("#deleteBtn").click(function(){
		// js에서 true(확인)나 false(취소)를 선택하게 하는 함수 : confirm()
		if(!confirm("정말 삭제하시겠습니까?")) return false;
	});
});
</script>
</head>
<body>
<div class="container">
<h2>질문 답변 보기</h2>
<table class="table">
	<tr>
		<th>번호</th>
		<td>${vo.no }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${vo.title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${vo.content }</td>
	</tr>
	<tr>
		<th>이름 (아이디)</th>
		<td>${vo.name } (${vo.id })</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${vo.writeDate }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${vo.hit }</td>
	</tr>
	<tr>
		<td colspan="2">
		<!-- 로그인 처리가 되어 있으면 나타나는 버튼 -->
		<c:if test="${!empty login }">
			<!-- 내 질문에 대한 답변 할 수 없다. -->
			<c:if test="${login.id != vo.id}">
				<a href="answerForm.jsp?no=${vo.no }" class="btn btn-default">답변하기</a>
			 </c:if>
			<!-- 내가 작성한 글이거나 관리자인 경우에 보여준다. -->
			<c:if test="${login.id == vo.id || login.gradeNo == 9}">
			<a href="updateForm.jsp?no=${vo.no }" class="btn btn-default">수정</a>
			<a href="delete.jsp?no=${vo.no }" class="btn btn-default" id="deleteBtn">삭제</a>
			</c:if>
		</c:if>
			<a href="list.jsp?page=${param.page }&perPageNum=${param.perPageNum }" class="btn btn-default">리스트</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>