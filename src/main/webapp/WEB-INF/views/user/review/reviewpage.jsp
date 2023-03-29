<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hello World</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- header_link -->
<jsp:include page="../inc/header_link.jsp"></jsp:include>
<!-- header_link end -->

</head>
<body>
	<!-- hero-content -->
	<div class="page-header">
		<!-- header-->
		<jsp:include page="../inc/page/header.jsp"></jsp:include>
		<!-- header end -->
		<jsp:include page="../inc/page/header_main.jsp"></jsp:include>
	</div>
	<!-- hero-content end-->


	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<!-- partial:partials/_sidebar.html -->
				<jsp:include page="../inc/mypage/sidebar.jsp"></jsp:include>
				<!-- sidebar.html end  -->
			</div>
			<div class="col-md-9">
				<div class="row md-4">
					<div class="col mt-5">
						<form class="form-group" id="form1">
							<h2> 작성한 리뷰</h2>
							<div class="form-group"></div>
							<table class="table table-bordered table-sm">
								<thead>
									<tr>
										<th>No</th>
										<th>강의</th>
										<th>작성일</th>
										<th>별점</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td>0</td>
										<td>java</td>
										<td>2023/03/29</td>
										<td>★★★★★</td>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<button type="button" class="btn btn-outline-success" id="bt_regist">글쓰기 등록</button>
			</div>
		</div>
	</div>


	<!-- clients_logo -->
	<jsp:include page="../inc/clients_logo.jsp"></jsp:include>
	<!-- clients_logo end -->

	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
	<!-- footer_link -->
	<jsp:include page="../inc/footer_link.jsp"></jsp:include>
	<!-- footer_link end-->
	
	<script type="text/javascript">
		function regist(){
			$("#form1").attr({
				action: "/user/review/regist",
				method: "GET"
			})	;
			$("#form1").submit();
		}
		
		$(function(){
			$("#bt_regist").click(function(){
				regist();
			});
		});
	
	
	</script>

</body>
</html>