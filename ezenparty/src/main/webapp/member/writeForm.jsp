<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style type="text/css">
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
}

.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}
</style>
<script type="text/javascript" src="/js/formUtil.js"></script>
<script type="text/javascript">
$(function(){
	
	// 생년월일 10자리가 차면 연락 처리로 넘어간다.
	$("#birth").keyup(function(){ autoNext("#birth", "#tel", 10);})
	// 연락처 13자리가 차면 연락 처리로 넘어간다.
	$("#tel").keyup(function(){ autoNext("#tel", "#address", 13);})
	
	$("#pwMsg").css("color","red");
	$("#pw2Msg").css("color","red");
	
	// 비밀번호 길이가 8자 이상인지 확인해서 메시지에 작성하는 이벤트
	$("#pw").keyup(function(){
		// 입력한 데이터의 길이
		var len = $(this).val().length;
		if(len < 8) {
			$("#pwMsg").text("8자 이상을 입력하셔야 합니다.");
			$("#pwMsg").css("color","red");
		} else{
			$("#pwMsg").text("적당한 길이의 비밀번호 입니다.");
			$("#pwMsg").css("color","green");
		}
	})
	// 비밀번호확인 길이가 8자 이상인지 확인해서 이상이면 비밀번호와 비밀번호 확인이 같은지를 보여주는 메시지에 작성하는 이벤트
	$("#pw2").keyup(function(){
		// 입력한 데이터의 길이
		var len = $(this).val().length;
		if(len < 8) {
			$("#pw2Msg").text("8자 이상을 입력하셔야 합니다.");
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
<div class="container">
<h2 class="text-center">회원 가입 폼</h2>
<!-- 사용자에게 데이터를 입력하도록 한다. : form, input, select, textarea tag -->
<!-- 입력 데이터 : 아이디, 비밀번호, 비밀번호확인, 이름, 성별, 생년월일, 연락처, 이메일, 사진 -->
<!-- action : 데이터를 받을 URL, method : get - URL 뒤에 데이터, post - 데이터를 따로 보이지 않게 데이터 -->
<form action="write.jsp" method="post" class="joinForm" enctype="multipart/form-data" id="writeForm">
		<div class="textForm">
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<input type="text" name="id" maxlength="20" id="id" class="form-control"  placeholder="아이디"/>
			<span>예)abc156</span>
		</div>
		<div class="textForm">
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<input type="password" name="pw" maxlength="20" id="pw" class="form-control" placeholder="비밀번호"/>
				<span id="pwMsg">8자 이상을 입력하셔야 합니다.</span>
		</div>
		<div class="textForm">
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<input type="password" name="pw2" maxlength="20" id="pw2" class="form-control" placeholder="비밀번호 확인"/>
				<span id="pw2Msg">8자 이상을 입력하셔야 합니다.</span>
		</div>
		<div class="textForm">
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<input type="text" name="name" maxlength="10" id="name" class="form-control" placeholder="이름"/>
			<span>예)홍길동</span>
			</div>
		<div class="textForm">
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<input type="text" name="birth" maxlength="20" id="birth"  placeholder="생년월일" class="form-control"/>
			<span>예)1900-01-01</span>
		</div>
		<div class="textForm">
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<input type="text" name="tel" maxlength="13" id="tel" placeholder="연락처" class="form-control"/>
			<span>예)010-1111-2222</span>
		</div>
		<div class="textForm">
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<input type="text" name="address" maxlength="250" id="address"  placeholder="주소" class="form-control"/>
			<span>예)경기도 의정부시 12-1(도로명주소)</span>
		</div>
		<div class="textForm">
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<input type="text" name="email" maxlength="50" id="email"  placeholder="이메일" class="form-control"/>
			<span>예)test@naver.com</span>
		</div>
		<div class="textForm">
			<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
			<input type="text" maxlength="50" placeholder="프로필 선택(필수X)" class="form-control" disabled/><input name="photo" type="file"></input>
			</div>
			<div class="textForm">
				<!-- button이 form tag 안에 있으면 데이터를 전달하는 동작을 하게 된다. -->
				<button type="submit" class="btn btn-default">회원가입</button>
				<button type="button" onclick="history.back()" class="btn btn-default">취소</button>
			</div>
</form>
</div>
</body>
</html>