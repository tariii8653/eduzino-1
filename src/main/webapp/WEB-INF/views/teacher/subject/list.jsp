<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Plus Admin</title>
<!-- plugins:css -->
<jsp:include page="../inc/header_link.jsp"></jsp:include>
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
    <div class="container-scroller">
      <!-- partial:partials/_sidebar.html -->
      <jsp:include page="../inc/sidebar.jsp"></jsp:include>
      <!-- sidebar.html end  -->
      
      <!-- partial  -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_settings-panel.html -->
        <div id="settings-trigger"><i class="mdi mdi-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close mdi mdi-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-default-theme">
            <div class="img-ss rounded-circle bg-light border mr-3"></div>Default
          </div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme">
            <div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark
          </div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles default primary"></div>
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles light"></div>
          </div>
        </div>
        <!-- partial -->
        <!-- partial:partials/_navbar.html -->
        <jsp:include page="../inc/navbar.jsp"></jsp:include>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper pb-0">
          
          	<div class="zino-subject-list-box" id="subjectApp">
          		<template v-for="subject in subjectList">      		
    	      		<subject_item :key="subject.subject_idx" :item="subject"/>
          		</template>
          		<div class="mt-2 overflow-hidden zino-subject-list-regist">
	          		<button class="btn btn-primary float-right" id="bt_regist">강의 등록</button>
	          	</div>
          	</div>
          	<div class="zino-subject-list-pagination">
                <button type="button" class="btn btn-primary"><i class="mdi mdi-arrow-left-drop-circle-outline"></i></button>
	                <button type="button" class="btn btn-primary">1</button>
                <button type="button" class="btn btn-primary"><i class="mdi mdi-arrow-right-drop-circle-outline"></i></button>
          	</div>
            
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
			<div class="progress">
				<div class="progress-bar bg-success" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
			</div>
 				<div>
     				<h2 class="zino-subject-list-item-title">{{item.subject_title}}</h2>
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
	  ,methods:{
	},created:function(){
		if(this.item.subject_pic==null){
			this.imgurl="${imgUri}/selectImage.png";
		}else{
			this.imgurl="${imgUri}/"+this.item.subject_pic;
		}
	}
}

function init(){
	$("#bt_regist").click(function(){
		location.href="/teacher/subject/regist";
	});
	$.ajax({
		url:"/teacher/rest/subjects/1",
		type:"get",
		success:function(result){
			console.log(result);
			subjectApp.subjectList = result;
		}
	});
}
$(function(){
	subjectApp = new Vue({
		el:"#subjectApp",
		data:{
			subjectList:[]
		},components:{
			subject_item
		}
	});
	init();
});
</script>
</html>














