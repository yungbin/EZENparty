<%@ page import="com.webjjang.util.PageObject"%>
<%@ page import="com.ezenparty.member.vo.LoginVO"%>
<%@ page import="com.ezenparty.notice.vo.NoticeVO"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ezenparty.notice.service.NoticeListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

<%
// 여기가 자바의 처리 부분입니다.
// DB 클래스 확인
Class.forName("com.ezenparty.util.db.DB");

// 페이지 정보받기(수집)
PageObject pageObject = PageObject.getInstance(request);

// 데이터 수집
// now - 현재 공지, old - 지난 공지, res - 예약 공지, all - 전체 공지 -> pt(point)
// pt = pageObject.period
//notice가 기본적으로 보이게 한다
String pt = request.getParameter("pt");
if(pt == null) pt = "notice"; // 기본 값 세팅 : 현재 공지

pageObject.setPeriod(pt);

// DB에서 데이터 가져오기 - 서비스 객체 생성, 호출하여 리스트 셋팅
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

// 저장객체에 pageObject 셋팅
request.setAttribute("pageObject", pageObject);
%>

<!DOCTYPE html>
<html>
<!-- 페이지 정보 -->
<head>
<meta charset="UTF-8">
<title>공지사항&#38;이벤트</title>
<style type="text/css">
th {
	background: black;
	color: white;
}

.data:hover {
	cursor: pointer; /* 커서 가져다대면 색상포인트 생김 */
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
		<h2>공지사항&#38;이벤트</h2>
		<a href="list.jsp?pt=notice" class="btn btn-default" style='${(pt == "notice")?style:""}'>공지사항</a>
		<a href="list.jsp?pt=event" class="btn btn-default" style='${(pt == "event")?style:""}'>이벤트</a>
		<!-- 관리자만 볼 수 있는 카테고리 -->
		<c:if test="${!empty login && 9 == login.getGradeNo()}">
		<a href="list.jsp?pt=resEvent" class="btn btn-default" style='${(pt == "resEvent")?style:""}'>예약 이벤트</a>
		</c:if>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<%-- notice가 아닌 event만 기간 뜨도록 --%>
				<% if(!(pt.equals("notice"))) { %>
				<th>기간</th>
				<% } %>
				<th>등록일</th>
				<th>작성자</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach items="${list}" var="vo">
					<tr
						onclick="document.location='view.jsp?no=${vo.no}&pt=${pt }&page=${pageObject.page }&perPageNum=${pageObject.perPageNum }'"
						class="data">
						<td>${vo.no}</td>
						<td>[${vo.kind}]${vo.title}</td>
						<% if(!(pt.equals("notice"))) { %>
						<td>${vo.startDate}~ ${vo.endDate}</td>
						<% } %>
						<td>${vo.writeDate}</td>
						<td>${vo.writer}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" style="text-align: center;"><pageNav:pageNav
							listURI="list.jsp" pageObject="${pageObject }" query="&pt=${pt }"></pageNav:pageNav>
					</td>
				</tr>
			</c:if>
			<c:if test="${!empty login && 9 == login.getGradeNo()}">
			<tr>
				<td colspan="5" style="text-align: center;"><a
					href="writeForm.jsp" class="btn btn-default">글등록</a></td>
			</tr>
			</c:if>
		</table>
	</div>
</body>
</html>