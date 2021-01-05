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

<title>주택검색</title>
<link
	href="${pageContext.request.contextPath}/Web/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&display=swap"
	rel="stylesheet">
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
<!-- Custom styles for this template -->
<link href="css/clean-blog.min.css" rel="stylesheet">
<script type="text/javascript">
	function searchDeal() {
		document.getElementById("searchform").action = "${root}/searchall.do";
		document.getElementById("searchform").submit();
	}
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		searchDeal();
	}
</script>

<style type="text/css">
h1, th, input, option, label, select {
	font-family: 'Do Hyeon', sans-serif;
}

.form-control {
	font-size: 1.3rem;
}

select {
	text-align: center
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

.btn {
	font-size: 15px;
	font-weight: 800;
	padding: 11px 12px;
	margin: 0 0 5px 5px;
	letter-spacing: 2px;
	text-transform: uppercase;
	border-radius: 0.5rem;
	font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}
</style>
</head>

<body>
	<%@ include file="header.jsp"%>

	<!-- Page Header -->
	<header class="masthead">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>주택 매물 검색</h1>
						<span class="subheading">좋은집을 구해보세요!</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container" align="center">
		<!-- 인코딩필터 -->
		<form id="searchform" class="form-inline" action="">
			<input type='hidden' name='act' id='act' value='dealsearch' /> <input
				type="hidden" name="pg" id="pg" value="1"> <label
				class="checkbox-inline"> <input type="checkbox" name="type"
				value="APT_DEAL" checked> 아파트 매매
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="type" value="APT_RENT" checked> 아파트 전월세
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="type" value="HOUSE_DEAL" checked> 연립,주택 매매
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="type" value="HOUSE_RENT" checked> 연립,주택 전월세
			</label> <br /> <select class="form-control" name="key" id="key">
				<option value="dong" selected="selected">법정동</option>
				<option value="aptname">아파트이름</option>
			</select> <input type="text" class="form-control" placeholder="검색어 입력"
				name="word" id="word">
			<button type="button" class="btn btn-info btn-sm"
				onclick="javascript:searchDeal();">검색</button>

		</form>

		<c:if test="${deals == null}">
			<script>
				searchDeal();
			</script>
		</c:if>
		<table class="table table-hover" id="deals">
			<thead>
				<tr class="table-info" align="center">
					<th>거래번호</th>
					<th>행정동</th>
					<th>아파트이름</th>
					<th>거래금액</th>
					<th>거래종류</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test='${not empty deals}'>
						<c:forEach var="deal" items="${deals}">
							<tr
								onclick="location.href='${root}/searchforlat.do?dong=${deal.dong}&code=${deal.code}&jibun=${deal.jibun}'">
								<td>${deal.no}</td>
								<td>${deal.dong}</td>
								<td>${deal.aptName}</td>
								<td>${deal.dealAmount}</td>
								<td>${deal.type}</td>
							</tr>
						</c:forEach>
						<table>
							<tr>
								<td>${navigation.navigator}</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<tr align="center">
							<td colspan='5'>등록된 거래내역이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<hr>

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
