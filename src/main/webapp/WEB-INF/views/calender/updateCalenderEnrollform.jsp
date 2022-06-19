<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-일정 수정하기</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/calender/calenderEnroll.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="cal-Enrollform">
			<form  name="enrollFormSchedule" id="enrollForm-Schedule" action="updateCalender.do" method="post" enctype="multipart/form-data">
				<div class="enrollform-in-Section">
					<div class="cal-left">
						<div class="calender-sectionTitle">일정 수정하기</div>
						<div class="big-section">
							<div class="iput">
								<input type="hidden" name="editStartDate" value="${ calender.startDate }">
								<input type="hidden" name="editEndDate" value="${ calender.endDate }">
								<input type="hidden" name="editWriterNo" value="${ calender.writerNo }">
								<div class="inputTitle1">일정 제목</div>
								<div class="inputSection">
									<input type="text" class="textline" name="title" placeholder="일정 제목을 입력해주세요." value="${ calender.title }">
								</div>
							</div>
						</div>
						<div class="datesection">
							<div class="iput">
								<div class="inputTitle2">일시</div>
								<div class="inputSection">
									<input type="date" class="margin-right2 startday" id="startdate" name="startDate" value="${ fn:substring(calender.startDate, 0, 10) }">
									<input type="time" class="margin-right2 startTime" id="startTime" name="startTime" value="${ fn:substring(calender.startDate, 11, 16) }">
									<div class="gg">~</div>
									<input type="date" class="margin-right2 endday" id="enddate" name="endDate" value="${ fn:substring(calender.endDate, 0, 10) }">
									<input type="time" class="margin-right2 endTime" id="endTime" name="endTime" value="${ fn:substring(calender.endDate, 11, 16) }">
								</div>
							</div>
						</div>
						<div class="big-section allday">
							<label for="oneday" id="onday"><input type="checkbox" name="oneday" value="24" onclick="allday()"> 하루종일</label>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2">구분</div>
								<div class="inputSection">
									<c:choose>
										<c:when test="${ calender.sectionOption eq '근무' }">
											<label class="margin-right3" for="work"><input type="radio" value="1" name="sectionOption" id="work" checked> 근무</label>
											<label class="margin-right3" for="working-outside"><input type="radio" value="2" name="sectionOption" id="working-outside"> 외근</label>
											<label class="margin-right3" for="meeting"><input type="radio" value="3" name="sectionOption" id="meeting"> 회의</label>
											<label class="margin-right3" for="leave"><input type="radio" value="4" name="sectionOption" id="leave"> 휴가</label>
											<label class="margin-right3" for="etc"><input type="radio" value="5" name="sectionOption" id="etc"> 기타</label>
										</c:when>
										<c:when test="${ calender.sectionOption eq '외근' }">
											<label class="margin-right3" for="work"><input type="radio" value="1" name="sectionOption" id="work"> 근무</label>
											<label class="margin-right3" for="working-outside"><input type="radio" value="2" name="sectionOption" id="working-outside" checked> 외근</label>
											<label class="margin-right3" for="meeting"><input type="radio" value="3" name="sectionOption" id="meeting"> 회의</label>
											<label class="margin-right3" for="leave"><input type="radio" value="4" name="sectionOption" id="leave"> 휴가</label>
											<label class="margin-right3" for="etc"><input type="radio" value="5" name="sectionOption" id="etc"> 기타</label>
										</c:when>
										<c:when test="${ calender.sectionOption eq '회의' }">
											<label class="margin-right3" for="work"><input type="radio" value="1" name="sectionOption" id="work"> 근무</label>
											<label class="margin-right3" for="working-outside"><input type="radio" value="2" name="sectionOption" id="working-outside"> 외근</label>
											<label class="margin-right3" for="meeting"><input type="radio" value="3" name="sectionOption" id="meeting" checked> 회의</label>
											<label class="margin-right3" for="leave"><input type="radio" value="4" name="sectionOption" id="leave"> 휴가</label>
											<label class="margin-right3" for="etc"><input type="radio" value="5" name="sectionOption" id="etc"> 기타</label>
										</c:when>
										<c:when test="${ calender.sectionOption eq '휴가' }">
											<label class="margin-right3" for="work"><input type="radio" value="1" name="sectionOption" id="work"> 근무</label>
											<label class="margin-right3" for="working-outside"><input type="radio" value="2" name="sectionOption" id="working-outside"> 외근</label>
											<label class="margin-right3" for="meeting"><input type="radio" value="3" name="sectionOption" id="meeting"> 회의</label>
											<label class="margin-right3" for="leave"><input type="radio" value="4" name="sectionOption" id="leave" checked> 휴가</label>
											<label class="margin-right3" for="etc"><input type="radio" value="5" name="sectionOption" id="etc"> 기타</label>
										</c:when>
										<c:otherwise>
											<label class="margin-right3" for="work"><input type="radio" value="1" name="sectionOption" id="work"> 근무</label>
											<label class="margin-right3" for="working-outside"><input type="radio" value="2" name="sectionOption" id="working-outside"> 외근</label>
											<label class="margin-right3" for="meeting"><input type="radio" value="3" name="sectionOption" id="meeting"> 회의</label>
											<label class="margin-right3" for="leave"><input type="radio" value="4" name="sectionOption" id="leave"> 휴가</label>
											<label class="margin-right3" for="etc"><input type="radio" value="5" name="sectionOption" id="etc" checked> 기타</label>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle1">공개 여부</div>
								<div class="inputSection">
									<c:if test="${ calender.openOption eq '개인공개' }">
										<label class="margin-right3" for="personal"><input type="radio" value="개인공개" name="openOption" id="personal" checked> 개인 공개</label>
									</c:if>
									<c:if test="${ calender.openOption ne '개인공개' }">
										<label class="margin-right3" for="personal"><input type="radio" value="개인공개" name="openOption" id="personal"> 개인 공개</label>
									</c:if>
									<c:if test="${ calender.openOption eq '팀공개' }">
										<label class="margin-right3" for="team"><input type="radio" value="팀공개" name="openOption" id="team" checked> 팀 공개</label>
									</c:if>
									<c:if test="${ calender.openOption ne '팀공개' }">
										<label class="margin-right3" for="team"><input type="radio" value="팀공개" name="openOption" id="team"> 팀 공개</label>
									</c:if>
									<label class="margin-right3" for="whole">
										<c:if test="${(loginUser.jobNo eq '7' or loginUser.jobNo eq '8') and calender.openOption eq '전체공개' }">
											<input type="radio" value="전체공개" name="openOption" id="whole" checked> 전체 공개
										</c:if>
										<c:if test="${(loginUser.jobNo eq '7' or loginUser.jobNo eq '8') and calender.openOption ne '전체공개' }">
											<input type="radio" value="전체공개" name="openOption" id="whole"> 전체 공개
										</c:if>
									</label>
								</div>
							</div>
						</div>
						<div class="memo-section">
							<div class="iput">
								<div class="inputTitle2">메모</div>
								<div class="memoSection">
									<textarea name="memo" id="memo" placeholder="내용을 입력해 주세요.">${ calender.memo }</textarea>
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2">알림</div>
								<div class="inputSection">
									<select name="alarm">
										<c:if test="${ calender.alarm eq '0' }">
											<option value="0" selected>안함</option>
										</c:if>
										<c:if test="${ calender.alarm ne '0' }">
											<option value="0">안함</option>
										</c:if>
										<c:if test="${ calender.alarm eq '10' }">
											<option value="10" selected>10분전</option>
										</c:if>
										<c:if test="${ calender.alarm ne '10' }">
											<option value="10">10분전</option>
										</c:if>
										<c:if test="${ calender.alarm eq '15' }">
											<option value="15" selected>15분전</option>
										</c:if>
										<c:if test="${ calender.alarm ne '15' }">
											<option value="15">15분전</option>
										</c:if>
										<c:if test="${ calender.alarm eq '30' }">
											<option value="30" selected>30분전</option>
										</c:if>
										<c:if test="${ calender.alarm ne '30' }">
											<option value="30">30분전</option>
										</c:if>
									</select>
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2">장소</div>
								<div class="inputSection">
									<input type="text" class="textline" name="place" placeholder="장소를 입력해 주세요." value="${ calender.place }">
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2 colorinfo">범주</div>
								<div class="colorsection">
									<div class="selectcolor-div">
										<input type="hidden" name="selectColor" value="${calender.selectColor }">
										<div class="selectColor ffb5c1"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="colorlist">
							<div class="colorlist-one">
								<div class="ffb5c1"></div>
								<div class="dfccff"></div>
								<div class="ffb9a4"></div>
								<div class="ffb9"></div>
								<div class="FFFEC4"></div>
								<div class="FF8D82"></div>
								<div class="a0d8ff"></div>
							</div>
							<div class="colorlist-two">
								<div class="ff8781"></div>
								<div class="c7c4ff"></div>
								<div class="f18372"></div>
								<div class="a6ff4d"></div>
								<div class="fff462"></div>
								<div class="fd731c"></div>
								<div class="ffff"></div>
							</div>
						</div>
					</div>
					<div class="preview_And_Button">
						<div style="height: 100%;">
							<div id="previewTitle">미리보기</div>
							<div class="preview">
								<div class="colorPreview">
									미리보기
								</div>
							</div>
							<div class="buttonLine">
								<button type="button" class="commonButton1 insert-calender" style="width: 90px;">일정수정하기</button>
								<button type="button" class="commonButton1 back-calender" style="width: 90px;" onclick="location.href='calendar.do'">취소하기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
        </div>
    </div> 
    <script>
	 	// 일정 추가하기 페이지 이름
		$(function(){
	         $(".page_title>.title_name").text("일정 수정하기");
		})
	 	
		// 수정하기 버튼 클릭시 내용 확인
		$('.insert-calender').on('click', function(){
			let checkform = document.enrollFormSchedule;
			//제목 : checkform.title.value
			//시작일 : checkform.startdate.value
			//시작시간 : checkform.startTime.value
			//마감일 : checkform.enddate.value
			//마감시간 : checkform.endTime.value
			//하루종일 여부 : $('input[name = "oneday"]').is(':checked')
			//메모 : checkform.memo.value
			//알림 : checkform.aleam.value
			//장소 : checkform.place.value
			//범주 : checkform.selectColor.value
		
			
			if(checkform.title.value == ""){ // 일정 제목 작성 하지 않앗을 시 알람
	    		$("#alert_title .title_name").text("일정 제목 확인");
	    		$("#alert_body .alert_content").text("일정 제목을 적으셔야 합니다.");
	    		$("#alertBackground").css("display","block");
			}else if($('input[name = "oneday"]').is(':checked') == true & checkform.startDate.value == ""){
				// 하루종일 체크 하되 날짜를 작성 하지 않을 시 알람
	    		$("#alert_title .title_name").text("일시 확인");
	    		$("#alert_body .alert_content").text("날짜를 적으셔야 합니다.");
	    		$("#alertBackground").css("display","block");
				
			}else if($('input[name = "oneday"]').not(':checked') & (checkform.startDate.value == "" | checkform.startTime.value == ""
					| checkform.endDate.value == "" | checkform.endTime.value == "")){ // 하루종일 체크 안하되 하나라도 일시 작성 하지 않을 시 알림
	    		$("#alert_title .title_name").text("일시 확인");
	    		$("#alert_body .alert_content").text("일시를 적으셔야 합니다.");
	    		$("#alertBackground").css("display","block");
			}else{ // 모두 작성 시 submit
				checkform.submit();
			}
			
			
		})
		
		// alert 확인 버튼시
    	$(".cancel_btn").click(function(){
   			$("#alertBackground").hide();
    	})


		// rgb -> hex코드
		function rgb2hex(rgb) {
			if (  rgb.search("rgb") == -1 ) {
				return rgb;
			} else {
				rgb = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
				function hex(x) {
					return ("0" + parseInt(x).toString(16)).slice(-2);
				}
				return hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]); 
			}
		}

    	// 색상 클릭 시 그 색상으로 바꾸기
		$('.colorlist').children().children().on('click', function(){
			let color = $(this).css('backgroundColor');
			color = rgb2hex(color);
			
			
			if(color == 'ffb5c1'){
				$('input[name = "selectColor"]').val('1')
			}else if(color == 'dfccff'){
				$('input[name = "selectColor"]').val('2')
			}else if(color == 'ffb9a4'){
				$('input[name = "selectColor"]').val('3')
			}else if(color == '14ffb9'){
				$('input[name = "selectColor"]').val('4')
			}else if(color == 'fffec4'){
				$('input[name = "selectColor"]').val('5')
			}else if(color == 'ff8d82'){
				$('input[name = "selectColor"]').val('6')
			}else if(color == 'a0d8ff'){
				$('input[name = "selectColor"]').val('7')
			}else if(color == 'ff8781'){
				$('input[name = "selectColor"]').val('8')
			}else if(color == 'c7c4ff'){
				$('input[name = "selectColor"]').val('9')
			}else if(color == 'f18372'){
				$('input[name = "selectColor"]').val('10')
			}else if(color == 'a6ff4d'){
				$('input[name = "selectColor"]').val('11')
			}else if(color == 'fff462'){
				$('input[name = "selectColor"]').val('12')
			}else if(color == 'fd731c'){
				$('input[name = "selectColor"]').val('13')
			}else if(color == '00ffff'){
				$('input[name = "selectColor"]').val('14')
			}
			
			$('.selectColor').css('backgroundColor','#'+color);
			$('.colorPreview').css('backgroundColor','#'+color);
		})
    
		// 하루종일 클릭 시
    	function allday(){
			$(".endTime").val(" ").toggle();
			$("#enddate").val(" ").toggle();
			$(".startTime").val(" ").toggle();
			$(".gg").toggle();
		}
		
		// 선택된범주 클릭 시
		$(".selectcolor-div").on('click', function() {
			event.stopPropagation();
			$(".colorlist").toggle();
		})
		
		// 켜지면 범주 가리기
		$(document).ready(function() {
			$(".colorlist").hide();
			let val = $('input[name = "selectColor"]').val()
			let color = "";
			
			console.log("색 바꾸ㅜ라!!!!!!!")
			console.log(val)
			
			if(val == '1'){
				color = 'ffb5c1';
			}else if(val == '2'){
				color = 'dfccff';
			}else if(val == '3'){
				color = 'ffb9a4';
			}else if(val == '4'){
				color = '14ffb9';
			}else if(val == '5'){
				color == 'fffec4';
			}else if(val == '6'){
				color = 'ff8d82';
			}else if(val == '7'){
				color = 'a0d8ff';
			}else if(val == '8'){
				color = 'ff8781';
			}else if(val == '9'){
				color = 'c7c4ff';
			}else if(val == '10'){
				color = 'f18372;'
			}else if(val == '11'){
				color = 'a6ff4d;'
			}else if(val == '12'){
				color = 'fff462';
			}else if(val == '13'){
				color = 'fd731c';
			}else if(val == '14'){
				color = '00ffff';
			}

			console.log(color)
			$('.selectColor').css('backgroundColor','#'+color);
			$('.colorPreview').css('backgroundColor','#'+color);
		})
		
		// 범주 외에 클릭 시 가려지기
		$(document).click(function(){
	    	$(".colorlist").hide();
	    })
	    
	    // 마감 시간의 값이 변경 됐을 때
		$('.endTime, .startTime').on('change', function() {
			let checkform = document.enrollFormSchedule;
			// 시작일과 마감일이 같고 시작시간이 마감시간보다 크거나 같으면 알람뒤 지움
			if(checkform.startDate.value == checkform.endDate.value & checkform.startTime.value >= checkform.endTime.value){
	    		if(checkform.startTime.value > checkform.endTime.value){
	    			$("#alert_title .title_name").text("시작날짜 시간과 마감날짜 시간 확인");
	    			$("#alert_body .alert_content").html("시작날짜 시간이 마감날짜 시간을 넘습니다.");
	    			$("#alertBackground").css({"display":"block"});
	    			$('#startdate').val(" ");
	    			$('#startTime').val(" ");
	    			$('#enddate').val(" ");
	    			$('.endTime').val(" ");
				}else if(checkform.startTime.value == checkform.endTime.value){
	    			$("#alert_title .title_name").text("시작날짜 시간과 마감날짜 시간 확인");
	    			$("#alert_body .alert_content").html("시작날짜 시간이 마감날짜 시간과 같습니다.");
	    			$("#alertBackground").css("display","block");
	    			$('#startdate').val(" ");
	    			$('#startTime').val(" ");
	    			$('#enddate').val(" ");
	    			$('.endTime').val(" ");
				}
			}
		})
	    
	    $('.startday').on('change', function() {
			document.enrollFormSchedule.endDate.min = document.enrollFormSchedule.startDate.value
		})
    </script>
</body>
</html>