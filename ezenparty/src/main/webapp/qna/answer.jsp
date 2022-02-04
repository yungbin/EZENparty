<%@page import="com.ezenparty.qna.service.QnaAnswerService"%>
<%@page import="com.ezenparty.member.vo.LoginVO"%>
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

String strRefNo = request.getParameter("refNo");
long refNo = Long.parseLong(strRefNo);
String strOrdNo = request.getParameter("ordNo");
int ordNo = Integer.parseInt(strOrdNo);
String strLevNo = request.getParameter("levNo");
int levNo = Integer.parseInt(strLevNo);

//아이디는 session에서 꺼낸다.
String id = ((LoginVO)session.getAttribute("login")).getId();

// insert 처리 번호는 시퀀스 사용
// Controller -> Service -> DAO : QnaVO 객체를 만들어서 전달한다.
QnaVO vo = new QnaVO();
vo.setTitle(title);
vo.setContent(content);
vo.setId(id);
vo.setRefNo(refNo); // 1차 정렬을 refNo로 하기때문에 한곳에 모여야 한다.
vo.setOrdNo(ordNo + 1); // 보고 있는 글 아래로 위치하도록 +1 한다. 데이터 중에서 +1한 값과 같거나 큰 데이터는 +1을 해야한다.
vo.setLevNo(levNo + 1); // 보고 있는 글 아래로 위치하도록 +1 한다. 데이터 중에서 +1한 값과 같거나 큰 데이터는 +1을 해야한다.
vo.setParentNo(no); // 보고 있었던 글번호가 부모 글번호가 되기 때문에. 글번호는 시퀀스 사용한다.

System.out.println("질문답변 글수정 - " + vo);

// QnaAnswerService -> QnaDAO.answer()
QnaAnswerService service = new QnaAnswerService();
service.service(vo);

// 질문답변 보기로 자동 이동시킨다.
response.sendRedirect("list.jsp");
%>

