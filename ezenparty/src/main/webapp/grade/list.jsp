<%@page import="com.ezenparty.grade.service.GradeListService"%>
<%@page import="com.ezenparty.grade.vo.GradeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 데이터 수집 - 없다.
// DB에서 데이터 가져오기
GradeListService service = new GradeListService();
List<GradeVO> list = service.service();

System.out.println("list.jsp - list : " + list);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급 리스트</title>
<style type="text/css">
th, td{
	border: 1px solid #444;
	padding: 5px;
}
</style>
</head>
<body>
<div class="container">
<h2>등급 리스트</h2>
<div>
<form action="write.jsp" method="post" class="form-group">
	<input name="gradeNo" placeholder="번호" maxlength="2" pattern="\d{1,2}" required="required"
	 size="3">
	 <input name="gradeName" placeholder="등급명" pattern="[가-힣]{1,6}" required="required"
	 size="7">
	 <button>추가</button>
</form>
</div>
</div>
<table class="container">
<tr>
	<th>번호</th>
	<th>이름</th>
	<th>수정/삭제</th>
</tr>
<% for(GradeVO vo : list){ %>
<form action="update.jsp" method="post" class="form-control">
<tr>
	<td><input value="<%= vo.getGradeNo() %>" name="gradeNo" class="form-control"></td>
	<td><input value="<%= vo.getGradeName() %>" name="gradeName" class="form-control"></td>
	<td>
		<button>수정</button>
		<a href="delete.jsp?gradeNo=<%= vo.getGradeNo()%>"><button type="button">삭제</button></a>
	</td>
</tr>
</form>
<% } %>
</table>
</body>
</html>