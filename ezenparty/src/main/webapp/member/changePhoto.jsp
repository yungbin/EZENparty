<%@page import="java.io.File"%>
<%@page import="com.ezenparty.member.service.PhotoChangeService"%>
<%@page import="com.ezenparty.member.vo.MemberVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = "/upload/member/";
String realPath = request.getServletContext().getRealPath(path);
int size = 10 * 1024 * 1024;
System.out.println("[changePhoto.jsp] realpath>> " + realPath);

MultipartRequest multi = new MultipartRequest(request, realPath, size, "utf-8", new DefaultFileRenamePolicy());

String id = multi.getParameter("id");
String oldPhoto = multi.getParameter("oldPhoto");
String photo = multi.getFilesystemName("photo");

MemberVO vo = new MemberVO();
vo.setId(id);
vo.setPhoto(path + photo);
// 확인용
System.out.println("[changePhoto.jsp] vo>> " + vo);

PhotoChangeService service = new PhotoChangeService();
int result = service.service(vo);

File oldFile = new File(request.getServletContext().getRealPath(oldPhoto));
if(result > 0 && oldFile.exists() && !oldPhoto.equals("/upload/member/noImage.jpg")){
	oldFile.delete();
}

response.sendRedirect("view.jsp?id=" + id);
%>