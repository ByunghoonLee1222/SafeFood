<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        		var isLogin = false;
                var name = '<%= (String)session.getAttribute("id") %>';
                if (name != "null") {
                	console.log("!!")
                    $('#sign').text(name + " 회원 정보");
                    $('#login').text("로그아웃");
                    $('#sign').attr("href", "memberinfo.do");
                    $('#login').attr("data-target", "#");
                    $('#login').attr("href", "logout.do");
                    isLogin = true;
    			}
                else{
                	$('#sign').attr("href", "signup.jsp");
                    $('#login').attr("data-target", "#modalLoginForm");
                }
                $('#login').click(function () {
                    if (isLogin) {
                        alert('로그아웃 됐습니다.');
                        isLogin=false;
                        location.reload();
                    }
                })
                
                $('#delete').click(function(){
                	console.log("!!")
                	if(confirm("회원 탈퇴 하시겠습니까??")){
                		response.sendRedirect("delete.do");
                		window.location.href="delete.do"

                	};
                	
                })
                
                var line = "${member.material}".split(",");
                line.forEach(function(e){
                	console.log(e)
                	document.getElementById(e).checked = true;
                })
                
                
            });
        	
        </script>
</head>
    <body>
		<div id="nav">
   <jsp:include page="/nav.jsp"/>
</div>

        <div class="container">
            <!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
            <div class="row">
                <br /><br /><br /><br />
                <h1 class="text-center">회원 정보 조회</h1>
            </div>
            <!--// 헤더 들어가는 부분 -->
    
            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
            <hr />
            <!-- 본문 들어가는 부분 -->
    
            <form class="form-horizontal" role="form" 	method="post" action="updateMem.do">
    
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                    	<input type="text" class="form-control" name="id" value="${member.id}" readonly="readonly">
                    </div>
                </div>
                <div class="form-group" id="divPw">
                    <label for="inputPw" class="col-lg-2 control-label">비밀번호</label>
                    <div class="col-lg-10">
                    	<input type="password" class="form-control" name="password" value="${member.password}">
                    </div>
                </div>
    
                <div class="form-group" id="divName">
                    <label for="inputNamer" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                    	<input type="text" class="form-control" name="name" value="${member.name}">
                    </div>
                </div>
                
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                    	<input type="text" class="form-control" name="email" value="${member.email}">
                    </div>
                </div>
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                    	<input type="text" class="form-control" name="phoneNumber" value="${member.phone}">
                    </div>
                </div>
                
                <div class="form-group" id="divAddress">
                    <label for="inputAddress" class="col-lg-2 control-label">주소</label>
                    <div class="col-lg-10">
                    	<input type="text" class="form-control" name="address" value="${member.address}">
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label for="inputEmailReceiveYn" class="col-lg-2 control-label">알레르기</label>
                    <fieldset id="checkbox-group" >
                        <legend>Check</legend>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="대두" value="대두">대두
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="땅콩" value="땅콩">땅콩
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="우유" value="우유">우유
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="게" value="게">게
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="새우" value="새우">새우
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="참치" value="참치">참치
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="연어" value="연어">연어
                        </label>
                        <label class="checkbox-inline checkbox-">
                            <input type="checkbox" name="material" id="쑥" value="쑥">쑥
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="소고기" value="소고기">소고기
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="닭고기" value="닭고기">닭고기
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="돼지고기" value="돼지고기">돼지고기
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="복숭아" value="복숭아">복숭아
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="민들레" value="민들레">민들레
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" id="계란흰자" value="계란흰자">계란흰자
                        </label>
                    </fieldset>
                </div>
                
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-info">수정</button>
                    </div>
                </div>
            </form>
            <form class="form-horizontal" method="post" action="delete.do">
            <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-warning" id="delete">회원 탈퇴</button>
                    </div>
                </div>
            </form>
    			
            <!--// 본문 들어가는 부분 -->
            <hr />
            <!-- 푸터 들어가는 부분 -->
    
           <footer class="text-center">
            <jsp:include page="/copyright.jsp"/>
        </footer>
            <!--// 푸터 들어가는 부분 -->
        </div>
    </body>
</html>