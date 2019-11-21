<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
        
        <div class="container2">
            <!-- Section -->
            <section>
    
                <div class="features">

                <c:forEach items='${list }' var='food'>
                	
					<article><span><img src="${food.image}" class="listimg"></img></span>
  					<div class='content'><div class='tit'><h3><a href ='foodInfo.do?name=${food.name }'>${food.name }</a></h3>
  					<a class="a"><i class="far fa-calendar-alt"> Feb.2017</i></a> &nbsp; <a href="foodInfo.do?name=${food.name }" class="a">  <i class="fas fa-external-link-alt">  View detail</i></a></div><p>
  					<div class="ma">${food.material }</div>
  					<div class="b"><a href="#" class="btn-info"><i class="fas fa-plus-square"> 추가</i></a> <a href="#" class="btn-info"><i class="fas fa-shopping-bag"> 찜</i></a></div></div></article>
  					
                </c:forEach>

                </div>
            </section>
        </div>
        <footer class="text-center">
            <div>
                <p><span class="glyphicon glyphicon-map-marker"></span> (SSAFY) 서울시 강남구 태헤란로 멀티스퀘어</p>
                <p><span class="glyphicon glyphicon-phone"></span> 1544-9001</p>
                <p><span class="glyphicon glyphicon-envelope"></span> admin@ssafy.com</p>
            </div>
        </footer>

</body>
</html>