<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>주택관련뉴스</title>
  <!-- GET google Font -->
  
 <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet"> 
 <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!-- Custom styles for this template -->
  <link href="css/clean-blog.min.css" rel="stylesheet">
  <style type="text/css">
  	a{font-family: 'Do Hyeon', sans-serif;},
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
<%@ include file="header.jsp" %>
 
  <!-- Page Header -->
  <header class="masthead"  style="">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1 class='headerfont'>오늘의  뉴스</h1>
            <span class="subheading">Housing News</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container" align="center">
		<!-- 인코딩필터 -->

 <ul>
 	
	<%
        // 파싱할 사이트를 적어준다(해당 사이트에 대한 태그를 다 긁어옴)
 		Document doc2 = Jsoup.connect("https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%EC%A3%BC%ED%83%9D%EA%B4%80%EB%A0%A8%EB%89%B4%EC%8A%A4").get();
        //Elements posts = doc2.body().getElementsByClass("news mynews section _prs_nws");
        Elements posts = doc2.body().getElementsByClass("type01");
        //System.out.println(doc2.getElementsByClass("list"));
        Elements file = posts.select("li");
        for(Element e : file){
        	if(e.select("dt a").attr("title").equals("")){
        		continue;
        	}
        	out.println("<a  href='"+e.select("dt a").attr("href")+"'>"+e.select("dt a").attr("title")+"</a>");
        	out.println("<dd>"+e.select("dd").eq(1).text()+"</dd>");
        	out.println("<hr/>");
        

        }
	%>
  </ul>	
  </div>
  <hr>

  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
          </ul>
          <p class="copyright text-muted">Copyright &copy; Team : 411</p>
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
