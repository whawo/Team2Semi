<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
	<jsp:param value="4weeks admin" name="title" />
</jsp:include>
<style>
	canvas {
		display: block;
		margin-left: auto;
		margin-right: auto;
	}
	/* div {
		border: 1px dotted gray;
	} */
</style>
<script src="/js/chartjs-plugin-doughnutlabel.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			//오늘 시작/종료 챌린지 수 차트
			url : "http://localhost:8888/admin/rest/report/chal/today",
			method : "get",
			dataType : "json",
			async : false,
			success : function(resp) {
				var values = [];
				values.push(resp.scnt);
				values.push(resp.ecnt);

				//차트 생성
				const ctx = document.querySelector('#startEndToday');
				const myChart = new Chart(ctx, {
					type : 'bar',
					data : {
						labels : [ "시작", "종료" ],
						datasets : [ {
							label : "챌린지 수",
							data : values,
							backgroundColor : [
							'rgba(108, 122, 239, 0.2)',
							'rgba(54, 162, 235, 0.2)' ],
							borderColor : [
							'rgb(108, 122, 239)', 
							'rgb(54, 162, 235)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							y : {
								type : 'linear',
								ticks : {
									stepSize : 1
								}
							}
						},
						plugins : {
							legend : {
								display: false
							},
							title : {
								display : true,
								text : moment().format("YY.MM.DD(ddd)"),
								padding: {
				                    bottom: 20
				                }
							}
						}
					}
				});
			}
		});
		
		$.ajax({
			//오늘 인증률 차트
			url : "http://localhost:8888/admin/rest/report/chal/today_confirm_rate",
			method : "get",
			dataType : "json",
			async : false,
			success : function(resp) {
				var values = [];
				values.push(resp);
				values.push(1-resp);
				console.log(values);
				//차트 생성
				const ctx = document.querySelector('#todayConfirmRate');
				const myChart = new Chart(ctx, {
					type : 'doughnut',
					data : {
						labels : [ "인증률" ],
						datasets : [ {
							label : "인증률",
							data : values,
							backgroundColor : [
							'rgba(108, 122, 239, 0.2)',
							'rgba(201, 203, 207, 0.2)'
							],
							borderColor : [
							'rgb(108, 122, 239)', 
							'rgb(201, 203, 207)'
							],
							borderWidth : 1
						} ]
					},
					options : {
						responsive: false,
						plugins : {
							legend : {
								display: false
							},
							title : {
								display : true,
								text : "오늘 인증률 = 진행 중인 챌린지의 오늘 인증글 수 / 참가자 수",
								padding: {
				                    bottom: 20
				                }
							},
							doughnutLabel: {
								labels: [
									{
										text: values[0] * 100 + "%",
										color: "black",
										font: {
											size: "25",
											family: "Arial, Helvetica, sans-serif",
											style: "italic",
											weight: "bold",
										}
									}]
							}
						},
						cutout:"80%",
						rotation: -90,
				        circumference: 180
					}
				});
			}
		});
		
		$.ajax({
			//오늘 가입/탈퇴자수 차트
			url : "http://localhost:8888/admin/rest/report/chal/today_user",
			method : "get",
			dataType : "json",
			async : false,
			success : function(resp) {
				var values = [];
				values.push(resp.joinedCnt);
				values.push(resp.leaveCnt);

				//차트 생성
				const ctx = document.querySelector("#joinedAndLeave");
				const myChart = new Chart(ctx, {
					type : 'bar',
					data : {
						labels : [ "가입회원", "탈퇴회원" ],
						datasets : [ {
							data : values,
							backgroundColor : [
							'rgba(108, 122, 239, 0.2)',
							'rgba(54, 162, 235, 0.2)' ],
							borderColor : [
							'rgb(108, 122, 239)', 
							'rgb(54, 162, 235)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							y : {
								type : 'linear',
								ticks : {
									stepSize : 1
								}
							}
						},
						plugins : {
							legend : {
								display: false
							},
							title : {
								display : true,
								text : moment().format("YY.MM.DD(ddd)"),
								padding: {
				                    bottom: 20
				                }
							}
						}
					}
				});
			}
		});
	});
</script>
</head>
<div id="dashboard">
	<div class="container-1200 mb-50">
		<div class="row float-container">
			<div class="row float-left w-33 p-20">
				<div class="row center">
					<h3>오늘 가입자/탈퇴자 수</h3>
				</div>
				<div class="row">
					<canvas id="joinedAndLeave"></canvas>
				</div>
			</div>
			<div class="row float-left w-33 p-50">
				<div class="row center">
					<h3>오늘 시작/종료 챌린지 수</h3>
				</div>
				<div class="row center">
					<canvas id="startEndToday"></canvas>
				</div>
			</div>
			<div class="row float-left w-33">
				<div class="row center">
					<h3>오늘 인증률</h3>
				</div>
				<div class="row center">
					<canvas id="todayConfirmRate" width="300" height="150"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- header에서 열린 태그 -->
</body>
</html>