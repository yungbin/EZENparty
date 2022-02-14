<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<div class="container">
		<h2 class="text-center">상품 등록</h2>
		<form action="write.jsp" method="post" class="form-horizontal"
			id="writeForm" enctype="multipart/form-data">
			<div class="form-group">
				<label for="pname" class="control-label col-sm-2">상품명</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" class="form-control" name="pname"
						maxlength="100" id="pname" />
				</div>
			</div>
			<div class="form-group">
				<label for="price" class="control-label col-sm-2">가격</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" class="form-control" name="price"
						maxlength="100" id="price" />
				</div>
			</div>
			<div class="form-group">
				<label for="unit" class="control-label col-sm-2">수량</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" name="unit" id="unit" class="form-control"
						maxlength="10" />
				</div>
			</div>
			<div class="form-group">
				<div id="categoriesDiv">
					<label for="categories" class="control-label col-sm-2">대분류</label>
					<div class="col-sm-4">
						<select name="categories" id="categories" class="form-control">
							<option selected="selected" value="balloon">풍선</option>
							<option value="cos">코스튬</option>
						</select>
					</div>
				</div>
				<div id="kindDiv">
					<label for="pkind" class="control-label col-sm-2">소분류</label>
					<div class="col-sm-4">
						<select name="pkind" id="pkind" class="form-control">
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
				<button type="submit" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">다시입력</button>
				<button type="button" onclick="history.back()"
					class="btn btn-default">취소</button>
			</div>
		</form>
	</div>
</body>
</html>