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

<link href=./js/mask/app.8a40331b.js rel=preload as=script>
<link href=./js/mask/chunk-vendors.c683c542.js rel=preload as=script>
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

.navfont,td{
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

				<div id=app2 class=container></div>
				<script src=./js/mask/chunk-vendors.c683c542.js></script>
				<script src=./js/mask/app.8a40331b.js></script>
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
	
	<script>
		var isContinue = false;
		var myGamePiece;
		var myObstacles = [];
		var myScore;
		var MaxSpeed = 3;
		function startGame() {
			
			myGamePiece = new component(60, 30, "img/싸피로고.PNG", 10, 120, "image");
			myScore = new component("30px", "Consolas", "black", 280, 40, "text");
		myGameArea.start();
			
		}

		var myGameArea = {
			canvas : document.createElement("canvas"),
			start : function() {
				this.canvas.width = 500;
				this.canvas.height = 300;
				this.context = this.canvas.getContext("2d");
				document.body.insertBefore(this.canvas,
						document.body.childNodes[0]);
				this.frameNo = 0;
				this.interval = setInterval(updateGameArea, 20);
			},
			clear : function() {
				this.context.clearRect(0, 0, this.canvas.width,
						this.canvas.height);
			},
			stop : function() {
				alert("당신의 점수는 :" + myScore.text.split(":")[1] +" 입니다");
				startGame();
				clearInterval(this.interval);
			}
		}

		function component(width, height, color, x, y, type) {
			this.type = type;
			if (type == "image") {
				this.image = new Image();
				this.image.src = "img/싸피로고.PNG";
			}
			this.width = width;
			this.height = height;
			this.speedX = 0;
			this.speedY = 0;
			this.x = x;
			this.y = y;
			this.update = function() {
				ctx = myGameArea.context;
				if (this.type == "text") {
					ctx.font = this.width + " " + this.height;
					ctx.fillStyle = "red";
					ctx.fillText(this.text, this.x, this.y);
				} else if (type == "image") {
					ctx.drawImage(this.image, this.x, this.y, this.width, this.height);
				} else {
					ctx.fillStyle = color;
					ctx.fillRect(this.x, this.y, this.width, this.height);
				}
			}
			this.newPos = function() {
				this.x += this.speedX;
				this.y += this.speedY;
			}
			this.crashWith = function(otherobj) {
				var myleft = this.x;
				var myright = this.x + (this.width);
				var mytop = this.y;
				var mybottom = this.y + (this.height);
				var otherleft = otherobj.x;
				var otherright = otherobj.x + (otherobj.width);
				var othertop = otherobj.y;
				var otherbottom = otherobj.y + (otherobj.height);
				var crash = true;
				if ((mybottom < othertop) || (mytop > otherbottom)
						|| (myright < otherleft) || (myleft > otherright)) {
					crash = false;
				}
				return crash;
			}
		}

		function updateGameArea() {
			var x, height, gap, minHeight, maxHeight, minGap, maxGap;
			for (i = 0; i < myObstacles.length; i += 1) {
				if (myGamePiece.crashWith(myObstacles[i])) {
					myGameArea.stop();
					return;
				}
			}
			myGameArea.clear();
			myGameArea.frameNo += 1;
			if (myGameArea.frameNo == 1 || everyinterval(150)) {
				x = myGameArea.canvas.width;
				minHeight = 20;
				maxHeight = 200;
				height = Math.floor(Math.random() * (maxHeight - minHeight + 1)
						+ minHeight);
				minGap = 50;
				maxGap = 200;
				gap = Math
						.floor(Math.random() * (maxGap - minGap + 1) + minGap);
				myObstacles.push(new component(10, height, "#1BB1E7", x, 0));
				myObstacles.push(new component(10, x - height - gap, "#1BB1E7",
						x, height + gap));
			}
			for (i = 0; i < myObstacles.length; i += 1) {
				myObstacles[i].speedX = -1;
				myObstacles[i].newPos();
				myObstacles[i].update();
			}
			myScore.text = "점수 : " + myGameArea.frameNo;
			
			myScore.update();
			myGamePiece.newPos();
			myGamePiece.update();
		}

		function everyinterval(n) {
			if ((myGameArea.frameNo / n) % 1 == 0) {
				return true;
			}
			return false;
		}

		function moveup() {
			myGamePiece.speedY = -1;
		}

		function movedown() {
			myGamePiece.speedY = 1;
		}

		function moveleft() {
			myGamePiece.speedX = -1;
		}

		function moveright() {
			myGamePiece.speedX = 1;
		}

		function clearmove() {
			myGamePiece.speedX = 0;
			myGamePiece.speedY = 0;
		}
		function Key() {
			if (event.keyCode == 37) { // 좌
				myGamePiece.speedX -= 1;
				if (myGamePiece.speedX < -MaxSpeed) {
					myGamePiece.speedX += 1;
				}
			} else if (event.keyCode == 38) { // 상
				myGamePiece.speedY -= 1
				if (myGamePiece.speedY < -MaxSpeed) {
					myGamePiece.speedY += 1;
				}
			} else if (event.keyCode == 39) { // 우
				myGamePiece.speedX += 1
				if (myGamePiece.speedX > MaxSpeed) {
					myGamePiece.speedX -= 1;
				}
			} else if (event.keyCode == 40) { // 하
				myGamePiece.speedY += 1
				if (myGamePiece.speedY > MaxSpeed) {
					myGamePiece.speedX -= 1;
				}
			}
		}
		document.onkeydown = Key;
	</script>
</body>

</html>
