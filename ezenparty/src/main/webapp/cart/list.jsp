<%@page import="com.ezenparty.cart.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ezenparty.cart.service.CartListService"%>
<%@page import="com.webjjang.util.PageObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<%
// 자바 처리 부분
// DB 클래스 확인
Class.forName("com.ezenparty.util.db.DB");

// 페이지 정보 받기
PageObject pageObject = PageObject.getInstance(request);
// 데이터 가져오기 - 생성 호출
// Controller(JSP) - Service - DAO
CartListService service = new CartListService();
List<CartVO> list = service.service(pageObject);

//el 객체나 JSTL을 사용하기 위해서 request 객체에 담기
request.setAttribute("list", list);
request.setAttribute("pageObject", pageObject);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<div class="container">
<h2>장바구니 리스트</h2>
<table class="table">
	<tr>
		<th>상품번호</th>
		<th>상품이미지</th>
		<th>상품명</th>
		<th>수량</th>
		<th>가격</th>
	</tr>
	<!-- 데이터 있는 만큼 반복 처리해서 줄을 만들어 낸다. -->
	<c:forEach items="${list }" var="vo">
		<tr>
			<td>${vo.pno }</td>
			<td><img src="${vo.image }" style="width: 40px; height: 50px;"></td>
			<td>${vo.pname }</td>
			<td>${vo.nuit }</td>
			<td>${vo.price }</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="5">
			<pageNav:pageNav listURI="list.jsp" pageObject="${pageObject }"/>
			</td>
		</tr>
		<tr>
			<td colspan="5">
			<button class="btn btn-default">선택 상품 구매</button>
			<button class="btn btn-default">전체 상품 구매</button>
			</td>
		</tr>
</table>
</div>
</body>
</html>