<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Admin</title>
    <!-- plugins:css -->
    <jsp:include page="../inc/header_link.jsp"></jsp:include>
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
          
	<!-- *********************상단 버튼들************************** -->
      <div class="page-header flex-wrap">
        <div class="header-left">
          <button class="btn btn-primary mb-2 mb-md-0 mr-2"> Mail </button>
          <button class="btn btn-outline-primary bg-white mb-2 mb-md-0"> Excel </button>
        </div>
        <div class="header-right d-flex flex-wrap mt-2 mt-sm-0">
          <button type="button" class="btn btn-primary mt-2 mt-sm-0 btn-icon-text">
            <i class="mdi mdi-circle"></i> Add Prodcut </button>
        </div>
      </div>
	<!-- *********************상단 버튼들************************** -->
            
	<!-- **********************회원 테이블************************** -->
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>닉네임</th>
				<th>메일주소</th>
				<th>회원상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td><a href="#"> Doe</a></td>
				<td>john@example.com</td>
				<td>일반회원</td>
			</tr>
			<tr>
				<td>2</td>
				<td><a href="#"> Doe</a></td>
				<td>john@example.com</td>
				<td>강사</td>
			</tr>
			<tr>
				<td>3</td>
				<td><a href="#"> Doe</a></td>
				<td>john@example.com</td>
				<td>정지</td>
			</tr>
		</tbody>
	</table>
	<!-- **********************회원 테이블************************** -->

          </div>
          <!-- content-wrapper ends -->
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
    <!-- container-scroller -->
    <!-- plugins:js -->
		<jsp:include page="../inc/footer_link.jsp"></jsp:include>
    <!-- plugins:js end -->
    <!-- End custom js for this page -->
  </body>

</html>