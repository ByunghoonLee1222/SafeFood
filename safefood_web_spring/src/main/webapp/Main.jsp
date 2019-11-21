<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<title>메인 페이지</title>
        <meta charset="UTF-8">
        <!-- 합쳐지고 최소화된 최신 CSS -->
        <script src="./js/jquery-3.3.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- 부가적인 테마 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="./css/food.css">
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./font/cssFont/all.css">
		<script type="text/javascript">
		$(function(){
			if("${msg}" != ""){
				alert("${msg}");
				console.log("${msg}");
			}
		});
		</script>
</head>
<body>

<div id="nav">
   <jsp:include page="/nav.jsp"/>
</div>
        		
        <!-- Container (중간 섹션) -->
        <div class="bg-1">
            <div>
                <br /><br /><br /><br /><br /><br />
            </div>
            <div id="band" class="container text-center">
                <h1><em>WHAT WE PROVIDE</em></h1>
                <P>건강한 삶을 위한 먹거리 프로젝트</P>
                <br>
                 <div class="row bg-2 text-center">
					<form action="search.do">
                        <div class="form-group col-md-3">
                            <label for="sel1">검색 조건</label>
                            <select class="form-control" id="sel1" name ="sel1">
                                <option value="name">상품명</option>
                                <option value="material">성분</option>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="keyword">검색 단어</label>
                            <input type="text" class="form-control" id="keyword" name ="keyword">
                        </div>
                        <div class="form-group col-sm-1">
                            <br/>
                            <button type="submit" class="btn btn-info" id="search"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
					
					</form>


                </div>
            </div>
        </div>
        <div class="container conta">
            <section>
               	<div id="best">
            		<a class="btn btn-warning" href='filter.do'>추천 식품</a>
            	</div>
            	<form method="post" action="sort.do">
            	<div><p>정렬방식</p>
            		<select name="sort">
            			<option value="no">번호</option>
            			<option value="name">이름</option>
            			<option value="kal">칼로리</option>
            		</select>
            		<input type="submit" name="type" value="오름차순">
            		<input type="submit" name="type" value="내림차순">
            	</div>
            	</form>
                <div class="features2">
                <c:forEach items='${list }' var='food'>
					<article><span><img src="${food.image}" class="listimg"></img></span>
					<div class='content'><h3><a class = 'goDetailInfo' href ='foodInfo.do?name=${food.name }'>${food.name }</a></h3>
					<a class="a"><i class="far fa-calendar-alt"> Feb.2017</i></a> &nbsp; <a href="foodInfo.do?name=${food.name }" class="a">  <i class="fas fa-external-link-alt">  View detail</i></a><hr><p>
                	${food.material }
                	<p class="b"><a href="#" class="btn-info"><i class="fas fa-plus-square"> 추가</i></a> <a href="#" class="btn-info"><i class="fas fa-shopping-bag"> 찜</i></a></p></div></article>
                </c:forEach>
                </div>
            </section>
        </div>
        <footer class="text-center">
            <jsp:include page="/copyright.jsp"/>
        </footer>
    </body>
</html>
