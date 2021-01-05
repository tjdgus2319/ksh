<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<nav id="index_nav_login">
			<ul class="m-0 p-0">
				<li class="float-right"><a class="p-1" href="${pageContext.request.contextPath}/live5/c_join_member/c_join_member.jsp">SignUp</a></li>
				<li class="float-right"><a class="p-1" href="#">
					<span id="spanForLogin" data-toggle="modal" data-target="#loginModal">Login</span>
				</a></li>
				<li class="float-right"><a class="p-1" href="#"><span id="spanForID" style="display: none;"></span>
					<span id="spanForLogout" style="display: none;">Logout</span></a></li>
			</ul>
		</nav>
		<header id="index_header" class="jumbotron text-center mb-1">
			<h4>행복한 우리 집</h4> 
		</header>
		<!-- nav start -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark rounded">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/live5/a_format/00.bs4_format.jsp">Home</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						동네 정보
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">APT 매매</a>
						<a class="dropdown-item" href="#">APT 전월세</a>
						<a class="dropdown-item" href="#">주택 매매</a>
						<a class="dropdown-item" href="#">주택 전월세</a>
						<a class="dropdown-item" href="#">상권 정보</a>
						<a class="dropdown-item" href="#">환경 정보</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Notice</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">News</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Contact</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						AJAX
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/01ajax1.jsp">AJAX1</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/02ajax2.jsp">AJAX2</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/03ajax3.jsp">AJAX3</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/04ajax4.jsp">AJAX4</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/05ajax5.jsp">AJAX5</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/06ajax6.jsp">AJAX6</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/07xmlhttprequest1.jsp">XMLHttpRequest1</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/08xmlhttprequest2.jsp">XMLHttpRequest2</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						live5
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/a_format/00.bs4_format.jsp">Format</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/b_id_check/b_id_check.jsp">ID Check</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/c_join_member/c_join_member.jsp">회원가입</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/c_join_member/c_login.jsp">로그인</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/d_select_key/d_select_key.jsp">Key Word</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/d_select_key/d_select_key2.jsp">Key Word2</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/f_select_box/f_select_box.jsp">Select Box</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						GuestBook
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/eboard/eboard1write.jsp">글쓰기</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/eboard/eboard2list.jsp">글목록</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/eboard/eboard3detail.jsp">글상세</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/eboard/eboard4modify.jsp">글수정</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/eboard/eboard5delete.jsp">글삭제</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/live5/eboard/eboard6session.jsp">세션적용</a>
					</div>
				</li>
			</ul>
		</nav>
		<!-- nav end -->
		<!-- login modal start -->
		<div class="modal" id="loginModal">
			<div class="modal-dialog modal-md" style="vertical-align: middle;">
				<div class="modal-content">
					<!-- ModalHeader -->
					<div class="modal-header">
						<h4 class="modal-title">LogIn</h4>
						<button type="button" class="close dataDismiss" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<div class="form-group">
							<label for="mbr_id">ID:</label>
							<input type="text" id="mbr_id" class="form-control" placeholder="Enter ID">
						</div>
						<div class="form-group">
							<label for="mbr_pwd">Password:</label>
							<input type="password" id="mbr_pwd" class="form-control" placeholder="Enter Password">
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" id="modalLogInBtn" class="btn btn-primary" data-dismiss="modal">LogIn</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- login modal end -->
		<!-- login script start -->
		<script>
		$(document).ready(function() {
			if(${user_session != null && user_session.userid != null && user_session.userid != ''}) {
				$("#spanForLogin").css("display","none");
				$("#spanForID").text(" ${user_session.userid}님 ");
				$("#spanForID").css("display","inline");
				$("#spanForLogout").css("display","inline");
			} else {
				$("#spanForLogin").css("display","inline");
				$("#spanForID").text("");
				$("#spanForID").css("display","none");
				$("#spanForLogout").css("display","none");
			}
		});//ready
		$(document).ready(function() {
			$("#modalLogInBtn").click(function() {
				if($.trim($("#mbr_id").val()) == ''){
					alert("ID를 입력해 주세요.");
					return;
				}
				if($.trim($("#mbr_pwd").val()) == ''){
					alert("Password를 입력해 주세요.");
					return;
				}
				$.post(
						"${pageContext.request.contextPath}/CJoinMemberController"
						,{
							command:'login'
							,mbr_id:$("#mbr_id").val()
							,mbr_pwd:$("#mbr_pwd").val()
						}
						, function(data, status) {
							if(status == "success"){
								if(data[0].message_code == "-1") {
									alert("시스템 관리자에게 문의 바랍니다.");
								} else if(data[0].message_code == "0"){
									alert("잘못된 ID 또는 Password 입니다.");
								} else {
									$("#spanForLogin").css("display","none");
									$("#spanForID").text(" "+data[0].userid+"님 ");
									$("#spanForID").css("display","inline");
									$("#spanForLogout").css("display","inline");
								}
							} else {
								alert("시스템 관리자에게 문의 바랍니다.");
							}
						}//function
						, "json"
				);//post
			});//click
			$("#spanForLogout").click(function() {
				$.post(
						"${pageContext.request.contextPath}/CJoinMemberController"
						,{ command:'logout' }
						, function(data, status) {
							if(status == "success"){
								if(data == 1) {
									$("#spanForLogin").css("display","inline");
									$("#spanForID").text("");
									$("#spanForID").css("display","none");
									$("#spanForLogout").css("display","none");
									alert("로그아웃 되었습니다.");
									//location.href="${pageContext.request.contextPath}/live5/a_format/00.bs4_format.jsp";
								} else {
									alert("시스템 관리자에게 문의 바랍니다.");
								}
							} else {
								alert("시스템 관리자에게 문의 바랍니다.");
							}
						}//function
						, "json"
				);//post
			});//click
		});//ready
		</script>
		<!-- login script end -->
