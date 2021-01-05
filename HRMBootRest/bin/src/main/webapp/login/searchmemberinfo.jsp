<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Modify User Info</title>
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
</head>

<body>
	<div class="masthead">
		<%@ include file="/Web/header.jsp" %>
		  <header class="masthead" >
		    <div class="overlay"></div>
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-8 col-md-10 mx-auto">
		          <div class="site-heading">
		            <h1> 관리자페이지 </h1>
		            <span class="subheading">
		            	회원검색
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
<table class="table mb-5">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody id="brd_list_tbody">
	</tbody>
</table>
<script>
$(document).ready(function(){
	$.get(
			"${pageContext.request.contextPath}/CJoinMemberController",
			 {
				command:'searchallmember'
			}
			,function(data,status){
				if(status == "success"){
					$("#brd_list_tbody").empty();
					if(data.length > 0){
						$.each(data, function(index, obj) {
							let str = "<tr><td>"
								+obj.userid+"</td><td>"
								+obj.username+"</td><td>"
								+obj.tel+"</td><td>"
								+obj.email+"</td><td>"
								+obj.add+"</td></tr>";
							$("#brd_list_tbody").append(str);
							
						});//each
					} else {
						alert("조회된 Data가 없습니다.");
					}
				} else {
					alert("시스템 관리자에게 문의 바랍니다.");
				}
			}//function
			, "json"
	);//get

});//ready
</script>


<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-dark rounded mt-1"></footer>
	</div>
</body>
</html>
