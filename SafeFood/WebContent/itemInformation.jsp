<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- Chart.js -->
<script type="text/javascript" src="Chart/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="Chart/Chart.js"></script>


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
				<a href="logcheck.do?action=logout.do" id="logout">로그아웃</a> <a href="main.do?action=memberinfo.do" id="memberinfo">회원정보</a>
			</div>
		</div>
	</section>

	<!--==========================
    Header
  ============================-->
	<header id="header">
		<div class="container">
			<div id="logo" class="pull-left">
				<a href="main.do"><img
					src="https://lab.ssafy.com/uploads/-/system/appearance/header_logo/1/ssafy_logo.png"
					alt="" title="" /></a>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<!-- <li class="menu-active"><a href="#body">Home</a></li> -->
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

	<main id="main"> <!-- #services --> <!--==========================
      Services Section
    ============================-->
	<section id="services">
		<div class="container" id="id_container">
			<div class="section-header">
				</br> </br>
				<h2>제품 상세 정보</h2>
			</div>
			<div class="row">

				<div class="col-lg-12">
					<div class=" box3 wow fadeInLeft row" id="tableSection">
						<div class="col-lg-4">
							<img src="${item.img}" width="300px">
						</div>
						<div class="col-lg-8">

							<table class="table">
								<tr>
									<td width="30%">제품명</td>
									<td>${item.name}</td>
								</tr>
								<tr>
									<td width="30%">제조사</td>
									<td>${item.maker}</td>
								</tr>
								<tr>
									<td width="30%">원재료</td>
									<td>${item.material}</td>
								</tr>
								<tr>
									<td width="30%">알레르기성분</td>
									<td>${item.allergy}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- #services --> </main>
	<!-- #chart -->
	<br/>
	<br/>
	<br/>
	<br/>
	<div class="row">
		<div class="col-lg-1"></div>
		<canvas class="col-lg-6" id="myChart"></canvas>
		<div class="col-lg-4" id="tableChart">

			<table class="table">
				<tr>
					<td width="30%">일일제공량</td>
					<td>${item.supportpereat}</td>
				</tr>
				<tr>
					<td width="30%">칼로리</td>
					<td>${item.calory}</td>
				</tr>
				<tr>
					<td width="30%">탄수화물</td>
					<td>${item.carbo}</td>
				</tr>
				<tr>
					<td width="30%">단백질</td>
					<td>${item.protein}</td>
				</tr>
				<tr>
					<td width="30%">지방</td>
					<td>${item.fat}</td>
				</tr>
				<tr>
					<td width="30%">당류</td>
					<td>${item.sugar}</td>
				</tr>
				<tr>
					<td width="30%">나트륨</td>
					<td>${item.natrium}</td>
				</tr>
				<tr>
					<td width="30%">콜레스테롤</td>
					<td>${item.chole}</td>
				</tr>
				<tr>
					<td width="30%">포화지방산</td>
					<td>${item.fattyacid}</td>
				</tr>
				<tr>
					<td width="30%">트랜스지방</td>
					<td>${item.transfat}</td>
				</tr>
			</table>



		</div>
	</div>
	<br/>
	<br/>
	<br/>
	<br/>

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
	<script src="js/main.js"></script>



	<script type="text/javascript">



$(function(){
var ctx = document.getElementById("myChart");
	
	var myChart = new Chart(ctx,
			{
				type : "pie",
				data : {
					labels : [ "Carbo", "Protein", "Fat",  "Chole",
							"TransFat" ],
					datasets : [{
						label : "#pieChart",
						data : [ ${item.carbo}, ${item.protein}, ${item.fat},  ${item.chole}, ${item.transfat} ],
						backgroundColor : [ "rgba(255, 99, 132, 0.2)",
								"rgba(54, 162, 235, 0.2)",
								"rgba(255, 206, 86, 0.2)",
								"rgba(75, 192, 192, 0.2)",
								"rgba(153, 102, 255, 0.2)"],
						borderColor : [ "rgba(255, 99, 132, 1)",
								"rgba(54, 162, 235, 1)",
								"rgba(255, 206, 86, 1)",
								"rgba(75, 192, 192, 1)",
								"rgba(153, 102, 255, 1)"],
						borderWidth : 1
					}]
				},
				options : {

				}
			});

})
	</script>
</body>
</html>
