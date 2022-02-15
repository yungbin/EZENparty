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
<script type="text/javascript" src="/js/formUtil.js"></script>
<script>
	// min (시작 숫자 및 최소 숫자) , max (최대 숫자), step (화살표를 누를때 얼마만큼 올라가거나 내려갈건지)
$(function() {
	$("#spinner").spinner({
		min : 1,
		max : 100,
		step : 1
	});
	// 	ui-spinner-up 증가 화살표
	// 	ui-spinner-down 감소 화살표

	// 화살표를 눌러 증가시킬시 이벤트 처리
	$(".ui-spinner-up").on("click", function(){
		// 확인용
		//alert("하하" + Number($("#spinner").val()));
		
		// vo.price 값의 텍스트를 가져와 정수형으로 만들고 저장.
		var price = parseInt($("#priceSpan").text());
		// spinner의 값(수량)을 가져와 정수형으로 만들고 저장
		var up = parseInt($("#spinner").val());
		// total 변수에 상품가격과 현재수량을 곱한값을 저장.
		var total = price * up;
		
		// 확인용
		//alert(price + "*" + up + "=" + total);
		
		// 총 상품금액에 total 값을 콤마를 찍은 상태(addComma)로 포맷시킨뒤 세팅.
		$("#totalPrice").text(addComma(String(total)));
	});
	
	// 화살표를 눌러 감소시킬시 이벤트 처리
	$(".ui-spinner-down").on("click", function(){
		// 확인용
		//alert("하하" + Number($("#spinner").val()));
		
		// vo.price 값의 텍스트를 가져와 정수형으로 만들고 저장.
		var price = parseInt($("#priceSpan").text());
		// spinner의 값(수량)을 가져와 정수형으로 만들고 저장
		var up = parseInt($("#spinner").val());
		// total 변수에 상품가격과 현재수량을 곱한값을 저장.
		var total = price * up;
		
		// 확인용
		//alert(price + "*" + up + "=" + total);
		
		// 총 상품금액에 total 값을 콤마를 찍은 상태(addComma)로 포맷시킨뒤 세팅.
		$("#totalPrice").text(addComma(String(total)));

	});
	
	// spinner에 값이 변동될 경우의 이벤트 처리
	$("#spinner").change(function(){
		
		// vo.price 값의 텍스트를 가져와 정수형으로 만들고 저장.
		var price = parseInt($("#priceSpan").text());
		// spinner의 값(수량)을 가져와 정수형으로 만들고 저장
		var up = parseInt($("#spinner").val());
		// total 변수에 상품가격과 현재수량을 곱한값을 저장.
		var total = price * up;
		
		// 확인용
		//alert(price + "*" + up + "=" + total);
		
		// 총 상품금액에 total 값을 콤마를 찍은 상태(addComma)로 포맷시킨뒤 세팅.
		$("#totalPrice").text(addComma(String(total)));
		
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
.panel-body, .panel-heading{
	text-align: right;
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
						<span class="spanDataRow">${numberType}</span>
						<span id="priceSpan" style="display: none;">${vo.price}</span>
						</li>
					<li class="list-group-item"><strong class="strHead">등록일</strong>
						<!-- fmt태그를 이용하여 db의 날짜형식 데이터를 var변수에 저장한다. --> 
						<!-- String 데이터를 Date 타입으로 변경후 -->
						<fmt:parseDate value="${vo.writeDate}" var="toDate"
							pattern="yyyy-MM-dd" scope="page" /> <span class="spanDataRow">
							<fmt:formatDate value="${toDate}" pattern="yyyy년 MM월 dd일" />
					</span></li>
					<li class="list-group-item"><strong class="strHead">종류</strong>
						<span class="spanDataRow">
						<!-- c:choose (=switch문), c:when (=case), c:otherwise (=default)-->
							<c:choose>
								<c:when test="${vo.categories eq 'balloon' }">풍선</c:when>
								<c:when test="${vo.categories eq 'cos' }">코스프레</c:when>
								<c:otherwise>없음</c:otherwise>
							</c:choose>
							/
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
					<!-- 수량에 따른 계산 부분 -->
					<div>
						<div style="width:50%;"></div>
						<!-- float을 이용하여 레이아웃을 잡는다. -->
						<div class="panel panel-default" style="width:50%; float: right;">
							<div class="panel-heading">
								<label for="spinner" class="control-label"
									style="text-align: center; font-size: 20px; padding: 4px;">수량</label>
								<input id="spinner" name="unit" value="1">
							</div>
							<div class="panel-body"><span>총 상품금액 : </span>
							<fmt:formatNumber value="${vo.price }" type="number" var="total" />
							<strong id="totalPrice">${total }</strong></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-7"></div>
					<div class="col-sm-1"></div>
					<div class="col-sm-4" id="publicBtn" style="margin: 30px 0; text-align: center;">
						<button class="btn btn-default btn-lg">장바구니</button>
						<button class="btn btn-default btn-lg">구매</button>
					</div>
				</div>
			</div>
		</form>
		<div>
			<a href="updateForm.jsp?pno=${vo.pno }"
			class="btn btn-default btn-lg">글 수정</a>
			<a href="delete.jsp?pno=${vo.pno }&oldImage=${vo.image}&oldContent=${vo.content}"
			class="btn btn-default btn-lg">글 삭제</a> 
			<a href="list.jsp?page=${param.page }&perPageNum=${param.perPageNum }
			&kind=${param.kind}&categories=${param.categories}"class="btn btn-default btn-lg">리스트</a>
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