<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-일정 추가하기</title>
</head>
	<style>

		/*전체라인*/
		
		/*메인섹션 안에 폼을 감싼 섹션*/
		.cal-Enrollform{
			justify-content: center;
			width: 83vw;
			height: 130vh;
		}
		/*form*/
		#enrollForm-Schedule{
			height: 100%;
		}
		/*form 속 모두 감싼 div*/
		.enrollform-in-Section{
			width: 100%;
		    display: flex;
			height: 100%;
			justify-content: center;
		}

		
		/*왼쪽*/

		/*왼쪽전체*/
		.cal-left{
		    width: 40%;
		}
		/*input text*/
		.textline{
			width: 96.5%;
		}
		input[type=checkbox], input[type=radio] {
			transform : scale(1.3);
		}
		
		/*date 마진*/
		.margin-right2{
			margin-right: 2%;
			font-size: 15px;
		}
		/*일시 하루종일 padding*/
		#onday{
			padding-left: 19.5%;
		}
		.big-section.allday {
		    margin-top: -25px;
		}
		/*radio 마진*/
		.margin-right3{
			margin-right: 3%;
			padding: 8px 0;
		}
		
		/*form 속 textarea*/
		#memo{
			resize: none;
		    width: 84%;
			height: 80%;
		}

		/*범주 제목*/
		.inputTitle2.colorinfo, .colorsection {
		    display: flex;
		    align-items: center;
		}
		/*범주 영역*/
		.colorsection {
		    height: 91%;
		    width: 55%;
		}
		/*선택된범주*/
		.selectcolor-div {
			width: 53px;
			height: 53px;
		}
		.selectcolor-div, .colorlist{
			border: 1px solid;
			background-color: #fff;
		}
		.selectColor {
		    margin: 4px;
		    height: 45px;
		    width: 45px;
		}

		/*리스트 감싼 div*/
		.colorlist{
			height: 10%;
			width: 70%;
			transform: translate(136.5px, -17px);
		}
		.colorlist-one {
		    margin-top: 10px;
		    margin-bottom: -5px;
		}
		/*컬러리스트*/
		.colorlist-one, .colorlist-two {
			width: 100%;
            height: 50%;
            display: flex;
			justify-content: space-evenly;
		}
		.colorlist-one>div, .colorlist-two>div{
			width: 50px;
			height: 50px;
		}
		/*범주색상들*/
        .ffb5c1{
            background-color: #ffb5c1;
        }
        .dfccff{
            background-color: #dfccff;
        }
        .ffb9a4{
            background: #ffb9a4;
        }
        .ffb9{
            background-color: #14ffb9;
        }
        .FFFEC4{
            background-color: #FFFEC4;
        }
        .FF8D82{
            background-color: #FF8D82;
        }
        .a0d8ff{
            background-color: #a0d8ff;
        }
        .ff8781{
            background-color: #ff8781;
        }
        .c7c4ff{
            background-color: #c7c4ff;
        }
        .f18372{
            background-color: #f18372;
        }
        .a6ff4d{
            background-color: #a6ff4d;
        }
        .fff462{
            background-color: #fff462;
        }
        .fd731c{
            background-color: #fd731c;
        }
        .ffff{
            background-color: #00ffff;
        }
		
		#memo, .textline{
			font-size: 15px;
		}
		.gg{
		    margin: auto;
		    margin-right: 2%;
		}
		
		/*form 속 소제목 한 줄*/
		.iput{
			display: flex;
			width: 100%;
			height: 100%;
		}
		/*input 태그 섹션*/
		.inputSection{
			display: flex;
			width: 70%;
			height: 50%;
		}
		/*textarea 섹션*/
		.memoSection{
			width: 100%;
			height: 100%;
			margin-left: 3.7%;
		}
		/*하루종일*/
		.padding-date {
		    padding-left: 13.3%;
	        height: 5%;
		}
		.datesection{
			height: 6%;
		}
		/*cal-Enrollform 감싼 섹션*/
		.big-section{
			height: 6%;
		}
		/*메모 센션*/
		.memo-section{
			height: 27%;
		}

		/*일정 추가하기 글자*/
		.calender-sectionTitle{
			font-weight: bold;
			font-size: 30px;
			margin-bottom: 2%;
		    height: 5%;
		}
		/*form 속 소제목*/
		.inputTitle1, .inputTitle2{
			font-weight: bold;
			font-size: 22px;
			margin-right: 3.1%;
			width: 17%;
		    padding: 3px 0;
		}
		.inputTitle2{
			margin-right: 3.1%;
		}
		
		/*오른쪽*/
		
		/*미리보기 라인*/
		.preview_And_Button {
			width: 13.5%;
			padding: 4% 0;
		}
		/*미리보기 큰 div*/
		.preview {
			border: 1px solid black;
			margin-bottom: 3%;
			margin-top: 2%;
			width: 80%;
			padding: 7% 1%;
			display: flex;	
		}
		/*미리보기 속 예시 div*/
		.colorPreview {
			width: 80%;
			height: 30%;
			margin: auto;
			line-height: 25px;
		}

		
		/*버튼영역*/
		.buttonLine {
		    width: 82%;
		    height: 10%;
		    display: flex;
		    justify-content: space-between;
		}
		.insert-calender, .back-calender{
		    width: 90px;
			height: 50px;
			line-height: 13px;
		}
	</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="cal-Enrollform">
			<form  name="enrollFormSchedule" id="enrollForm-Schedule" action="insertCalender.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="empNo" id="empNo" value="${loginUser.empNo}">
				<div class="enrollform-in-Section">
					<div class="cal-left">
						<div class="calender-sectionTitle">일정 추가하기</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle1">일정 제목</div>
								<div class="inputSection">
									<input type="text" class="textline" name="title" placeholder="일정 제목을 입력해주세요.">
								</div>
							</div>
						</div>
						<div class="datesection">
							<div class="iput">
								<div class="inputTitle2">일시</div>
								<div class="inputSection">
									<input type="date" class="margin-right2 startday" id="startdate" name="startDate">
									<input type="time" class="margin-right2 startTime" id="startTime" name="startTime">
									<div class="gg">~</div>
									<input type="date" class="margin-right2 endday" id="enddate" name="endDate">
									<input type="time" class="margin-right2 endTime" id="endTime" name="endTime">
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
									<label class="margin-right3" for="work"><input type="radio" value="1" name="sectionOption" id="work" checked> 근무</label>
									<label class="margin-right3" for="working-outside"><input type="radio" value="2" name="sectionOption" id="working-outside"> 외근</label>
									<label class="margin-right3" for="meeting"><input type="radio" value="3" name="sectionOption" id="meeting"> 회의</label>
									<label class="margin-right3" for="leave"><input type="radio" value="4" name="sectionOption" id="leave"> 휴가</label>
									<label class="margin-right3" for="etc"><input type="radio" value="5" name="sectionOption" id="etc"> 기타</label>
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle1">공개 여부</div>
								<div class="inputSection">
									<label class="margin-right3" for="personal"><input type="radio" value="개인공개" name="openOption" id="personal" checked> 개인 공개</label>
									<label class="margin-right3" for="team"><input type="radio" value="팀공개" name="openOption" id="team"> 팀 공개</label>
										<label class="margin-right3" for="whole">
										<c:if test="${loginUser.jobNo eq '7' or loginUser.jobNo eq '8'}">
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
									<textarea name="memo" id="memo" placeholder="내용을 입력해 주세요."></textarea>
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2">알림</div>
								<div class="inputSection">
									<select name="alarm">
										<option value="0">안함</option>
										<option value="10">10분전</option>
										<option value="15">15분전</option>
										<option value="30">30분전</option>
									</select>
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2">장소</div>
								<div class="inputSection">
									<input type="text" class="textline" name="place" placeholder="장소를 입력해 주세요.">
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2 colorinfo">범주</div>
								<div class="colorsection">
									<div class="selectcolor-div">
										<input type="hidden" name="selectColor" value="1">
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
								<div class="colorPreview ffb5c1">
									미리보기
								</div>
							</div>
							<div class="buttonLine">
								<button type="button" class="commonButton1 insert-calender" style="width: 90px;">일정추가하기</button>
								<button type="button" class="commonButton1 back-calender" style="width: 90px;" onclick="location.href='calendar.do'">취소하기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
        </div>
    </div> 
    <script>
    
		// 추가하기 버튼 클릭시 내용 확인
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
	    		$("#alert_container").css("display","block");
			}else if($('input[name = "oneday"]').is(':checked') == true){
				if(checkform.startDate.value == ""){ // 하루종일 체크 하되 날짜를 작성 하지 않을 시 알람
		    		$("#alert_title .title_name").text("일시 확인");
		    		$("#alert_body .alert_content").text("날짜를 적으셔야 합니다.");
		    		$("#alert_container").css("display","block");
				}
			}else if(checkform.startDate.value == "" | checkform.startTime.value == ""
					| checkform.endDate.value == "" | checkform.endTime.value == ""){ // 하루종일 체크 안하되 하나라도 일시 작성 하지 않을 시 알림
	    		$("#alert_title .title_name").text("일시 확인");
	    		$("#alert_body .alert_content").text("일시를 적으셔야 합니다.");
	    		$("#alert_container").css("display","block");
			}else{ // 모두 작성 시 submit
				checkform.submit();
			}
			
			
		})
		
		// alert 확인 버튼시
    	$(".cancel_btn").click(function(){
   			$("#alert_container").hide();
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
	    			$("#alert_container").css({"display":"block"});
	    			$('#startdate').val(" ");
	    			$('#startTime').val(" ");
	    			$('#enddate').val(" ");
	    			$('.endTime').val(" ");
				}else if(checkform.startTime.value == checkform.endTime.value){
	    			$("#alert_title .title_name").text("시작날짜 시간과 마감날짜 시간 확인");
	    			$("#alert_body .alert_content").html("시작날짜 시간이 마감날짜 시간과 같습니다.");
	    			$("#alert_container").css("display","block");
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