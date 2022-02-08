<%@page import="com.ezenparty.member.service.LoginService"%>
<%@page import="com.ezenparty.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 데이터 수집 - 아이디, 비밀번호
String id = request.getParameter("id");
String pw = request.getParameter("pw");

LoginVO inVO = new LoginVO();
inVO.setId(id);
inVO.setPw(pw);

// 데이터 확인
System.out.println("login.jsp - inVO : " + inVO);

// DB에서 로그인 정보를 가져온다. 아이디와 비밀번호에 맞는 데이터
LoginService service = new LoginService();
LoginVO vo = service.service(inVO);
if(vo != null){
	// 로그인 처리를 한다. -> session에 저장해 둔다. Object로 저장이된다.
	session.setAttribute("login", vo);
	System.out.println("login.jsp - 로그인 처리가 되었습니다.");
	// main이 없어서 공지 사항으로 보내자. (자동)
	response.sendRedirect("/member/list.jsp");
} else {
	// 정보가 틀렸다. -> 확인 페이지로 이동
	System.out.println("login.jsp - 아이디나 비밀번호를 확인해 주세요");
	response.sendRedirect("loginForm.jsp");
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>