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
//페이지 정보 받기
PageObject pageObject = PageObject.getInstance(request);

// 서비스 받기
ProductListService service = new ProductListService();
List<ProductVO> list = service.service(pageObject);

System.out.println("list.jsp [list] >> " + list);

// 저장객체에 list 와 pageObject 세팅
request.setAttribute("list", list);
request.setAttribute("pageObject", pageObject);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<body>
<div class="container">
<h2>이미지 리스트</h2>
	<div class="row">
		<c:forEach items="${list }" var="vo" varStatus="vs">
			<div class="col-md-3">
				<div class="thumbnail dataRow"
					onclick="location='view.jsp?no=${vo.pno }'">
					<img src="${vo.image }" alt="Photo List"
						style="width: 100%; height: 300px;">
					<div class="caption">
						<p>${vo.pname }</p>
						${vo.price }
					</div>
				</div>
			</div>
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
<c:if test="${!empty login }">
	<a href="writeForm.jsp" class="btn btn-default">등록</a>
</c:if>
	<a href="list.jsp" class="btn btn-default">새로고침</a>
</div>
</body>
</html>