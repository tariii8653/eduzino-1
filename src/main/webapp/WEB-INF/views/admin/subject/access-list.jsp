<%@page import="com.edu.zino.domain.Member"%>
<%@page import="com.edu.zino.domain.Email"%>
<%@page import="com.edu.zino.domain.Birthday"%>
<%@page import="com.edu.zino.domain.ProfilePhoto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Admin</title>
<!-- plugins:css -->
<jsp:include page="../inc/header_link.jsp"></jsp:include>
<style type="text/css">
.overflow-hidden {
	overflow: hidden;
	width: 80%;
}

.zino-subject-list-box {
	display: flex;
	flex-wrap: wrap;
}

.zino-subject-list-item {
	padding-right: 25px !important;
	padding-left: 25px !important;
}

.zino-subject-list-item-head {
	margin-top: 50px;
}

.zino-subject-list-item-head, .zino-subject-list-item-head img {
	width: 300px;
	height: 188px;
}

.zino-subject-list-item-body {
	padding: 26px 30px 20px;
	border: 1px solid #ebebeb;
	border-top: 0;
	background: #fff;
}

.zino-subject-list-item-body .zino-subject-list-item-title {
	margin: 5px 0 0 0;
	font-size: 20px;
	line-height: 1.3;
	font-weight: 400;
}

.zino-subject-list-item-body a {
	color: #19c880;
	text-decoration: none;
}

.zino-subject-list-pagination {
	display: flex;
	justify-content: center;
}

#bt_regist {
	font-size: 15px;
}
</style>
</head>

<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="../inc/sidebar.jsp"></jsp:include>
		<!-- sidebar.html end  -->

		<!-- partial  -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<!-- partial -->
			<!-- partial:partials/_navbar.html -->
			<jsp:include page="../inc/navbar.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">

				<div class="content-wrapper pb-0">

					<div class="zino-subject-list-box">
						<c:forEach items="${subjectList}"  var="item">
						
						
							<div class="zino-subject-list-item">
								<div class="zino-subject-list-item-head">
									<figure>
										
										<img src="${imgUri}/${item.subject_pic}">
									</figure>
								</div>
								<div class="zino-subject-list-item-body">
									<div>
										<h2 class="zino-subject-list-item-title">
											<a href="/teacher/subject/detail/${item.subject_idx}">${item.subject_title}</a>
										</h2>
									</div>
									<div class="zino-subject-list-item-teacher">
										<a href="#">${item.teacher.member.member_nickname}</a>
									</div>
									<div class="zino-subject-list-item-price">
										<span><fmt:formatNumber value="${item.subject_price}" pattern="#,###"/></span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="zino-subject-list-pagination">
						<c:if test="${page>10}">
							<button type="button" class="btn btn-primary">
								<i class="mdi mdi-arrow-left-drop-circle-outline"></i>
							</button>
						</c:if>
						<c:forEach var="p" begin="${firstPage}" end="${lastPage}" step="1">
							<button type="button" class="btn btn-primary">${p}</button>
						</c:forEach>
						<c:if test="${lastPage<totalPage }">
							<button type="button" class="btn btn-primary">
								<i class="mdi mdi-arrow-right-drop-circle-outline"></i>
							</button>
						</c:if>
					</div>


					<!-- partial:partials/_footer.html -->
					<jsp:include page="../inc/footer.jsp"></jsp:include>
					<!-- partial:partials/_footer.html end -->
					<!-- partial -->
				</div>
				<!-- main-panel ends -->
			</div>
			<!-- partial end  -->
			<!-- page-body-wrapper ends -->
		</div>
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<jsp:include page="../inc/footer_link.jsp"></jsp:include>
	<!-- plugins:js end -->
	<!-- End custom js for this page -->
</body>

<script type="text/javascript">
</script>

</html>