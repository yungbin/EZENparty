<%@ page import="com.webjjang.util.PageObject"%>
<%@ page import="com.ezenparty.member.vo.LoginVO"%>
<%@ page import="com.ezenparty.notice.vo.NoticeVO"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ezenparty.notice.service.NoticeListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

<%
// 여기가 자바의 처리 부분입니다.
// DB 클래스 확인
Class.forName("com.ezenparty.util.db.DB");

// 페이지 정보 수집
PageObject pageObject = PageObject.getInstance(request);

// 데이터 수집
// now - 현재 공지, old - 지난 공지, res - 예약 공지, all - 전체 공지 -> pt(point)
// pt = pageObject.period
String pt = request.getParameter("pt");
if(pt == null) pt = "all"; // 기본 값 세팅 : 현재 공지

pageObject.setPeriod(pt);

// DB에서 데이터 가져오기 - 생성, 호출
NoticeListService service = new NoticeListService();
List<NoticeVO> list = service.service(pageObject);

// 데이터 확인하기
//System.out.println(list);
// 클릭한 버튼의 스타일 문자열 변수
String style = "background: black; color : white;";

// session에서 로그인 정보를 받아낸다.
// LoginVO loginVO = (LoginVO)session.getAttribute("login");

request.setAttribute("list", list);
request.setAttribute("pt", pt);
request.setAttribute("style", style);

// 페이지정보를 request에 담는다.
request.setAttribute("pageObject", pageObject);
%>

<!DOCTYPE html>
<html>
<!-- 페이지 정보 -->
<head>
<meta charset="UTF-8">
<title>공지사항&이벤트</title>
<style type="text/css">
th{
	background: black;
	color: white;
}
.data:hover{
	cursor: pointer; /* 손가락 */
	background: #eee;
}
</style>
</head>
<script type="text/javascript">
<%-- alert("${pt}"); // 경고창 띄우기 --%>
</script>
<!-- 데이터 표시부분 -->
<body>
<div class="container">
	<h2>공지사항&이벤트</h2>
	<a href="list.jsp?pt=all" class="btn btn-default" style='${(pt == "all")?style:""}'>전체글</a>
	<a href="list.jsp?pt=notice" class="btn btn-default" style='${(pt == "notice")?style:""}'>공지사항</a>
	<a href="list.jsp?pt=event" class="btn btn-default" style='${(pt == "event")?style:""}'>이벤트</a>
<table class="table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>기간</th>
		<th>등록일</th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="5">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty list}">
		<c:forEach items="${list}" var="vo">
			<tr onclick="document.location='view.jsp?no=${vo.no}&pt=${pt }&page=${pageObject.page }&perPageNum=${pageObject.perPageNum }'" class="data">
				<td>${vo.no}</td>
				<td>${vo.title}</td>
				<td>${vo.startDate} ~ ${vo.endDate}</td>
				<td>${vo.writeDate}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" style="text-align: center;">
				<pageNav:pageNav listURI="list.jsp" pageObject="${pageObject }" query="&pt=${pt }"></pageNav:pageNav>
			</td>
		</tr>
	</c:if>
<%-- 	<% if(loginVO != null && loginVO.getGradeNo() == 9) {%> --%>
<%-- <c:if test="${!empty login && 9 == login.getGradeNo()}"> --%>
		<tr>
			<td colspan="5" style="text-align: center;">
				<a href="writeForm.jsp" class="btn btn-default">글등록</a>
			</td>
		</tr>
<%-- </c:if> --%>
</table>
</div>
</body>
</html>