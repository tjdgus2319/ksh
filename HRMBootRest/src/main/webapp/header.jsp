<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/Web/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/Web/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/Web/css/clean-blog.min.css" rel="stylesheet">
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		.mainfont {font-family: 'Black Han Sans', sans-serif;}
		a {font-family: 'Jua', sans-serif;}
		#mainNav .navbar-nav>li.nav-item>a {
		
    font-size: 14px;
    font-weight: 800;
    letter-spacing: 1px;
    text-transform: uppercase;
    color : #262223;
}	
	</style>
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" style='color : #262223' href="${pageContext.request.contextPath}/main.jsp">SSAFY 3rd</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/main.jsp">메인페이지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/about.jsp">주택검색</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/post.jsp">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/qna.do">QNA
          </a>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/news.jsp">주택관련뉴스</a>
          </li>
         
         <li class="nav-item">
         	<a id="spanForSignUp" href="${pageContext.request.contextPath}/login/join_member.jsp">회원가입</a></li>
		<li class="nav-item">
			<a href="#">
			<span id="spanForLogin" data-toggle="modal" data-target="#loginModal">로그인</span></a>
		</li>
			<li class="nav-item"><a href="#">
					<span id="spanForID" style="display: none;"></span>
					<span id="spanForLogout" style="display: none;">로그아웃</span></a>
			</li>
			<li class="nav-item"><a href="${pageContext.request.contextPath}/login/modify.jsp">
					<span id="spanForMyinfo" style="display: none;">내정보수정</span></a>
			</li>
			<li class="nav-item"><a href="${pageContext.request.contextPath}/login/searchpw.jsp">
					<span id="spanforpw" style="display: inline;">비밀번호찾기</span></a>
			</li>
			
			<li class="nav-item"><a href="${pageContext.request.contextPath}/login/searchmemberinfo.jsp">
					<span id="spanforadmin" style="display: none;">회원검색</span></a>
			</li>
			
        </ul>
      </div>
    </div>
  </nav>
  <!-- login modal start -->
		<div class="modal" id="loginModal">
			<div class="modal-dialog modal-md" style="vertical-align: middle;">
				<div class="modal-content">
					<!-- ModalHeader -->
					<div class="modal-header">
						<h4 class="modal-title">LogIn</h4>
						<button type="button" class="close dataDismiss" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<div class="form-group">
							<label for="mbr_id">ID:</label>
							<input type="text" id="mbr_id" class="form-control" placeholder="Enter ID">
						</div>
						<div class="form-group">
							<label for="mbr_pwd">Password:</label>
							<input type="password" id="mbr_pwd" class="form-control" placeholder="Enter Password">
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" id="modalLogInBtn" class="btn btn-primary" data-dismiss="modal">LogIn</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- login modal end -->
		<!-- login script start -->
		<script>
		$(document).ready(function() {
			if(${user_session != null && user_session.userid != null && user_session.userid != ''}) {
				$("#spanForLogin").css("display","none");
				$("#spanForID").text(" ${user_session.userid}님 ");
				$("#spanForID").css("display","inline");
				$("#spanForLogout").css("display","inline");
				$("#spanForMyinfo").css("display","inline");
				$("#spanForSignUp").css("display","none");
				if("${user_session.userid}"=="admin"){
					$("#spanforadmin").css("display","inline");
				}
				$("#spanforpw").css("display","none");
			} else {
				$("#spanForLogin").css("display","inline");
				$("#spanForID").text("");
				$("#spanForID").css("display","none");
				$("#spanForLogout").css("display","none");
				$("#spanForMyinfo").css("display","none");
				$("#spanForSignUp").css("display","inline");
				$("#spanforadmin").css("display","none");
				$("#spanforpw").css("display","inline");
				
			}
		});//ready
		$(document).ready(function() {
			$("#modalLogInBtn").click(function() {
				if($.trim($("#mbr_id").val()) == ''){
					alert("ID를 입력해 주세요.");
					return;
				}
				if($.trim($("#mbr_pwd").val()) == ''){
					alert("Password를 입력해 주세요.");
					return;
				}
				$.post(
						"${pageContext.request.contextPath}/login.do"
						,{
							 mbr_id:$("#mbr_id").val()
							,mbr_pwd:$("#mbr_pwd").val()
						}
						, function(data, status) {
							if(status == "success"){
								
								if(data[0].message_code == "-1") {
									alert("시스템 관리자에게 문의 바랍니다.");
								} else if(data[0].message_code == "0"){
									alert("잘못된 ID 또는 Password 입니다.");
								} else {
									alert("로그인 완료");
									$("#spanForLogin").css("display","none");
									$("#spanForID").text(" "+data[0].userid+"님 ");
									$("#spanForID").css("display","inline");
									$("#spanForLogout").css("display","inline");
									$("#spanForSignUp").css("display","none");
									$("#spanForMyinfo").css("display","inline");
									if($("#mbr_id").val() =="admin"){$("#spanforadmin").css("display","inline");}
									$("#spanforpw").css("display","none");
									location.href="${pageContext.request.contextPath}/main.jsp";
								}
							} else {
								alert("시스템 관리자에게 문의 바랍니다.");
							}
						}//function
						, "json"
				);//post
			});//click
			$("#spanForLogout").click(function() {
				$.post(
						"${pageContext.request.contextPath}/logout.do"
						, function(data, status) {
							if(status == "success"){
								 
									$("#spanForLogin").css("display","inline");
									$("#spanForID").text("");
									$("#spanForID").css("display","none");
									$("#spanForLogout").css("display","none");
									$("#spanForSignUp").css("display","inline");
									$("#spanForMyinfo").css("display","none");
									$("#spanforadmin").css("display","none");
									$("#spanforpw").css("display","inline");
									alert("로그아웃 되었습니다.");
									location.href="${pageContext.request.contextPath}/main.jsp";
								} else {
									alert("시스템 관리자에게 문의 바랍니다.");
								}
							} //function
						, "json"
				);//post
			});//click
		});//ready
		</script>
</body>
</html>