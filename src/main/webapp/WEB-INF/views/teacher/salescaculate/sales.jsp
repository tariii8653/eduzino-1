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
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_settings-panel.html -->
        <!-- partial -->
        <!-- partial:partials/_navbar.html -->
        <jsp:include page="../inc/navbar.jsp"></jsp:include>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper pb-0">
            
            
            <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
	    		<i class="fa fa-calendar"></i>&nbsp;
	   			<span></span>
	   			<i class="fa fa-caret-down"></i>
			</div>

            
            
            
			<div class="card">
                <div class="card-body">
                	<div class="chartjs-size-monitor">
                		<div class="chartjs-size-monitor-expand">
                			<div class=""></div>
            			</div>
	            		<div class="chartjs-size-monitor-shrink">
	            			<div class=""></div>
	            		</div>
	            	</div>
                    <h4 class="card-title">Bar chart</h4>
                    <canvas id="barChart" style="height: 134px; display: block; width: 269px;" width="336" height="167" class="chartjs-render-monitor"></canvas>
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
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  <script type="text/javascript">
  
  
  $(function() {
		 var start = moment();
		    var end = moment();

		    function cb(start, end) {
		        $('#reportrange span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
		    }

		    $('#reportrange').daterangepicker({
		        startDate: start,
		        endDate: end,
		        ranges: {
		           '최근 일별 매출': [moment().subtract(6, 'days'), moment()],
		           '이번달 주간 매출': [moment().startOf('month'), moment().endOf('month')],
		           '최근 월별 매출': [moment().subtract(6, 'months'), moment().endOf('month')]
		        },
		        locale: {
		            "separator": " ~ ",                     // 시작일시와 종료일시 구분자
		            "format": 'YYYY-MM-DD',     // 일시 노출 포맷
		            "applyLabel": "확인",                    // 확인 버튼 텍스트
		            "cancelLabel": "취소",                   // 취소 버튼 텍스트
		            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		            }
		    }, cb);

		    cb(start, end);
		    


		});
  </script>

</html>