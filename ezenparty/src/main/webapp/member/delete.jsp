<%@page import="java.io.File"%>
<%@page import="com.ezenparty.member.vo.MemberVO"%>
<%@page import="com.ezenparty.member.service.MemberDeleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 한글처리
//request.setCharacterEncoding("utf-8");
// 데이터 수집
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String tel = request.getParameter("tel");
String oldImage = request.getParameter("oldImage");
System.out.println("[delete.jsp] - oldImage : " + oldImage);


// MemberVO에 담기
MemberVO vo = new MemberVO();
vo.setId(id);
vo.setPw(pw);
vo.setTel(tel);

System.out.println("회원 삭제 - vo : " + vo);

 //생성하고 호출 MemberDeleteService
MemberDeleteService service = new MemberDeleteService();
int result = service.service(vo);

File oldFile = new File(request.getServletContext().getRealPath(oldImage));
// // 자동으로 list로 보낸다.
if(result > 0 && oldFile.exists()) {
	oldFile.delete();
	response.sendRedirect("list.jsp");
}
else out.println("삭제 오류 - 입력하신 정보를 확인해주세요.");
%>