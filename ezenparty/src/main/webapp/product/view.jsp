<%@page import="com.ezenparty.notice.vo.NoticeVO"%>
<%@page import="com.ezenparty.notice.service.NoticeViewService"%>
<%@page import="com.ezenparty.product.vo.ProductVO"%>
<%@page import="com.ezenparty.product.service.ProductViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
.strHead{
	width: 300px;
	display: table-cell;
	font-size: 30px;
	color: #555;
}
.spanDataRow{
	width: 300px;
	display: table-cell;
	font-size: 26px;
	color: #666;
}
/* 기본 테두리 제거 */
.list-group-item{
	border: none;
}
#publicBtn{
	text-align: right;
}
#viewImage{
	width: 450px;
	height: auto;
}
#pnameFont{
	font-style: italic;
	font-size: 32px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-5">
				<img id="viewImage" alt="none" src="${vo.image }">
			</div>
			<div class="col-sm-6">
				<ul>
					<li class="list-group-item"><b id="pnameFont">${vo.pname }</b><hr></li>
					<li class="list-group-item"><strong class="strHead">상품코드</strong>
					<span class="spanDataRow">${vo.pno }</span></li>
					<li class="list-group-item"><strong class="strHead">가격</strong>
					<span class="spanDataRow">${vo.price }</span></li>
					<li class="list-group-item"><strong class="strHead">색상</strong>
					<span class="spanDataRow">${vo.color }</span></li>
					<li class="list-group-item"><strong class="strHead">등록일</strong>
					<span class="spanDataRow">${vo.writeDate }</span></li>
					<li class="list-group-item"><strong class="strHead">종류</strong>
					<span class="spanDataRow">${vo.pkind }</span></li>
				</ul>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-8" id="adminBtn">
				<a href="updateForm.jsp?pno=${vo.pno }" class="btn btn-default btn-lg">글 수정</a>
				<a href="delete.jsp?pno=${vo.pno }&oldImage=${vo.image}&oldContent=${vo.content}" class="btn btn-default btn-lg">글 삭제</a>
			</div>
			<div class="col-sm-4" id="publicBtn">
				<button class="btn btn-default btn-lg">장바구니</button>
				<button class="btn btn-default btn-lg">구매</button>
				<a href="list.jsp?page=${param.page }&perPageNum=${param.perPageNum }"
				 class="btn btn-default btn-lg">리스트</a>
			</div>
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