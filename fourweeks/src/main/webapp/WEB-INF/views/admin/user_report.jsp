<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
	<jsp:param value="유저 통계" name="title" />
</jsp:include>
    
<style>

</style>

<script type="text/javascript">
   $(function () {
	   // 2022년 월별 가입자 통계
       $.ajax({
           url: "http://localhost:8888/admin/rest/report/chal/user",
           method: "get",
           dataType: "json",
           success: function (resp) {
               var labels = [];
               var values = [];
               for (var i = 0; i < resp.length; i++) {
                   labels.push(resp[i].joinDate);
                   values.push(resp[i].userCount);
               }
               const ctx = document.querySelector("#monthly-joiner");
               const myChart = new Chart(ctx, {
                   type: "bar",
                   data: {
                       labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                       datasets: [{
                               data: values,
                               backgroundColor: [
                                   "rgba(255, 99, 132, 0.2)",
                                   "rgba(54, 162, 235, 0.2)",
                                   "rgba(255, 206, 86, 0.2)",
                                   "rgba(75, 192, 192, 0.2)",
                                   "rgba(153, 102, 255, 0.2)",
                                   "rgba(255, 159, 64, 0.2)",
                               ],
                               borderColor: [
                                   "rgba(255, 99, 132, 1)",
                                   "rgba(54, 162, 235, 1)",
                                   "rgba(255, 206, 86, 1)",
                                   "rgba(75, 192, 192, 1)",
                                   "rgba(153, 102, 255, 1)",
                                   "rgba(255, 159, 64, 1)",
                               ],
                               borderWidth: 1,
                           },],
                   },
                   options: {
                      scales: {
                          y: {
                        	  beginAtZero: true,
                          },
                      },
                      plugins: {
                    	 legend: {
                    		 display: false
                    	 },
                      },
                   },
               });
           },
       });
    // 2022년 월별 탈퇴자 통계
       $.ajax({
           url: "http://localhost:8888/admin/rest/report/chal/leave_user",
           method: "get",
           dataType: "json",
           success: function (resp) {
               var labels = [];
               var values = [];
               for (var i = 0; i < resp.length; i++) {
                   labels.push(resp[i].leaveDate);
                   values.push(resp[i].leaveCount);
               }
               const ctx = document.querySelector("#monthly-leaver");
               const myChart = new Chart(ctx, {
                   type: "bar",
                   data: {
                       labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                       datasets: [{
                               data: values,
                               backgroundColor: [
                                   "rgba(255, 99, 132, 0.2)",
                                   "rgba(54, 162, 235, 0.2)",
                                   "rgba(255, 206, 86, 0.2)",
                                   "rgba(75, 192, 192, 0.2)",
                                   "rgba(153, 102, 255, 0.2)",
                                   "rgba(255, 159, 64, 0.2)",
                               ],
                               borderColor: [
                                   "rgba(255, 99, 132, 1)",
                                   "rgba(54, 162, 235, 1)",
                                   "rgba(255, 206, 86, 1)",
                                   "rgba(75, 192, 192, 1)",
                                   "rgba(153, 102, 255, 1)",
                                   "rgba(255, 159, 64, 1)",
                               ],
                               borderWidth: 1,
                           },],
                   },
                   options: {
                      scales: {
                          y: {
                        	  beginAtZero: true,
                        	  ticks : {
									stepSize : 1
								}
                          },
                      },
                      plugins: {
                    	 legend: {
                    		 display: false
                    	 },
                      },
                   },
               });
           },
       });
       // 2022년 월별 회원 로그인 통계
       $.ajax({
           url: "http://localhost:8888/admin/rest/report/chal/users_visit",
           method: "get",
           dataType: "json",
           success: function (resp) {
               var labels = [];
               var values = [];
               for (var i = 0; i < resp.length; i++) {
                   labels.push(resp[i].loginDate);
                   values.push(resp[i].visitCount);
               }
               const ctx = document.querySelector("#monthly-visitor");
               const myChart = new Chart(ctx, {
                   type: "bar",
                   data: {
                       labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                       datasets: [{
                               data: values,
                               backgroundColor: [
                                   "rgba(255, 99, 132, 0.2)",
                                   "rgba(54, 162, 235, 0.2)",
                                   "rgba(255, 206, 86, 0.2)",
                                   "rgba(75, 192, 192, 0.2)",
                                   "rgba(153, 102, 255, 0.2)",
                                   "rgba(255, 159, 64, 0.2)",
                               ],
                               borderColor: [
                                   "rgba(255, 99, 132, 1)",
                                   "rgba(54, 162, 235, 1)",
                                   "rgba(255, 206, 86, 1)",
                                   "rgba(75, 192, 192, 1)",
                                   "rgba(153, 102, 255, 1)",
                                   "rgba(255, 159, 64, 1)",
                               ],
                               borderWidth: 1,
                           },],
                   },
                   options: {
                      scales: {
                          y: {
                        	  beginAtZero: true,
                          },
                      },
                      plugins: {
                    	 legend: {
                    		 display: false
                    	 },
                      },
                   },
               });
           },
       });
   });
   </script>
</head>
<div id="dashboard">
	<div class="container-1000 mb-50">
		<div class="row float-container">
			<div class="row float-left w-50 p-20 mb-50">
				<div class="row center">
					<h3>2022년 월별 가입자수</h3>
				</div>
				<div class="row">
					<canvas id="monthly-joiner"></canvas>
				</div>
			</div>
			
			<div class="row float-left w-50">
				<div class="row center">
					<h3>2022년 월별 탈퇴자수</h3>
				</div>
				<div class="row center">
					<canvas id="monthly-leaver"></canvas>
				</div>
			</div>
		</div>
		
		<div class="row float-container">
			
			<!-- <div class="row float-left w-50">
				<div class="row center">
					<h3>최근 한달 방문자수</h3>
				</div>
				<div class="row center">
					<canvas id="#"></canvas>
				</div>
			</div> -->
			
			<div class="row float-left w-50">
				<div class="row center">
					<h3>2022년 월별 방문자수(가입회원)</h3>
				</div>
				<div class="row center">
					<canvas id="monthly-visitor"></canvas>
				</div>
			</div>
			
		</div>
	</div>
</div>
<!-- header에서 열린 태그 -->
</body>
</html>