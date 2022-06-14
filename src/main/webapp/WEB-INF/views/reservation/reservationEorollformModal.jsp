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
	.reservation-table td {
	    border: 1px solid;
	}
	
	.reservationEnroll_body div, reservationEnroll_footer div{
		border: 1px solid;
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
	    border: 1px solid;
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
	select.res-bigCategory, .res-smallCategory {
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
	    height: 89%;
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
							<td class="article-in-option">일시</td>
							<td>
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
			}else if(startDate == '' || startTime == '' || endDate == '' || endTime == ''){// 시작일이나 종료일을 선택 하지 않을 시
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

			let arr = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30",
					   "06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30",
					   "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30",
					   "18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"];
			// 날짜 선택 시 
			$(document).on('change','.res-startDate',function(){
				console.log("시작일 바꿈")

				let sRoom = $(".res-smallCategory").val()
				let startDate = $('.res-startDate').val()
				//console.log(startDate)
				//console.log(typeof startDate)
				// 만약 저녁 7시부터 회의 하게 되면 readonly풀림
				//if(startDate)
				//$('.endDate').val(startDate).attr("readonly", true)
				
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
										
										console.log('시만 존재 : '+midTime)

									}else if(i.getMinutes() == 30){
										//midTime = i.getHours()+"시 "+i.getMinutes()+"분";
										let hour = ""+i.getHours();
										
										if(hour.length != 1){
											midTime = hour+":"+i.getMinutes();
										}else{
											midTime = "0"+hour+":"+i.getMinutes();
										}
										
										console.log('분도 존재 : '+midTime)
									}
									// 해당 시간동안 예약이 존재 하니 없애주기
									for(let j = 0 ; j < arr.length ; j++){
										if(arr[j] == midTime){
											arr = arr.splice(j, 1)
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
					}/*,
					complete : function(data, status) {
						console.log("안나오니?")
						// 시작시간가능한거(예약 있는 시간대 제외 해야함) -- 제대로 안탐 6/14
						$.each(arr, function(index, obj){
							
							let option = $("<option>");
							option.val(obj).text(obj);
							$('.res-startTime').append(option)
						})
					}*/
				})
				
				
			})
			

			// .res-startTime 값 change시 이후에가능한 시간 뽑아오기
			$(document).on('click','.res-startTime',function(){
				let end = document.getElementById("res-endDate")
				let val = new Date($("#res-startDate").val()).toISOString().substring(0, 10);
				console.log(val)
				start.value = val;


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
				
				if(!$(".resname-padding").hasClass(name)){
					$(".reservation-member").append('<span class="resname-padding '+name+'">'+name+'<img class="image-x" src="${ pageContext.servletContext.contextPath }/resources/images/xButton.png"><input type="hidden" value="'+val+'" name="attendeeNo"/></span>')
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