<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Happy House!</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
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
<link href="css/clean-blog.min.css" rel="stylesheet">
<style type="text/css">
.mainfont {
	font-family: 'Black Han Sans', sans-serif;
}

.navfont {
	font-family: 'Jua', sans-serif;
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
	margin-bottom: 10px;
	background: no-repeat center center;
	background-color: #FFFFFF;
	background-attachment: scroll;
	position: relative;
	background-size: cover;
}

.router-link-exact-active {
	color: red;
}

.table {
	margin: 20px auto;
}

#mainNav {
	border-bottom: 1px solid transparent;
	background: 0 0;
	background-color: #1BB1E7;
}
</style>

<!-- Custom styles for this template -->

<link rel=stylesheet
	href=https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css
	integrity=sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh
	crossorigin=anonymous>
<script
	src=https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js></script>
<link href=./js/app.f7bc39f3.js rel=preload as=script>
<link href=./js/chunk-vendors.c683c542.js rel=preload as=script>

</head>

<body>
	<!-- Navigation -->
	<%@ include file="header.jsp"%>

	<!-- Page Header -->
	<header class="masthead" style="background-image: url('img/logo5.png')">
		<!-- <div class="overlay"></div>  -->
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">
						<h1 class="mainfont">
							<font color="#1DCBF2">Happy</font> <font color="#1C8DA6">House</font>
						</h1>
						<span class="subheading">서울 10반 서상원 김성현</span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<script>
		function f5Key() {
			if (event.keyCode == 116) {
				event.keyCode = 0;
				event.cancelBubble = true;
				event.returnValue = false;
				location.href = "http://localhost:8080/happyhouse/main.jsp";
			}
		}
		document.onkeydown = f5Key;
	</script>
	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-10 mx-auto">
				<div class="post-preview">
					<%
						Document doc2 = Jsoup.connect(
							"https://www.google.co.kr/search?source=hp&ei=5yPnXqTPF56Ur7wPjO-WOA&q=%EC%BD%94%EB%A1%9C%EB%82%98+%ED%99%95%EC%A7%84%EC%9E%90&oq=%EC%BD%94%EB%A1%9C%EB%82%98+%ED%99%95%EC%A7%84%EC%9E%90&gs_lcp=CgZwc3ktYWIQAzIFCAAQgwEyBQgAEIMBMgUIABCDATICCAAyBQgAEIMBMgIIADICCAAyAggAMgIIADICCAA6BQgAELEDOgQIABAKUNcCWOcXYLoYaAdwAHgCgAGEAYgB-QySAQQ2LjEwmAEAoAEBqgEHZ3dzLXdperABAA&sclient=psy-ab&ved=0ahUKEwjk3uXcpoPqAhUeyosBHYy3BQcQ4dUDCAc&uact=5")
							.get();
					Elements name = doc2.body().getElementsByClass("OrdL9b");
					Elements detail = name.select("span");
					Elements number = doc2.body().getElementsByClass("QM7g5b");
					System.out.println(number.get(0));

					out.print("<table class='table'>");
					out.print("<thead class='thead-dark'><tr><td>" + new SimpleDateFormat("MM-dd HH:mm").format(System.currentTimeMillis())
							+ " 기준" + "</td><td>지역</td><td>확진자</td><td>완치자</td><td>사망자</td></tr></thead>");
					for (int i = 0; i < number.size();) {
						out.print("<tr>");
						out.print("<td>" + number.get(i++) + "</td>");
						out.print("<td>" + number.get(i++) + "</td>");
						out.print("<td>" + number.get(i++) + "</td>");
						out.print("<td>" + number.get(i++) + "</td>");
						out.print("</tr>");

					}
					out.print("</table>");
					%>


					<p class="post-meta">
						Posted by <a href="#">SangwonSeo</a> on june 16, 2020
					</p>
				</div>
			</div>


			<div class="col-lg-6 col-md-10 mx-auto">
				<div id=app class=container></div>
				<script src=./js/chunk-vendors.c683c542.js></script>
				<script src=./js/app.f7bc39f3.js></script>
				
					<div class="post-preview">
				<p class="post-meta">
					Posted by <a href="#">KimSungHyun</a> on May 11, 2020
				</p>
				</div>
			</div>

		
		</div>
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
