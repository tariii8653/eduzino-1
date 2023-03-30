<%@page import="com.edu.zino.domain.Admin"%>
<%@page import="com.edu.zino.domain.Teacher"%>
<%@page import="com.edu.zino.domain.Subject"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%Teacher teacher = (Teacher)session.getAttribute("teacher"); %>
<%Admin admin = (Admin)session.getAttribute("admin"); %>
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
	<div class="container" id="subjectApp" v-if="Object.keys(subject).length > 0" >
		<div class="row">
			<div class="col-12">
			    <header class="entry-header">
			        <h1 class="entry-title" style="text-align: center;">{{subject.subject_title}}</h1>
			 	</header><!-- .entry-header -->
			</div><!-- .col -->
		</div>
        <div class="row">
            <div class="col-12 offset-lg-1 col-lg-10" >
                <div class="featured-image">
                    <img :src="imgurl" class="eduzino-subject-detail-pic">
                </div>
            </div><!-- .col -->
        </div><!-- .row -->
        <div class="row">
            <div class="col-12 offset-lg-1 col-lg-1">
            </div><!-- .col -->

            <div class="col-12 col-lg-8">
                <div class="single-course-wrap">
	                    <div class="course-info flex flex-wrap align-items-center">
	                        <div class="course-author flex flex-wrap align-items-center mt-3">
	                            <img src="/resources/user/images/course-author.jpg" alt="">
	
	                            <div class="author-wrap">
	                                <label class="m-0">Teacher</label>
	                                <div class="author-name"><a href="#">{{subject.teacher.member.member_nickname}}</a></div>
	                            </div><!-- .author-wrap -->
	                        </div><!-- .course-author -->
	
	                        <div class="course-cats mt-3">
	                            <label class="m-0">Categories</label>
	                            <div class="author-name"><a href="#">{{subject.sub_category.sub_name}}</a></div>
	                        </div><!-- .course-cats -->
	
	                        <div class="course-students mt-3">
	                            <label class="m-0">price</label>
	                            <div class="author-name"><span>₩{{subject.subject_price.toLocaleString('ko-KR')}}</span></div>
	                        </div><!-- .course-students -->
	
	                        <div class="buy-course mt-3">
	                            <a class="btn" href="#">ADD to cart</a>
	                        </div><!-- .buy-course -->
	                        <div class="buy-course mt-3">
	                            <a class="btn" href="#">ADD to wish</a>
	                        </div><!-- .buy-course -->
	                    </div><!-- .course-info -->
	
	                    <div class="single-course-cont-section">
                        <h2>학습목표</h2>

                        <ul class="p-0 m-0 green-ticked" v-for="goal in subject.goals">
                            <li>{{goal.goal_name}}</li>
                        </ul>

                        <h2>준비물</h2>
                        <ul class="p-0 m-0 black-doted"  v-for="requirement in subject.requirements">
                            <li>{{requirement.requirement_name}}</li>
                        </ul>

                        <h2>설명</h2>
                        <div v-html="detail"></div>
                    </div>
                    

                    <div class="single-course-accordion-cont mt-3" id="test213">
                        <header class="entry-header flex flex-wrap justify-content-between align-items-center">
                            <h2>강의내용</h2>
                        </header><!-- .entry-header -->

                        <div class="entry-contents">
                            <div class="accordion-wrap type-accordion" id="sectoin-content">
                                <!-- 섹션 vue 올곳 -->
								<template v-for="subject in subject.sectionList">
									<section_item :key="subject.subject_idx" :item="subject" />
								</template>
								
	
                            </div>
                        </div><!-- .entry-contents -->
                    </div><!-- .single-course-accordion-cont  -->
					<div class="mt-3">
						<%if(teacher!=null){ %>
							<button v-if="subject.teacher.teacher_idx == ${teacher.teacher_idx}" type="button" class="btn btn-primary" @click="update()">수정하기</button>
						<%} %>
						<%if(admin!=null){ %>
							<button v-if="subject.subject_permission==1" type="button" class="btn btn-primary" @click="request()">승인하기</button>
							<button v-if="subject.subject_permission==1" type="button" class="btn btn-primary" @click="reject()">거부하기</button>
						<%} %>
						
					</div>
                    <div class="related-courses">
                        <header class="entry-heading flex flex-wrap justify-content-between align-items-center">
                            <h2 class="entry-title">수강평</h2>
                        </header><!-- .entry-heading -->

                        <div class="row mx-m-25">
                        	<!-- 수강평올곳 -->
                        </div><!-- .row -->
                    </div><!-- .related-course -->
                </div><!-- .single-course-wrap -->
            </div><!-- .col -->
        </div><!-- .row -->
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
let sectionList = [];

const section_item ={
		template:`
			<div>
				<h3 class="entry-title flex flex-wrap justify-content-between align-items-lg-center active">
		            <span class="arrow-d"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></span>
		            <span class="lecture-group-title">{{item.section_name}}</span>
		            <span class="number-of-lectures"></span>
		            <span class="total-lectures-time"></span>
		        </h3>
		        <div class="entry-content accordion-active" style="">
		            <ul class="p-0 m-0" v-for="movie in item.movieList">
		                <li class="flex flex-column flex-lg-row align-items-lg-center"><span class="lecture-title">{{movie.movie_name}}</span><span class="lectures-preview"></span><span class="lectures-time text-left text-lg-right"></span></li>
		            </ul>
		        </div>
	        </div>
		`,props:['item']
		  ,methods:{
			
		}
	}

function init(){
	$.ajax({
		url:"/teacher/rest/subject/${subject_idx}",
		type:"get",
		success:function(result){
			console.log("성공 : ",result);
			subjectApp.subject=result;
			sectionList = result.sectionList;
		}
	});
}
$(function(){
	subjectApp = new Vue({
		el:"#subjectApp",
		data:{
			subject:{},
			imgurl:"",
			detail:""
		},components:{
			section_item	
		},methods:{
			update:function(){
				console.log("실행");
				location.href="/teacher/subject/regist/goal/${subject_idx}";
			},request:function(){
				$.ajax({
					url:"/admin/rest/subject/request",
					type:"post",
					data:{
						subject_idx:${subject_idx}	
					},success:function(result){
						alert("승인 완료");
					}
				});
			},reject:function(){
				$.ajax({
					url:"/admin/rest/subject/reject",
					type:"post",
					data:{
						subject_idx:${subject_idx}	
					},success:function(result){
						alert("거부완료");
					}
				});
			}
		},updated:function(){
			this.imgurl="${imgUri}/"+this.subject.subject_pic;
			this.detail = $(this.subject.subject_detail).html();
		}
	});
	init();
});
</script>
</body>
</html>