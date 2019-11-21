<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>���� ������</title>
        <meta charset="UTF-8">
        <!-- �������� �ּ�ȭ�� �ֽ� CSS -->
        <script src="./js/jquery-3.3.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- �ΰ����� �׸� -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="./css/food.css">
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./font/cssFont/all.css">

</head>
<body>

<div id="nav">
   <jsp:include page="/nav.jsp"/>
</div>
        <div class="bg-1">
            <div>
                <br /><br /><br /><br /><br /><br />
            </div>
        </div>
<!-- ���� ����Ʈ  -->
 <div class="container conta">
            <section>
               	<div id="best">
            		<a class="btn btn-warning" href='filter.do'>��õ ��ǰ</a>
            	</div>
            	<form method="post" action="sort.do">
            	<div><p>���Ĺ��</p>
            		<select name="sort">
            			<option value="no">��ȣ</option>
            			<option value="name">�̸�</option>
            			<option value="kal">Į�θ�</option>
            		</select>
            		<input type="submit" name="type" value="��������">
            		<input type="submit" name="type" value="��������">
            	</div>
            	</form>
                <div class="features2">
                <c:forEach items='${list }' var='food'>
					<article><span><img src="${food.image}" class="listimg"></img></span>
					<div class='content'><h3><a class = 'goDetailInfo' href ='test.do?name=${food.name }'>${food.name }</a></h3>
					<a class="a"><i class="far fa-calendar-alt"> Feb.2017</i></a> &nbsp; <a href="test.do?name=${food.name }" class="a">  <i class="fas fa-external-link-alt">  View detail</i></a><hr><p>
                	${food.material }
                	<p class="b"><a href="#" class="btn-info"><i class="fas fa-plus-square"> �߰�</i></a> <a href="#" class="btn-info"><i class="fas fa-shopping-bag"> ��</i></a></p></div></article>
                </c:forEach>
                </div>
            </section>
        </div>
        <footer class="text-center">
            <jsp:include page="/copyright.jsp"/>
        </footer>
</body>
</html>