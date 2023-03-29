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
		<div class="row">
			<div>
	        	<iframe src="https://player.vimeo.com/video/807359667?h=d3cd22b17e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" width="640" height="360" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="sample.mp4"></iframe>
			</div>
			<div>
				
			</div>
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
<script src="https://player.vimeo.com/api/player.js"></script>
<script type="text/javascript">
let subjectApp;
let sectionList = [];


function init(){
	$.ajax({
		url:"/teacher/rest/subject/${subject_idx}",
		type:"get",
		success:function(result){
			console.log("성공 : ",result);
			//subjectApp.subject=result;
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