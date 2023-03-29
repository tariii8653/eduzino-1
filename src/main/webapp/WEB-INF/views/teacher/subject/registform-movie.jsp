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
        <div class="main-panel app--content--3vcMt" style="padding: 0px;">
           	<div class="sub-header--flex-align-center--1_RER sub-header--container--1pQeg">
           		<div class="sub-header--flex-align-center--1_RER sub-header--content--1H7YJ">
           			<h2 data-purpose="page-title" class="ud-heading-serif-xl">${studyPlanVO.getName()}</h2>
           		</div>
           	</div>
           	<div class="main-content--content--1Myl4" id="subjectApp">
           		<div class="goals--formgroup-box" id="app_goal">
           			<p class="goals-form--subtitle--3R5d-">
	       				<span>다음 설명은 강의 미리보기에서 공개되며 강의 성과에 직접적으로 영향을 미칩니다. 이러한 설명은 수강생이 강의가 자신에게 맞는지 여부를 판단할 수 있도록 돕습니다.</span>
	      			</p>
	      			<div>
	      				<template v-for="(item,i) in sectionList">
		      				<section_item :videos="list" :page="page" :item="item" :no="i" />
	      				</template>
	      			</div>
           		</div>
           		<div>
           			<div class="zino-subject-movie-plus-btn-box" style="background: #fff">
      					<button @click="sectionPlus('')">섹션 추가</button>
      				</div>
           		</div>
				<div class="ud-form-btn-group">
					<button class="btn btn--form-grop-save float-right" id="bt_save">저장하기</button>
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
<script src="/resources/teacher/subject/js/video_row.js"></script>
<script src="/resources/teacher/subject/js/pagination.js"></script>
<script src="/resources/teacher/subject/js/movie_item.js"></script>
<script type="text/javascript">
let subjectApp;
const subject = {
		subject_idx:${subject_idx}
};
let videoState = {
	page: {
		totalRecord: 0,
		blockSize: 10,
		pageSize: 10,
		totalPage: 0,
		firstPage: 0,
		lastPage: 0,
		currentPage: 1,
		no: 0,
		curPos: 0,
		prevFlag:true,
		nextFlag:true,
	},
	list:{
		videoList:[],
		showList:[],
	},
	setTotalRecoard() {
		this.page.totalRecord = this.list.videoList.length;
		this.init();
	},
	setVideoList(videoList){
		this.list.videoList = videoList;
	},
	setShowList(){
		this.list.showList = this.list.videoList.slice(this.page.curPos,this.page.curPos+this.page.pageSize);
	},
	setCurrentPage(currentPage){
		this.page.currentPage = currentPage;
		this.init();
		this.setShowList();
	},
	init(){
		this.page.totalPage = Math.ceil(this.page.totalRecord/this.page.pageSize);
		this.page.firstPage = this.page.currentPage-(this.page.currentPage%this.page.blockSize-1);
		this.page.lastPage = parseInt(this.page.firstPage)+parseInt(this.page.blockSize);
		this.page.curPos = (this.page.currentPage-1)*this.page.pageSize;
		this.page.no = this.page.totalRecord-this.page.curPos;
		if(this.page.currentPage<11){
			this.page.prevFlag = false;
		}
		if(this.page.lastPage>this.page.totalPage){
			this.page.nextFlag=false;
		}
	}
}
let sectionState={
	state:{		
		sectionList:[]
	},del(idx){
		this.state.sectionList.splice(idx,1);
	}
}

const section_item={
	template:`
		<div class="zino-subject-section-form-group">
			<div class="zino-subject-movie-form-head">
				<div class="display-flex">
					<span class="zino-subject-movie-form-head-label">      						
						섹션{{no+1}}:
					</span>
					<div v-if="!flag.sectionTitleEditFlag" class="zino-subject-movie-form-head-input">
						<i class="bi bi-file-earmark"></i>
						<span class="zino-subject-movie-form-head-value">{{item.section_name}}</span>
						<div class="zino-subject-movie-head-icon-box">
							<button class="zino-subject-movie-edit-icon" @click="sectionNameEditEvent()">
	     						<i class="bi bi-pencil-fill"></i>
							</button>
							<button class="zino-subject-movie-delete-icon" @click="sectionDelete()">
	     						<i class="bi bi-eraser-fill"></i>
							</button>
						</div>
					</div> 
					<div v-else class="flex zino-subject-movie-form-head-input">
						<input class="form-control dp-inline zino-subject-input" :value="item.section_name" @input="nameInputEvent($event)"/>
					</div>
					<div v-if="flag.sectionTitleEditFlag" class="zino-subject-movie-title-btn-box">
						<button class="btn btn-primary" @click="sectionNameEditEvent()">취소</button>
						<button class="btn btn-primary" @click="sectionNameSave()">저장</button>
					</div>
				</div>
			</div>
			<div class="zino-subject-movie-form-body">
				<template v-for="(item,i) in movieItemList">
					<movie_item :key="item.key" :videos="videos" :pm="page" :item="item" :group="movieItemList" :no="i"/>		      					
				</template>
				<div class="zino-subject-movie-plus-btn-box">
 					<button @click="movieItemPlus('')">커리큘럼 추가</button>
 				</div>
			</div>
		</div>
	`,props:['videos','page','item','no']
	,data(){
		return{
			movieItemList:sectionState.state.sectionList[this.no].movieList,
			key:1,
			sectionTempName:this.item.section_name,
			flag:{
				sectionTitleEditFlag:true,
			}
		};
	},components:{
		movie_item
	},methods:{
		movieItemPlus:function(movie_name){
			let item = {};
			item['key']=this.key++;
			item['movie_name']=movie_name;
			this.movieItemList.push(item);
		},nameInputEvent(event){
			this.sectionTempName = event.target.value;
		},sectionNameEditEvent:function(){
			this.flag.sectionTitleEditFlag=!this.flag.sectionTitleEditFlag;
		},sectionNameSave:function(){
			this.item.section_name = this.sectionTempName;
			this.sectionNameEditEvent();
		},sectionDelete:function(){
			sectionState.del(this.no);
		}
	},created:function(){
		console.log("최초의 no는 ?  ",this.no);
		if(this.no == 0 && this.movieItemList.length < 1){
			let item = {};
			item['key']=this.key++;
			item['movie_name']='소개';
			this.movieItemList.push(item);
		}
		if(this.item.section_name.length>0){
			this.flag.sectionTitleEditFlag = false;
		}
	},updated:function(){
		videoState.setTotalRecoard();
		videoState.setShowList();
		console.log("section updated",this.movieItemList);
	}
}


//html태그에서는 대소문자를 구문못하기때문에 대문자로 사용할시 인식불가
subjectApp= new Vue({
	el:"#subjectApp",
	data:{
		list:videoState.list,//강사가 보유중인 전체 강의들
		page: videoState.page,
		sectionList:sectionState.state.sectionList,
		key:1
	},
	components:{
		section_item
	},methods:{
		setList:function(videoList){
			videoState.setVideoList(videoList);
			videoState.setTotalRecoard();
			videoState.setShowList();
		},sectionPlus:function(section_name){
			console.log('sectionPlus');
			let item = {};
			item['key']=this.key++;
			item['section_name']=section_name;
			item['subject'] = subject;
			item['movieList']= [];
			this.sectionList.push(item);
		}
	}
});
let sectionObj;
function sectionSave(){
	console.log("넘길 Data : ",JSON.stringify(subjectApp.sectionList));
	$.ajax({
		url:"/teacher/rest/subject/${subject_idx}/section",
		type: 'POST',
		contentType: "application/json; charset=utf-8",
		async: false,
		dataType: 'json',
		data:JSON.stringify(subjectApp.sectionList)
		,success:function(result,status,xhr){
			console.log(result);
			alert("저장완료");
		}
	});
}
function getSubjectMovie(){
	$.ajax({
		url:"/teacher/rest/subject/${subject_idx}/section",
		type: 'get',
		success:function(result,status,xhr){
			console.log(result);
			console.log("result length : ",result.length);
			if(result.length<1){
				subjectApp.sectionPlus("소개");
			}else{
				sectionState.state.sectionList = result;
				subjectApp.sectionList = sectionState.state.sectionList;
			}
		}
	});
}

function init(){	
	$.ajax({
		url:"/rest/teacher/videos/${teacher.teacher_idx}",
		type:"get",
		success:function(result){
			subjectApp.setList(result);
		}
	});
	$("#bt_save").click(function(){
		sectionSave();
	});
	getSubjectMovie();
}
$(function(){
	init();
});
</script>
</html>