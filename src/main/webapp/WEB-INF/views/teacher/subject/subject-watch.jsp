<%@page import="com.edu.zino.domain.Subject"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.eduzino-subject-detail-pic{
    margin-top: 30px;
    margin-left: 75px;
    width: 750px;
    height: 460px;
}
.buy-course.mt-3{
	flex: 1;
    width: 0%;
}
.buy-course.mt-3 a{
    padding: 17px 20px;
}
.eduzino-subject-watch-wrapper{
	margin-top:30px;
	display: flex;
}
iframe {
    width: 100%;
}
.eduzino-subject-watch-view{
	flex: 1;
}
.eduzino-subject-watch-list{
	height: 600px;
    overflow: scroll;
	border: 1px solid #11111145;
}
.eduzino-subject-watch-item{
	margin: 0px;
	padding:4px 15px;
	min-width: 184px;
    min-height: 36px;
}
.movie-item:hover{
	cursor: pointer;
}
.eduzino-subject-watch-item.section-item{
	color: white;
	background: #19c880;
}
</style>
    <title>Hello World</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- header_link -->
	<jsp:include page="../../user/inc/header_link.jsp"></jsp:include>
	<!-- header_link end -->
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
	
	<div class="container" id="subjectApp">
		<div class="row mt-3" style="text-align: center;">
				<div class="col-12">
				    <header class="entry-header">
				        <h1 class="entry-title">{{subject.subject_title}}</h1>
				 	</header><!-- .entry-header -->
				</div><!-- .col -->
			</div>
		<div class="eduzino-subject-watch-wrapper">
			<div class="eduzino-subject-watch-view">
				<input type="hidden" :value="showVideoIdx">
	        	<iframe v-if="Object.keys(subject).length > 0" :src="iframeSrc" width="640" height="360" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="sample.mp4"></iframe>
			</div>
			<div class="eduzino-subject-watch-list">
				<template v-for="section in subject.sectionList">
					<section_item :key="section.section_idx" :section="section" />
				</template>
			</div>
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
<script src="https://player.vimeo.com/api/player.js"></script>
<script type="text/javascript">
let subjectApp;
//let sectionList = [];
/*<p class="text-dark eduzino-subject-watch-item">보고있는 영상명</p>*/
const section_item ={
		template:`
			<div>
				<p class="eduzino-subject-watch-item section-item">{{section.section_name}}</p>
				<template v-for="movie in section.movieList">
					<p v-if="!videoCheck(movie.video.video_idx)" class="text-secondary eduzino-subject-watch-item movie-item" @click="videoChange(movie)">{{movie.movie_name}}</p>
					<p v-else class="text-dark eduzino-subject-watch-item movie-item">{{movie.movie_name}}</p>
				</template>
			</div>
		`,props:['section']
		  ,methods:{
			  videoChange:function(movie){
				  subjectApp.showVideoURI=movie.video.video_link;
				  subjectApp.showVideoIdx=movie.video.video_idx;
			  },
			  videoCheck:function(video_idx){
				  if(subjectApp.showVideoIdx == video_idx){
					  return true;
				  }
				  return false;
			  }
		}
	}

function init(){
	subjectApp = new Vue({
		el:"#subjectApp",
		data:{
			subject:{},
			vimeoURL:"https://player.vimeo.com/video",
			showVideoURI:"",
			showVideoIdx:0,
			iframeSrc:""
		},methods:{
			
		},components:{
			section_item
		},updated:function(){
			console.log("video_link : ",this.subject.sectionList[0].movieList[0].video.video_link);
			if(this.showVideoIdx == 0){
				this.showVideoIdx=this.subject.sectionList[0].movieList[0].video.video_idx;
				this.showVideoURI=this.subject.sectionList[0].movieList[0].video.video_link;
			}
			this.iframeSrc = this.vimeoURL+this.showVideoURI;
		}
	});
	
	
	$.ajax({
		url:"/teacher/rest/subject/${subject_idx}",
		type:"get",
		success:function(result){
			console.log("성공 : ",result);
			subjectApp.subject=result;
			//sectionList = result.sectionList;
		}
	});
}
$(function(){
	init();
});
</script>
</body>
</html>