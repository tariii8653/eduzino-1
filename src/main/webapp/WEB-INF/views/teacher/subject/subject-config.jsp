<%@page import="com.edu.zino.vo.StudyPlanVO"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/teacher/subject/regist_style.css" />
</head>
  <body>
    <div class="container-scroller container" style="max-width: 1403px; overflow: initial;">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="../inc/subject/sidebar.jsp"></jsp:include>
      <!-- sidebar.html end  -->
      
      <!-- partial  -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_navbar.html -->
        <jsp:include page="../inc/subject/navbar.jsp"></jsp:include>
        <!-- partial -->
        <div class="main-panel app--content--3vcMt" style="padding: 0px;" id="subjectApp" v-if="Object.keys(subject).length > 0">
           	<div class="sub-header--flex-align-center--1_RER sub-header--container--1pQeg">
           		<div class="sub-header--flex-align-center--1_RER sub-header--content--1H7YJ">
           			<h2 data-purpose="page-title" class="ud-heading-serif-xl">${studyPlanVO.getName()}</h2>
           		</div>
           	</div>
           	<div class="main-content--content--1Myl4">
           		<div class="goals--formgroup-box" id="app_goal">
	      			<div>
	      				<div class="ud-heading-md goals-form--question-label--1lkHx">상태 현황</div>
		      			<div class="form-group details-form--question-text-container--2ac22">
							<button v-if="subject.subject_permission==0" type="button" class="btn btn-primary btn-fw mr-3" style="font-size: 16px;" @click="subjectRequest()">검토 신청</button>
							<button v-else type="button" class="btn btn-secondary btn-fw mr-3" style="font-size: 16px;">검토 신청</button>
							<span>신청시 관리자의 검토 후 판매가 가능합니다.</span>
						</div>
		      			<div class="form-group details-form--question-text-container--2ac22">
							<button type="button" class="btn btn-danger btn-fw mr-3" style="font-size: 16px;" @click="del()">삭제</button>
							<span>삭제 신청 시 복구가 불가능 합니다.</span>
						</div>
	      			</div>
	      			
	      			<fieldset>
	      				<legend class="ud-form-label ud-heading-md">강의 공개/비공개</legend>
	      				<div class="zino-subject-selectbox-inline-field">
	      					<div class="course-basics-form--category-fields--1M1_V">
	      						<div class="form-group" id="category_app">
		      						<div class="ud-select-container ud-select-container-large" style="width: 100%;">
										<select aria-invalid="false" id="subject_access" class="mb-2 zino-subject-select">
											<option value="0">비공개</option>
											<option value="1">공개</option>
										</select>
										<span>공개 강의는 누구나 eduzino에서 볼 수 있습니다</span>
									</div>
    							</div>
  							</div>
  						</div>
  					</fieldset>
  					
           		</div>
				<div class="ud-form-group detail-form-btn-group">
					<button class="btn btn-primary mb-2 mb-md-0 mr-2 btn--form-grop-save float-right" @click="save()">저장하기</button>
				</div>
           	</div>
          <!-- content-wrapper ends -->
          <!-- partial -->
        </div>
        <div> 푸터올곳</div>
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
<script src="/resources/root/categoryApp.js"></script>
<script type="text/javascript">
let subjectApp;
function del(){
	$.ajax({
		url:"/teacher/rest/subject/${subject_idx}",
		type:"delete",
		success:function(result){
			alert("삭제성공");
			location.href="/teacher/subject/list"
		}
	});
}
function subjectRequest(){
	$.ajax({
		url:"/teacher/rest/subject/request",
		type:"post",
		data:{
			subject_idx:${subject_idx}
		},success:function(result){
			alert("요청성공");
			subjectApp.subject.subject_permission = 1;
		}
	});
}

function init(){
	subjectApp = new Vue({
		el:"#subjectApp",
		data:{
			subject:{}
		},methods:{
			del:function(){
				if(confirm("삭제하시겠습니까?")){			
					del();
				}
			},subjectRequest:function(){
				if(confirm("검토 신청 하시겠습니까?")){			
					subjectRequest();
				}
			},save:function(){
				let subject_access = $("#subject_access").val();
				$.ajax({
					url:"/teacher/rest/subject/access",
					type:"post",
					data:{
						subject_idx:${subject_idx},
						subject_access:subject_access
					},success:function(result){
						alert("저장완료");
					}
				});
			}
		},updated:function(){
			$("#subject_access").val(this.subject.subject_access);
		}
	});
	$.ajax({
		url:"/teacher/rest/subject/${subject_idx}/summary",
		type:"get",
		success:function(result){
			console.log("가져온 정보는 : ",result);
			subjectApp.subject = result;
		}
	});
	
	$("#bt_del").click(function(){
		
	});
	$("#bt_save").click(function(){
		
	});
}


$(function(){
	init();
});

</script>
</html>













