<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Format</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/live5/00.bs4.css" />
</head>
<body>
	<div class="container">
		<%@ include file="/live5/00.bs4_header.jsp" %>
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2>Join Member</h2>
				</div>
			</div>
		</div>
		</section>
		<!-- End Breadcrumbs -->
		<!-- section start -->
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 450px;">
				<div class="card-body">

<!-- here start -->
<script >
$(document).ready(function(){
	$("#idcheck").click(function(){
		if(document.getElementById("id_txt").value != ""){
			$.get(
					"${pageContext.request.contextPath}/BIdCheckController",
					{command : "id_check", id_input:$("#id_txt").val()},
					function(data , status){
						if( status =='success'){
							if(data == 1){
								alert("ID가 중복되었습니다 다른아이디를 사용해주세요");
								$("id_check").text('');
								document.getElementById("id_txt").value='';
							} //통신만 잘된거지 데이터를 성공적으로 가져온거하곤 다른 이야기 
							else if (data == -1){
								alert("관리자에게 문의하세요!");
							} else if(data == 0){
								alert("사용가능한 아이디입니다.");
								$("#isOk").text('사용가능한아이디입니다!');
							}
						} else {
							// 통신 에러
							alert("통신 error");
						}
					}
			)
		} else {
			alert("아이디입력!");
		}
	}); // click
}); // ready
</script>

<h1>
	<form class="was-validated">
	 		<div class="form-group">
				ID : <input type= "text" class="form-control" id="id_txt" required> 
				 <div class="valid-feedback" id="isOk"> 여기에 중복돼었는지 여부를 표시해준다. </div>
    			 <div class="invalid-feedback"> 아이디를 입력하세요 </div>
				 <button id="idcheck"> ID 중복 체크 </button>
			</div>
			<div class="form-group">
				PW : <input type= "password" class="form-control" required> 
				<div class="valid-feedback">입력완료</div>
    			 <div class="invalid-feedback">비밀번호를 입력하세요</div>
			</div>
			<div class="form-group">
				Name : <input type= "text"  class="form-control" required> 
				<div class="valid-feedback"></div>
    			 <div class="invalid-feedback">이름을 입력하세요</div>
			</div>
			<div class="form-group">
				Phone : <input type= "text" class="form-control" required> 
				<div class="valid-feedback"></div>
    			 <div class="invalid-feedback">핸드폰번호를 입력하세요</div>
			</div>
			<div class="form-group">
				E-mail : <input type= "text"  class="form-control" required>
				<div class="valid-feedback"></div>
    			 <div class="invalid-feedback">이메일을 입력하세요</div>
			</div>
			<div class="form-group">
				Address : <input type= "text" class="form-control" required>
				<div class="valid-feedback"></div>
    			<div class="invalid-feedback">주소를 입력하세요</div>
			</div>
		<button type="submit" class="btn btn-primary">Join Us!</button>
	</form>
	
</h1>

<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-dark rounded mt-1"></footer>
	</div>
</body>
</html>
