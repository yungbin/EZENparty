<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script type="text/javascript" src="/js/formUtil.js"></script>
<script type="text/javascript">
$(function(){
	// 생년월일 10자리가 차면 연락 처리로 넘어간다.
	$("#birth").keyup(function(){ autoNext("#birth", "#tel", 10);})
	// 연락처 13자리가 차면 연락 처리로 넘어간다.
	$("#tel").keyup(function(){ autoNext("#tel", "#email", 13);})
	
	$("#pwMsg").css("color","red");
	$("#pw2Msg").css("color","red");
	
	// 비밀번호 길이가 4자 이상인지 확인해서 메시지에 작성하는 이벤트
	$("#pw").keyup(function(){
		// 입력한 데이터의 길이
		var len = $(this).val().length;
		if(len < 4) {
			$("#pwMsg").text("4자 이상을 입력하셔야 합니다.");
			$("#pwMsg").css("color","red");
		} else{
			$("#pwMsg").text("적당한 길이의 비밀번호 입니다.");
			$("#pwMsg").css("color","green");
		}
	})
	// 비밀번호확인 길이가 4자 이상인지 확인해서 이상이면 비밀번호와 비밀번호 확인이 같은지를 보여주는 메시지에 작성하는 이벤트
	$("#pw2").keyup(function(){
		// 입력한 데이터의 길이
		var len = $(this).val().length;
		if(len < 4) {
			$("#pw2Msg").text("4자 이상을 입력하셔야 합니다.");
			$("#pw2Msg").css("color","red");
		} else{
			if($(this).val() == $("#pw").val()){
				$("#pw2Msg").text("적당한 비밀번호 확인을 입력하셨습니다.");
				$("#pw2Msg").css("color","green");
			} else{
				$("#pw2Msg").text("비밀번호와 비밀번호 확인이 같지 않습니다.");
				$("#pw2Msg").css("color","red");
			}// if end
		}// if end
	})// $("#pw2").keyup() 끝
	
	// 데이터가 넘어갈때 데이터 유효성 검사 이벤트.
	$("#writeForm").submit(function(){
		//alert("데이터 넘어가유~~~~");
// 		var birth = $("#birth").val();
// 		// reg_date : /js/formUtil 안에 선언
// 		if(!reg_date.test(birth)) {
// 			else alert("패턴에 맞지 않는다! \nyyyy-mm-dd 형식의 날짜 데이터를 입력하셔야 합니다.");
// 			$("#birth").focus();
// 			return false;
// 		}

		// 이메일
		if(!regTest(reg_date, "#birth", "nyyyy-mm-dd 형식의 날짜 데이터")) return false;
		if(!regTest(reg_tel, "#tel", "잘 써보세요. ex) 000-0000-0000")) return false;
		if(!regTest(reg_email, "#email", "test@naver.com 형식의 이메일")) return false;
		
		//submit 무시
		//return false;
	});
});
</script>
</head>
<body>
<h2>회원 가입 폼</h2>
<!-- 사용자에게 데이터를 입력하도록 한다. : form, input, select, textarea tag -->
<!-- 입력 데이터 : 아이디, 비밀번호, 비밀번호확인, 이름, 성별, 생년월일, 연락처, 이메일, 사진 -->
<!-- action : 데이터를 받을 URL, method : get - URL 뒤에 데이터, post - 데이터를 따로 보이지 않게 데이터 -->
<form action="write.jsp" method="post" enctype="multipart/form-data" id="writeForm">
	<table>
		<tr>
			<th>아이디</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td><input type="text" name="id" maxlength="20"/></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력
			 type="password" : 입력한 문자를 대체문자로 보여준다. 동그라미로 보여준다.-->
			<td>
				<input type="password" name="pw" maxlength="20"
					id="pw"/>
				<span id="pwMsg">4자 이상을 입력하셔야 합니다.</span>
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td>
				<input type="password" name="pw2" maxlength="20"
					id="pw2"/>
				<span id="pw2Msg">4자 이상을 입력하셔야 합니다.</span>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td><input type="text" name="name" maxlength="10"/></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력
			 xxxx-xx-xx placeholder : 입력 형식 예를 데이터가 입력이 안 되었을 때 백그라운드로 표시-->
			<td><input type="text" name="birth" maxlength="10" placeholder="예)1900-01-01"
				id="birth"/></td>
		</tr>
		<tr>
			<th>연락처</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td><input type="text" name="tel" maxlength="13" placeholder="예)010-1111-2222"
				id="tel"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td><input type="text" name="email" maxlength="50" placeholder="예)test@naver.com"
				id="email"/></td>
		</tr>
		<tr>
			<th>사진</th>
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<td><input type="file" name="photo" maxlength="10"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- button이 form tag 안에 있으면 데이터를 전달하는 동작을 하게 된다. -->
				<button type="submit">회원가입</button>
				<button type="reset">다시입력</button>
				<button type="button" onclick="history.back()">취소</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>