<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Select Key</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/live5/00.bs4.css" />
	<style>
		.search_dropdown_content {
			display: none;
			position: absolute;
			background-color: white;
			min-width: 35%;
			box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
			z-index: 1;
			margin-left: 15%;
		}
	</style>
</head>
<body>
	<div class="container">
		<%@ include file="/live5/00.bs4_header.jsp" %>
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2>Select Key Test Page</h2>
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
	$("#searchTxt").keyup(function() {
		$(".search_dropdown_content").css("display", "none");
		$("#searchResult").empty();
		$.get("${pageContext.request.contextPath}/DSelectKeyController"
				, {command:'search_window', search_input:$("#searchTxt").val()}
				, function(data, status) {
					if(status == "success"){
						$(".search_dropdown_content").css("display", "block");
						$.each(data, function(index, vo) {
							let str = "<span class='classForClcik'>"
							+vo.key_word+"</span><br>";
							$("#searchResult").append(str);
						});//each
						$("span[class=classForClcik]").on("click",function() {
				 			//alert($(this).text());
				 			$("#searchTxt").val($(this).text());
						});
					} else {
						alert("시스템 관리자에게 문의 바랍니다.");
					}
				}//function
				, "json"//!!!
		);//get
	});//click
});//ready
</script>
<h1>
	SEARCH : <input type="text" id="searchTxt" size="33">
	<div id="searchResult" class="search_dropdown_content"></div>
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
