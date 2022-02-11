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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
// taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
// 숫자형식을 가격 형식으로 바꾸기위해 jstl 라이브러리를 선언하였다.

// 페이지 정보 받기
PageObject pageObject = PageObject.getInstance(request);
// 한 페이지에 보여질 갯수를 기본 10 -> 12로 늘렸습니다.
pageObject.setPerPageNum(12);

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
<style type="text/css">
.thumbnail{
	border: none;
}
.thumbnail:hover{
	border: 1px solid #bbb;
	cursor: pointer;
}
.pageNavDiv{
	display: flex;
}
.pageNav{
	margin: auto;
}
</style>
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
							<!--fmt 태그를 이용하여 숫자형식의 데이터를 가격표시형식으로 표시해준다. 포맷한 결과를 var변수에 넣었다.-->
							<fmt:formatNumber value="${vo.price }" type="number"
								var="numberType" />
							<!-- 포맷한 변수를 선언하면 정상적으로 표시가 된다. -->
							<b>${numberType} 원</b>
						</div>
					</div>
			</div>
			<!-- vs의 나머지가 0이면서 list.size()랑 같지 않을때 들어간다. -->
			<c:if test="${vs.count % 4 == 0 && vs.count != list.size()}">
			<!-- 한 줄을 마감하고 새로운 줄을 시작한다. -->
	 ${"</div>" }
	 <!-- 새로운 row 생성 -->
	 <hr>
	 ${"<div class='row'>" }
</c:if>
		</c:forEach>
	</div>
<div class="pageNavDiv">
	<div class="pageNav">
		<pageNav:pageNav listURI="list.jsp" pageObject="${pageObject }"/>
	</div>
</div>
<c:if test="${!empty login }">
	<a href="writeForm.jsp" class="btn btn-default">등록</a>
</c:if>
	<a href="list.jsp" class="btn btn-default">새로고침</a>
</div>
</body>
</html>