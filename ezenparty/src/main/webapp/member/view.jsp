<%@page import="com.ezenparty.member.vo.MemberVO"%>
<%@page import="com.ezenparty.member.service.MemberViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 데이터 수집 - 아이디 
String id = request.getParameter("id");

MemberViewService service = new MemberViewService();
MemberVO vo = service.service(id);

// System.out.print("view.jsp - vo : " + vo);
// Controller(JSP) - MemberViewService - MemberDAO
// MemberViewService 클래스 작성 -> 생성 호출
// MemberDAO 클래스에 view(long no) 추가 작성

request.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>

<!-- jQuery 라이브러리 등록 - JS를 쉽게 처리하기 위한 함수가 들어있다. jQuery() 혹은 $() -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">
/* id가 deleteDiv 안에 label 태그를 선택해서 CSS를 적용시켜라*/
#deleteDiv label {
	margin: 0 5px 0 10px;
}
#memberImage {
	width: 300px;
	height: 300px;
}

#changeImageDiv {
	display: none;
}
</style>

<script type="text/javascript">
// body(문서-document)가 다 로딩이 되면 동작이 되도록 선언한 형태
$(function(){
	// deleteDiv id를 찾아서 숨긴다.(hide)
	// deleteDiv가 보였다가 숨겨진다. -> 원래부터 안 보이기 CSS의 visiability 속성을 이용한다.
	$("#deleteDiv").hide();	
});
</script>

</head>
<body>
<div class="container">
	<h1>회원 정보 보기</h1>
	<table class="table">
		<tr>
			<th>사진</th>
			<td><img src="${vo.photo }" alt="" id="memberImage">
				<button type="button" onclick="$('#changeImageDiv').show()" class="btn btn-default">바꾸기</button>
				<div id="changeImageDiv">
					<form action="changePhoto.jsp" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="${vo.id }">
						<input type="hidden" name="oldPhoto" value="${vo.photo }">
						<input type="file" name="photo" required="required">
						<button class="btn btn-default">변경</button>
						<button type="button" onclick="$('#changeImageDiv').hide()" class="btn btn-default">취소</button>
					</form>
				</div>
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${vo.id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${vo.birth }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${vo.tel }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${vo.address }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${vo.email }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${vo.regDate }</td>
		</tr>
		<tr>
			<th>최근 접속일</th>
			<td>${vo.conDate }</td>
		</tr>
		<tr>
			<th>회원 상태</th>
			<td>${vo.status }</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>${vo.gradeName }(${vo.gradeNo })</td>
		</tr>
	</table>
	
<a href="updateForm.jsp?id=${vo.id }" class="btn btn-default">수정</a>
<button onclick="$('#deleteDiv').show();" class="btn btn-default">삭제</button>
<a href="list.jsp?page=${param.page }&perPageNum=${param.perPageNum }" class="btn btn-default">리스트</a>
<div id="deleteDiv">
	<h3>삭제에 필요한 정보 입력</h3>
	<form action="delete.jsp" method="post" class="form-inline">
	<div class="form-group">
		<label for="id">아이디</label>
		<input name="id" id="id" class="form-control">
	</div>
	<div class="form-group">
		<label for="pw">비밀번호</label>
		<input type="password" name="pw" id="pw" class="form-control">
	</div>
	<div class="form-group">
		<label for="tel">전화번호</label>
		<input name="tel" id="tel" class="form-control">
	</div>
		<input type="hidden" name="oldImage" value="${vo.photo }">
		<div style="margin: 10px 0 0 0;">
			<button class="btn btn-default">삭제</button>
			<button type="button" onclick="$('#deleteDiv').hide();" class="btn btn-default">취소</button>
		</div>
	</form>
</div>
</div>
</body>
</html>