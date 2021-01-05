<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>AJAX3</title>
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
					<h2>AJAX3</h2>
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
	$("#btn3").click(function() {
		$.ajax({
			type:"get"
			, dataType:"xml"
			, async:true
			, url:"${pageContext.request.contextPath}/AjaxController"
			, data:{command:"ajax3"}
			, success:function(data, status){
				let colorArr = ['table-primary','table-success','table-danger'];
				//$("tbody").empty();
				$(data).find("item").each(function(idx) {
					let str = "<tr class="+colorArr[idx%3]+">"
					+ "<td>" + $(this).find("건축년도").text() + "</td>"
					+ "<td>" + $(this).find("법정동").text() + "</td>"
					+ "<td>" + $(this).find("아파트").text() + "</td>"
					+ "<td>" + $(this).find("지번").text() + "</td>"
					+ "<td>" + $(this).find("지역코드").text() + "</td></tr>";
					$("tbody").append(str);
				});
			}
			, error:function(data, status){
				$("#btn3_res").append("<p>"+status+"</p>");
			}
		});//ajax 기본 format
	});//click
});//ready
</script>
<h2>
	<button id="btn3">Get Xml from Server</button>
</h2>
<h2 id="btn3_res">
	AJAX = Asynchronous JavaScript and XML.<br>
</h2>
<table class="table">
	<thead>
		<tr>
			<th>건축년도</th>
			<th>법정동</th>
			<th>아파트</th>
			<th>지번</th>
			<th>지역코드</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-dark rounded mt-1"></footer>
	</div>
</body>
</html>
