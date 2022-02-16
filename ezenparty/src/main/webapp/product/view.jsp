<%@page import="com.ezenparty.member.vo.LoginVO"%>
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

// view service 객체 생성및 호출
ProductViewService service = new ProductViewService();
// ProductVO  세팅
ProductVO vo = service.service(pno);
// 권한처리를 위한 login session 세팅
LoginVO loginVO = (LoginVO)session.getAttribute("login");
// vo 데이터를 EL객체로 만듦.
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
	// spinner의 화살표를 이용하지않고 값을 직접 입력할 경우를 대비한 함수
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
	
	$(".btnDelete").click(function(){
		
		if(confirm("정말 삭제하시겠습니까?")){
			location="delete.jsp?pno=${vo.pno }&oldImage=${vo.image}&oldContent=${vo.content}";
		}else{
			return false;
		}
		
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
						<!-- jquery에서 포맷전의 상품가격을 받기위해 display none으로 잡아서 선언하였다. -->
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
		<!-- 장바구니 개발중.-->
		<form action="/cart/write.jsp" method="post" class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<!-- 수량에 따른 계산 부분 -->
					<div>
						<div style="width:50%;"></div>
						<!-- float을 이용하여 레이아웃을 잡는다. -->
						<div class="panel panel-default" style="width:50%; float: right;">
							<div class="panel-heading">
							<!-- spinner의 label태그 -->
								<label for="spinner" class="control-label"
									style="text-align: center; font-size: 20px; padding: 4px;">수량</label>
								<!-- spinner input 태그 처음 보여지는 기본값을 1로 설정 -->
								<input id="spinner" name="unit" value="1">
							</div>
							<div class="panel-body"><span>총 상품금액 : </span>
							<!-- 장바구니에 상품 가격을 hidden으로 넘긴다. -->
							<input type="hidden" name="price" value="${vo.price }">
							<fmt:formatNumber value="${vo.price }" type="number" var="total" />
							<strong id="totalPrice">${total }</strong></div>
							<!-- 장바구니에 상품명을 hidden으로 넘긴다. -->
							<input type="hidden" name="pname" value="${vo.pname }">
							<!-- 장바구니에 상품이미지를 hidden으로 넘긴다. -->
							<input type="hidden" name="image" value="${vo.image }">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-7"></div>
					<div class="col-sm-1"></div>
					<div class="col-sm-4" id="publicBtn" style="margin: 30px 0; text-align: right;">
						<!-- 개발중 -->
						<button class="btn btn-default btn-lg">장바구니</button>
						<!-- 개발중 -->
						<button class="btn btn-default btn-lg" type="button" onclick="alert('구매완료')">구매</button>
					</div>
				</div>
			</div>
		</form>
		<div>
			<!-- 관리자만 보일수 있도록 조건을 설정. -->
			<c:if test="${!empty login && 9 == login.getGradeNo()}">
				<a href="updateForm.jsp?pno=${vo.pno }"
				class="btn btn-default btn-lg">글 수정</a>
				<a class="btn btn-default btn-lg btnDelete">글 삭제</a>
			</c:if>
			<!-- 리스트는 누구나 볼 수 있어야한다. -->
			<a href="list.jsp?page=${param.page }&perPageNum=${param.perPageNum }
			&kind=${param.kind}&categories=${param.categories}"class="btn btn-default btn-lg">리스트</a>
		</div>
		<hr>
		<!-- 상품 설명 -->
		<div class="row productInfo">
			<div class="contentDiv">
				<img src="${vo.content }">
			</div>
		</div>
	</div>
</body>
</html>