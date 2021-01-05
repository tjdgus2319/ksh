<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Modify User Info</title>
	
	<!-- get google font -->
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet"> 
 <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
	   <!-- Bootstrap core CSS -->
	  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	  <!-- Custom fonts for this template -->
	  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	
	  <!-- Custom styles for this template -->
	  <link href="${pageContext.request.contextPath}/css/clean-blog.min.css" rel="stylesheet">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
	  <style type="text/css">
  	a,h1, label{font-family: 'Do Hyeon', sans-serif;},
  	dd{	font-family: 'Noto Serif KR', serif;}
  	.headerfont{font-family: 'Do Hyeon', sans-serif;}
  	header.masthead .overlay {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    background-color: #1BB1E7;
    opacity: .5;
}
header.masthead {
	height: 300px;
    margin-bottom: 50px;
    background: no-repeat center center;
    background-color: #FFFFFF;
    background-attachment: scroll;
    position: relative;
    background-size: cover;
}

header.masthead .page-heading, header.masthead .post-heading, header.masthead .site-heading {
    padding: 120px 0;
}
  </style>
</head>

<body>
	<div class="masthead">
		<%@ include file="/header.jsp" %>
		  <header class="masthead" style=" height : 300px; ">
		    <div class="overlay"></div>
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-8 col-md-10 mx-auto">
		          <div class="site-heading">
		            <h1> 비밀번호 찾기 </h1>
		            <span class="subheading">
		            	 
		             </span>
		          </div>
		        </div>
		      </div>
		    </div>
  		</header>
		<!-- section start -->
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 450px;">
				<div class="card-body">

<!-- here start -->
<script>
$(document).ready(function(){
	
	$("#mbr_id_register").change(function(){//id check
		$("#id_chk_res").text("");
		$("#id_chk_res").removeClass("text-primary");
		$("#id_chk_res").removeClass("text-danger");
		if($("#mbr_id_register").val() == ''){
			return;
		}
		if(!/^(?=.*[a-z])(?=.*[0-9]).{6,20}$/.test($("#mbr_id_register").val())){            
			$("#id_chk_res").text(" 아이디의 형식이 잘못되었습니다. 형식:(영문 소문자/숫자, 6~20자)");
			$("#id_chk_res").toggleClass("text-danger");
	        $('#mbr_id_register').focus();
	        return;
		}
	});//id 형식
	$("#mbr_tel").change(function(){
		$("#tel_chk_res").text('');
		if($("#mbr_tel").val() == ''){
			return;
		}
		var numStd = /^[0-9]+$/;
		if($("#mbr_tel").val().match(numStd)){
			//alert("ok");
		}else{
			$("#tel_chk_res").text(" 숫자만 입력 가능한 필드 입니다. 형식:(01055557777, 6~20자)");
			$("#mbr_tel").val('');
			return;
		}
	});//change
	$("#mbr_email").change(function(){
		$("#email_chk_res").text('');
		if($("#mbr_email").val() == ''){
			return;
		}
	    if(!/^(?=.*[a-zA-Z0-9])(?=.*[@.]).{6,20}$/.test($("#mbr_email").val())){            
	        $("#email_chk_res").text(" 이메일의 형식이 잘못되었습니다. 형식:(example@examle.com, 8~20자)");
	        $('#mbr_email').val('').focus();
	        return;
	    }
	});//change
	

});//ready
</script>
<script>
$(document).ready(function(){

	$("#find_btn").click(function() {
		//alert($("#mbr_id_register").val());
		//alert($.trim($("#mbr_id_register").val()))
		if($.trim($("#mbr_id_register").val()) == ''){
			alert("ID를 입력해 주세요.");
			return;
		}
		if($.trim($("#mbr_tel").val()) == ''){
			alert("CellPhone을 입력해 주세요.");
			return;
		}
		if($.trim($("#mbr_email").val()) == ''){
			alert("E-mail을 입력해 주세요.");
			return;
		}
		$.post(
				"${pageContext.request.contextPath}/find_pw.do"
				,{
					 mbr_id: $("#mbr_id_register").val()
					,mbr_tel:$("#mbr_tel").val()
					,mbr_email:$("#mbr_email").val()
				
				}
				,function(data,status){
					if(status == "success"){
							alert("비밀번호 : " + data);
							location.href="${pageContext.request.contextPath}/main.jsp";
					} else {
						alert("시스템 관리자에게 문의 바랍니다.");
					}
				}
		);//post
	});//click
});//ready
</script>
<form id="join_form" name="join_form" method="post">
	<label for="mbr_id_register"><strong>User ID (* 20자 이내) <span id="id_chk_res"></span></strong></label>
	<input type="text" id="mbr_id_register" name="mbr_id_register" class="form-control mb-3" placeholder="ID" maxlength="20" required="required" />

	
	<label for="mbr_tel"><strong>User CellPhone (* 20자 이내) <span id="tel_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="mbr_tel" name="mbr_tel" class="form-control mb-3" placeholder="01055557777" maxlength="20" required="required" />

	<label for="mbr_email"><strong>User E-mail (* 50자 이내) <span id="email_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="mbr_email" name="mbr_email" class="form-control mb-3" placeholder="example@example.com" maxlength="50" required="required" />

	<button type="button" id="find_btn" class="btn btn-primary btn-block">비밀번호 찾기</button>
</form>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-dark rounded mt-1"></footer>
	</div>
</body>
</html>
