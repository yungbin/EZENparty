<%@page import="com.ezenparty.qna.vo.QnaVO"%>
<%@page import="com.ezenparty.qna.service.QnaViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 자바 부분입니다.
// 데이터 받기 - 번호, 관련글번호, 순서번호, 들여쓰기번호, 제목
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);

// DB에서 QnaVO를 가져온다.
QnaViewService service = new QnaViewService();
QnaVO vo = service.service(no); 

// EL이나 JSTL에서 데이터를 사용하기 위해서 기본 저장 객체에 저장해 둔다.
request.setAttribute("vo", vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 글수정</title>
</head>
<body>
	<div class="container">
		<h2>문의 글수정</h2>
		<form action="answer.jsp" method="post" class="form-horizontal">
		<input type="hidden" name="no" value="${vo.no }">
		<input type="hidden" name="refNo" value="${vo.refNo }">
		<input type="hidden" name="ordNo" value="${vo.ordNo }">
		<input type="hidden" name="levNo" value="${vo.levNo }">
			<div class="form-group">
				<label for="title" class="control-label col-sm-2">제목</label>
				<!--input 데이터 입력, type : 입력형태, name : 전달 이름, maxlength : 최대 입력-->
				<div class="col-sm-10">
					<input type="text" name="title" id="title" class="form-control"
						maxlength="100" value="[답변]${vo.title }"/>
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="control-label col-sm-2">내용</label>
				<div class="col-sm-10">
					<textarea rows="7" cols="80" name="content" id="content"
						class="form-control"></textarea>
				</div>
			</div>
			<!-- button이 form tag 안에 있으면 데이터를 전달하는 동작을 하게 된다. -->
			<div class="text-center">
				<button type="submit" class="btn btn-default">답변</button>
				<button type="reset" class="btn btn-default">다시입력</button>
				<button type="button" onclick="history.back()"
					class="btn btn-default">취소</button>
			</div>
		</form>
	</div>
</body>
</html>