<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.ezenparty.member.service.MemberWriteService"%>
<%@page import="com.ezenparty.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 여기는 자바입니다.
// 한글 처리
//request.setCharacterEncoding("utf-8");

String path = "/upload/member/";
String realPath = request.getServletContext().getRealPath(path);
int size = 10 * 1024 * 1024;
// realPath 확인용
System.out.println("[write.jsp] realPath>> " + realPath);

MultipartRequest multi = new MultipartRequest(request, realPath, size, "utf-8", new DefaultFileRenamePolicy());

// 넘어오는 데이터 받기
String id = multi.getParameter("id");
String pw = multi.getParameter("pw");
String name = multi.getParameter("name");
String birth = multi.getParameter("birth");
String tel = multi.getParameter("tel");
String address = multi.getParameter("address");
String email = multi.getParameter("email");
String photo = multi.getFilesystemName("photo");
// 확인용
System.out.println("[write.jsp] photo - " + photo);

//사진이 안들어오면 NoImage.jpg로 기본 세팅한다.
if(photo == null || photo.equals("")) photo = "noimage.jpg";
// 확인용
//System.out.println("[write.jsp] photo - " + photo);

// Controller -> Service -> DAO : MemberVO 객체를 만들어서 전달한다.
MemberVO vo = new MemberVO();
vo.setId(id);
vo.setPw(pw);
vo.setName(name);
vo.setBirth(birth);
vo.setTel(tel);
vo.setAddress(address);
vo.setEmail(email);
vo.setPhoto(path + photo);

//확인용
System.out.println("회원가입 vo - " + vo);

//MemberWriteService -> MemberDAO.write
MemberWriteService service = new MemberWriteService();
int result = service.service(vo);

// 회원관리 리스트로 자동 이동시킨다.
response.sendRedirect("/main/main.jsp");
%>
