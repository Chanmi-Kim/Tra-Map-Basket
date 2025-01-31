<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>TraMap Basket</title>
	
	<!-- css삽입 -->
<%@ include file="/inc/css.jsp" %>
<style>
	#basketbtn i{
		font-size: 30px;
	}
	
	#basket { 
		position:fixed; width:15%; display:inline-block; right:1%; /* 창에서 오른쪽 길이 */ top:20%; /* 창에서 위에서 부터의 높이 */ background-color: transparent; margin:0; 
		border: 1px solid black;
		border-radius: 5px;	
		height: 600px;
		/* overflow-y: scroll; */
	}
    
    .picture {
		float: left;
		width: 80px;
		height: 80px;
		border: 1px solid #ddd;
		margin: 10px;
		margin-top: 10px;
		margin-left: 10px;
		/* background-image: url(/project/asset/img/${pic}); */
		background-image: url(/project/asset/img/copizulzul.jpg);
		background-repeat: no-repeat;
		background-size: contain;
		background-position : center center;
	}
	
	.adminmenu{
		text-align:center;
		font-size: 25px;
		border-top:1px solid #ccc;
		margin: 20px;
		padding: 30px;
	}
	
	#profilename , #profilelevel{
		text-align:center;
	}
	
    .container{
    	width:900px;
    	
    }

	#tblAdd{ width: 700px;}
	#tblAdd th{width:100px;}
	#tblAdd td{width: 600px;}
    
	#continent1 {display: inline-block;}
	#country1 {display: inline-block; height:20px;}
	
	#tblAdd{ margin-left:80px;}
	
	.selectbox > #continent1 {display:inline-block;}
	.selectbox > #continent1 {display:inline-block;}
	
	.btns{float:right;}
	
	.headname{
		margin : 10px;
	}
	    #container {
        text-align:center;
        padding-top:300px; 
    }
 
    #sido, #sigungu {
        width:150px;   
        height:30px;
        font-size:15px;
    }


</style>
<script type="text/javascript">
	$('document').ready(function() {

});
	
	function countryChange(){
		var country = $("select [name='country'] option:selected").val();
		$.ajax({
			type:"POST",
			url:"multi/change.php",
			data:"country="+countr,
			success: function(html){
				${"#search-tourist"}.html(html);
			}
		});
	}
	
	function touristspotChange(){
		var country = $("select[name='country'] option:selected").val();
		var touristspot = $("select[name='touristspot'] option:selected").val();
		$.ajax({
			type:"POST",
			url:"multi/change.php",
			data:"country=" + country +"&touristspot" +touristspot,
			success:function(html){
				$("#search-")
			}
		});
	}
</script>
</head>
<body>
<?php include $_SERVER['DOCUMENT_ROOT']."/db.php"; ?>

  <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.html"><img src="/project/asset/img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Shop</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="category.html">Shop Category</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-product.html">Product Details</a></li>
                  <li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
                  <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
                  <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li>
                </ul>
							</li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Blog</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
                </ul>
							</li>
							<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Pages</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                  <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li>
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">Tracking</a></li>
                </ul>
              </li>
              <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
            </ul>

            <ul class="nav-shop">
            <c:if test="${!empty loginCheck }">
              <li class="nav-item"><button onclick="location.href='/project/member/ybh/ybhMypage.do';"><i class="ti-search"></i></button></li>
              <li class="nav-item"><button onclick="location.href='/project/admin/hotel/hotellist.do';"><i class="ti-settings"></i></button> </li>
              <li class="nav-item"><a class="button button-header" href="/project/member/ybh/ybhLogout.do">Logout</a></li>
            </c:if>
            <c:if test="${empty loginCheck }">
              <li class="nav-item"><a class="button button-header" href="/project/member/ybh/ybhLogin.do"
              	onclick="window.open(this.href, '_blank', 'width=400,height=300,toolbars=no,scrollbars=no,left=700, top=50'); return false;">Login</a></li>
              	
            </c:if>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->



    <main class="site-main">
    
 	<!-- 페이지 우측 메뉴 바 -->
    <div id="basket">
    	<!-- 우측 메뉴바 프로필부분 -->
    	<div class="profile" >
    		<div id="pic"></div>
    		<input type="button" value="정보관리" class="btn btn-default" onclick="">
    		<div id="profilename"><label>관일장(guan)</label></div>
    		<div id="profilelevel"><label>관리자</label></div>
    	</div>
    	<!-- 우측 메뉴바 메뉴부분 -->
    	<div class="adminmenu" >
    		<div><a href="/project/admin/airline/airlinehome.do">항공 관리</a></div>
    		<div><a href="/project/admin/country/countryhome.do">나라 관리</a></div>
    		<div><a href="/project/admin/tourspot/tourspothome.do">관광지 관리</a></div>
    		<div><a href="/project/admin/hotel/hotellist.do">숙박 관리</a></div>
    		<div><a href="/project/admin/theme/themehome.do">테마 관리</a></div>
    		<div><a href="/project/admin/member/memberlist.do">회원 관리</a></div>
    	</div>
    </div>
	

    <!-- ================ Blog section start ================= -->  
     <section class="section-margin calc-60px">
      <div class="container" style="border: 1px solid black;">
        <div class="section-intro pb-60px">
         
          <h2 class="headname">호텔<span class="section-intro__style">추가</span></h2>
        </div>
    		
    		<form method="POST" action="/admin/hotel/addok.do" enctype="multipart/form-data">
    			<table id="tblAdd" class="table table-bordered">
    				<tr>
    					<th>나라선택</th>
    					<td>
    						<select name="country" id="country" class="form-control">
    							<c:forEach items="${countrylist}" var="tsdto">
    								<option value="${cdto.country_seq}">${cdto.name}</option>
    							</c:forEach>
    						</select>
    					</td>
    				</tr>
    				<tr>
    					<th>호텔명</th>
    					<td><input type="text" name="name" id="name" class="form-control" required></td>
    				</tr>
    				<tr>
    					<th>사진</th>
    					<td><input type="file" name="picture" id="picture" class="form-control"></td>
    				</tr>
    				<tr>
    					<th>설명</th>
    					<td><textarea name="description" id="description" class="form-control" required></textarea></td>
    				</tr>
    				<tr>
    					<th>경도</th>
    					<td><input type="text" name="lat" id="lat" class="form-control" required></td>
    				</tr>
    				<tr>
    					<th>위도</th>
    					<td><input type="text" name="lng" id="lng" class="form-control" required></td>
    				</tr>
    				<tr>
    					<th>근처 관광지</th>
    					<td class="selectbox">
    						<select name="spot" id="spot" class="form-control">
    							<c:forEach items="${touristspotlist}" var="tsdto">
    								<option value="${tsdto.TOURISTSPOT_SEQ}">${tsdto.name}</option>
    							</c:forEach>
    						</select>
						</td>
    				</tr>
    			</table>
    			<div class="btns">
				<input type="button" value="돌아가기" class="control"
					onclick="location.href='/project/admin/hotel/hotellist.jsp';">
				<input type="submit" value="추가하기" class="control">
				</div>
    		</form>
    	</div>
    	</section>
    
    <!-- ================ Blog section end ================= -->  

    <!-- ================ Subscribe section start ================= --> 
   <!--  <section class="subscribe-position">
      <div class="container">
        <div class="subscribe text-center">
          <h3 class="subscribe__title">Get Update From Anywhere</h3>
          <p>Bearing Void gathering light light his eavening unto dont afraid</p>
          <div id="mc_embed_signup">
            <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe-form form-inline mt-5 pt-1">
              <div class="form-group ml-sm-auto">
                <input class="form-control mb-1" type="email" name="EMAIL" placeholder="Enter your email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '" >
                <div class="info"></div>
              </div>
              <button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe Now</button>
              <div style="position: absolute; left: -5000px;">
                <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
              </div>

            </form>
          </div>
          
        </div>
      </div>
    </section> -->
    <!-- ================ Subscribe section end ================= --> 

    

  </main>


  <!--================ Start footer Area  =================-->	
	<footer class="footer">
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">호텔</a></li>
								<li><a href="#">나라</a></li>
								<li><a href="#">관광지</a></li>
								<li><a href="#">가이드</a></li>
								<li><a href="#">고객센터</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="/project/asset/img/gallery/r1.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r2.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r3.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r5.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r7.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->
	<%@ include file="/inc/js.jsp" %>
	<!-- 이곳 -->
	
	
</body>

</html>