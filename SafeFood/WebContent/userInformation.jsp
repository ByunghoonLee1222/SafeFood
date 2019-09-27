<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Reveal Bootstrap Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">
<link href="css/taemin.css" rel="stylesheet">
<!-- =======================================================
    Theme Name: Reveal
    Theme URL: https://bootstrapmade.com/reveal-bootstrap-corporate-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>
<c:if test="${not empty msg}">
	<script>
		alert('${msg}');
	</script>
</c:if>
<body id="body">

	<!--==========================
    Top Bar
  ============================-->
	<section id="topbar" class="d-none d-lg-block">
		<div class="container clearfix">
			<div class="contact-info float-left">
				
			</div>
			<div class="social-links float-right">
				<a href="logcheck.do?action=logout.do" id="logout">로그아웃</a> 
				<a href="main.do?action=memberinfo.do" id="memberinfo">회원정보</a>
			</div>
		</div>
	</section>

	<!--==========================
    Header
  ============================-->
	<header id="header">
		<div class="container">
			<div id="logo" class="pull-left">
				 <a href="main.do"><img src="https://lab.ssafy.com/uploads/-/system/appearance/header_logo/1/ssafy_logo.png"  alt="" title="" /></a>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li><a href="#about">공지 사항</a></li>
					<li><a href="main.do?action=list.do">상품 정보</a></li>
					<li><a href="#portfolio">베스트 섭취 정보</a></li>
					<li><a href="#team">내 섭취 정보</a></li>
					<li><a href="#contact">예상 섭취 정보</a></li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</header>
	<!-- #header -->


	<!-- #intro -->

	<main id="main"> <!--==========================
     userInformation Section
    ============================-->
	<section id="userInformation">
		<div class="container">
			<div class="section-header">
				</br> </br>
				<h2>내 정보 보기</h2>
			</div>

			<form id="memberupdate" method="post" action="main.do?action=userUpdate.do">

				<div class="row marginbox">
					<h4 class="col-lg-4" align="center">아이디</h4>
					<input type="id" class="form-control col-lg-8" name="id"
						placeholder="Id" value="${member.id}">
				</div>
				<hr>
				<div class="row marginbox">
					<h4 class="col-lg-4" align="center">비밀번호</h4>
					<input type="password" class="form-control col-lg-8" name="password"
						placeholder="Password" value="${member.password}">
				</div>
				<hr>
				<div class="row marginbox">
					<h4 class="col-lg-4" align="center">이름</h4>
					<input type="text" class="form-control col-lg-8" name="name"
						placeholder="Name" value="${member.name}">
				</div>
				<hr>
				<div class="row marginbox">
					<h4 class="col-lg-4" align="center">이메일</h4>
					<input type="text" class="form-control col-lg-8" name="email"
						placeholder="Email" value="${member.email}">
				</div>
				<hr>
				<div class="row marginbox">
					<h4 class="col-lg-4" align="center">전화번호</h4>
					<input type="text" class="form-control col-lg-8" name="phoneNumber"
						placeholder="phoneNumber" value="${member.phone}">
				</div>
				<hr>
				<div class="row marginbox">
					<h4 class="col-lg-4" align="center">주소</h4>
					<input type="text" class="form-control col-lg-8" name="address"
						placeholder="Address" value="${member.address}">
				</div>
				<hr>
				<div class="row marginbox">
					<h4 class="col-lg-4" align="center">알레르기</h4>
					<input type="text" class="form-control col-lg-8" name="allergy"
							placeholder="Allergy" value="${member.allergy}">
				</div>
				<hr>
				<div class="row marginbox">
					<h4 class="col-lg-9"></h4>
					<input type="submit"  class="form-control col-lg-1 btn btn-primary" id="editButton"
						value="수정">
			</form>
					<input type="button" class="form-control col-lg-1 btn btn-default"
						id="submitButton" value="탈퇴" onclick="userdelete();">
						
				</div>


		</div>

	</section>


	<!-- #services --> </main>

	<!--==========================
    Footer
  ============================-->
	<footer id="footer">
		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong>Reveal</strong>. All Rights Reserved
			</div>
			<div class="credits">
				<!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Reveal
        -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- #footer -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/superfish/hoverIntent.js"></script>
	<script src="lib/superfish/superfish.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/magnific-popup/magnific-popup.min.js"></script>
	<script src="lib/sticky/sticky.js"></script>

	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>
