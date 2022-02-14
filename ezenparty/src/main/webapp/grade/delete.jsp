<%@page import="com.ezenparty.grade.service.GradeDeleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 데이터 수집
String strGradeNo = request.getParameter("gradeNo");
int gradeNo = Integer.parseInt(strGradeNo);

System.out.println("delete.jsp - gradeNo : " + gradeNo);

// DB에서 데이터 삭제
GradeDeleteService service = new GradeDeleteService();
int result = service.service(gradeNo);

// 자동으로 리스트로 이동시킨다.
response.sendRedirect("list.jsp");
%>
