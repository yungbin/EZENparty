<%@page import="com.ezenparty.notice.vo.NoticeVO"%>
<%@page import="com.ezenparty.notice.service.NoticeViewService"%>
<%@page import="com.ezenparty.product.vo.ProductVO"%>
<%@page import="com.ezenparty.product.service.ProductViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
// 상품 번호(pno)를 받아서 세팅한다.
String strPno = request.getParameter("pno");
long pno = Long.parseLong(strPno);

ProductViewService service = new ProductViewService();
ProductVO vo = service.service(pno);

request.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 보기</title>
<!-- jquery의 spinner 기능을 쓰기위해 jquery-ui를 CDN 방식으로 선언하였다.-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
	// min (시작 숫자 및 최소 숫자) , max (최대 숫자), step (화살표를 누를때 얼마만큼 올라가거나 내려갈건지)
	$(function() {
		$("#spinner").spinner({
			min : 0,
			max : 100,
			step : 1
		});
	});
</script>
<style type="text/css">
.strHead {
	width: 300px;
	display: table-cell;
	font-size: 24px;
	color: #555;
}

.spanDataRow {
	width: 300px;
	display: table-cell;
	font-size: 20px;
	color: #666;
}
/* 기본 테두리 제거 */
.list-group-item {
	border: none;
}

#publicBtn {
	text-align: right;
}

#viewImage {
	width: 450px;
	height: auto;
}

#pnameFont {
	font-style: italic;
	font-size: 32px;
}
</style>
</head>
<body style="background: #eee;">
	<div class="container">
		<div class="row">
			<div class="col-sm-5">
				<img id="viewImage" alt="none" src="${vo.image }">
			</div>
			<div class="col-sm-6">
				<ul>
					<li class="list-group-item"><b id="pnameFont">${vo.pname }</b>
					<hr></li>
					<li class="list-group-item"><strong class="strHead">상품코드</strong>
						<span class="spanDataRow">${vo.pno }</span></li>
					<li class="list-group-item"><strong class="strHead">가격</strong>
						<!-- fmt 태그를 이용하여 price를 가격표시형식으로 바꾼뒤 포맷한 값을 var변수에 저장한다. -->
						<fmt:formatNumber value="${vo.price }" type="number" var="numberType" />
						<!-- 포맷한 변수를 출력한다. 정상적으로 표시된다. -->
						<span class="spanDataRow">${numberType}</span></li>
					<li class="list-group-item"><strong class="strHead">색상</strong>
						<span class="spanDataRow">${vo.color }</span></li>
					<li class="list-group-item"><strong class="strHead">등록일</strong>
						<!-- fmt태그를 이용하여 db의 날짜형식 데이터를 var변수에 저장한다. --> 
						<!-- String 데이터를 Date 타입으로 변경후 --
						<fmt:parseDate value="${vo.writeDate}" var="toDate"
							pattern="yyyy-MM-dd" scope="page" /> <span class="spanDataRow">
							<fmt:formatDate value="${toDate}" pattern="yyyy년 MM월 dd일" />
					</span></li>
					<li class="list-group-item"><strong class="strHead">종류</strong>
						<span class="spanDataRow">
						<!-- c:choose (=switch문), c:when (=case), c:otherwise (=default)-->
						<c:choose>
							<c:when test="${vo.pkind eq 'colorB' }">일반풍선</c:when>
							<c:when test="${vo.pkind eq 'numberB' }">숫자풍선</c:when>
							<c:when test="${vo.pkind eq 'charB' }">캐릭터풍선</c:when>
							<c:when test="${vo.pkind eq 'birthB' }">생일풍선</c:when>
							<c:when test="${vo.pkind eq 'halloween' }">할로윈의상</c:when>
							<c:when test="${vo.pkind eq 'birthday' }">생일파티의상</c:when>
							<c:otherwise>없음</c:otherwise>
						</c:choose>
					</span></li>
				</ul>
			</div>
		</div>
		<hr>
		<form action="/cart/list.jsp" method="post" class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<!-- input 태그에 id를 spinner로 만들어주면 수량에 관한 UI(spinner)가 출력된다. -->
					<div class="col-sm-7"></div>
					<label for="spinner" class="control-label col-sm-1" style="text-align: center;  font-size: 20px; padding: 4px;">수량</label> 
					<div class="col-sm-4">
						<input id="spinner" name="unit">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-7"></div>
					<div class="col-sm-4" id="publicBtn" style="margin: 30px 0; text-align: center;">
						<button class="btn btn-default btn-lg">장바구니</button>
						<button class="btn btn-default btn-lg">구매</button>
					</div>
					<div class="col-sm-1"></div>
				</div>
			</div>
		</form>
		<div>
			<a href="updateForm.jsp?pno=${vo.pno }"
			class="btn btn-default btn-lg">글 수정</a>
			<a href="delete.jsp?pno=${vo.pno }&oldImage=${vo.image}&oldContent=${vo.content}"
			class="btn btn-default btn-lg">글 삭제</a> 
			<a href="list.jsp?page=${param.page }&perPageNum=${param.perPageNum }"
			class="btn btn-default btn-lg">리스트</a>
		</div>
		<hr>
		<div class="row productInfo">
			<div class="contentDiv">
				<img src="${vo.content }">
			</div>
		</div>
	</div>
</body>
</html>