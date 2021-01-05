<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보수정</title>
	
	 <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
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
	
		<style>
		label, h1{font-family: 'Do Hyeon', sans-serif;}
		
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
		            <h1> 내 정보 수정 </h1>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	
	
	
	
	$("#mbr_addr1").click(function(){//daum address
	    new daum.Postcode({
	        oncomplete: function(data) {
 	        	$("#mbr_addr1").val(data.address);
	        }//oncomplete
	    }).open();
	});//click

	$("#mbr_pwd_register").change(function(){
		$("#pwd_chk_res").text("");
		if($("#mbr_pwd_register").val() == ''){
			return;
		}
	    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$/.test($("#mbr_pwd_register").val())){            
	        $("#pwd_chk_res").text(" 비밀번호의 형식이 잘못되었습니다. 형식:(영문 대소문자+숫자+특수문자 전부 조합, 8~20자)");
	        $('#mbr_pwd_register').val('').focus();
	        return;
	    }//pwd 형식    
	});//change
	$("#mbr_pwd_register_re").change(function(){
		$("#pwd_chk_res").text("");
		if($("#mbr_pwd_register_re").val() == ''){
			return;
		}
		if($("#mbr_pwd_register_re").val() != $("#mbr_pwd_register").val()){
			$("#pwd_chk_res").text(" 패스워드를 다시 확인해 주세요.");
			$("#mbr_pwd_register_re").val('');
		}
	});//change
	$("#mbr_nm").change(function(){
		$("#nm_chk_res").text("");
		if($.trim($("#mbr_nm").val()) == ''){
	        $("#nm_chk_res").text(" 이름은 필수 입력입니다. 형식:(20자 이내)");
	        $('#mbr_nm').val('').focus();
	        return;
		}
	});//change
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
	
	$("#mbr_pwd_register").val("${user_sessionuser_session.userpwd}");
	$("#mbr_nm").val("${user_session.username}");
	$("#mbr_tel").val("${user_session.telephone}");
	$("#mbr_email").val("${user_session.email}");
	$("#mbr_addr1").val("${user_session.address}");
	
});//ready
</script>
<script>
$(document).ready(function(){
	$("#delete_btn").click(function(){
		$.post(
				"${pageContext.request.contextPath}/delete.do"
				,{
					mbr_id: "${user_session.userid}"
				}
				,function(data,status){
					if(status == "success"){
							alert("회원탈퇴완료");
							location.href="${pageContext.request.contextPath}/main";
					} else {
						alert("시스템 관리자에게 문의 바랍니다.");
					}
				}
		);
	});
	$("#join_btn").click(function() {
		//alert($("#mbr_id_register").val());
		//alert($.trim($("#mbr_id_register").val()))
		if($.trim($("#mbr_pwd_register").val()) == ''){
			alert("Password를 입력해 주세요.");
			return;
		}
	
		if($.trim($("#mbr_nm").val()) == ''){
			alert("Name을 입력해 주세요.");
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
		if($.trim($("#mbr_addr1").val()) == ''){
			alert("Address를 입력해 주세요.");
			return;
		}
		$.post(
				"${pageContext.request.contextPath}/modify.do"
				,{
					mbr_id: "${user_session.userid}"
					,mbr_pwd:$("#mbr_pwd_register").val()
					,mbr_nm:$("#mbr_nm").val()
					,mbr_tel:$("#mbr_tel").val()
					,mbr_email:$("#mbr_email").val()
					,mbr_addr:$("#mbr_addr1").val() + " " + $("#mbr_addr2").val()
				}
				,function(data,status){
					if(status == "success"){
							alert("회원정보수정완료! 다시로그인해주세요!");
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
	<label for="mbr_pwd_register"><strong>User Password (* 20자 이내) <span id="pwd_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="mbr_pwd_register" name="mbr_pwd_register" class="form-control mb-3" placeholder="Password" maxlength="20" required="required" />

	<label for="mbr_nm"><strong>User Name (* 10자 이내) <span id="nm_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="mbr_nm" name="mbr_nm" class="form-control mb-3" placeholder="Name" maxlength="10" required="required" />

	<label for="mbr_tel"><strong>User CellPhone (* 20자 이내) <span id="tel_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="mbr_tel" name="mbr_tel" class="form-control mb-3" placeholder="01055557777" maxlength="20" required="required" />

	<label for="mbr_email"><strong>User E-mail (* 50자 이내) <span id="email_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="mbr_email" name="mbr_email" class="form-control mb-3" placeholder="example@example.com" maxlength="50" required="required" />

	<label for="mbr_addr1"><strong>User Address (*)</strong></label>
	<input type="text" id="mbr_addr1" name="mbr_addr1" class="form-control mb-3" readonly="readonly" placeholder="Click!" required="required" />

	<label for="mbr_addr2"><strong>User Address 2 (50자 이내)</strong></label>
	<input type="text" id="mbr_addr2" name="mbr_addr2" class="form-control mb-3" placeholder="주소 상세" maxlength="50" />

	<button type="button" id="join_btn" class="btn btn-primary btn-block">정보수정</button>
	<button type="button" id="delete_btn" class="btn btn-primary btn-block">회원탈퇴</button>
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
