<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Safe Food</title>

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


<!-- Mentor CSS Files -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/imagehover.min.css">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<script type="text/javascript" src='./js/jquery-3.3.1.js'></script>
<script type="text/javascript">
 <c:if test="${msg !=null}">
	console.log("msg");
	$(function(){
	$("#login").modal();
	})
	</c:if>
	</script>

<!-- =======================================================
Theme Name: Reveal
 Theme URL: https://bootstrapmade.com/reveal-bootstrap-corporate-template/
 Author: BootstrapMade.com
 License: https://bootstrapmade.com/license/
 ======================================================= -->

</head>

<body id="body">

	<!--==========================
Top Bar
 ============================-->
	<section id="topbar" class="d-none d-lg-block">
		<div class="container clearfix">
			<div class="contact-info float-left"></div>
			<div class="social-links float-right">
				<a href="#" data-target="#login" data-toggle="modal">로그인</a> <a
					href="#" data-target="#signup" data-toggle="modal">회원가입</a>

			</div>
		</div>
	</section>

	<!--Modal box-->
	<div class="modal fade" id="login" role="dialog" data-backdrop="static">
		<div class="modal-dialog modal-sm">
			<!-- Modal content no 1-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-center form-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body padtrbl">
					<div class="login-box-body">
						<p class="login-box-msg">아이디와 비밀번호를 입력하세요.</p>
						<c:if test="${msg !=null}">
							<p class="login-box-msg">${msg}</p>
						</c:if>
						<div class="form-group">
							<form id="loginForm" method="post"
								action="logcheck.do?action=login.do">

								<div class="form-group has-feedback">
									<!----- username -------------->
									<input class="form-control" placeholder="Username" id="loginid"
										type="text" autocomplete="off" name="id" /> <span
										style="display: none; font-weight: bold; position: absolute; color: red; position: absolute; padding: 4px; font-size: 11px; background-color: rgba(128, 128, 128, 0.26); z-index: 17; right: 27px; top: 5px;"
										id="span_loginid"></span>
									<!---Alredy exists ! -->
									<span class="glyphicon glyphicon-user form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<!----- password -------------->
									<input class="form-control" placeholder="Password"
										id="loginpsw" type="password" autocomplete="off" name="pw" />
									<span
										style="display: none; font-weight: bold; position: absolute; color: grey; position: absolute; padding: 4px; font-size: 11px; background-color: rgba(128, 128, 128, 0.26); z-index: 17; right: 27px; top: 5px;"
										id="span_loginpsw"></span>
									<!---Alredy exists ! -->
									<span class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="checkbox icheck">
											<label> <input type="checkbox" id="loginrem">
												Remember Me
											</label>
										</div>
									</div>
									<div class="col-lg-12">
										<button type="submit" class="btn btn-green btn-block btn-flat">로그인</button>
										<button type="button" class="btn btn-green btn-block btn-flat"
											data-target="#signup" data-toggle="modal">회원가입</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--Modal box-->
	<div class="modal fade" id="signup" role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content no 2-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-center form-title">회원 가입</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<div class="modal-body padtrbl">

					<div class="signup-box-body">
						<div class="form-group">

							<form id="memberinsert" method="post"
								action="main.do?action=memberinsert.do">
								<div class="row marginbox">
									<a class="col-lg-4" align="center"> 아이디 </a> <input type="text"
										class="form-control col-lg-6" name="id" placeholder="id">
								</div>
								<div class="row marginbox">
									<a class="col-lg-4" align="center"> 비밀번호 </a> <input
										type="text" class="form-control col-lg-6" name="password"
										placeholder="Password">
								</div>
								<div class="row marginbox">
									<a class="col-lg-4" align="center"> 이름 </a> <input type="text"
										class="form-control col-lg-6" name="name" placeholder="Name">
								</div>
								<div class="row marginbox">
									<a class="col-lg-4" align="center"> 이메일 </a> <input type="text"
										class="form-control col-lg-6" name="email" placeholder="Email">
								</div>
								<div class="row marginbox">
									<a class="col-lg-4" align="center"> 전화번호 </a> <input
										type="text" class="form-control col-lg-6" name="phone"
										placeholder="phoneNumber">
								</div>
								<div class="row marginbox">
									<a class="col-lg-4" align="center"> 주소 </a> <input type="text"
										class="form-control col-lg-6" name="address"
										placeholder="Address">
								</div>
								<div class="row marginbox">
									<a class="col-lg-4" align="center"> 알레르기 </a>
									<fieldset class="col-lg-8" id="innerFiledSet">
										<input class="from-control marginbox" type="checkbox"
											name="allergy" value="대두"> 대두 <input
											class="from-control marginbox" type="checkbox" name="allergy"
											value="땅콩"> 땅콩 <input class="from-control marginbox"
											type="checkbox" name="allergy" value="우유"> 우유 <input
											class="from-control marginbox" type="checkbox" name="allergy"
											value="새우"> 새우 <input class="from-control marginbox"
											type="checkbox" name="allergy" value="참치"> 참치 <input
											class="from-control marginbox" type="checkbox" name="allergy"
											value="연어"> 연어 <input class="from-control marginbox"
											type="checkbox" name="allergy" value="쑥"> 쑥 <input
											class="from-control marginbox" type="checkbox" name="allergy"
											value="소고기"> 소고기 <input
											class="from-control marginbox" type="checkbox" name="allergy"
											value="닭고기"> 닭고기 <input
											class="from-control marginbox" type="checkbox" name="allergy"
											value="돼지고기"> 돼지고기 <input
											class="from-control marginbox" type="checkbox" name="allergy"
											value="복숭아"> 복숭아 <input
											class="from-control marginbox" type="checkbox" name="allergy"
											value="민들레"> 민들레 <input
											class="from-control marginbox" type="checkbox" name="allergy"
											value="계란"> 계란
									</fieldset>
								</div>
								<div class="row"></div>
								<div class="col-lg-12">
									<button type="submit" class="btn btn-green btn-block btn-flat">가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	<!--/ Modal box-->
	<!--==========================
Header
 ============================-->
	<header id="header">
		<div class="container">
			<div id="logo" class="pull-left">
				<a href="#body"><img
					src="https://lab.ssafy.com/uploads/-/system/appearance/header_logo/1/ssafy_logo.png"
					alt="" title="" /></a>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<!-- <li class="menu-active"><a href="#body">Home</a></li> -->
					<li><a href="#about">공지 사항</a></li>
					<li><a href="main.do?action=list.do" >상품 정보</a></li>
					<li><a href="#portfolio">베스트 섭취 정보</a></li>

				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</header>
	<!-- #header -->

	<!--==========================
Intro Section
 ============================-->
	<section id="intro">

		<div class="intro-content">
			<h2>SafeFood</h2>
			<h4>자연의 맛 그대로 바른먹거리를 전하다.</h4>
		</div>

		<div id="intro-carousel" class="owl-carousel">
			<div class="item"
				style="background-image: url('http://image.chosun.com/sitedata/image/201903/06/2019030601012_0.jpg');"></div>
			<div class="item"
				style="background-image: url('http://static.myletter.net/20181102/6c59105b-1ea9-4e6d-bdd2-e5deafe499e3.jpg');"></div>
			<div class="item"
				style="background-image: url('https://www.skyscanner.co.kr/wp-content/uploads/2018/05/GettyImages-473146354.jpg?fit=1048,696');"></div>
			<div class="item"
				style="background-image: url('https://image.winudf.com/v2/image/Y29tLmVsZmFtLmFuZHJvaWQuYmVzdC5mb29kX3NjcmVlbnNob3RzXzE4Xzg2ZmUyNQ/screen-18.jpg?fakeurl=1&type=.jpg');"></div>
		</div>

	</section>
	<!-- #intro -->

	<main id="main"> <!--==========================
Search Section
 ============================-->
	<section id="search">
		<div class="container" class="text-center">
			<br/>

			<form action="main.do?action=foodList.do" method="post">
				<div class="row">
					<div class="searchCondition col-lg-3"></div>
					<div class="searchCondition col-lg-2">
						<div align="center">
							<h4 class="title">
								<a>검색조건  &nbsp;&nbsp;&nbsp;</a>
							</h4>
							<select id='searchCondition' size='1' class="form-control"
								name='key'>
								<option value='all' selected>검색조건</option>
								<option value='name' >상품명</option>
								<option value='maker'>제조사</option>
								<option value='material'>첨가물</option>
							</select>
						</div>
					</div>


					<div class="searchWords col-lg-2">
						<div align="center">
							<h4 class="title">
								<a>검색단어  &nbsp;&nbsp;</a>
							</h4>
							<input type="text" class="form-control" id="searchWord"
								name="word" onKeyPress="if (event.keyCode==13){searchItem();}">
						</div>
					</div>

					<div class="searchButton col-lg-0.3">
						<div align="center">
							<h4 class="title">
								<a> &nbsp;&nbsp;&nbsp;</a>
							</h4>
							<input type='submit' id='searchButton' value='검색하기'
								class="btn btn-primary"></input>
						</div>
					</div>


				</div>



			</form>


		</div>
		<br /> <br />
	</section>
	<!--==========================
Services Section
 ============================-->
	<section id="services">
		<div class="container">
			<div class="row" id="serviceSection">

				<div class='col-lg-12'>
					<c:forEach items='${foodList}' var='food'>
						<div class='col-lg-12'>
							<div class=' box2 wow fadeInLeft row'>

								<div class='col-lg-3'>
									<img src='${food.img}' width='200px' style='cursor: pointer'
											onclick="itemInfor(${food.code});">	</div>

								<div class='col-lg-8'>
									<h4 style='cursor: pointer'>
										<a> ${food.name} </a>
									</h4>
									<p>${food.material}</p>
									<div class="row ">
										<h4 class="col-lg-7"></h4>
										<input type="button"
											class="form-control col-lg-2 btn btn-default"
											id="submitButton" value="추가"> <input type="button"
											class="form-control col-lg-2 btn btn-primary" id="editButton"
											value="찜">
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

	</main>
	</br>
	<!--==========================
Footer
 ============================-->
	<footer id="footer">
		<div class="container">
			<div class="copyright">
				© Copyright <strong>Reveal</strong>. All Rights Reserved
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


	<script type="text/javascript">
	 function itemInfor(foodno) {
		window.location.href="main.do?action=itemInfor.do&code="+foodno;
	} 
	
	</script>


</body>
</html>