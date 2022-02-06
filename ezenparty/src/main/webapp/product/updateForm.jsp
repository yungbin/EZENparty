<%@page import="com.ezenparty.product.vo.ProductVO"%>
<%@page import="com.ezenparty.product.service.ProductViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String strPno = request.getParameter("pno");
long pno = Long.parseLong(strPno);

System.out.println("[updateForm] pno >> " + pno);

ProductViewService service = new ProductViewService();
ProductVO vo = service.service(pno, 0);

request.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
<div class="container">
<h2 class="text-center">상품 수정</h2>
		<form action="update.jsp" method="post" class="form-horizontal"
			id="updateForm" enctype="multipart/form-data">
			<div class="form-group">
				<label for="pname" class="control-label col-sm-2">상품명</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" class="form-control" name="pname"
						maxlength="100" id="pname" value="${vo.pname }"/>
					<input type="hidden" name="pno" value="${vo.pno }"/>
					<input type="hidden" name="oldContent" value="${vo.content }"/>
					<input type="hidden" name="oldImage" value="${vo.image }"/>
				</div>
			</div>
			<div class="form-group">
				<label for="price" class="control-label col-sm-2">가격</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" class="form-control" name="price"
						maxlength="100" id="price" value="${vo.price }"/>
				</div>
			</div>
			<div class="form-group">
				<label for="color" class="control-label col-sm-2">색상</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" name="color" id="color" class="form-control"
						maxlength="10" value="${vo.color }"/>
				</div>
			</div>
			<div class="form-group">
				<label for="unit" class="control-label col-sm-2">수량</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" name="unit" id="unit" class="form-control"
						maxlength="10" value="${vo.unit }"/>
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="control-label col-sm-2">내용 이미지</label>
				<div class="col-sm-10">
					<input name="content" type="file">
				</div>
			</div>
			<div class="form-group">
				<label for="image" class="control-label col-sm-2">이미지 파일</label>
				<div class="col-sm-10">
					<input name="image" type="file">
				</div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-default">수정</button>
				<button type="reset" class="btn btn-default">다시입력</button>
				<button type="button" onclick="history.back()"
					class="btn btn-default">취소</button>
			</div>
		</form>
	</div>
</body>
</html>