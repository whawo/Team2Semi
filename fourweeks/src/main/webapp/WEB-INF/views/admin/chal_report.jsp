<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
	<jsp:param value="챌린지 통계" name="title" />
</jsp:include>
<style>
	canvas {
		display: block;
		margin-left: 30px;
		margin-right: 30px;
	}
</style>
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
			//최근 6개월 시작 챌린지 수 차트
			url : "http://localhost:8888/admin/rest/report/chal/half",
			method : "get",
			dataType : "json",
			async : false,
			success : function(resp) {
				var labels = [];
				var values = [];
				for (i = 0; i < resp.length; i++) {
					labels.push(resp[i].startMonth);
					values.push(resp[i].cnt);
				}
				//차트 생성
				const ctx = document.querySelector('#startHalf');
				const myChart = new Chart(ctx, {
					type : 'line',
					data : {
						labels : labels,
						datasets : [ {
							label : "챌린지 수",
							data : values,
							fill : false,
							borderColor : 'rgb(108, 122, 239)',
							tension : 0.1,
							borderWidth : 2
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
								text : moment().add(-5, "months").format("YY.MM") + " - " + moment().format("YY.MM"),
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
			//지난 달 주제별 시작 챌린지 수
			url : "http://localhost:8888/admin/rest/report/chal/topic_last",
			method : "get",
			dataType : "json",
			async : false,
			success : function(resp) {
				var lastLabels = [];
				var lastValues = [];
				for (i = 0; i < resp.length; i++) {
					lastLabels.push(resp[i].chalTopic);
					lastValues.push(resp[i].chalCnt);
				}
				$.ajax({
					//이번 달 주제별 시작 챌린지 수
					url : "http://localhost:8888/admin/rest/report/chal/topic_this",
					method : "get",
					dataType : "json",
					async : false,
					success : function(resp) {
						var labels = [];
						var values = [];
						for (i = 0; i < resp.length; i++) {
							labels.push(resp[i].chalTopic);
							values.push(resp[i].chalCnt);
						}
						//차트 생성
						const ctx = document.querySelector('#topicMonthly');
						const myChart = new Chart(ctx, {
							type : 'line',
							data : {
								labels : lastLabels,
								datasets : [
										{
											label : "2022-09",
											data : lastValues,
											fill : false,
											borderColor : 'rgba(54, 162, 235, 0.3)',
											tension : 0.1,
											borderWidth : 2
										},
										{
											label : "2022-10",
											data : values,
											fill : false,
											borderColor : 'rgb(108, 122, 239)',
											tension : 0.1,
											borderWidth : 2
										},

								]
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
										position : 'top',
									},
									title : {
										display : true,
										text : moment().add(-1, "months").format("YY.MM") + " 시작 vs. " + moment().format("YY.MM") + " 시작",
										padding: {
						                    bottom: 20
						                }
									}
								}
							}
						});
					}
				});
			}
		});

		$.ajax({
			//이번 달 주제별 시작 챌린지 수
			url : "http://localhost:8888/admin/rest/report/chal/topic_this",
			method : "get",
			dataType : "json",
			async : false,
			success : function(resp) {
				var chalLabels = [];
				var chalValues = [];
				for (i = 0; i < resp.length; i++) {
					chalLabels.push(resp[i].chalTopic);
					chalValues.push(resp[i].chalCnt);
				}
				$.ajax({
					//이번 달 주제별 참가자 수 평균
					url : "http://localhost:8888/admin/rest/report/chal/part_topic",
					method : "get",
					dataType : "json",
					async : false,
					success : function(resp) {
						var partLabels = [];
						var partValues = [];
						for (i = 0; i < resp.length; i++) {
							partLabels.push(resp[i].chalTopic);
							partValues.push(resp[i].partCnt);
						}
						//차트 생성
						const ctx = document.querySelector('#participantByTopic');
						const myChart = new Chart(ctx, {
							type : 'line',
							data : {
								labels : chalLabels,
								datasets : [
										{
											type : 'bar',
											label : "챌린지 수",
											data : chalValues,
											fill : false,
											borderColor : 'rgb(54, 162, 235)',
											backgroundColor : 'rgba(54, 162, 235, 0.2)'
										},
										{
											type : 'line',
											label : "참가자 수",
											data : partValues,
											fill : false,
											borderColor : 'rgb(108, 122, 239)',
											tension : 0.1,
											borderWidth : 2
										},

								]
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
										position : 'top',
									},
									title : {
										display : true,
										text : moment().format("YY.MM") + " 시작 챌린지 기준",
										padding: {
						                    bottom: 20
						                }
									}
								}
							}
						});
					}
				});
			}
		});
	});
</script>
</head>
<div id="dashboard">
	<div class="container-1000 mb-50">
		<div class="row float-container">
			<div class="row float-left w-50 p-20 mb-50">
				<div class="row center">
					<h3>오늘 시작/종료 챌린지 수</h3>
				</div>
				<div class="row">
					<canvas id="startEndToday"></canvas>
				</div>
			</div>
			<div class="row float-left w-50">
				<div class="row center">
					<h3>최근 6개월 시작 챌린지 수</h3>
				</div>
				<div class="row center">
					<canvas id="startHalf"></canvas>
				</div>
			</div>
		</div>
		<div class="row float-container">
			<div class="row float-left w-50 p-20">
				<div class="row center">
					<h3>주제별 챌린지 수 비교</h3>
				</div>
				<div class="row">
					<canvas id="topicMonthly"></canvas>
				</div>
			</div>
			<div class="row float-left w-50">
				<div class="row center">
					<h3>주제별 평균 참가자 수</h3>
				</div>
				<div class="row">
					<canvas id="participantByTopic"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- header에서 열린 태그 -->
</body>
</html>