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
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_sidebar.html -->
      <jsp:include page="../inc/sidebar.jsp"></jsp:include>
      <!-- sidebar.html end  -->
      
      <!-- partial  -->
        <!-- partial -->
        <!-- partial:partials/_navbar.html -->
        <jsp:include page="../inc/navbar.jsp"></jsp:include>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper pb-0">
            <div class="page-header flex-wrap">
              <div class="header-left d-flex flex-wrap mt-2 mt-sm-0">
              <div class="btn-group mb-2 mb-md-0 mr-2" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary" id="day"> 일간 </button>
                            <button type="button" class="btn btn-outline-secondary border-left border-left-sm-0" id="month"> 월간 </button>
                            <button type="button" class="btn btn-outline-secondary" id="year"> 년간 </button>
               </div>
               
                <!-- date -->
                <div class="inputdate mb-2 mb-md-0 mr-2">
		            <input type="date" name="startDate">
		             ~ 
		            <input type="date" name="endDate">                
                </div>

              </div>
              <div class="header-right d-flex flex-wrap mt-2 mt-sm-0">

			
              
              </div>
            </div>
            
            
            <!-- first row starts here -->
            <div class="row">
              <div class="col stretch-card grid-margin"">
                <div class="card">
                  <div class="card-body">
                       <canvas id="barChart" style="height: 134px; display: block; width: 269px;" width="336" height="167" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            
            <!-- table row starts here -->
            <div class="row">
             <div class="col-xl-8 stretch-card grid-margin">
                <div class="card">
                  <div class="card-body pb-0">
                    <h4 class="font-weight-bold mb-0">매출상세</h4>
                  </div>
                  <div class="card-body p-0">
                    <div class="table-responsive">
                      <table class="table custom-table text-dark">
                        <thead>
                          <tr>
                            <th>기간</th>
                            <th>매출금액</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>2023-02-01 ~ 2023-02-28</td>
                            <td>40,234</td>
                          </tr>
                          <tr>
                            <td>2023-02-01 ~ 2023-02-28</td>
                            <td>765728</td>
                          </tr>
                          <tr>
                            <td>2023-02-01 ~ 2023-02-28</td>
                            <td>22437</td>
                          </tr>
                          <tr>
                            <td>2023-02-01 ~ 2023-02-28</td>
                            <td>1,75938</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            
              <div class="col-xl-4 grid-margin">
              <div class="card">
                  <div class="card-body">
                    <div class="d-flex border-bottom mb-4 pb-2">
                    <h4 class="font-weight-bold mb-0">정산</h4>
                    <div class="pl-4">
						<input type="month" name="monthCaculate">

                      </div>
                    </div>
                    <div class="d-flex border-bottom mb-4 pb-2">
                        <h4 class="font-weight-bold text-success mb-0">매출금액</h4>
                      <div class="pl-4">
                        <h6 class="text-muted">2,750,000</h6>
                      </div>
                    </div>
                    <div class="d-flex border-bottom mb-4 pb-2">
                        <h4 class="font-weight-bold text-danger mb-0"> 수수료 </h4>
                      <div class="pl-4">
                        <h6 class="text-muted"> -30,000</h6>
                      </div>
                    </div>
                    <div class="d-flex border-bottom mb-4 pb-2">
                        <h4 class="font-weight-bold text-info mb-0">합계</h4>
                      <div class="pl-4">
                        <h6 class="text-muted">2,720,000</h6>
                      </div>
                    </div>
                  </div>
                </div>
              
              </div>
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
  

  <script type="text/javascript">
	
	/*----------------------------------------------------------
		버튼에 날짜 이벤트
	------------------------------------------------------------*/
  	let date = new Date();
	let y=date.getFullYear();
	let m=date.getMonth();
	let d=date.getDate();
	let todayMonth; //현재 월
	let todayDay; //현재 일

	$(function() {
		
		if(m < 10){
			todayMonth = '0'+(m+1);
			todayDay = '0'+d
		}else {
			todayMonth = (m+1);
			todayDay = d
		}
		
		$("input[name=monthCaculate]").val(y+"-"+todayMonth);
		  
		//일간 (12일)
		$("#day").click(function(){
			$("input[name=startDate]").val(y+"-"+todayMonth+"-"+(d-11));
			$("input[name=endDate]").val(y+"-"+todayMonth+"-"+d);
		});
		
		//월간 (1~12월)
		$("#month").click(function(){
			let first = new Date(y,(todayMonth-12),1); //구하고자 하는 달의 첫번째 일
			let firstMonth;
			let firstDay;
			
			
			if(first.getDate() < 10){
				firstMonth = '0'+(first.getMonth()+1);
				firstDay = '0'+first.getDate();
			}
			let last = new Date(y,todayMonth,0);
			
			
			$("input[name=startDate]").val(first.getFullYear()+"-"+firstMonth+"-"+firstDay);
			$("input[name=endDate]").val(y+"-"+todayMonth+"-"+last.getDate());
		});
		
		//년간 (12년)
		$("#year").click(function(){
			let first = new Date((y-11),1,1); //구하고자 하는 달의 첫번째 일
			let firstMonth;
			let firstDay;
			
			if(first.getDate() < 10){
				firstMonth = '0'+first.getMonth();
				firstDay = '0'+first.getDate();
			}
			let last = new Date(y,todayMonth,0);
			
			$("input[name=startDate]").val(first.getFullYear()+"-"+firstMonth+"-"+firstDay);
			$("input[name=endDate]").val(y+"-12-"+last.getDate());
		});


	});
  </script>

</html>