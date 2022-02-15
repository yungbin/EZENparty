<%@page import="com.ezenparty.product.service.ProductDeleteService"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 데이터 수집
String strPno = request.getParameter("pno");
long pno = Long.parseLong(strPno);
String oldImage = request.getParameter("oldImage");
String oldContent = request.getParameter("oldContent");

// 데이터 확인
//System.out.println("delete.jsp - no : " + no + " oldName : " + oldFileName);

// DB 에서 삭제하기 - 첨부된 파일은 따로 삭제 처리해야만 한다.
ProductDeleteService service = new ProductDeleteService();
int result = service.service(pno);

// DB에서 데이터가 삭제되었으면 파일도 삭제한다.
// 삭제 전 이미지 파일들의 경로들을 파일객체에 담는다.
File oldFileImage = new File(request.getServletContext().getRealPath(oldImage));
File oldFileContent = new File(request.getServletContext().getRealPath(oldContent));

// oldFileImage.exists() -> 파일이나 폴더가 존재한다. (true) 
if(result > 0 && oldFileImage.exists() && oldFileContent.exists())
	oldFileImage.delete();
	oldFileContent.delete();

// 리스트로 자동 이동
response.sendRedirect("list.jsp?categories=balloon&kind=colorB");
%>