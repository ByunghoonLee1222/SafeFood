<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <!-- Bootstrap -->
        <script src="./js/jquery-3.3.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- 부가적인 테마 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="./css/food.css">
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./font/cssFont/all.css"></head>
<body>
		<div id="nav">
   <jsp:include page="/nav.jsp"/>
</div>
        
        <div class="container">
            <!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
            <div class="row">
                <br /><br /><br /><br />
                <h1 class="text-center">회원 가입</h1>
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
    
            <form class="form-horizontal" role="form" method="post" action="memberregit.do">
    
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="id" data-rule-required="true"
                            placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="password" name="password"
                            data-rule-required="true" placeholder="패스워드" maxlength="30">
                    </div>
                </div>
                
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="name" name="name" data-rule-required="true"
                            placeholder="한글만 입력 가능합니다." maxlength="15">
                    </div>
                </div>
    			<div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="email" name="email" data-rule-required="true"
                            placeholder="이메일 입력" maxlength="15">
                    </div>
                </div>
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="phoneNumber" data-rule-required="true"
                            placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                    </div>
                </div>
                <div class="form-group" id="divAddress">
                    <label for="inputAddress" class="col-lg-2 control-label">주소</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="address" name="address" data-rule-required="true"
                            placeholder="주소 입력" maxlength="15">
                    </div>
                </div>
    
                <div class="form-group">
                    <label for="inputEmailReceiveYn" class="col-lg-2 control-label">알레르기</label>
                    <fieldset id="checkbox-group" >
                        <legend>Check</legend>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="대두">대두
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="땅콩">땅콩
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="우유">우유
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="게">게
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="새우">새우
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="참치">참치
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="연어">연어
                        </label>
                        <label class="checkbox-inline checkbox-">
                            <input type="checkbox" name="material" value="쑥">쑥
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="소고기">소고기
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="닭고기">닭고기
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="돼지고기">돼지고기
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="복숭아">복숭아
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="민들레">민들레
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="material" value="계란흰자">계란흰자
                        </label>
                    </fieldset>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-info">등록</button>
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