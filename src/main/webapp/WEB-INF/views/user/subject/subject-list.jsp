<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hello World</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- header_link -->
	<jsp:include page="../../user/inc/header_link.jsp"></jsp:include>
	<!-- header_link end -->
<style type="text/css">
.overflow-hidden{
	overflow: hidden;
	width: 80%;
}
.zino-subject-list-box{
	display: flex;
	flex-wrap: wrap;
}
.zino-subject-list-item{
	padding-right: 25px !important;
    padding-left: 25px !important;
}
.zino-subject-list-item-head{
	margin-top: 50px;
}
.zino-subject-list-item-head, .zino-subject-list-item-head img{
	width: 300px;
	height: 188px;
}
.zino-subject-list-item-body{
	padding: 26px 30px 20px;
    border: 1px solid #ebebeb;
    border-top: 0;
    background: #fff;
    height: 115px;
}
.zino-subject-list-item-body .zino-subject-list-item-title{
	margin: 5px 0 0 0;
    font-size: 20px;
    line-height: 1.3;
    font-weight: 400;
}
.zino-subject-list-item-body a{
	color: #19c880;
	text-decoration: none;
}
.zino-subject-list-pagination{
    display: flex;
    justify-content: center;
}
#bt_regist{
	font-size: 15px;
}
</style>
</head>
<body>
	<!-- hero-content -->
    <div class="page-header">
    	<!-- header-->
		<jsp:include page="../../user/inc/page/header.jsp"></jsp:include>
		<!-- header end -->
    	<jsp:include page="../../user/inc/page/header_main.jsp"></jsp:include>
    </div>
    <!-- hero-content end-->
    <div class="container">
    
		<div class="zino-subject-list-box" id="subjectApp">
			<template v-for="subject in subjectList">      		
				<subject_item :key="subject.subject_idx" :item="subject"/>
			</template>
		</div>
    </div>
	
	<!-- clients_logo -->
    <jsp:include page="../../user/inc/clients_logo.jsp"></jsp:include>
    <!-- clients_logo end -->
    
	<!-- footer -->
	<jsp:include page="../../user/inc/footer.jsp"></jsp:include>
	<!-- footer -->
	<!-- footer_link -->
	<jsp:include page="../../user/inc/footer_link.jsp"></jsp:include>
	<!-- footer_link end-->
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
<script type="text/javascript">
let subjectApp;
const subject_item ={
	template:`
		<div class="zino-subject-list-item">
 			<div class="zino-subject-list-item-head">	
     			<figure>
         			<img :src="imgurl">
     			</figure>
 			</div>
 			<div class="zino-subject-list-item-body">
 				<div>
     				<h2 class="zino-subject-list-item-title"><a :href="subjectDetailPage">{{item.subject_title}}</a></h2>
     			</div>
     			<div class="zino-subject-list-item-teacher">
     				<a href="#">{{item.teacher.member_nickname}}</a>
     			</div>
     			<div class="zino-subject-list-item-price">
     				<span>₩{{item.subject_price.toLocaleString('ko-KR')}}</span>
     			</div>
 			</div>
 		</div>
	`,props:['item']
	,created:function(){
		this.imgurl="${imgUri}/"+this.item.subject_pic;
		this.subjectDetailPage="/teacher/subject/detail/"+this.item.subject_idx;
	}
}
function init(){
	subjectApp = new Vue({
		el:"#subjectApp",
		data:{
			subjectList:[]
		},components:{
			subject_item
		}
	});
	
	$.ajax({
		url:"/rest/category/${top_category_idx}/subjects",
		type:"get",
		success:function(result){
			console.log("결과",result);
			subjectApp.subjectList = result;
		}
	});
};
$(function(){
	init();
});
</script>
</body>
</html>






