<%@page import="com.ezenparty.notice.service.NoticeUpdateService"%>
<%@page import="com.ezenparty.notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 한글 처리
request.setCharacterEncoding("utf-8");
 
// 데이터 수집 - 번호, 제목, 내용, 시작일, 종료일
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);
String title = request.getParameter("title");
String content = request.getParameter("content");
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
 
NoticeVO vo = new NoticeVO();
vo.setNo(no);
vo.setTitle(title);
vo.setContent(content);
vo.setStartDate(startDate);
vo.setEndDate(endDate);

System.out.println("update.jsp - vo : " + vo);

NoticeUpdateService service = new NoticeUpdateService();
service.service(vo);

response.sendRedirect("view.jsp?no=" + no);
%>