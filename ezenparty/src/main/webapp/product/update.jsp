<%@page import="com.ezenparty.product.service.ProductUpdateService"%>
<%@page import="java.io.File"%>
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
System.out.println("update.jsp realPath>> " + realPath);

int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request, realPath, size, "utf-8", new DefaultFileRenamePolicy());

String strPno = multi.getParameter("pno");
long pno = Long.parseLong(strPno);
// 번호 확인용
System.out.println("[update] pno >> " + pno);

String pname = multi.getParameter("pname");
String strPrice = multi.getParameter("price");
long price = Long.parseLong(strPrice);

String strUnit = multi.getParameter("unit");
long unit = Integer.parseInt(strUnit);
String pkind = multi.getParameter("pkind");
String categories = multi.getParameter("categories");

String content = multi.getFilesystemName("content");
String image = multi.getFilesystemName("image");
String oldContent = multi.getParameter("oldContent");
String oldImage = multi.getParameter("oldImage");

ProductVO vo = new ProductVO();
vo.setPno(pno);
vo.setPname(pname);
vo.setPrice(price);
vo.setUnit(unit);
vo.setCategories(categories);
vo.setPkind(pkind);

System.out.println("update.jsp vo >> " + vo);
//이미지와 내용 이미지를 수정을 했는지 확인하는 변수
int cnts = 0;
int cnti = 0;

//내용이미지 수정했는지 안했는지 확인용 조건문 (수정됬으면 cnts 1, 수정을 안했으면 cnts 0)
if(content != null){
	vo.setContent(path + content);
	cnts = 1;
} else{
	vo.setContent(oldContent);
}
//확인용
//System.out.println("song " + cnts);

//이미지 수정했는지 안했는지 확인용 조건문 (수정됬으면 cnti 1, 수정을 안했으면 cnti 0)
if(image != null){
	vo.setImage(path + image);
	cnti = 1;
} else{
	vo.setImage(oldImage);
}
//확인용
//System.out.println("cnti " + cnti);

//서비스 객체 생성
ProductUpdateService service = new ProductUpdateService();
//업데이트가 되었으면 result에 0 이상의 값이 나온다.
int result = service.service(vo);
System.out.println("result " + result);

//파일객체 생성 수정 전 이미지와 내용이미지파일의 경로를 저장해놓는다.
File oldContentFile = new File(request.getServletContext().getRealPath(oldContent));
File oldImageFile = new File(request.getServletContext().getRealPath(oldImage));

//result 가 0보다 큰 숫자이면 어떠한 수정이 이루어 진것이므로 조건 달성
//수정 전 이미지와 내용이미지의 파일이나 폴더가 존재(exists)하면 조건 달성
//내용이미지파일이나 이미지파일이 수정이 됬으면 cnts, cnti의 값이 1 이므로 조건 달성
if(result > 0 && oldContentFile.exists() && cnts == 1) oldContentFile.delete();
if(result > 0 && oldImageFile.exists() && cnti == 1) oldImageFile.delete();

//확인용
response.sendRedirect("view.jsp?pno=" + pno);
%>