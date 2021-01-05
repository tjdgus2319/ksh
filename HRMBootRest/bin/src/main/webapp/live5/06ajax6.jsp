<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>AJAX6</title>
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
					<h2>AJAX6</h2>
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
	let colorArr = ['table-primary','table-success','table-danger'];
	$("#btn6").click(function() {
		$.get(
				"${pageContext.request.contextPath}/AjaxController"
				, {command:'ajax4'}
				, function(data, status){
					if(status == 'success') {
						//$("tbody").empty();
						$.each(data, function(index, vo) {
							let str = "<tr class="+colorArr[index%3]+">"
							+ "<td>" + vo.articleno + "</td>"
							+ "<td>" + vo.subject + "</td>"
							+ "<td>" + vo.userid + "</td>"
							+ "<td>" + vo.regtime + "</td></tr>";
							$("tbody").append(str);
						});//each
					} else {
						$("#btn4_res").append("<p>"+status+"</p>");
					}
				}//function
				, "json"
		);//get
	});//click
	$(document).ajaxStart(function(){
		alert("ajaxStart");
	});
	$(document).ajaxSend(function(e, xhr, opt){
		alert("ajaxSend");
	});
	$(document).ajaxSuccess(function(){
		alert("ajaxSuccess");
	});
	$(document).ajaxComplete(function(){
		alert("ajaxComplete");
	});
	$(document).ajaxStop(function(){
		alert("ajaxStop");
	});
	$(document).ajaxError(function(){
		alert("ajaxError");
	});
});//ready
</script>
<h2>
	<button id="btn6">Get Json from Server</button>
</h2>
<h2 id="btn6_res">
	AJAX = Asynchronous JavaScript and XML.<br>
</h2>
<table class="table">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
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
