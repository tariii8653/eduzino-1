<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>payComplete</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- header_link -->
<jsp:include page="../inc/header_link.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/shop/css/style_cart.css">
<script src="https://js.tosspayments.com/v1/payment"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style>
	.cart__total__procced{
		width:500px;
		height:500px;
	}
	
	.discount__content{
		 text-align: center; 
	}
	
	.btn-outline-success {
    color: #28a745;
    background-color: transparent;
    background-image: none;
    border-color: #28a745;
    font-size: 22px;
    margin-left: 20px;
}
	
	h3 { 
		text-align: center; 
		 line-height: 300px;
	}
	</style>

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
 
            <div class="row" style="justify-content: center; padding:30px ">
	             <div class="cart__total__procced">
	             
                          <h3>결제에 실패하였습니다</h3>                                   
                       	<div class="discount__content" style="padding:30px ">
							 <button type="button" class="btn btn-outline-success btn-fw"> <a href="http://localhost:7777">메인으로</a></button>                   
							 <button type="button" class="btn btn-outline-success btn-fw"> <a href="http://localhost:7777/cart/list">장바구니로 돌아가기</a></button>                    
	                    </div>               
                </div>  
            </div>
        </div>
    </section>
	
	
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