<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>주택 상세페이지</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- Custom styles for this template -->
<link href="css/clean-blog.min.css" rel="stylesheet">

<style type="text/css">
.headerfont {
	font-family: 'Do Hyeon', sans-serif;
}

td {
	font-family: 'Jua', sans-serif;
	text-align: center;
}

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

header.masthead .page-heading, header.masthead .post-heading, header.masthead .site-heading
	{
	padding: 120px 0;
}

h1, th, input, option, label, select {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>

	<!-- Page Header -->
	<header class="masthead">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h2>주택 실거래가 상세정보</h2>
						<span class="subheading">이 집 꼭 사세요</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container" align="center">
		<table class="table thead-dark" id="info">
			<tbody>
				<tr>
					<td>거래번호</td>
					<td>법정동코드</td>
					<td>법정동</td>
					<td>지번</td>
					<td>아파트이름</td>
					<td>건축연도</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td>${deal.no}</td>
					<td>${deal.code}</td>
					<td>${deal.dong}</td>
					<td>${deal.jibun}</td>
					<td>${deal.aptName}</td>
					<td>${deal.buildYear}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
		<div class="col-sm-6">


			<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>

		</div>
		<div class="col-sm-6">
			<div style="width: 100%; height: 500px; margin: auto;">맛집정보
				들어가는 곳 + 지하철 + 외국인 등등.. + 뒤로가기 버튼</div>
		</div>
	</div>
	<hr>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDb-NTWjm6JVKOPkP7b5F72nz7pIUYbWkY&callback=initMap"></script>
	<script>
		var multi = {lat: ${deal.lat}, lng: ${deal.lng}};
		var map;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center: multi, zoom: 18
			});
			 
			  var marker = new google.maps.Marker({
				    position: multi,
				    animation: google.maps.Animation.BOUNCE,
				    map: map,
				    title: 'apt'
				  });
			  marker.setMap(map);
		}
		
	</script>
	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<ul class="list-inline text-center">
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<p class="copyright text-muted">Copyright &copy; Your Website
						2019</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/clean-blog.min.js"></script>

</body>

</html>
