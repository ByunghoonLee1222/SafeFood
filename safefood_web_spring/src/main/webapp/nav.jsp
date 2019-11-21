<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<script type="text/javascript">
        	$(function(){
        		<c:forEach items="${list}" var="food">
        			console.log('${food.name}');
        		</c:forEach>
        		var isLogin = false;
                var name = '<%= (String)session.getAttribute("id") %>';
                console.log("세션아이디"+name);
                if (name != "null") {
                	console.log("!!")
                    $('#sign').text(name + " 회원 정보");
                    $('#login').text("로그아웃");
                    $('#sign').attr("href", "memberinfo.do");
                    $('#login').attr("data-target", "#");
                    $('#login').attr("href", "logout.do");
                    isLogin = true;
                    $('#best').show();
    			}
                else{
                	$('#sign').attr("href", "signup.jsp");
                    $('#login').attr("data-target", "#modalLoginForm");
                    $("#best").hide();
                }
                $('#login').click(function () {
                    if (isLogin) {
                        alert('로그아웃 됐습니다.');
                        isLogin=false;
                        location.reload();
                    }
                })
	           	$("#findPW").click(function(){
	        		 var id = $("#id").val();
	        		 $.ajax({
	        			 url : "findPW.do",
	        			 type : "get",
	        			 data :{id: id},
	        			 error  : function(xhr, status,message){
	        				 alert("error:"+message);
	        			 },
	        			 success : function(data){
	        				 alert(data);
	        			 }
	        		 });
	        	});
            });
        	
        	function search(){
        		//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
        		console.log($("#sel1").val())
 		 		console.log($("#keyword").val())
 		 		$('.features *').remove();
	       		 $.ajax({
	       			 type: "GET"
	 				,url : 'search.do'								// 요청 url
	 			  ,data : { type : $("#sel1").val()		// 요청 데이터, 어디로 갈건지
		  		  ,condition : $("#keyword").val()}		// 데이터 어떻게 할건지						// 응답 받는 데이터 타입
	 			  ,success  :  function(data){					// 성공 했을때 처리
	 				  console.log(data)
	 			  }
	 			  ,error : function(err){						// 에러 났을때 처리
	 				  console.log(err)
	 			  }
 		 		})
        	}
        	
        </script>
<nav class="navbar navbar-default navbar-fixed-top">
        
            	<div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="main.do">
                    <img class="navbar-brand2" src="img/header-logo.jpg">
                </a>
            	</div>
            	<div class="collapse navbar-collapse" id="myNavbar">
	                <ul class="nav navbar-nav navbar-right">
	                    <li><a href="#notice">공지 사항</a></li>
	                    <li><a href="foodlist.do">상품 정보</a></li>
	                    <li><a href="#bestfood">베스트 섭취 정보</a></li>
	                    <li><a href="#myfood">내 섭취 정보</a></li>
	                    <li><a href="#prediction">예상 섭취 정보</a></li>
	                    <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
	                    <li><a href="" id="sign"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
	                    <li><a href="" data-toggle="modal" data-target="#modalLoginForm" id="login"><span class="glyphicon glyphicon-log-in">
	                                Login</span></a></li>
	        
	                </ul>
                
            </div>
    		<!-- 로그인 모달창 -->
            <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <form action="login.do" method="get"  id="frm">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h4 class="modal-title w-100 font-weight-bold">로그인</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body mx-3">
                            <div class="md-form mb-5">
                                <i class="fas fa-envelope prefix grey-text"></i>
                                <input type="text" name="id" id="id" class="form-control validate">
                                <label data-error="wrong" data-success="right" for="id">Your ID</label>
                            </div>
        
                            <div class="md-form mb-4">
                                <i class="fas fa-lock prefix grey-text"></i>
                                <input type="password" name="pw" id="pw" class="form-control validate">
                                <label data-error="wrong" data-success="right" for="pw">Your PW</label>
                            </div>
        
                        </div> 
                        <div class="modal-footer d-flex justify-content-center">
                        	<input type="button" id="findPW" value="비밀번호 찾기">
                            <input type="submit" value="Login">
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </nav>
</nav>

