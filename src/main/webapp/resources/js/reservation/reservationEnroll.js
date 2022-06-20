
		$(document).on('click','.reservation_submit',function(){
			let enrollFormReservation = document.enrollFormReservation;
			// empNo 		// 사원번호
			// roomSmallNo;	// 회의실 번호
			// startDate;	// 시작일
			// endDate;		// 종료일
			// meetingName;	// 회의명
			// status;		// 상태값
			let empNo = enrollFormReservation.empNo.value;
			let roomSmallNo = enrollFormReservation.roomSmallNo.value;
			let startDate = enrollFormReservation.startDate.value;
			let startTime = enrollFormReservation.startTime.value;
			let endDate = enrollFormReservation.endDate.value;
			let endTime = enrollFormReservation.endTime.value;
			let meetingName = enrollFormReservation.meetingName.value;
			let attendeeNo = new Object();
			
			let meetingRoom = $(".res-smallCategory").val()

			if(enrollFormReservation.attendeeNo != undefined){
				console.log("들어옴 =========")
				let size = $("input[name = 'attendeeNo']").length
				
				for(let i = 0; i < size ; i++){
					attendeeNo[i] = $("input[name = 'attendeeNo']").eq(i).val()
					console.log($("input[name = 'attendeeNo']").eq(i).val());
					console.log("나감 ======")
				}
			}
			console.log(attendeeNo.length)
			console.log(empNo)
			console.log(roomSmallNo)
			console.log(startDate)
			console.log(startTime)
			console.log(endDate)
			console.log(endDate)
			console.log(meetingName)
			// 회의실번호가 없으면
			if(roomSmallNo == '' || roomSmallNo == undefined || meetingRoom == '선택'){
				$("#res-alert_title .title_name").text("회의실 선택 확인");
				$("#res-alert_body .res-alert_content").text("회의실을 선택해야 합니다.");
				$(".reservationEnrollFormModal").hide();
				$("#res-alertBackground").css("display","block");
				
				
			}else if(startDate == '' || startTime == '선택' || endDate == '' || endTime == '선택'){// 시작일이나 종료일을 선택 하지 않을 시
				
				alertok("예약 날짜, 시간 선택 확인", "예약 날짜나 시간을 선택해야 합니다.");
				// alert 확인 버튼시
				$(".res_Ok_btn").click(function(){
					
					$("#res-alertBackground").hide();
					$(".reservationEnrollFormModal").show();
					return false;
				})
			}else if(Object.keys(attendeeNo).length <=  0){ // 초대자가 없으면
				
				alertok("참석자 선택 확인", "참석자를 선택해야 합니다.");
				// alert 확인 버튼시
				$(".res_Ok_btn").click(function(){
					
					$("#res-alertBackground").hide();
					$(".reservationEnrollFormModal").show();
					return false;
				})
				
			}else if(meetingName == ''){// 회의명이 없으면
			
				
				alertok("회의명 작성 확인", "회의명 작성해야 합니다.");
				// alert 확인 버튼시
				$(".res_Ok_btn").click(function(){
					
					$("#res-alertBackground").hide();
					$(".reservationEnrollFormModal").show();
					return false;
				})
			}else{ // 모두 작성 시 submit
				//enrollFormReservation.submit();
				let push = $('.PushOrUpdate').val();
				if(push == 1){
					startDate = startDate+" "+startTime;
					endDate = endDate+" "+endTime;
					
					let obj = {
						empNo:empNo,
						roomSmallNo:roomSmallNo,
						startDate:startDate,
						endDate:endDate,
						meetingName:meetingName
					}
					
					
					$.ajax({
						url:"insertReservation.do",
						data:{
							reservation:obj,
							attendeeNo:attendeeNo
						},
						type:"post",
						success:function(index){
							console.log(index)
							
							if(index > 0){
								location.href = "roomReservation.do";
							}
						},
						error:function(error){
							console.log("실패")
						}
					})
				}else if(push == 2){
					startDate = startDate+" "+startTime;
					endDate = endDate+" "+endTime;
					// 6.18일 예약업데이트 관련 추가 됨
					let reserveNo = $('#enrollForm-Reservation .reserveNo').val()
					let obj = {
						empNo:empNo,
						roomSmallNo:roomSmallNo,
						startDate:startDate,
						endDate:endDate,
						meetingName:meetingName,
						reserveNo : reserveNo
					}
					
					
					$.ajax({
						url:"updateReservation.do",
						data:{
							reservation:obj,
							attendeeNo:attendeeNo
						},
						type:"post",
						success:function(index){
							console.log(index)
							
							if(index > 0){
								location.href = "roomReservation.do";
							}
						},
						error:function(error){
							console.log("실패")
						}
					})
				}
			}
			
		})
		$(function(){
			
			let start = document.getElementById("res-startDate")
			let minn = new Date().toISOString().substring(0, 10);
			console.log(minn)
			start.min = minn;
			
			// 날짜 선택시 종료일도 min 처리
			$(document).on('change','#res-startDate',function(){
				console.log("시작일 값 바꿈")
				
				let minval = document.getElementById("res-startDate").value
				let end = document.getElementById("res-endDate")
				
				console.log(minval)
				end.min = minval;
				
			})
			
			// 대분류 미팅룸 이름
			$.ajax({
				url:"selectLroomList.do",
				type:"get",
				success:function(list){
					console.log("대분류 미팅룸 찾기 성공")
					
					let select = $(".res-bigCategory")
					
					if(list.length != 0){
						$.each(list, function(index, obj){
							
							let option = $("<option>")
							
							let largeName = obj.largeRoomName;
							let lNo = obj.roomLargeNo;
							
							console.log(largeName)
							option.val(lNo)
							option.append(largeName)
							select.append(option)
						})
					}
				},
				error:function(){
					console.log("대분류 미팅룸 찾기 실패")
				}
			})
			
			// 소분류 미팅룸 이름
			$(document).on('change',".res-bigCategory", function() {
				let lNo = $('.res-bigCategory').val()
				console.log(lNo)
				$.ajax({
					url:"selectSroomList.do",
					data:{
						lNo:lNo
					},
					type:"get",
					success:function(list){
						console.log("소분류 미팅룸 찾기 성공")
						
						let select = $(".res-smallCategory")
						let base = $("<option>").val("선택").text("선택")
						select.empty()
						select.append(base)
						if(list.length != 0){
							$.each(list, function(index, obj){
								
								let option = $("<option>")
								
								let smallName = obj.smallRoomName;
								let sNo = obj.roomSmallNo;
								let max = obj.maxCount;
								
								console.log(smallName)
								option.val(sNo)
								option.append(smallName).append(" - ("+max+"명)")
								select.append(option)
							})
						}
						
					},
					error:function(){
						console.log("소분류 미팅룸 찾기 실패")
					}
				})
			})
			// 부서 알아오기
			$.ajax({
				url:"selectResDepartment.do",
				type:"get",
				success:function(list){
					console.log("부서찾기 성공")
					
					if(list.length != 0){
						
						let dep = $(".res-department")
						
						$.each(list, function(index, val){
							//<p><span>예시팀</span><input type="hidden" value="1"/></p>
							let p = $("<p>").addClass("department-pline")
							let span = $("<span>")
							let inphidd = $("<input>").attr("type","hidden")
							let name = val.departmentTitle;
							let no = val.departNo;
							
							inphidd.val(no)
							span.append(name)
							p.append(span).append(inphidd)
							dep.append(p)
							
						})
					}
				},
				error:function(){
					console.log("부서찾기 실패")
				}
			})

			let arr = new Array();
			let arr5 = new Array();
			// 날짜 선택 시 
			$(document).on('change','.res-startDate',function(){
				console.log("시작일 바꿈")

				let sRoom = $(".res-smallCategory").val()
				let startDate = $('.res-startDate').val()
				
				// 6.18일 예약업데이트 관련 추가 됨
				let reserveNo = $('#enrollForm-Reservation .reserveNo').val()
				
				let Default = '<option value="선택">선택</option>'; 
				$("#res-startTime").empty().append(Default)
				
				
				arr = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30",
					   "06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30",
					   "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30",
					   "18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"];
				$.ajax({
					url:"selectreservation.do",
					data:{
						startDate : startDate,
						sRoom : sRoom,
						reserveNo : reserveNo
					},
					type:"get",
					success:function(list){
						console.log("값 가져오기 성공")
						
						// 값을 가져왔을 시 존재하는 시간대 제외하고 선택할 수 있게 해주기
						if(list.length != 0){
							
							let $ResStartTime = $('.res-startTime')
							let op = $('<option>').val("선택").text("선택")
							$ResStartTime.empty();
							$ResStartTime.append(op)
							
							
							$.each(list, function(index, val){
								let startDate = val.startDate;
								let endDate = val.endDate;
								console.log(startDate)
								console.log(endDate)
								let start = new Date(startDate);
								let end = new Date(endDate);
								// 시작시간이 가능한 시간대만 보여주기
								for(let i = start ; i <= end ;){
									let midTime = "";
									// 00분이면 시만 뽑기
									if(i.getMinutes() == 0){
										let hour = ""+i.getHours();
										
										if(hour.length != 1){
											midTime = hour+":00";
										}else{
											midTime = "0"+hour+":00";
										}
										
										//console.log('시만 존재 : '+midTime)

									}else if(i.getMinutes() == 30){
										//midTime = i.getHours()+"시 "+i.getMinutes()+"분";
										let hour = ""+i.getHours();
										
										if(hour.length != 1){
											midTime = hour+":"+i.getMinutes();
										}else{
											midTime = "0"+hour+":"+i.getMinutes();
										}
										
										//console.log('분도 존재 : '+midTime)
									}
									
									
									// 해당 시간동안 예약이 존재 하니 없애주기
									for(let j = 0 ; j < arr.length ; j++){
										if(arr[j] == midTime){
											arr.splice(j, 1);
											j--;
										}
									}
									//<option value="00:00">오전0시</option>
									i.setMinutes(i.getMinutes()+30)
								}
							})
							
						}
						
					},
					error:function(){
						console.log("값 가져오기 실패")
					},
					complete : function(data, status) {
						console.log("안나오니?")
						
						console.log(arr)
						// 시작시간가능한거(예약 있는 시간대 제외 해야함) -- 제대로 안탐 6/14
						$.each(arr, function(index, obj){
							
							let option = $("<option>");
							option.val(obj).text(obj);
							$('.res-startTime').append(option)
						})
					}
				})
				
				
			})
			

			// .res-startTime 값 change시 이후에가능한 시간 뽑아오기
			$(document).on('change','.res-startTime',function(){
				let startDate = $("#res-startDate").val()
				let startTime = $("#res-startTime").val()
				let sRoom = $(".res-smallCategory").val()
				let endDate = $("#res-endDate")
				
				// 다시 선택했을 때도 고려 하기 위해 empty()
				let $ResEndTime = $('.res-endTime')
				let op = $('<option>').val("선택").text("선택")
				$ResEndTime.empty();
				$ResEndTime.append(op)
				
				// 종료일에 시작일 값 넣기
				endDate.val(startDate);
				
				startDate += " "+startTime;
				
				// 6.18일 예약업데이트 관련 추가 됨
				let reserveNo = $('#enrollForm-Reservation .reserveNo').val()
				
				let arr1 = new Array();
				arr1 = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30",
					   "06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30",
					   "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30",
					   "18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"];
				
				$.ajax({
					url:"selectreservation.do",
					data:{
						startDate : startDate,
						sRoom:sRoom,
						reserveNo : reserveNo
					},
					type:"get",
					success:function(list){
						console.log("값 가져오기 성공")
						
						// 값을 가져왔을 시 존재하는 시간대 제외하고 선택할 수 있게 해주기
						if(list.length != 0){
							
							let $ResEndTime = $('.res-endTime')
							let op = $('<option>').val("선택").text("선택")
							$ResEndTime.empty();
							$ResEndTime.append(op)
							
							
							$.each(list, function(index, val){
								// startTime이후 일 시에만
								let startDate = val.startDate;
								let endDate = val.endDate;
								let start = new Date(startDate);
								let end = new Date(endDate);
								
								// 예약 시작일의 시간
								let arrrr = startDate.split(' ')
								
								let resTime = arrrr[1];
								resTime = resTime.substring(0,5);
								arrrr = resTime.split(":")
								let resHours = arrrr[0];
								let resMinutes = arrrr[1];
								
								console.log("resTime : "+resTime)
								// 시작 시간 가져오기(예약 되어있는 시간과 비교 하기 위해)
								let startTimeval = $("#res-startTime").val()
								let startHour = Number(startTimeval.substring(0,2)) 	// 시작시간 시
								let startMinute = Number(startTimeval.substring(3,5)) 	// 시작시간 분
								
								// 종료가능한 시간대만 보여주기
								// (startTime 이전의 시간도 지워야함)
								
								// 예약할 시간 이후의 첫 예약일 시작시간 선언
								let eStandard = "";
								// 예약할 시간의 배열 위치(가져온 이유는 이 인덱스 기준으로 이전 값을 모두 지울거임)
								let sStandard = arr1.indexOf(startTimeval)

								// 에이젝스로 받아왔을때 각 예약의 시간이 고객의 예약할 시간보다 늦거나 같을 때 예약 시작일을 갖고오기
								// 각 예약의 시간을 가져오는건 startDate의 뒷 부분 Hour과 Minutes를 비교 하자
								
								// 이제 시간 지우기
								// 1. 예약할 시작시간 이전 값들 모두 지우기
								for(let h = 0 ; h <= sStandard ; h++){
									arr1.shift();
								}
								
								// 2. 예약이 존재하는 값이후 모두 지우기 (얘가 안됨 6/15)
								// 예약된 시간이 예약할 시간보다 크거나 같으면
								if(resHours >= startHour && resMinutes >= startMinute){
									// 끝에 사라진 기준점 넣기
									eStandard = resTime;
									console.log("끝 기준점 : " + eStandard)
									
									// 기준점 기준으로 삭제
									arr1 = arr1.slice(0, arr1.indexOf(eStandard));
									
									if(startHour < 19){
										$("#res-endDate").attr("readonly", true);
										return false;
									}else{
										let end = document.getElementById("res-endDate")
										let max = document.getElementById("res-startDate").value;
										console.log(max)
										let dateee = new Date(max)
										dateee.setDate(dateee.getDate()+1)
										max = dateee.getFullYear()+"-"+("0"+(dateee.getMonth()+1))+"-"+dateee.getDate();
										console.log(max)
										end.max = max;
										
										if($("#res-endDate").attr("readonly")){
											$("#res-endDate").attr("readonly", false);
										}
										return false;
									}
								}else{
									// 5시간 제한 잡기(정비 시간 포함 5시간 30분)
									// 1. 오후 6시(18시 30분) 보다 적을시엔 종료날짜 readonly 걸어두기
									if(startHour < 19){
										$("#res-endDate").attr("readonly", true);
										
										// 5시간30분뒤 시간 생성
										let limit = new Date($("#res-startDate").val()+(' '+startTimeval))
										limit.setMinutes(limit.getMinutes()+330);
										console.log("limit : "+limit)
										
										let limitEnd = new Date($("#res-startDate").val()+' 23:30')
										// 1-1. 최대 5시간 이후는 값 지워주기
										for(let i = limit ; i <= limitEnd ;){
											let midTime = "";
											// 00분이면 시만 뽑기
											if(i.getMinutes() == 0){
												let hour = ""+i.getHours();
												
												if(hour.length != 1){
													midTime = hour+":00";
												}else{
													midTime = "0"+hour+":00";
												}
											}else if(i.getMinutes() == 30){
												let hour = ""+i.getHours();
												
												if(hour.length != 1){
													midTime = hour+":"+i.getMinutes();
												}else{
													midTime = "0"+hour+":"+i.getMinutes();
												}
											}
											// 해당 시간동안 예약이 존재 하니 없애주기
											for(let j = 0 ; j < arr1.length ; j++){
												if(arr1[j] == midTime){
													arr1.splice(j, 1);
													break;
												}
											}
											i.setMinutes(i.getMinutes()+30)
										}
										
									// 2. 오후 7시(19시) 이상이면(같은것 포함) 종료날짜 max을 다음날까지 체크(이후 날짜 선택시 에게 맡긴다.)
									}else{
										let end = document.getElementById("res-endDate")
										let max = document.getElementById("res-startDate").value;
										console.log(max)
										let dateee = new Date(max)
										dateee.setDate(dateee.getDate()+1)
										max = dateee.getFullYear()+"-"+("0"+(dateee.getMonth()+1))+"-"+dateee.getDate();
										console.log(max)
										end.max = max;
										
										if($("#res-endDate").attr("readonly")){
											$("#res-endDate").attr("readonly", false);
										}
									}
								}
									
							})
							
						}else{
							
							// 시작 시간 가져오기(예약 되어있는 시간과 비교 하기 위해)
							let startTimeval = $("#res-startTime").val()
							let startHour = Number(startTimeval.substring(0,2)) 	// 시작시간 시
							let startMinute = Number(startTimeval.substring(3,5)) 	// 시작시간 분
							
							// 종료가능한 시간대만 보여주기
							// (startTime 이전의 시간도 지워야함)
							
							// 예약할 시간 이후의 첫 예약일 시작시간 선언
							let eStandard = "";
							// 예약할 시간의 배열 위치(가져온 이유는 이 인덱스 기준으로 이전 값을 모두 지울거임)
							let sStandard = arr1.indexOf(startTimeval)

							// 에이젝스로 받아왔을때 각 예약의 시간이 고객의 예약할 시간보다 늦거나 같을 때 예약 시작일을 갖고오기
							// 각 예약의 시간을 가져오는건 startDate의 뒷 부분 Hour과 Minutes를 비교 하자
							
							// 이제 시간 지우기
							// 1. 예약할 시작시간 이전 값들 모두 지우기
							for(let h = 0 ; h <= sStandard ; h++){
								arr1.shift();
							}
							
							// 5시간 제한 잡기(정비 시간 포함 5시간 30분)
							// 1. 오후 6시(18시 30분) 보다 적을시엔 종료날짜 readonly 걸어두기
							if(startHour < 19){
								$("#res-endDate").attr("readonly", true);
								
								// 5시간30분뒤 시간 생성
								let limit = new Date($("#res-startDate").val()+(' '+startTimeval))
								limit.setMinutes(limit.getMinutes()+330);
								console.log("limit : "+limit)
								
								let limitEnd = new Date($("#res-startDate").val()+' 23:30')
								// 1-1. 최대 5시간 이후는 값 지워주기
								for(let i = limit ; i <= limitEnd ;){
									let midTime = "";
									// 00분이면 시만 뽑기
									if(i.getMinutes() == 0){
										let hour = ""+i.getHours();
										
										if(hour.length != 1){
											midTime = hour+":00";
										}else{
											midTime = "0"+hour+":00";
										}
									}else if(i.getMinutes() == 30){
										let hour = ""+i.getHours();
										
										if(hour.length != 1){
											midTime = hour+":"+i.getMinutes();
										}else{
											midTime = "0"+hour+":"+i.getMinutes();
										}
									}
									// 해당 시간은 5시간30분 초과하니까 없애주기
									for(let j = 0 ; j < arr1.length ; j++){
										if(arr1[j] == midTime){
											arr1.splice(j, 1);
											
										}
									}
									i.setMinutes(i.getMinutes()+30)
								}
								
							// 2. 오후 7시(19시) 이상이면(같은것 포함) 종료날짜 max을 다음날까지 체크(이후 날짜 선택시 에게 맡긴다.)
							}else{
								let end = document.getElementById("res-endDate")
								let max = document.getElementById("res-startDate").value;
								console.log(max)
								let dateee = new Date(max)
								dateee.setDate(dateee.getDate()+1)
								max = dateee.getFullYear()+"-"+("0"+(dateee.getMonth()+1))+"-"+dateee.getDate();
								console.log(max)
								end.max = max;
								
								if($("#res-endDate").attr("readonly")){
									$("#res-endDate").attr("readonly", false);
								}
							}
						}
						
					},
					error:function(){
						console.log("값 가져오기 실패")
					},
					complete : function(data, status) {
						console.log("안나오니?")
						
						console.log(arr1)
						// 종료시간가능한거(예약 있는 시간대 제외 해야함)
						// arr1가 존재하면(종료 시간이 존재하면)
						if(arr1.length != 0){
							
							$.each(arr1, function(index, obj){
								// 최대 5시간
								let hour1 = obj.substring(0,2)
								let minute1 = obj.substring(3,5)
								
								// 오후 7시 이후는 최대 5시간 이므로 00시부터 04시30분까지 가능하니 유의
								// starttime시간,분 부터 보여줘야함 
								// 끝은 이후에 예약 되있는 startTime 까지 이거나 없으면 5시간까지 보여줘야 한다
								let option = $("<option>");
								option.val(obj).text(obj);
								$('.res-endTime').append(option)
							})
						}
					}
				})
			})
			
			// 만약 endDate를 change 하면 하루전 최대 가능한 시간 뽑아주기
			$(document).on('change','#res-endDate',function(){
				console.log("종료일 바꿈")
				
				
				
				// 예약시작 시간 가져오기
				let startTime = new Date($("#res-startDate").val()+" "+$("#res-startTime").val());
				
				let limitstart = new Date($("#res-endDate").val())
				limitstart.setHours(0);
				limitstart.setMinutes(0);
				
				let arr = new Array();
				// startDate와 endDate가 같지 않을떼(하루 차이)
				if($("#res-startDate").val() != $("#res-endDate").val()){
					
					// 최대 5시간 30분
					startTime.setMinutes(startTime.getMinutes()+330) // 5시간 50분 뒤
					//	startTime.setDate(startTime.getDate()+1)
					let limit = startTime;
					console.log(limitstart)
					console.log(limit)
					let count = 0;
					// for문 돌리기(시작 시간다음날의 00시00분 ~ 시작시간의 최대 5시간 30분까지) 
					for(let i = limitstart ; i < limit; i.setMinutes(i.getMinutes()+30)){
						// 배열에 새로 담고 뿌려주기
						
						// 각 30분 마다 넣을 시간 변수
						let midTime = "";
						
						// 00분이면 시만 뽑기
						if(i.getMinutes() == 0){
							let hour = ""+i.getHours();
							
							if(hour.length != 1){
								midTime = hour+":00";
							}else{
								midTime = "0"+hour+":00";
							}
						}else if(i.getMinutes() == 30){
							// 30분이면 분까지 
							let hour = ""+i.getHours();
							
							if(hour.length != 1){
								midTime = hour+":"+i.getMinutes();
							}else{
								midTime = "0"+hour+":"+i.getMinutes();
							}
						}
						
						// 만들어진 midTime을 배열에 넣어주기
						arr.push(midTime)
					}
					console.log("다음날 arr ~ 시작시간 이후의 5시간 30분")
					console.log(arr)
					
					// endDate를 value를 변수에 담아 저장
					let endDate = $("#res-endDate").val()
					let sRoom = $(".res-smallCategory").val()
					
					// 6.18일 예약업데이트 관련 추가 됨
					let reserveNo = $('#enrollForm-Reservation .reserveNo').val()
					
					// 그 다음날의 예약 현황을 봐야 하기 때문에 ajax로 값을 부른다
					$.ajax({
					url:"selectreservation.do",
					data:{
						startDate : endDate,
						sRoom:sRoom,
						reserveNo:reserveNo
					},
					type:"get",
					success:function(list){
						console.log("값 가져오기 성공")
						
						// 값을 가져왔을 시 존재하는 시간대 제외하고 선택할 수 있게 해주기
						if(list.length != 0){
							
							let $ResEndTime = $('.res-endTime')
							let op = $('<option>').val("선택").text("선택")
							$ResEndTime.empty();
							$ResEndTime.append(op)
							
							
							$.each(list, function(index, val){
								// startTime이후 일 시에만
								let startDate = val.startDate;
								let endDate = val.endDate;
								let start = new Date(startDate);
								let end = new Date(endDate);
								
								// 예약 시작일의 시간
								let arrrr = startDate.split(' ')
								
								let resTime = arrrr[1];
								resTime = resTime.substring(0,5);
								arrrr = resTime.split(":")
								let resHours = arrrr[0];
								let resMinutes = arrrr[1];
								
								console.log("resTime : "+resTime)
								// 초기화된시간 가져오기(예약 되어있는 시간과 비교 하기 위해)
								let startTimeval = arr[0];
								let startHour = Number(startTimeval.substring(0,2)) 	// 시작시간 시
								let startMinute = Number(startTimeval.substring(3,5)) 	// 시작시간 분
								
								// 종료가능한 시간대만 보여주기
								// (startTime 이전의 시간도 지워야함)
								
								// 예약할 시간 이후의 첫 예약일 시작시간 선언
								let eStandard = "";
								// 예약할 시간의 배열 위치(가져온 이유는 이 인덱스 기준으로 이전 값을 모두 지울거임)
								let sStandard = arr.indexOf(startTimeval)

								// 에이젝스로 받아왔을때 각 예약의 시간이 고객의 예약할 시간보다 늦거나 같을 때 예약 시작일을 갖고오기
								// 각 예약의 시간을 가져오는건 startDate의 뒷 부분 Hour과 Minutes를 비교 하자
								
								// 이제 시간 지우기
								// 1. 예약할 시작시간 이전 값들 모두 지우기
								for(let h = 0 ; h < sStandard ; h++){
									arr.shift();
								}
								
								// 2. 예약이 존재하는 값이후 모두 지우기 (얘가 안됨 6/15)
								// 예약된 시간이 예약할 시간보다 크거나 같으면
								if(resHours >= startHour && resMinutes >= startMinute){
									// 끝에 사라진 기준점 넣기
									eStandard = resTime;
									console.log("끝 기준점 : " + eStandard)
									
									// 기준점 기준으로 삭제
									arr = arr.slice(0, arr.indexOf(eStandard));
									
									
								}else{
									// 5시간 제한 잡기(정비 시간 포함 5시간 30분)
									// 1. 오후 6시(18시 30분) 보다 적을시엔 종료날짜 readonly 걸어두기
									if(startHour < 19){
										$("#res-endDate").attr("readonly", true);
										
										// 5시간30분뒤 시간 생성
										let limit = new Date($("#res-startDate").val()+(' '+startTimeval))
										limit.setMinutes(limit.getMinutes()+330);
										console.log("limit : "+limit)
										
										let limitEnd = new Date($("#res-startDate").val()+' 23:30')
										// 1-1. 최대 5시간 이후는 값 지워주기
										for(let i = limit ; i <= limitEnd ;){
											let midTime = "";
											// 00분이면 시만 뽑기
											if(i.getMinutes() == 0){
												let hour = ""+i.getHours();
												
												if(hour.length != 1){
													midTime = hour+":00";
												}else{
													midTime = "0"+hour+":00";
												}
											}else if(i.getMinutes() == 30){
												let hour = ""+i.getHours();
												
												if(hour.length != 1){
													midTime = hour+":"+i.getMinutes();
												}else{
													midTime = "0"+hour+":"+i.getMinutes();
												}
											}
											// 해당 시간동안 예약이 존재 하니 없애주기
											for(let j = 0 ; j < arr1.length ; j++){
												if(arr[j] == midTime){
													arr.splice(j, 1);
													break;
												}
											}
											i.setMinutes(i.getMinutes()+30)
										}
										
									// 2. 오후 7시(19시) 이상이면(같은것 포함) 종료날짜 max을 다음날까지 체크(이후 날짜 선택시 에게 맡긴다.)
									}
								}
									
							})
							
						}else{
							
							// 시작 시간 가져오기(예약 되어있는 시간과 비교 하기 위해)
							let startTimeval = $("#res-startTime").val()
							let startHour = Number(startTimeval.substring(0,2)) 	// 시작시간 시
							let startMinute = Number(startTimeval.substring(3,5)) 	// 시작시간 분
							
							// 종료가능한 시간대만 보여주기
							// (startTime 이전의 시간도 지워야함)
							
							// 예약할 시간 이후의 첫 예약일 시작시간 선언
							let eStandard = "";
							// 예약할 시간의 배열 위치(가져온 이유는 이 인덱스 기준으로 이전 값을 모두 지울거임)
							let sStandard = arr.indexOf(startTimeval)

							// 에이젝스로 받아왔을때 각 예약의 시간이 고객의 예약할 시간보다 늦거나 같을 때 예약 시작일을 갖고오기
							// 각 예약의 시간을 가져오는건 startDate의 뒷 부분 Hour과 Minutes를 비교 하자
							
							// 이제 시간 지우기
							// 1. 예약할 시작시간 이전 값들 모두 지우기
							for(let h = 0 ; h <= sStandard ; h++){
								arr.shift();
							}
							
							// 5시간 제한 잡기(정비 시간 포함 5시간 30분)
							// 1. 오후 6시(18시 30분) 보다 적을시엔 종료날짜 readonly 걸어두기
							if(startHour < 19){
								$("#res-endDate").attr("readonly", true);
								
								// 5시간30분뒤 시간 생성
								let limit = new Date($("#res-startDate").val()+(' '+startTimeval))
								limit.setMinutes(limit.getMinutes()+330);
								console.log("limit : "+limit)
								
								let limitEnd = new Date($("#res-startDate").val()+' 23:30')
								// 1-1. 최대 5시간 이후는 값 지워주기
								for(let i = limit ; i <= limitEnd ;){
									let midTime = "";
									// 00분이면 시만 뽑기
									if(i.getMinutes() == 0){
										let hour = ""+i.getHours();
										
										if(hour.length != 1){
											midTime = hour+":00";
										}else{
											midTime = "0"+hour+":00";
										}
									}else if(i.getMinutes() == 30){
										let hour = ""+i.getHours();
										
										if(hour.length != 1){
											midTime = hour+":"+i.getMinutes();
										}else{
											midTime = "0"+hour+":"+i.getMinutes();
										}
									}
									// 해당 시간은 5시간30분 초과하니까 없애주기
									for(let j = 0 ; j < arr1.length ; j++){
										if(arr[j] == midTime){
											arr.splice(j, 1);
											
										}
									}
									i.setMinutes(i.getMinutes()+30)
								}
								
							
							}
						}
						
					},
					error:function(){
						console.log("값 가져오기 실패")
					},
					complete : function(data, status) {
						console.log("안나오니?")
						
						console.log(arr)
						// 종료시간가능한거(예약 있는 시간대 제외 해야함)
						// arr가 존재하면(종료 시간이 존재하면)
						if(arr.length != 0){
							let $ResEndTime = $('.res-endTime')
							let op = $('<option>').val("선택").text("선택")
							$ResEndTime.empty();
							$ResEndTime.append(op)
							$.each(arr, function(index, obj){
								// 최대 5시간
								let hour1 = obj.substring(0,2)
								let minute1 = obj.substring(3,5)
								
								// 오후 7시 이후는 최대 5시간 이므로 00시부터 04시30분까지 가능하니 유의
								// starttime시간,분 부터 보여줘야함 
								// 끝은 이후에 예약 되있는 startTime 까지 이거나 없으면 5시간까지 보여줘야 한다
								let option = $("<option>");
								option.val(obj).text(obj);
								$('.res-endTime').append(option)
							})
						}
					}
					// 예약 시작 시간 의 첫 시간이 for문 돌린 시와 시간이 같거나 크면
				})
			}else{// 날짜가 같을 시
				let startDate = $("#res-startDate").val()
				let startTime = $("#res-startTime").val()
				let sRoom = $(".res-smallCategory").val()
				let endDate = $("#res-endDate")
				
				// 종료일에 시작일 값 넣기
				endDate.val(startDate);
				
				startDate += " "+startTime;
				
				// 6.18일 예약업데이트 관련 추가 됨
				let reserveNo = $('#enrollForm-Reservation .reserveNo').val()
				
				let arr1 = new Array();
				arr1 = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30",
					   "06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30",
					   "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30",
					   "18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"];
				
				$.ajax({
					url:"selectreservation.do",
					data:{
						startDate : startDate,
						sRoom:sRoom,
						reserveNo : reserveNo
					},
					type:"get",
					success:function(list){
						console.log("값 가져오기 성공")
						
						// 값을 가져왔을 시 존재하는 시간대 제외하고 선택할 수 있게 해주기
						if(list.length != 0){
							
							let $ResEndTime = $('.res-endTime')
							let op = $('<option>').val("선택").text("선택")
							$ResEndTime.empty();
							$ResEndTime.append(op)
							
							
							$.each(list, function(index, val){
								// startTime이후 일 시에만
								let startDate = val.startDate;
								let endDate = val.endDate;
								let start = new Date(startDate);
								let end = new Date(endDate);
								
								// 예약 시작일의 시간
								let arrrr = startDate.split(' ')
								
								let resTime = arrrr[1];
								resTime = resTime.substring(0,5);
								arrrr = resTime.split(":")
								let resHours = arrrr[0];
								let resMinutes = arrrr[1];
								
								console.log("resTime : "+resTime)
								// 시작 시간 가져오기(예약 되어있는 시간과 비교 하기 위해)
								let startTimeval = $("#res-startTime").val()
								let startHour = Number(startTimeval.substring(0,2)) 	// 시작시간 시
								let startMinute = Number(startTimeval.substring(3,5)) 	// 시작시간 분
								
								// 종료가능한 시간대만 보여주기
								// (startTime 이전의 시간도 지워야함)
								
								// 예약할 시간 이후의 첫 예약일 시작시간 선언
								let eStandard = "";
								// 예약할 시간의 배열 위치(가져온 이유는 이 인덱스 기준으로 이전 값을 모두 지울거임)
								let sStandard = arr1.indexOf(startTimeval)

								// 에이젝스로 받아왔을때 각 예약의 시간이 고객의 예약할 시간보다 늦거나 같을 때 예약 시작일을 갖고오기
								// 각 예약의 시간을 가져오는건 startDate의 뒷 부분 Hour과 Minutes를 비교 하자
								
								// 이제 시간 지우기
								// 1. 예약할 시작시간 이전 값들 모두 지우기
								for(let h = 0 ; h <= sStandard ; h++){
									arr1.shift();
								}
								
								// 2. 예약이 존재하는 값이후 모두 지우기 (얘가 안됨 6/15)
								// 예약된 시간이 예약할 시간보다 크거나 같으면
								if(resHours >= startHour && resMinutes >= startMinute){
									// 끝에 사라진 기준점 넣기
									eStandard = resTime;
									console.log("끝 기준점 : " + eStandard)
									
									// 기준점 기준으로 삭제
									arr1 = arr1.slice(0, arr1.indexOf(eStandard));
									
									if(startHour < 19){
										$("#res-endDate").attr("readonly", true);
										return false;
									}else{
										let end = document.getElementById("res-endDate")
										let max = document.getElementById("res-startDate").value;
										console.log(max)
										let dateee = new Date(max)
										dateee.setDate(dateee.getDate()+1)
										max = dateee.getFullYear()+"-"+("0"+(dateee.getMonth()+1))+"-"+dateee.getDate();
										console.log(max)
										end.max = max;
										
										if($("#res-endDate").attr("readonly")){
											$("#res-endDate").attr("readonly", false);
										}
										return false;
									}
								}else{
									// 5시간 제한 잡기(정비 시간 포함 5시간 30분)
									// 1. 오후 6시(18시 30분) 보다 적을시엔 종료날짜 readonly 걸어두기
									if(startHour < 19){
										$("#res-endDate").attr("readonly", true);
										
										// 5시간30분뒤 시간 생성
										let limit = new Date($("#res-startDate").val()+(' '+startTimeval))
										limit.setMinutes(limit.getMinutes()+330);
										console.log("limit : "+limit)
										
										let limitEnd = new Date($("#res-startDate").val()+' 23:30')
										// 1-1. 최대 5시간 이후는 값 지워주기
										for(let i = limit ; i <= limitEnd ;){
											let midTime = "";
											// 00분이면 시만 뽑기
											if(i.getMinutes() == 0){
												let hour = ""+i.getHours();
												
												if(hour.length != 1){
													midTime = hour+":00";
												}else{
													midTime = "0"+hour+":00";
												}
											}else if(i.getMinutes() == 30){
												let hour = ""+i.getHours();
												
												if(hour.length != 1){
													midTime = hour+":"+i.getMinutes();
												}else{
													midTime = "0"+hour+":"+i.getMinutes();
												}
											}
											// 해당 시간동안 예약이 존재 하니 없애주기
											for(let j = 0 ; j < arr1.length ; j++){
												if(arr1[j] == midTime){
													arr1.splice(j, 1);
													break;
												}
											}
											i.setMinutes(i.getMinutes()+30)
										}
										
									// 2. 오후 7시(19시) 이상이면(같은것 포함) 종료날짜 max을 다음날까지 체크(이후 날짜 선택시 에게 맡긴다.)
									}else{
										let end = document.getElementById("res-endDate")
										let max = document.getElementById("res-startDate").value;
										console.log(max)
										let dateee = new Date(max)
										dateee.setDate(dateee.getDate()+1)
										max = dateee.getFullYear()+"-"+("0"+(dateee.getMonth()+1))+"-"+dateee.getDate();
										console.log(max)
										end.max = max;
										
										if($("#res-endDate").attr("readonly")){
											$("#res-endDate").attr("readonly", false);
										}
									}
								}
									
							})
							
						}else{
							
							// 시작 시간 가져오기(예약 되어있는 시간과 비교 하기 위해)
							let startTimeval = $("#res-startTime").val()
							let startHour = Number(startTimeval.substring(0,2)) 	// 시작시간 시
							let startMinute = Number(startTimeval.substring(3,5)) 	// 시작시간 분
							
							// 종료가능한 시간대만 보여주기
							// (startTime 이전의 시간도 지워야함)
							
							// 예약할 시간 이후의 첫 예약일 시작시간 선언
							let eStandard = "";
							// 예약할 시간의 배열 위치(가져온 이유는 이 인덱스 기준으로 이전 값을 모두 지울거임)
							let sStandard = arr1.indexOf(startTimeval)

							// 에이젝스로 받아왔을때 각 예약의 시간이 고객의 예약할 시간보다 늦거나 같을 때 예약 시작일을 갖고오기
							// 각 예약의 시간을 가져오는건 startDate의 뒷 부분 Hour과 Minutes를 비교 하자
							
							// 이제 시간 지우기
							// 1. 예약할 시작시간 이전 값들 모두 지우기
							for(let h = 0 ; h <= sStandard ; h++){
								arr1.shift();
							}
							
							// 5시간 제한 잡기(정비 시간 포함 5시간 30분)
							// 1. 오후 6시(18시 30분) 보다 적을시엔 종료날짜 readonly 걸어두기
							if(startHour < 19){
								$("#res-endDate").attr("readonly", true);
								
								// 5시간30분뒤 시간 생성
								let limit = new Date($("#res-startDate").val()+(' '+startTimeval))
								limit.setMinutes(limit.getMinutes()+330);
								console.log("limit : "+limit)
								
								let limitEnd = new Date($("#res-startDate").val()+' 23:30')
								// 1-1. 최대 5시간 이후는 값 지워주기
								for(let i = limit ; i <= limitEnd ;){
									let midTime = "";
									// 00분이면 시만 뽑기
									if(i.getMinutes() == 0){
										let hour = ""+i.getHours();
										
										if(hour.length != 1){
											midTime = hour+":00";
										}else{
											midTime = "0"+hour+":00";
										}
									}else if(i.getMinutes() == 30){
										let hour = ""+i.getHours();
										
										if(hour.length != 1){
											midTime = hour+":"+i.getMinutes();
										}else{
											midTime = "0"+hour+":"+i.getMinutes();
										}
									}
									// 해당 시간은 5시간30분 초과하니까 없애주기
									for(let j = 0 ; j < arr1.length ; j++){
										if(arr1[j] == midTime){
											arr1.splice(j, 1);
											
										}
									}
									i.setMinutes(i.getMinutes()+30)
								}
								
							// 2. 오후 7시(19시) 이상이면(같은것 포함) 종료날짜 max을 다음날까지 체크(이후 날짜 선택시 에게 맡긴다.)
							}else{
								let end = document.getElementById("res-endDate")
								let max = document.getElementById("res-startDate").value;
								console.log(max)
								let dateee = new Date(max)
								dateee.setDate(dateee.getDate()+1)
								max = dateee.getFullYear()+"-"+("0"+(dateee.getMonth()+1))+"-"+dateee.getDate();
								console.log(max)
								end.max = max;
								
								if($("#res-endDate").attr("readonly")){
									$("#res-endDate").attr("readonly", false);
								}
							}
						}
						
					},
					error:function(){
						console.log("값 가져오기 실패")
					},
					complete : function(data, status) {
						console.log("안나오니?")
						
						console.log(arr1)
						// 종료시간가능한거(예약 있는 시간대 제외 해야함)
						// arr1가 존재하면(종료 시간이 존재하면)
						if(arr1.length != 0){
							
							$.each(arr1, function(index, obj){
								// 최대 5시간
								let hour1 = obj.substring(0,2)
								let minute1 = obj.substring(3,5)
								
								// 오후 7시 이후는 최대 5시간 이므로 00시부터 04시30분까지 가능하니 유의
								// starttime시간,분 부터 보여줘야함 
								// 끝은 이후에 예약 되있는 startTime 까지 이거나 없으면 5시간까지 보여줘야 한다
								let option = $("<option>");
								option.val(obj).text(obj);
								$('.res-endTime').append(option)
							})
						}
					}
				})
			}
		})
			
			// 주소록 버튼 클릭시 div창이 뜸
			$(document).on('click','.reserve_contact',function(){
				$('.res-addressBox').toggle();
			})
			
			// 부서 클릭시 해당하는 사원 뜨게하기
			$(document).on('click','.department-pline',function(){
				//.department-pline
				let dNo = $(this).children('input').val()
				console.log(dNo)
				$.ajax({
					url:"selectResAddress.do",
					data:{
						dNo : dNo
					},
					type:"get",
					success:function(list){
						console.log("부서 내 사원 이름 찾기 성공")
						
						if(list.length != 0){
							
							let dep = $(".res-empName")
							dep.empty();
							$.each(list, function(index, val){
								//<p><span>예시사원</span><input type="hidden" value="1"/></p>
								let p = $("<p>").addClass("empName-pline")
								let span = $("<span>").addClass("empName-res")
								let inphidd = $("<input>").attr("type","hidden")
								let name = val.empName;
								let no = val.empNo;
								
								inphidd.val(no)
								span.append(name)
								p.append(span).append(inphidd)
								dep.append(p)
								
							})
						}
					},
					error:function(error){
						console.log("부서 내 사원 이름 찾기 실패")
					}
				})
			})

			// x버튼 클릭시 사라짐
			$(document).on('click','.image-x',function(){
				let parent = $(this).parent().attr("class");
				parent = parent.split(" ")
				console.log(parent[1]);
				parent = parent[1];
				
				$("."+parent).remove();
			})
			
			
			// 취소 버튼 클릭시 히든
			$(document).on("click",'.reservationEnroll_cancelbtn',function(){
				$('.res-smallCategory option').remove();
				
				let op = $('<option>')
				op.text('선택')
				op.val('선택')
				$('.res-smallCategory').append(op)
				
				$('.res-bigCategory').val('선택').prop('selected', true);
				$('.res-startDate').val('')
				$('.res-startTime').val('선택').prop('selected', true);
				$('.res-endTime').val('선택').prop('selected', true);
				$('.res-endDate').val('')
				$('.reservation-member').empty()
				$('#meetingName').empty()
				$('.res-endDate').attr('readonly',false)
				
				
				$(".reservationEnrollFormModal").css("display","none");
				
			})
		})