<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hello World</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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
			
				<div class="p-3 bg-primary">
					<div class="card" style="width:400px">
					  <img class="card-img-top" src="img_avatar1.png" alt="Card image">
					  <div class="card-body">
					    <h4 class="card-title">Name</h4>
					    <p class="card-text">Some example text.</p>
					    <a href="#" class="btn btn-primary">change photo</a>
					  </div>
					</div>
				  <form class="form-inline" action="/action_page.php">
				    <label for="email2" class="mb-2 mr-sm-2">Email:</label>
				    <input type="text" class="form-control mb-2 mr-sm-8" id="email2" placeholder="Enter email" name="email">
				    <label for="pwd2" class="mb-2 mr-sm-2">Password:</label>
				    <input type="text" class="form-control mb-2 mr-sm-8" id="pwd2" placeholder="Enter password" name="pswd">
				    
				    <button type="submit" class="btn btn-primary mb-2">저장하기</button>
				  </form>
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

</body>
</html>