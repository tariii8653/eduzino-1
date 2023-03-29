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
<style type="text/css">
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}



</style>
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
						<h2>수강평 등록폼</h2>

						<form id="form1">

							<div class="mb-3">

								<label>강의</label> <input type="text" class="form-control"
									name="adminboard_title" placeholder="제목을 입력해 주세요">

							</div>

							<div class="mb-3"></div>

							<div class="mb-3"></div>

							<div class="mb-3">

								<labe>내용</label> <textarea class="form-control" rows="5"
									name="adminboard_content" placeholder="내용을 입력해 주세요"></textarea>
							</div>

						</form>

						<link href="/assets/css/star.css" rel="stylesheet" />

						<form class="mb-3" name="myform" id="myform" method="post">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span> <input type="radio"
									name="reviewStar" value="5" id="rate1"><label
									for="rate1">★</label> <input type="radio" name="reviewStar"
									value="4" id="rate2"><label for="rate2">★</label> <input
									type="radio" name="reviewStar" value="3" id="rate3"><label
									for="rate3">★</label> <input type="radio" name="reviewStar"
									value="2" id="rate4"><label for="rate4">★</label> <input
									type="radio" name="reviewStar" value="1" id="rate5"><label
									for="rate5">★</label>
							</fieldset>
					
						</form>
						<div>

							<button type="button" class="btn btn-sm btn-success"
								id="bt_regist">등록</button>

							<button type="button" class="btn btn-sm btn-success" id="bt_list">목록</button>

						</div>
					</div>
				</div>

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
		function regist() {
			$("#form1").attr({
				action : "/user/review/regist",
				method : "GET"
			});
			$("#form1").submit();
		}

		$(function() {
			$("#bt_regist").click(function() {
				regist();
			});
			$("#bt_list").click(function(){
				location.href="/user/review";
			});
		});
	</script>

</body>
</html>