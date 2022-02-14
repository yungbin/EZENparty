<%@page import="com.ezenparty.product.vo.ProductVO"%>
<%@page import="com.ezenparty.product.service.ProductViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String strPno = request.getParameter("pno");
long pno = Long.parseLong(strPno);
// pno 확인용
System.out.println("[updateForm] pno >> " + pno);

ProductViewService service = new ProductViewService();
ProductVO vo = service.service(pno);
// vo 확인용
System.out.println("[updateForm] vo >> " + vo);

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
						maxlength="100" id="pname" value="${vo.pname }" /> <input
						type="hidden" name="pno" value="${vo.pno }" /> <input
						type="hidden" name="oldContent" value="${vo.content }" /> <input
						type="hidden" name="oldImage" value="${vo.image }" />
				</div>
			</div>
			<div class="form-group">
				<label for="price" class="control-label col-sm-2">가격</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" class="form-control" name="price"
						maxlength="100" id="price" value="${vo.price }" />
				</div>
			</div>
			<div class="form-group">
				<div id="categoriesDiv">
					<label for="categories" class="control-label col-sm-2">대분류</label>
					<div class="col-sm-4">
						<select name="categories" id="categories" class="form-control">
							<option value="${vo.categories }" selected="selected">
							<c:choose>
								<c:when test="${vo.categories eq 'balloon' }">풍선</c:when>
								<c:when test="${vo.categories eq 'cos' }">코스프레</c:when>
								<c:otherwise>없음</c:otherwise>
							</c:choose>
							</option>
							<option value="" disabled="disabled">======</option>
							<option value="balloon">풍선</option>
							<option value="cos">코스튬</option>
						</select>
					</div>
				</div>
				<div id="kindDiv">
					<label for="pkind" class="control-label col-sm-2">소분류</label>
					<div class="col-sm-4">
						<select name="pkind" id="pkind" class="form-control">
							<option value="${vo.pkind }" selected="selected">
							<c:choose>
								<c:when test="${vo.pkind eq 'colorB' }">일반풍선</c:when>
								<c:when test="${vo.pkind eq 'numberB' }">숫자풍선</c:when>
								<c:when test="${vo.pkind eq 'charB' }">캐릭터풍선</c:when>
								<c:when test="${vo.pkind eq 'birthB' }">생일풍선</c:when>
								<c:when test="${vo.pkind eq 'halloween' }">할로윈의상</c:when>
								<c:when test="${vo.pkind eq 'birthday' }">생일파티 및 반티의상</c:when>
								<c:otherwise>없음</c:otherwise>
							</c:choose>
							</option>
							<option value="" disabled="disabled">======</option>
							<optgroup label="풍선">
								<option value="colorB">일반풍선</option>
								<option value="numberB">숫자풍선</option>
								<option value="charB">캐릭터풍선</option>
								<option value="birthB">생일풍선</option>
							</optgroup>
							<optgroup label="코스프레">
								<option value="halloween">할로윈의상</option>
								<option value="birthday">생일파티 및 반티의상</option>
							</optgroup>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="unit" class="control-label col-sm-2">수량</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" name="unit" id="unit" class="form-control"
						maxlength="10" value="${vo.unit }" />
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