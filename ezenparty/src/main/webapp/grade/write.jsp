<%@page import="com.ezenparty.grade.service.GradeWriteService"%>
<%@page import="com.ezenparty.grade.vo.GradeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 한글 처리
request.setCharacterEncoding("utf-8");
// 데이터 수집
String strGradeNo = request.getParameter("gradeNo");
int gradeNo = Integer.parseInt(strGradeNo);
String gradeName = request.getParameter("gradeName");
GradeVO vo = new GradeVO();
vo.setGradeNo(gradeNo);
vo.setGradeName(gradeName);

System.out.println("write.jsp - vo : " + vo);

//DB에 저장하기
GradeWriteService service = new GradeWriteService();
int result = service.service(vo);

// 자동으로 리스트로 이동
response.sendRedirect("list.jsp");
%>
