<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>공지사항 페이지</title>
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
	h1{font-family: 'Do Hyeon', sans-serif;}
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
            <h1 class='headerfont'>공지사항</h1>
            <span class="subheading">꼭 확인하세요!</span>
          </div>
        </div>
      </div>
    </div>
  </header>
<!-- here start -->
<!-- table start -->
<table class="table mb-5">
	<thead>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>
	</thead>
	<tbody id="brd_list_tbody">
	</tbody>
</table>
<!-- table end -->

<!-- modal start -->
<div class="modal" id="myModal">
	<div class="modal-dialog modal-md" style="vertical-align: middle;">
		<div class="modal-content">

			<!-- ModalHeader -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="close dataDismiss" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="mbr_id">
					<label for="mbr_id">ID:</label>
					<input type="text" id="mbr_id2" class="form-control"
							value="${user_session.userid}" >
				</div>
				<div class="form-group">
					<label for="brd_title">제목:</label>
					<input type="text" id="brd_title" class="form-control" placeholder="Enter Title">
				</div>
				<div class="form-group">
					<label for="brd_cnts">내용:</label>
					<textarea cols="80" class="form-control" id="brd_cnts" rows="10" data-sample-short></textarea>
					<script>
						CKEDITOR.replace('brd_cnts', {height: 260, width: 460});
					</script>
				</div>
				<input type="hidden" id="hid_brd_no">
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" id="modalRegistBtn" class="btn btn-primary">글 등록</button>
				<button type="button" id="modalModifyBtn" class="btn btn-info" data-dismiss="modal">글 수정</button>
				<button type="button" id="modalDeleteBtn" class="btn btn-danger" data-dismiss="modal">글 삭제</button>
				<button type="button" id="modalCloseBtn" class="btn btn-warning dataDismiss" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>
<!-- modal end -->

<!-- Button to Open the Modal -->
<button type="button" class="btn btn-primary" id="modal_open" data-toggle="modal" data-target="#myModal">
	글 쓰기
</button>

<script>
let cnts = CKEDITOR.instances.brd_cnts;
brd_list();
$(document).ready(function() {
	  $(".dataDismiss").click(function() {
	      $("#mbr_id2").val("");
	      $("#brd_title").val("");
	      cnts.setData('');
	      $("#hid_brd_no").val("");
	   });
	  
	  
	$("#modalRegistBtn").click(function() {
		
		$.post(
				"${pageContext.request.contextPath}/EBoardController"
				, {
					command:'brd_regist'
					, brd_title:$("#brd_title").val()
					, brd_cnts:cnts.getData()
				}
				,function(data,status){
					if(status == "success"){
						if(data == -2){
							alert("로그인 후 사용 바랍니다.");
							//location.href="${pageContext.request.contextPath}/live5/a_format/00.bs4_format.jsp";
						} else if(data == -1) {
							alert("시스템 관리자에게 문의 바랍니다.");
						} else if(data > 0) {
							alert("글이 등록 되었습니다.");
							$("#modalCloseBtn").click();
							$("#brd_title").val('');
							cnts.setData('');
							brd_list();
							
						} else {
							alert("잠시 후, 다시 시도해 주세요.");
						}
					} else {
						alert("시스템 관리자에게 문의 바랍니다.");
					}
				}
		);//post
	});//click
});//ready
function brd_list() {
	$.get(
			"${pageContext.request.contextPath}/EBoardController",
			 {
				command:'brd_list'
			}
			,function(data,status){
				if(status == "success"){
					if(data[0].message_code != null && data[0].message_code == '-1'){
						alert("시스템 관리자에게 문의 바랍니다.");
						return;
					}
					$("#brd_list_tbody").empty();
					if(data.length > 0){
						$.each(data, function(index, vo) {
							let str = "<tr><td>"
								+vo.articleno+"</td><td>"
								+"<a href='javascript:brd_detail("+vo.articleno+");'>"+vo.subject+"</td><td>"
								+vo.userid+"</td><td>"
								+vo.regtime+"</td></tr>"
							$("#brd_list_tbody").append(str);
						});//each
					} else {
						alert("조회된 Data가 없습니다.");
					}
				} else {
					alert("시스템 관리자에게 문의 바랍니다.");
				}
			}//function
			, "json"
	);//get
}//brd_list
function brd_detail(num) {
	$.get(
			"${pageContext.request.contextPath}/EBoardController"
			, {
				command:'brd_detail', brd_no:num
			}
			,function(data,status){
				if(status == "success"){
					if(data[0].message_code != null && data[0].message_code == '-1'){
						alert("시스템 관리자에게 문의 바랍니다.");
						return;
					}
					if(data.length > 0){
						$.each(data, function(index, dto){
							console.log(dto.userid);
							$("#mbr_id2").val(dto.userid);
							$("#brd_title").val(dto.subject);
							$("#hid_brd_no").val(dto.articleno);
							cnts.setData(dto.content);
							$("#modal_open").click();
						});
					} else {
						alert("조회된 Data가 없습니다.");
					}
				} else {
					alert("시스템 관리자에게 문의 바랍니다.");
				}
			}//function
			, "json"
	);//get
}//brd_detail
</script>
<!-- here end -->

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
          <p class="copyright text-muted">Copyright &copy; Your Website 2019</p>
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
