<%@page import="com.ezenparty.member.vo.LoginVO"%>
<%@page import="com.webjjang.util.PageObject"%>
<%@page import="com.ezenparty.product.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ezenparty.product.service.ProductListService"%>
<%@page import="oracle.sql.LobPlsqlUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<%
// 페이지 정보 받기
PageObject pageObject = PageObject.getInstance(request);

// 서비스 객체 생성후 리스트 세팅
ProductListService service = new ProductListService();
List<ProductVO> list = service.service(pageObject);

System.out.println("list.jsp [list] >> " + list);

// 저장객체에 list 와 pageObject 세팅
request.setAttribute("list", list);
request.setAttribute("pageObject", pageObject);

// 세션에서 로그인 정보를 가져와 loginVO에 담아둔다. ( 글쓰기 권한 )
LoginVO loginVO = (LoginVO)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
<script type="text/javascript">
$(function(){
	
	$(".dataRow").click(function(){
		var pno = $(this).find(".pno").text();

		location = "view.jsp?pno=" + pno + "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
	});
});
</script>
</head>
<body>
<div class="container">
<h2>이미지 리스트</h2>
	<div class="row">
		<c:forEach items="${list }" var="vo" varStatus="vs">
			<div class="col-md-3">
				<div class="thumbnail dataRow">
				<!-- 상품 번호를 화면에 표시하지 않은상태로 js에 값을 넘기기 위해 display:none 스타일을 적용하였다 -->
				<div class="pno" style="display:none;">${vo.pno }</div>
					<img src="${vo.image }" alt="Photo List"
						style="width: 100%; height: 300px;">
					<div class="caption">
						<p style="font-size: 20px;">${vo.pname }</p>
						<b>${vo.price }</b>
					</div>
				</div>
			</div>
			<!-- vs.count를 4로 나누어서 나머지가 0이고, 현재 찍으려는 이미지 갯수와 리스트의 갯수가 같지 않으면 if문 접속 -->
			<c:if test="${vs.count % 4 == 0 && vs.count != list.size()}">
			<!-- 한 줄을 마감하고 새로운 줄을 시작한다. -->
	 ${"</div>" }
	 ${"<div class='row'>" }
</c:if>
		</c:forEach>
	</div>
<div>
	<pageNav:pageNav listURI="list.jsp" pageObject="${pageObject }" />
</div>
<!-- 로그인폼 미완성 -->
<%-- <c:if test="${!empty login }"> --%>
	<a href="writeForm.jsp" class="btn btn-default">등록</a>
<%-- </c:if> --%>
	<a href="list.jsp" class="btn btn-default">새로고침</a>
</div>
</body>
</html>