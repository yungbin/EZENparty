<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항&#38;이벤트 등록</title>
<script type="text/javascript" src="/js/formUtil.js"></script>
<script type="text/javascript">
$(function() {
	//폼 데이터 넘기기 전에 데이터 검사
	$("#writeForm").submit(function() {
//	alert("데이터 검사");
	
	//필수 입력 데이터 검사
		if(emptyCheck("#title", "제목")) return false;
		if(emptyCheck("#content", "내용")) return false;
	
	});
});
</script>
</head>
<body>
<div class="container">
<h2>공지사항&#38;이벤트 등록</h2>
<!-- title, content, startDate, endDate 입력 -->
<form action="write.jsp" method="post" class="form-horizontal" id="writeForm">
			<div class="form-group">
			<label for="title" class="control-label col-sm-2">제목</label>
				<div class="col-sm-10">
					<input name="title" id="title" class="form-control"
						placeholder="4자이상 한글로 100자 이내" maxlength="100"
						title="4자이상 한글로 100자 이내" />
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="control-label col-sm-2">내용</label>
				<div class="col-sm-10">
					<textarea rows="7" cols="80" placeholder="공지 내용 입력 2000자 이내"
						name="content" id="content" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="kind" class="control-label col-sm-2">분류</label>
				<div class="col-sm-10">
					<input name="kind" id="kind" class="form-control"
						placeholder="1-공지사항, 2-이벤트" maxlength="2" class="1-공지사항, 2-이벤트" />
				</div>
			</div>
			<div class="form-group">
				<label for="startDate" class="control-label col-sm-2">시작일</label>
				<div class="col-sm-10">
					<!-- 정규 표현식 - \d : 숫자. [0-9] -->
					<input name="startDate" id="startDate" class="form-control"
						placeholder="yyyy-mm-dd" maxlength="10" title="날짜형식 : yyyy-mm-dd" />
				</div>
			</div>
			<div class="form-group">
				<label for="endDate" class="control-label col-sm-2">종료일</label>
				<div class="col-sm-10">
					<input name="endDate" id="endDate" class="form-control"
						placeholder="yyyy-mm-dd" maxlength="10" title="날짜형식 : yyyy-mm-dd" />
				</div>
			</div>
			<div class="text-center">
			<button class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">새로고침</button>
			<button type="button" onclick="history.back()" class="btn btn-default">취소</button>
		</div>
</form>
</div>
</body>