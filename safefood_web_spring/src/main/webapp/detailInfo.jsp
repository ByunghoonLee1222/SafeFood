<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	padding-top: 70px;
}

#two {
	padding-top: 70px;
}
</style>
<script src="js/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="js/chart.js@2.8.js"></script>

<link rel="stylesheet" href="./css/food.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./font/cssFont/all.css">

<meta charset="UTF-8">
<title>SafeFood | 상품 정보</title>
<script>
	$(function() {
		
		var chart = new CanvasJS.Chart("chartContainer", {
			theme: "light2", // "light1", "light2", "dark1", "dark2"
			exportEnabled: true,
			animationEnabled: true,
			title: {
				text: "영양 정보 / 일일제공량${f.serving_wt}"
			},
			data: [{
				type: "pie",
				startAngle: 25,
				toolTipContent: "<b>{label}</b>: {y}%",
				showInLegend: "true",
				legendText: "{label}",
				indexLabelFontSize: 16,
				indexLabel: "{label} - {y}",
				dataPoints: [
					{ y: ${f.nutr_cont1}, label: "칼로리" },
					{ y: ${f.nutr_cont2}, label: "탄수화물" },
					{ y: ${f.nutr_cont3}, label: "단백질" },
					{ y: ${f.nutr_cont4}, label: "지방" },
					{ y: ${f.nutr_cont5}, label: "당류" },
					{ y: ${f.nutr_cont6}, label: "나트륨" },
					{ y: ${f.nutr_cont7}, label: "콜레스트롤" },
					{ y: ${f.nutr_cont8}, label: "포화지방산" },
					{ y: ${f.nutr_cont9}, label: "트랜스지방" }
				]
			}]
		});
		chart.render();

	})
	
	
</script>

</head>
<body>

	<div id="nav">
		<jsp:include page="/nav.jsp" />
	</div>
	<header>
		<br /> <br />
		<h1 align="center">제품 정보</h1>
		<img>
	</header>
	<!-- Container (중간 섹션) -->
	<article id="one" class="container">
		<section id="sectionOne">
			<div class="foodinfo">
				<div class="col-md-3 col-xs-3">
					<span><img src="${f.image}" class="img-responsive"></span>
				</div>
				<div id="product" class="col-md-9 col-xs-9">
					<table class="table">
						<tr>
							<td class="col-md-2 col-xs-3">제품명</td>
							<td>${f.name}</td>
						</tr>
						<tr>
							<td>제조사</td>
							<td>${f.maker}</td>
						</tr>
						<tr>
							<td>원재료</td>
							<td>${f.material}</td>
						</tr>
						<tr>
							<td>알레르기 성분</td>
							<td>${aler}</td>
						</tr>
							<tr>
							<td>조회수</td>
							<td></td>
						</tr>
					</table>
				</div>

			</div>
		</section>
	</article>
	<article class="container">
		<div class="col-md-3 col-xs-3"></div>
		<div>
			<fieldset>
				<form>
					<div class="form-group">
						<label for="Quantity">Quantity</label> </br> <input type="number"
							id="quan" placeholder="1" min="1">
					</div>
				</form>
				<div class="btn-group" role="group" aria-label="...">
					<button type="button" class="btn btn-info" id="add" value="추가">
						<i class="fas fa-shopping-bag"></i>추가
					</button>
					<button type="button" class="btn btn-info" id="dib" value="찜">찜</button>
				</div>
			</fieldset>
		</div>
	</article>
	<article id="two" class="container">
		<section id="sectionTwo">
			<div id="chartContainer" style="height: 370px; width: 100%;"></div>
			<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		</section>
	</article>
	<footer class="text-center">
		<jsp:include page="/copyright.jsp" />
	</footer>
</body>
</html>