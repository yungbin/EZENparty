<%@page import="com.ezenparty.product.service.ProductWriteService"%>
<%@page import="com.ezenparty.product.vo.ProductVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = "/upload/image/";
String realPath = request.getServletContext().getRealPath(path);
// realPath 확인용
System.out.println("write.jsp realPath>> " + realPath);

int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request, realPath, size, "utf-8", new DefaultFileRenamePolicy());

String pname = multi.getParameter("pname");
String strPrice = multi.getParameter("price");
long price = Long.parseLong(strPrice);

String strUnit = multi.getParameter("unit");
int unit = Integer.parseInt(strUnit);
String pkind = multi.getParameter("pkind");

String content = multi.getFilesystemName("content");
String image = multi.getFilesystemName("image");

ProductVO vo = new ProductVO();
vo.setPname(pname);
vo.setPrice(price);
vo.setUnit(unit);
vo.setContent(path + content);
vo.setImage(path + image);
vo.setPkind(pkind);

//확인용
System.out.println("확인용 [write.jsp] vo >>> " + vo);

ProductWriteService service = new ProductWriteService();
int result = service.service(vo);

response.sendRedirect("list.jsp");
%>