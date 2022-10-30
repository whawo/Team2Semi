<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유저 통계</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/css_admin/reset.css">
    <link rel="stylesheet" type="text/css" href="/css_admin/layout.css">
    <link rel="stylesheet" type="text/css" href="/css_admin/commons.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
    <style>
        div {
            border: 1px dotted gray;
        }
    </style>
    <!-- jquery 라이브러리 -->
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- chart.js 라이브러리-->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
<body>
    <div class="container-1000 mb-50">
		<div class="row float-container">
			<div class="row float-left w-50 p-20">
				<div class="row center">
					<h3>2022년 월별 가입자수</h3>
				</div>
				<div class="row">
					<canvas id="month-per-joined"></canvas>
				</div>
			</div>
			<div class="row float-right w-50">
				<div class="row center">
					<h3>2022년 분기별 가입자수</h3>
				</div>
				<div class="row">
					<canvas id="quarter-per-joined"></canvas>
				</div>
			</div>
		</div>
    </div>
</body>
</html>