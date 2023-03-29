<%@page import="com.edu.zino.domain.OrderDetail"%>
<%@page import="com.edu.zino.util.PageManager"%>
<%@page import="com.edu.zino.domain.OrderSummary"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<OrderSummary> orderList = (List)request.getAttribute("orderList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Order Summary</title>
<style type="text/css">
 .pagination{
 	position:absolute;
 }
 .page-link{
 	background-color:rgb(60 181 49);
 }
 
</style>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- header_link -->
<jsp:include page="../inc/header_link.jsp"></jsp:include>
<!-- header_link end -->
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
<!-- 모달 -->
<link rel="stylesheet" href="/resources/shop/css/style_cart.css">
<script src="https://js.tosspayments.com/v1/payment"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style>
	.modal{
 	position: relative;
	position: fixed;
	z-index: 300000;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	}
	
	.button{
		font-size: 13px;
		text-transform: uppercase;
	}
	
	.table-responsive{
	  overflow-y: scroll;
	}
	
	
	.table-responsive::-webkit-scrollbar {
	  width: 10px;  /* 스크롤바의 너비 */
	}
	.table-responsive::-webkit-scrollbar-thumb {
	  height: 30%; /* 스크롤바의 길이 */
	  background: rgb(60 181 49); /* 스크롤바의 색상 */
	  border-radius: 10px;
	}
	
	.table-responsive::-webkit-scrollbar-track {
	  background: #84848447;  /*스크롤바 뒷 배경 색상*/
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
	
	
	<div class="container" id="app1">
		<div class="row">
			<div class="col-md-3">
				<!-- partial:partials/_sidebar.html -->
				<jsp:include page="../inc/mypage/sidebar.jsp"></jsp:include>
				 <!-- sidebar.html end  -->
			</div>
			<div class="col-md-9">
			<div class="card mt-5">
                  <div class="card-body" >
                    <h4 class="card-title">결제내역</h4>
                    
						 <span>&nbsp;</span>
	           			 <div class="row">
	            
					<!-- 상세내용  modal -->
					  <!-- The Modal -->
					  <div class="modal fade" id="myModal">
					    <div class="modal-dialog modal-dialog-centered">
					      <div class="modal-content">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h4 class="modal-title">결제 상세보기</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body" >
					          	<table class="table table-hover">				          	
						          	      <thead>
				                          <tr>
				                            <th>순번</th>
				                            <th>강의명</th>
				                            <th>수강료</th>
				                          </tr>
				                       	 </thead>
										<tbody class="cart_form_box" >
		                     	        	<template v-for="(detail,i) in orderDetailList">
		                     	        		<modal_table :key="detail.order_detail_idx" :detail="detail" :no="i"/>
		                     	      	  </template>
                          		 	 </tbody>

					          	</table>	
					        </div>
					        
					        <!-- Modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="site-btn" data-dismiss="modal" id="bt_closeModal">Close</button>			          
					        </div>
					      </div>
					    </div>
					  </div>
						<!-- 상세내용 모달 끝 -->
                    
                    <div class="table-responsive"  style="height: 600px; overflow: scroll;">
                      <table class="table table-hover" style="height:80%">
                        <thead>
                          <tr>
                            <th>순번</th>
                            <th>주문번호</th>
                            <th>결제일</th>
                            <th>결제금액</th>
                            <th>결제방식</th>
                            <th>결제상태</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                        	
                        	<%for(int i=0; i<orderList.size(); i++){ %>
                        	                    
                        	<%OrderSummary order = orderList.get(i); %>
							<tr>
                            <td><%=order.getOrder_summary_idx() %></td>
                            <td ><%= order.getOrder_id() %></td>
                            <td><%=order.getOrder_summary_regdate().substring(0, 10) %></td>
                            <td><%=order.getTotal_pay() %></td>
                            <td><%=order.getPayment().getPayment_type() %></td>
                            <td><%=order.getPaystate().getState()%></td>
                           <td>
                           <button  type="button" class="btn btn-outline-success btn-fw"data-toggle="modal" data-target="#myModal" 
                           onclick="getOrderDetail(<%=order.getOrder_summary_idx()%>)"> 상세보기 </button> 
                           <td>
                          </tr>
                          <%} %>
                        </tbody>
                      </table>
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
<code><script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.min.js"></script></code>
</body>
<script type="text/javascript">
let app1;
const modal_table={
		template:`
			<tr>
				<td>{{no+1}}</td>
				<td>{{detail.subject.subject_title}}</td>
				<td>{{detail.subject.subject_price}}</td>
				
			</tr>
		`,props:['detail',"no"]
}

app1=new Vue({
	el:"#app1",
	components:{
		modal_table
	},
	data:{
		count:3,
		orderDetailList:[]
	}
});

function getOrderDetail(summary_idx){
	$.ajax({
		url:"/rest/order/orderlist/"+summary_idx,
		type:"get",
		success:function(result,status,xhr){
			console.log(result);
			app1.orderDetailList = result;
		}
	});
}

</script>
</html>