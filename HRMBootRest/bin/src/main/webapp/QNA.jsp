<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<meta http-equiv=X-UA-Compatible content="IE=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
  <title>Clean Blog - Start Bootstrap Theme</title>
  <!-- GET google Font -->
  
 <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet"> 
 <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!-- Custom styles for this template -->
  <link href="css/clean-blog.min.css" rel="stylesheet">
	
	
	<style>

</style>
<link rel=stylesheet
	href=https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css
	integrity=sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh
	crossorigin=anonymous>
<script
	src=https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js></script>
	
	
<link href=./js/app.d7d6b47d.js rel=preload as=script>
<link href=./js/chunk-vendors.0e352e4a.js rel=preload as=script>
<style type="text/css">
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

.router-link-exact-active {
	color: red;
}

.table {
	margin: 20px auto;
}
	a,h1,span{font-family: 'Do Hyeon', sans-serif;},
  	dd{	font-family: 'Noto Serif KR', serif;}
  	.headerfont{font-family: 'Do Hyeon', sans-serif;}
 

header.masthead .page-heading, header.masthead .post-heading, header.masthead .site-heading {
    padding: 120px 0;
}
</style>

</head>
<body>
	<%@ include file="header.jsp" %>
	<header class="masthead" style=" height : 300px; ">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>QnA</h1>
            <span class="subheading">질문과 답변</span>
          </div>
        </div>
      </div>
    </div>
  </header>
	
	<div id=app class=container></div>
	<script src=./js/chunk-vendors.0e352e4a.js></script>
	<script src=./js/app.d7d6b47d.js></script>
</body>
</html>