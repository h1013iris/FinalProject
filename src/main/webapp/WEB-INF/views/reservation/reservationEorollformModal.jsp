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
	    height: 100%; 
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
	.reservationEnrollModal .startTime, .reservationEnrollModal .endTime {
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
	    height: 91%;
	    font-size: 15px;
	    background: white;
	}
	.res-addressBox div::-webkit-scrollbar{
	    display: none;
	}
	.res-department {
	    width: 30%;
       	border-right: 1px solid;
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
	button.commonButton1.reserve_contact {
	    height: 90%;
	}
	.redstar{
		color: red;
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
					<input type="hidden" class="PushOrUpdate" value="1">
					<input type="hidden" class="reserveNo" value="0"/>
					<table class="reservation-table">
						<tr class="reservation-article">
							<td class="article-in-option"><span class="redstar">*</span>회의실 선택</td>
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
							<td class="article-in-option res-dateLine"><span class="redstar">*</span>일시</td>
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
							<td class="article-in-option"><span class="redstar">*</span>참석자</td>
							<td>
								<div style=" display: flex;height: 79%;">
									<button class="commonButton1 reserve_contact" type="button">주소록</button> 
									<div class="reservation-member">
									</div>
								</div>
								<div class="res-addressBox" style="display: none;">
									<div class="res-department">
									</div>
									<div class="res-empName">
									</div>
								</div>
							</td>
						</tr>
						<tr class="reservation-article">
							<td class="article-in-option"><span class="redstar">*</span>회의명</td>
							<td>
								<input type="text" name="meetingName" id="meetingName" maxlength="50">
							</td>
						</tr>
					</table>
				</form>
            </div>
            <div class="modal_footer reservationEnroll_footer">
                <button class="reservation_submit commonButton1" type="button">예약하기</button>
                <button class="reservationEnroll_cancelbtn commonButton1" type="button">취소</button>
            </div>
        </div>
    </div>
    <script>
		// 사원 클릭시 리스트 뜸
		$(document).on('click','.empName-pline',function(){
			let val = $(this).find('input').val()
			let name = $(this).find('.empName-res').text()
			
			let meetingRoom = $(".res-smallCategory").val()
			
			if(meetingRoom == '선택'){
				
				alertok("회의실 예약 인원", "회의실 선택을 먼저 진행해주세요.");
				// alert 확인 버튼시
				$(".res_Ok_btn").click(function(){
					
					$("#res-alertBackground").hide();
					$(".reservationEnrollFormModal").show();

					//return false;
				})
				return false;
			}
			
			if(!$(".resname-padding").hasClass(name)){
				$(".reservation-member").append('<span name="resname-padding" class="resname-padding '+name+'">'+name+'<img class="image-x" src="${ pageContext.servletContext.contextPath }/resources/images/xButton.png"><input type="hidden" value="'+val+'" name="attendeeNo"/></span>')
			}
			
		})
    </script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/reservation/reservationEnroll.js"></script>
</body>
</html>