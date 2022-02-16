<%@page import="com.ezenparty.product.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ezenparty.product.service.ProductListService"%>
<%@page import="com.webjjang.util.PageObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//페이지 정보 받기
PageObject pageObject = PageObject.getInstance(request);
//DB에서 데이터를 가져온다. - controller(JSP) - ImageListService - ImageDAO
ProductListService service = new ProductListService();
List<ProductVO> list = service.service(pageObject);

//EL객체나 JSTL을 사용하기 위해서 서버의 기본 저장 객체에 담는다.
request.setAttribute("pageObject", pageObject);
request.setAttribute("list", list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인입니다.</title>
<style type="text/css">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial;
  padding: 10px;
  background: #f1f1f1;
}

/* Add a card effect for articles */
.card {
  background-color: white;
  margin-top: 30px;
  padding: 20px;
  text-align: center;
  margin-top: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Footer */
.footer {
  padding: 20px;
  text-align: center;
  background: #ddd;
  margin-top: 20px;
}

</style>
</head>
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="http://joyparty79.godohosting.com/data/goods/19/03/10/1000065651/1000065651_magnify_021.jpg" alt="Los Angeles" style="width: 100%;">
      </div>

      <div class="item">
        <img src="http://joyparty79.godohosting.com/data/goods/21/11/47/1000069642/1000069642_magnify_071.jpg" alt="Chicago" style="width: 100%;">
      </div>
    
      <div class="item">
        <img src="http://joyparty79.godohosting.com/data/goods/19/03/11/1000065699/1000065699_magnify_072.jpg" alt="New york" style="width: 100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div class="container">
  <h2 class="container">이젠파티 용품</h2>
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="/product/view.jpg" target="_blank">
          <img src="http://joyparty79.godohosting.com/data/goods/19/03/10/1000065651/1000065651_magnify_021.jpg" alt="Bolloon" style="width:100%">
          <div class="caption">
            <p>풍선</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="/product/view.jpg" target="_blank">
          <img src="http://joyparty79.godohosting.com/data/goods/21/11/47/1000069642/1000069642_magnify_071.jpg" alt="Nature" style="width:100%">
          <div class="caption">
            <p>소품</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="#" target="_blank">
          <img src="http://joyparty79.godohosting.com/data/goods/18/11/44/1000065334/1000065334_magnify_090.jpg" alt="Fjords" style="width:100%">
          <div class="caption">
            <p>소품</p>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <h2>파티용품</h2>
      <h5>파티용품</h5>
      <div class="fakeimg" style="height:200px;">Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
    <div class="card">
      <h2>파티용품</h2>
      <h5>파티용품2</h5>
      <div class="fakeimg" style="height:200px;">Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
  </div>
<div class="footer">
<footer style="padding-bottom: 98px;">
<span>이젠파티</span>
<address>경기도 의정부시</address>
<span>대표: 팀프로젝트3</span>
<span>사업자등록번호 : 123-45-67890</span>
<span>고객센터 : 1600-0000</span>
</footer>
</div>
</body>
</html>