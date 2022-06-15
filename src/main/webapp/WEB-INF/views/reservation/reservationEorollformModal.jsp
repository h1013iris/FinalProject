<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
	/*임의*/
	.reservation-table td:not(.res-dateLine) {
	    padding-bottom: 15px;
	}
	
	.reservationEnroll_body div, reservationEnroll_footer div{
		/*border: 1px solid;*/
	}
	.reservationEnroll_title {
		widtd: 100%;
	    font-size: 30px;
	    font-weight: 600;
	}
	.reservationEnroll_header .header_reservationModal {
		widtd: 95%;
	    border-bottom: 1px solid;
	    padding-bottom: 17px;
	    margin: 0 auto;
	}
	.modal_body.reservationEnroll_body {
	    height: 100%;
	}	
	form#enrollForm-Reservation {
	    width: 100%;
	    height: 100%;
	    margin-top: 12px;
	}
	table.reservation-table {
	    width: 100%;
	    height: 100%;
	}
	td.article-in-option {
	    padding-bottom: 15px;
	    font-size: 18px;
	    font-weight: 600;
	    line-height: 64px;
        width: 20%;
	}
	select.res-bigCategory, .res-smallCategory, input#res-startDate, input#res-endDate, .res-startTime, .res-endTime {
	    width: 150px;
	    height: 30px;
	}
	.startDate, .endDate {
	    width: 114px;
	    height: 27px;
	}
	.startTime, .endTime {
	    width: 70px;
	    height: 31px;
	    transform: translateY(-1px);
	}
	.reserve_contact{
		width: 100px;
	    height: 36px;
	    line-height: 41px;
	}
	input#meetingName {
	    width: 300px;
	    height: 26px;
	    line-height: 20px;
	}
	button.reservation_submit, .reservationEnroll_cancelbtn {
	    width: 70px;
	}
	.res-addressBox {
	    display: flex;
	    margin-top: 10px;
	    position: absolute;
	    width: 40%;
	    height: 20%;
	}
	.res-addressBox div{
	    overflow-y: scroll;
	    height: 92%;
	    font-size: 15px;
	    background: white;
	}
	.res-addressBox div::-webkit-scrollbar{
	    display: none;
	}
	.res-department {
	    width: 30%;
	}
	.res-empName {
	    width:63%;
	}
	.res-empName, .res-department {
	    padding: 5px;
	}
	.res-addressBox p {
	    margin-bottom: 4px;
	}
	.department-pline:hover, .empName-pline:hover{
		background: #e3e3e3;
	}
	.image-x{
		width: 12px;
	    height: 12px;
	}
	.resname-padding{
		padding-right: 5px;
	}
	.reservation-member {
	    width: 80%;
	    margin-left: 10px;
	}
	.res-addressBox {
	    border: 1px solid;
	}
</style>
</head>
<body>
    <div id="modal_background" class="reservationEnrollFormModal">
        <div id="modal_container" class="size800 reservationEnrollModal">
            <div class="modal_header reservationEnroll_header">
            	<div class="header_reservationModal">
	                <div class="logo">
	                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
	                </div>
	                <span class="modal_title reservationEnroll_title">회의실 예약하기</span>
                </div>
            </div>
            <div class="modal_body reservationEnroll_body">
				<form  name="enrollFormReservation" id="enrollForm-Reservation" action="insertReservation.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="empNo" value="${ loginUser.empNo }">
					<table class="reservation-table">
						<tr class="reservation-article">
							<td class="article-in-option">회의실 선택</td>
							<td>
								<select name="resBigCategory" class="res-bigCategory">
									<option value="선택">선택</option>
								</select>
								<select name="roomSmallNo" class="res-smallCategory">
									<option value="선택">선택</option>
								</select>
							</td>
						</tr>
						<tr class="reservation-article">
							<td class="article-in-option res-dateLine">일시</td>
							<td class="res-dateLine">
								<label for="startDate"><input type="date" name="startDate" id="res-startDate" class="res-startDate"></label>
								<span>
									<select name="startTime" id="res-startTime" class="res-startTime">
										<option value="선택">선택</option>
									</select>
								</span>
							</td>
						</tr>
						<tr class="reservation-article">
							<td class="article-in-option"></td>
							<td>
								<label for="endDate"><input type="date" name="endDate" id="res-endDate" class="res-endDate"></label>
								<span>
									<select name="endTime" id="res-endTime" class="res-endTime">
										<option value="선택">선택</option>
									</select>
								</span>
							</td>
						</tr>
						<tr class="reservation-article">
							<td class="article-in-option">참석자</td>
							<td>
								<div style=" display: flex;">
									<button class="commonButton1 reserve_contact" type="button">주소록</button> 
									<div class="reservation-member">
									</div>
								</div>
								<div class="res-addressBox" style="display: none;"><!-- -->
									<div class="res-department">
									</div>
									<div class="res-empName">
									</div>
								</div>
							</td>
						</tr>
						<tr class="reservation-article">
							<td class="article-in-option">회의명</td>
							<td>
								<input type="text" name="meetingName" id="meetingName">
							</td>
						</tr>
					</table>
				</form>
            </div>
            <div class="modal_footer reservationEnroll_footer">
                <button class="reservation_submit commonButton1" type="button">다음</button>
                <button class="reservationEnroll_cancelbtn commonButton1" type="button">취소</button>
            </div>
        </div>
    </div>
	<script>
		
	
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

			if(enrollFormReservation.attendeeNo != undefined){
				console.log("들어옴 =========")
				let size = $("input[name = 'attendeeNo']").length
				
				for(let i = 0; i < size ; i++){
					attendeeNo[i] = $("input[name = 'attendeeNo']").eq(i).val()
					console.log($("input[name = 'attendeeNo']").eq(i).val());
					console.log("나감 ======")
				}
			}
			console.log(attendeeNo)
			console.log(empNo)
			console.log(roomSmallNo)
			console.log(startDate)
			console.log(endDate)
			console.log(meetingName)
			// 회의실번호가 없으면
			if(roomSmallNo == '' || roomSmallNo == undefined){
				$("#alert_title .title_name").text("회의실 선택 확인");
				$("#alert_body .alert_content").text("회의실을 선택해야 합니다.");
				$(".reservationEnrollFormModal").hide();
				$("#alertBackground").css("display","block");
			}else if(startDate == '' || startTime == '선택' || endDate == '' || endTime == '선택'){// 시작일이나 종료일을 선택 하지 않을 시
				$("#alert_title .title_name").text("예약 날짜, 시간 선택 확인");
				$("#alert_body .alert_content").text("예약 날짜나 시간을 선택해야 합니다.");
				$(".reservationEnrollFormModal").hide();
				$("#alertBackground").css("display","block");
			}else if(attendeeNo == ''){ // 초대자가 없으면
				$("#alert_title .title_name").text("참석자 선택 확인");
				$("#alert_body .alert_content").text("참석자를 선택해야 합니다.");
				$(".reservationEnrollFormModal").hide();
				$("#alertBackground").css("display","block");
			}else if(meetingName == ''){// 회의명이 없으면
				$("#alert_title .title_name").text("회의명 작성 확인");
				$("#alert_body .alert_content").text("회의명 작성해야 합니다.");
				$(".reservationEnrollFormModal").hide();
				$("#alertBackground").css("display","block");
			}else{ // 모두 작성 시 submit
				//enrollFormReservation.submit();

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
			}
			
		})

		// alert 확인 버튼시
		$(".res-Cancel-btn").click(function(){
			$("#alertBackground").hide();
			$(".reservationEnrollFormModal").show();
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
							
							let largeName = obj.lRoomName;
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
								
								let smallName = obj.sRoomName;
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
				
				arr = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30",
					   "06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30",
					   "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30",
					   "18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"];
				$.ajax({
					url:"selectreservation.do",
					data:{
						startDate : startDate,
						sRoom:sRoom
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
				
				// 종료일에 시작일 값 넣기
				endDate.val(startDate);
				
				startDate += " "+startTime;
				
				let arr1 = new Array();
				arr1 = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30",
					   "06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30",
					   "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30",
					   "18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"];
				
				$.ajax({
					url:"selectreservation.do",
					data:{
						startDate : startDate,
						sRoom:sRoom
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
			$(document).on('click','#res-endDate',function(){
				console.log("종료일 바꿈")
				
				// 예약시작 시간 가져오기
				let startTime = $("#res-startTime").val();
				
				// for문 돌려서 17시면 
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
			// 사원 클릭시 리스트 뜸
			$(document).on('click','.empName-pline',function(){
				let val = $(this).find('input').val()
				let name = $(this).find('.empName-res').text()
				console.log(val+" "+ name)
				
				// 만약 회의실 안원 수를 넘으면 return false;
				//if($('input[name=resname-padding]').length > ){
					
				//}
				
				if(!$(".resname-padding").hasClass(name)){
					$(".reservation-member").append('<span name="resname-padding" class="resname-padding '+name+'">'+name+'<img class="image-x" src="${ pageContext.servletContext.contextPath }/resources/images/xButton.png"><input type="hidden" value="'+val+'" name="attendeeNo"/></span>')
				}
				
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

				$(".reservationEnrollFormModal").css("display","none");
				
			})
		})
	</script>
</body>
</html>