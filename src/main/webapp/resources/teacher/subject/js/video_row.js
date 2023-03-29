/**
 * 
 */
const video_row = {
		template:`
			<tr>
				<td>{{video.video_name}}</td>
				<td>
					<button class="btn btn-primary zino-subject-movie-select-btn" @click="choose(video)">선택</button>
					<button class="btn btn-danger zino-subject-movie-delete-btn" @click="del(video)">삭제</button>
				</td>
			</tr>
		`,props:['row_item','movieFlag','movie_item']
		,data(){
			return{
				video:this.row_item
			};
		},methods:{
			choose:function(video){
				console.log('선택메서드',video);
				this.movieFlag.videoShowFlag = false;
				this.movieFlag.selectedVideoFlag = true;
				this.movie_item['video']=video;
				console.log("video 추가 후 Movie Item : ",this.movie_item);
			},
			del:function(video){
				let video_idx = video.video_idx;
				$.ajax({
					url:"/rest/teacher/video/delete",
					type:"post",
					data:{
						video_idx:video_idx,
						teacher_idx:1
					},success:function(result){
						alert("삭제되었습니다.");
						subjectApp.setList(result);
					}
				});
			}
		}
	}