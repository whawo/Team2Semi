<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
	<jsp:param value="유저 통계" name="title" />
</jsp:include>
    
<style>
    div {
        border: 1px dotted gray;
    }
</style>

<script type="text/javascript">
   $(function () {
       $.ajax({
           url: "http://localhost:8888/admin/rest/report/chal/user",
           method: "get",
           dataType: "json", // 서버에서 돌아온다고 믿고 있는 타입
           success: function (resp) {
               // 비어있는 배열 2개를 만들고 resp의 데이터를 분산 저장
               var labels = [];
               var values = [];
               for (var i = 0; i < resp.length; i++) {
                   labels.push(resp[i].joinDate);
                   values.push(resp[i].userCount);
               }
               const ctx = document.querySelector("#month-per-joined");
               const myChart = new Chart(ctx, {
                   type: "bar",
                   data: {
                       labels: labels,
                       datasets: [
                           {
                               label: "가입자수",
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
                           },
                       ],
                   },
                   options: {
                       scales: {
                           y: {
                               beginAtZero: true,
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
					<canvas id="month-per-joined"></canvas>
				</div>
			</div>
			<div class="row float-left w-50">
				<div class="row center">
					<h3>2022년 분기별 가입자수</h3>
				</div>
				<div class="row center">
					<canvas id="quarter-per-joined"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- header에서 열린 태그 -->
</body>
</html>