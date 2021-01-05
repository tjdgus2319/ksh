<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>GuestBook</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.ckeditor.com/4.14.0/full/ckeditor.js"></script>
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
					<h2>GuestBook Page</h2>
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
<script type="text/javascript">

	$(document).ready(function(){
		// 화면 로드되자마자 띄어주어야한다.
		$.get(
			"${pageContext.request.contextPath}/EBoardController" // 주소
			, {command:"brd_list"}
			,function(data , status){
				$.each(data , function(index ,dto){
					let str = "<tr><td>" + dto.articleno
					+ "</td><td>" + dto.subject
					+ "</td><td>" + dto.userid
					+ "</td><td>" + dto.regtime+"</td></tr>";
					$('#brd_list_tbod').append(str);
				})
			}
			, "json"
		);
	});
</script>
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
					<input type="text" id="mbr_id" class="form-control"
							value="${user_session.userid}" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="brd_title">제목:</label>
					<input type="text" id="brd_title" class="form-control" placeholder="Enter Title">
				</div>
				<div class="form-group">
					<label for="brd_cnts">내용:</label>
					<textarea cols="80" class="form-control" id="brd_cnts" rows="10" data-sample-short></textarea>
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
//1. 게시글 등록 처리
//2. 게시글 목록 조회 처리
</script>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-dark rounded mt-1"></footer>
	</div>
</body>
</html>
