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
          
	<!-- *********************상단 버튼들 시작************************** -->
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
	<!-- *********************상단 버튼들 끝************************** -->
            
	<!-- **********************회원 정보 시작************************** -->
	<div class="card" style="width:200px">
	  <img class="card-img-top" src="/resources/admin/data/profile1.png" alt="Card image" style="width:100%">
	  <div class="card-body">
	    <h4 class="card-title">John Doe</h4>
	  </div>
	</div>
	
	<!-- **********************회원 정보 끝************************** -->

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