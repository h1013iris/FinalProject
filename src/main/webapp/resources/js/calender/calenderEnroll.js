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