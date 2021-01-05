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
      <div id="map" style="width:100%;height:350px;"></div>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=335dc7134d16940170aa9927b4bd53a6&libraries=services"></script>
      <script>
       
      // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
      var infowindow = new kakao.maps.InfoWindow({zIndex:1});

      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(${deal.lat}, ${deal.lng}), // 이미지 지도의 중심좌표
              level: 3, // 지도의 확대 레벨
          };  

      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 

      // 장소 검색 객체를 생성합니다
      var ps = new kakao.maps.services.Places(); 
      var temp='서울 '+'${deal.dong}'+' 맛집';
      console.log(temp);
      // 키워드로 장소를 검색합니다
      ps.keywordSearch(temp, placesSearchCB); 
      
///////////////////////////////////////////////////////////////////////////////////////////////////////////
      var markerPosition  = new kakao.maps.LatLng(${deal.lat}, ${deal.lng}); 
      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
          
       // 마커 이미지의 이미지 크기 입니다
       var imageSize = new kakao.maps.Size(24, 35); 
       
       // 마커 이미지를 생성합니다    
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
       
       // 마커를 생성합니다
       var marker = new kakao.maps.Marker({
           map: map, // 마커를 표시할 지도
           position: markerPosition, // 마커를 표시할 위치
           image : markerImage // 마커 이미지 
       });
///////////////////////////////////////////////////////////////////////////////////////////////////////////
      // 키워드 검색 완료 시 호출되는 콜백함수 입니다
      function placesSearchCB (data, status, pagination) {
          if (status === kakao.maps.services.Status.OK) {

              // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
              // LatLngBounds 객체에 좌표를 추가합니다
              var bounds = new kakao.maps.LatLngBounds();

              for (var i=0; i<data.length; i++) {
                  displayMarker(data[i]);    
                  bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
              }       

              // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
             // map.setBounds(bounds);
          } 
      }

      // 지도에 마커를 표시하는 함수입니다
      function displayMarker(place) {
          
          // 마커를 생성하고 지도에 표시합니다
          var marker = new kakao.maps.Marker({
              map: map,
              position: new kakao.maps.LatLng(place.y, place.x) 
          });

          // 마커에 클릭이벤트를 등록합니다
          kakao.maps.event.addListener(marker, 'click', function() {
              // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
              infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
              infowindow.open(map, marker);
          });
      }
      </script>
      </div>
      <div class="col-sm-6">
         <div style="width: 80%; height: 500px; margin: auto;"> 주변 상권 정보
          <c:choose>
					<c:when test="${not empty shopinfos}">
						<table>
							<c:forEach var="shop" items="${shopinfos}">
								<tr>
									<td>${shop.shopname}</td>
									<td>${shop.codename1}</td>
									<td>${shop.address}</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<tr align="center">
							<td colspan='5'>상권정보가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
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