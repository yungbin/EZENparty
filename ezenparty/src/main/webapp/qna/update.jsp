<%@page import="com.ezenparty.qna.service.QnaUpdateService"%>
<%@page import="com.ezenparty.qna.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 여기는 자바입니다.
// 넘어오는 데이터 받기
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);
String title = request.getParameter("title");
String content = request.getParameter("content");

// Controller -> Service -> DAO : QnaVO 객체를 만들어서 전달한다.
QnaVO vo = new QnaVO();
vo.setNo(no);
vo.setTitle(title);
vo.setContent(content);

System.out.println("질문답변 글수정 - " + vo);

// QnaUpdateService -> QnaDAO.update()
QnaUpdateService service = new QnaUpdateService();
service.service(vo);

// 게시판 리스트로 자동 이동시킨다.
response.sendRedirect("view.jsp?no=" + no + "&inc=0");
%>

