<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ID Check</title>
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
					<h2>ID Check Test Page</h2>
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
<script>
	$(document).ready(function() {
		$("#idCheck").click(function() {
			$.get("${pageContext.request.contextPath}/BIdCheckController"
					,{command:'id_check', id_input:$("#idCheckTxt").val()}
					, function(data, status) {
						if(status == "success"){
							if(data > 0) {
								$("#idCheckResult").css("color","red");
								$("#idCheckResult").text("이미 존재하는 ID 입니다.");
							} else if(data == 0) {
								$("#idCheckResult").css("color","blue");
								$("#idCheckResult").text("사용 가능한 ID 입니다.");
							} else if(data == -1) {
								alert("시스템 관리자에게 문의 바랍니다.");
							}
						} else {
							alert("시스템 관리자에게 문의 바랍니다.");
						}//status
					}//function
			);//get
		});//click
	});//ready
</script>
<h1>
	ID : <input type="text" id="idCheckTxt" > <button id="idCheck">ID 중복 체크</button>
	<p id="idCheckResult"></p>
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
