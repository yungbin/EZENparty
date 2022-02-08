<%@page import="com.ezenparty.notice.vo.NoticeVO"%>
<%@page import="com.ezenparty.notice.service.NoticeViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);

System.out.println("updateForm.jsp no : " + no);

NoticeViewService service = new NoticeViewService();
NoticeVO vo = service.service(no);

System.out.println("updateForm.jsp vo : " + vo);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
<div class="container">
<h2>글수정</h2>
<form action="update.jsp" method="post" class="form-horizontal">
		<div class="form-group">
			<label for="no" class="control-label col-sm-2">번호</label>
			<div class="col-sm-10">
				<!-- 정규 표현식 - \d : 숫자. [0~9] -->
				<input name="no" id="no" class="form-control" readonly="readonly"
				 value="<%= vo.getNo()%>" style="background: #eee"/>
			</div>
		</div>
		<div class="form-group">
			<label for="title" class="control-label col-sm-2">제목</label>
			<div class="col-sm-10">
				<!-- pattern : 정규표현식 - 입력한 데이터가 정규표현식과 맞는지 검사
						. - 모든문자, {최소 입력 글자 수, 최대 입력 글자 수}
					required : 필수 입력 항목을 지정 -> pattern에서는 데이터가 들어와야 검사하기 때문에 같이 쓰인다. 
					title : 마우스가 올라 갔을 때 버블 창에 나타나는 텍스트. pattern이 틀리면 나타나는 문자로도 사용됌.-->
				<input name="title" id="title" class="form-control" placeholder="제목입력 한글로 100자 이내" maxlength="100" 
				pattern=".{1,100}" required="required" title="제목입력 한글로 100자 이내"
				value="<%= vo.getTitle()%>"/>
			</div>
		</div>
		<div class="form-group">
			<label for="content" class="control-label col-sm-2">내용</label>
			<div class="col-sm-10">
				<textarea rows="7" cols="80" placeholder="공지 내용 입력 2000자 이내" name="content"
				id="content" class="form-control" required="required"><%= vo.getContent()%></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="startDate" class="control-label col-sm-2">시작날짜</label>
			<div class="col-sm-10">
				<!-- 정규 표현식 - \d : 숫자. [0~9] -->
				<input name="startDate" id="startDate" class="form-control" placeholder="yyyy-mm-dd" maxlength="10"
				pattern="\d{4}-\d{2}-\d{2}" title="날짜 형식 : yyyy-mm-dd"
				value="<%= vo.getStartDate()%>"/>
			</div>
		</div>
		<div class="form-group">
			<label for="endDate" class="control-label col-sm-2">종료날짜</label>
			<div class="col-sm-10">
				<input name="endDate" id="endDate" class="form-control" placeholder="yyyy-mm-dd" maxlength="10"
				pattern="\d{4}-\d{2}-\d{2}" title="날짜 형식 : yyyy-mm-dd"
				value="<%= vo.getEndDate()%>"/>
			</div>
		</div>
			<div class="text-center">
			<button class="btn btn-default">수정</button>
			<button type="reset" class="btn btn-default">새로고침</button>
			<button type="button" onclick="history.back()" class="btn btn-default">취소</button>
			<%-- 수정후 돌아갈때 전체글로 이동하도록 작성하기 --%>
			</div>
</form>
</div>
</body>
</html>