<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>챌린지 통계</title>
    
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
        $(function(){
            $.ajax({
                //오늘 시작/종료 챌린지 수 차트
                url:"http://localhost:8888/admin/rest/report/chal/today",
                method:"get",
                dataType:"json",
                async: false,
                success:function(resp){
                    var values = [];
                    values.push(resp.scnt);
                    values.push(resp.ecnt);
                    
                    //차트 생성
                    const ctx = document.querySelector('#startEndToday');
                    const myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: ["시작", "종료"],
                            datasets: [{
                                label: "챌린지 수",
                                data: values,
                                backgroundColor: [
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(54, 162, 235, 0.2)'
                                ],
                                borderColor: [
                                'rgb(75, 192, 192)',
                                'rgb(54, 162, 235)'
                                ],
                                borderWidth: 1
                            }]
                        }
                    });
                }
            });

            $.ajax({
                //최근 6개월 시작 챌린지 수 차트
                url:"http://localhost:8888/admin/rest/report/chal/half",
                method:"get",
                dataType:"json",
                success:function(resp){
                    console.log(resp);
                    var labels = [];
                    var values = [];
                    for(i = 0; i < resp.length; i++) {
                        labels.push(resp[i].startMonth);
                        values.push(resp[i].cnt);
                    }
                    console.log(labels);
                    console.log(values);
                    //차트 생성
                    const ctx = document.querySelector('#startHalf');
                    const myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: "챌린지 수",
                                data: values,
                                backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 205, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(153, 102, 255, 0.2)'
                                ],
                                borderColor: [
                                'rgb(255, 99, 132)',
                                'rgb(255, 159, 64)',
                                'rgb(255, 205, 86)',
                                'rgb(75, 192, 192)',
                                'rgb(54, 162, 235)',
                                'rgb(153, 102, 255)'
                                ],
                                borderWidth: 1
                            }]
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
    <div class="container-1000 mb-50">
		<div class="row float-container">
			<div class="row float-left w-50 p-20">
				<div class="row center">
					<h3>오늘 시작/종료 챌린지 수</h3>
				</div>
				<div class="row">
					<canvas id="startEndToday"></canvas>
				</div>
			</div>
			<div class="row float-right w-50">
				<div class="row center">
					<h3>최근 6개월 시작 챌린지 수</h3>
				</div>
				<div class="row">
					<canvas id="startHalf"></canvas>
				</div>
			</div>
		</div>
    </div>
</body>
</html>