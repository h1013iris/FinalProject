<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-캘린더</title>
</head>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/calender/calender.css">
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../calender/calenderDetailViewModal.jsp"></jsp:include>
	<jsp:include page="../calender/calenderSearchListModal.jsp"></jsp:include>
	<div class="main_section">
		<div class="main-caldiv">
		<form name="calendarFrm" id="calendarFrm" action="" method="GET">
			<div class="calendar">
			<div class="naviLine">
				<!--날짜 네비게이션  -->
				<div class="navigation">
					<a class="before_after_year" href="./calendar.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
						&lt;&lt;
					<!-- 이전해 -->
					</a> 
					<a class="before_after_month" href="./calendar.do?year=${today_info.before_year}&month=${today_info.before_month}">
						&lt;
					<!-- 이전달 -->
					</a> 
					<span class="this_month">
						&nbsp;${today_info.search_year}. 
						<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
					</span>
					<a class="before_after_month" href="/calendar.do?year=${today_info.after_year}&month=${today_info.after_month}">
					<!-- 다음달 -->
						&gt;
					</a> 
					<a class="before_after_year" href="/calendar.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
						<!-- 다음해 -->
						&gt;&gt;
					</a>
				</div>
				<div class="searchLine">
					<div class="searchtext"><input type="text" placeholder="검색할 일정" class="searchSchedule"></div>
					<label class="search"><button type="button" class="commonButton1 searchcalender"><img src="https://img.icons8.com/material/24/000000/search--v1.png"/></button></label>
				</div>
			</div>
			<table class="calendar_body">
				<thead>
					<tr bgcolor="#B9EEFF">
						<td class="day sun" >
							일
						</td>
						<td class="day" >
							월
						</td>
						<td class="day" >
							화
						</td>
						<td class="day" >
							수
						</td>
						<td class="day" >
							목
						</td>
						<td class="day" >
							금
						</td>
						<td class="day sat" >
							토
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<td class="today td${ dateList.date }">
										<div class="date">
											${dateList.date}
										</div>
										<c:forEach var="scheduleList" items="${monthList}">
											<c:choose>
												<c:when test="${ fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:startsWith(fn:substring(scheduleList.endDate, 8, 10), '0') 
												and fn:substring(scheduleList.endDate, 9, 10) == dateList.date  
												or fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.endDate, 8, 10) == dateList.date
												or fn:substring(scheduleList.endDate, 5, 7) == dateList.month and fn:startsWith(fn:substring(scheduleList.endDate, 8, 10), '0') 
												and fn:substring(scheduleList.endDate, 8, 10) == dateList.date 
												or fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.endDate, 8, 10) == dateList.date}">
													<div class="${ fn:replace(scheduleList.title, '&nbsp', '') }" style="background-color: #${ scheduleList.selectColor}; display:none; line-height: 18px;">
														${ scheduleList.title }
													</div>
												</c:when>
												<c:when test="${ fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:startsWith(fn:substring(scheduleList.startDate, 8, 10), '0') 
												and fn:substring(scheduleList.startDate, 9, 10) == dateList.date  
												or fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.startDate, 8, 10) == dateList.date
												or fn:substring(scheduleList.startDate, 5, 7) == dateList.month and fn:startsWith(fn:substring(scheduleList.startDate, 8, 10), '0') 
												and fn:substring(scheduleList.startDate, 8, 10) == dateList.date 
												or fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.startDate, 8, 10) == dateList.date}">
													<div class="${ fn:replace(scheduleList.title, '&nbsp', '') }" style="background-color: #${ scheduleList.selectColor}; display:none; line-height: 18px;">
														${ scheduleList.title }
													</div>
												</c:when>
											</c:choose>
										</c:forEach>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day td${ dateList.date }">
										<div class="sat">
											${dateList.date}
										</div>
										<c:forEach var="scheduleList" items="${monthList}">
											<c:choose>
												<c:when test="${ fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:startsWith(fn:substring(scheduleList.endDate, 8, 10), '0') 
												and fn:substring(scheduleList.endDate, 9, 10) == dateList.date  
												or fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.endDate, 8, 10) == dateList.date
												or fn:substring(scheduleList.endDate, 5, 7) == dateList.month and fn:startsWith(fn:substring(scheduleList.endDate, 8, 10), '0') 
												and fn:substring(scheduleList.endDate, 8, 10) == dateList.date 
												or fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.endDate, 8, 10) == dateList.date}">
													<div class="${ fn:replace(scheduleList.title, '&nbsp', '') }" style="background-color: #${ scheduleList.selectColor}; display:none;">
														${ scheduleList.title }
													</div>
												</c:when>
												<c:when test="${ fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:startsWith(fn:substring(scheduleList.startDate, 8, 10), '0') 
												and fn:substring(scheduleList.startDate, 9, 10) == dateList.date  
												or fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.startDate, 8, 10) == dateList.date
												or fn:substring(scheduleList.startDate, 5, 7) == dateList.month and fn:startsWith(fn:substring(scheduleList.startDate, 8, 10), '0') 
												and fn:substring(scheduleList.startDate, 8, 10) == dateList.date 
												or fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.startDate, 8, 10) == dateList.date}">
													<div class="${ fn:replace(scheduleList.title, '&nbsp', '') }" style="background-color: #${ scheduleList.selectColor}; display:none; line-height: 18px;">
														${ scheduleList.title }
													</div>
												</c:when>
											</c:choose>
										</c:forEach>
									</td>
					</tr>
								</c:when>
								<c:when test="${date_status.index%7==0}">
					<tr>	
						<td class="sun_day td${ dateList.date }">
							<div class="sun">
								${dateList.date}
							</div>
								<c:forEach var="scheduleList" items="${monthList}">
									<c:choose>
										<c:when test="${ fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:startsWith(fn:substring(scheduleList.endDate, 8, 10), '0') 
										and fn:substring(scheduleList.endDate, 9, 10) == dateList.date  
										or fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.endDate, 8, 10) == dateList.date
										or fn:substring(scheduleList.endDate, 5, 7) == dateList.month and fn:startsWith(fn:substring(scheduleList.endDate, 8, 10), '0') 
										and fn:substring(scheduleList.endDate, 8, 10) == dateList.date 
										or fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.endDate, 8, 10) == dateList.date}">
											<div class="${ fn:replace(scheduleList.title, '&nbsp', '') }" style="background-color: #${ scheduleList.selectColor}; display:none; line-height: 18px;">
												${ scheduleList.title }
											</div>
										</c:when>
										<c:when test="${ fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:startsWith(fn:substring(scheduleList.startDate, 8, 10), '0') 
										and fn:substring(scheduleList.startDate, 9, 10) == dateList.date  
										or fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.startDate, 8, 10) == dateList.date
										or fn:substring(scheduleList.startDate, 5, 7) == dateList.month and fn:startsWith(fn:substring(scheduleList.startDate, 8, 10), '0') 
										and fn:substring(scheduleList.startDate, 8, 10) == dateList.date 
										or fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.startDate, 8, 10) == dateList.date}">
											<div class="${ fn:replace(scheduleList.title, '&nbsp', '') }" style="background-color: #${ scheduleList.selectColor}; display:none; line-height: 18px;">
												${ scheduleList.title }
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
						</td>
								</c:when>
								<c:otherwise>
						<td class="normal_day td${dateList.date}">
							<div class="date">
								${dateList.date}
							</div>
								<c:forEach var="scheduleList" items="${monthList}">
									<c:choose>
										<c:when test="${ fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:startsWith(fn:substring(scheduleList.endDate, 8, 10), '0') 
										and fn:substring(scheduleList.endDate, 9, 10) == dateList.date  
										or fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.endDate, 8, 10) == dateList.date
										or fn:substring(scheduleList.endDate, 5, 7) == dateList.month and fn:startsWith(fn:substring(scheduleList.endDate, 8, 10), '0') 
										and fn:substring(scheduleList.endDate, 8, 10) == dateList.date 
										or fn:substring(scheduleList.endDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.endDate, 8, 10) == dateList.date}">
											<div class=" ${ fn:replace(scheduleList.title, '&nbsp', '') }" style="background-color: #${ scheduleList.selectColor}; display:none; line-height: 18px;">
												${ scheduleList.title }
											</div>
										</c:when>
										<c:when test="${ fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:startsWith(fn:substring(scheduleList.startDate, 8, 10), '0') 
										and fn:substring(scheduleList.startDate, 9, 10) == dateList.date  
										or fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.startDate, 8, 10) == dateList.date
										or fn:substring(scheduleList.startDate, 5, 7) == dateList.month and fn:startsWith(fn:substring(scheduleList.startDate, 8, 10), '0') 
										and fn:substring(scheduleList.startDate, 8, 10) == dateList.date 
										or fn:substring(scheduleList.startDate, 5, 7) eq '0'+(1+dateList.month) and fn:substring(scheduleList.startDate, 8, 10) == dateList.date}">
											<div class=" ${ fn:replace(scheduleList.title, '&nbsp', '') }" style="background-color: #${ scheduleList.selectColor}; display:none; line-height: 18px;">
												${ scheduleList.title }
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
						</td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</tbody>
			</table>
			</div>
		</form>
		<div class="today-Schedule">
			<div class="todaySchedule">
				<div class="schedule-title">오늘 예정된 일정</div>
				<ul class="todayList">
					<li class="not-today">
						오늘 예정된 일정이 없음
					</li>
					<c:forEach var="list" items="${ monthList }">
						<fmt:parseDate value="${fn:substring(list.startDate, 0, 10)}" var="startDateValue" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${startDateValue}" pattern="yyyy-MM-dd" var="startDate"/>
						<fmt:parseDate value="${fn:substring(list.endDate, 0, 10)}" var="endDateValue" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${endDateValue}" pattern="yyyy-MM-dd" var="endDate"/>
									<!-- 오늘이 시작일보다 크거나 같고 오늘이 종료일보다 작거나 같을때 일때  -->
						<c:if test="${ nowDate >= startDate and nowDate <= endDate}">
							<li class="${ fn:replace(list.title, '&nbsp', '') }" onclick="calenderDetail('${list.startDate}','${list.endDate }','${list.writerNo }')" style="margin-bottom:10px; border-bottom: 1px solid; padding-bottom: 10px;">
								<div style="margin-bottom: 17px;"><span>${list.title }</span>
									<c:if test="${ list.writerNo == department.departNo }">
										<span class="range" style="background-color: #${list.selectColor};">${ department.departmentTitle }</span>
									</c:if>
									<c:if test="${ list.writerNo != department.departNo }">
										<span class="range" style="background-color: #${list.selectColor};">내 할 일</span>
									</c:if>
									<c:if test="${ list.writerNo == 10000 }">
										<span class="range" style="background-color: #${list.selectColor};">전체 공개</span>
									</c:if>
								</div>
								<p class="font-small">시간  ${ fn:substring(list.startDate, 0, 4) }년 ${ fn:substring(list.startDate, 5, 7) }월 ${ fn:substring(list.startDate, 8, 10) }일 ${ fn:substring(list.startDate, 11, fn:length(list.startDate)-5) }
							~ ${ fn:substring(list.endDate, 0, 4) }년 ${ fn:substring(list.endDate, 5, 7) }월 ${ fn:substring(list.endDate, 8, 10) }일 ${ fn:substring(list.endDate, 11, fn:length(list.endDate)-5) }</p>
								<c:if test="${ fn:length(list.place) != 0 }">
									<p class="font-small">장소  ${ list.place }</p>
								</c:if>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="monthSchedule">
				<p class="schedule-this">${ today_info.search_month }월 스케쥴</p>
				<ul>
					<c:forEach var="list" items="${ monthList }">
						<li class="${ fn:replace(list.title, '&nbsp', '') }" onclick="calenderDetail('${list.startDate}','${list.endDate }','${list.writerNo }')" style="margin-bottom: 13px; border-bottom: 1px solid; padding-bottom: 10px;">
							<p>예시 제목 : ${ list.title }  
								<c:choose>
									<c:when test="${ list.openOption eq '전체공개' }">
										<span class="range" style="background-color: #${list.selectColor};">전체 공개</span>
									</c:when>
									<c:when test="${ list.openOption eq '팀공개' }">
										<span class="range" style="background-color: #${list.selectColor};">${ department.departmentTitle }</span>
									</c:when>
									<c:when test="${ list.openOption eq '개인공개' }">
										<span class="range" style="background-color: #${list.selectColor};">내 할 일</span>
									</c:when>
								</c:choose>
							</p>
							<br>
							<p class="font-small">시간  ${ fn:substring(list.startDate, 0, 4) }년 ${ fn:substring(list.startDate, 5, 7) }월 ${ fn:substring(list.startDate, 8, 10) }일 ${ fn:substring(list.startDate, 11, fn:length(list.startDate)-5) }
							~ ${ fn:substring(list.endDate, 0, 4) }년 ${ fn:substring(list.endDate, 5, 7) }월 ${ fn:substring(list.endDate, 8, 10) }일 ${ fn:substring(list.endDate, 11, fn:length(list.endDate)-5) }</p>
							<c:if test="${ fn:length(list.place) != 0 }">
								<p class="font-small">장소  ${ list.place }</p>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	</div>
	<script>
		// 상세조회로 이동
		// 안들어와짐 
		// 시도1. 모달에 스크립도 해도 안들어옴
		// 시도2. click 함수로도 안들어옴
		// 시도3. on해서 click도 안들어옴
		// 시도4. 위치를 바꿔도 안들어옴
		//".calenderSearchList_body .cal_document"
		$(document).on('click',".calenderSearchList_body .cal_document",function() {
			console.log("cal_document 클릭함!!!!!!!")
			let startDate = $(this).children().eq(0).val()
			let endDate = $(this).children().eq(1).val()
			let writerNo = $(this).children().eq(2).val()
			
			calenderDetail(startDate, endDate, writerNo);
		})	
	
		// 뒤로가기 클릭 시 닫힘
		$('.backCalender-button').click(function() {
			$('.calenderSearchList_body').empty()
			$('.calenderSearchListModal').css("display","none");
		})
	
		// 검색 버튼 클릭시 목록 조회하기
		$(".searchcalender").on('click', function() {
			console.log("검색 버튼 클릭")
			
			// 검색 값 받기
			let searchWord = $(".searchSchedule").val()
			
			console.log(searchWord)
			
			// 빈 값이 아닌 경우
			if(searchWord != ''){
				console.log("들어옴")
				
				$.ajax({
					url:"searchCalender.do",
					data:{
						searchWord : searchWord
					},
					type:"get",
					success:function(search){
						console.log("성공")
						
						if(search.length > 0){
							search.forEach(function(val, index){
								console.log(val)
								
								let calDocument = $('<div>').addClass("cal_document")
								let top = $('<div>').addClass("cal-sList-top")
								let title = $("<span>").addClass('cal-sList-title').html(val.title)
								let open = $("<span>").addClass('cal-sList-open').text("내 할 일")
								if(val.openOption == '팀공개'){
									open.text(val.department)
								}else if(val.openOption == '전체공개'){
									open.text("전체공개")
								}
								let middle = $('<div>').addClass('cal-sList-middle')
								let p1 = $('<p>').text("시간")
								let p2 = $('<p>').text("장소")
								
								let input = $("<span>").addClass('cal-sList-input')
								let time = $('<p>').addClass('cal-sList-time').text(val.startDate.substring(0,4)+"년 "+val.startDate.substring(5,7)+"월 "+val.startDate.substring(8,10)+"일 "+val.startDate.substring(11,16)+" ~ "+val.endDate.substring(0,4)+"년 "+val.endDate.substring(5,7)+"월 "+val.endDate.substring(8,10)+"일 "+val.endDate.substring(11,16))
								let place = $('<p>').addClass('cal-sList-place').text(val.place)
								
								let span = $("<span>")
								let hidStart = $("<input>").attr("type","hidden").val(val.startDate).attr("name","startDate"+index).addClass("startDate"+index)
								let hidEnd = $("<input>").attr("type","hidden").val(val.endDate).attr('name',"endDate"+index).addClass("endDate"+index)
								let hidWriter = $("<input>").attr("type","hidden").val(val.writerNo).attr('name',"writerNo"+index).addClass("writerNo"+index)
								
								input.append(time).append(place)
								span.append(p1).append(p2)
								middle.append(span).append(input)
								top.append(title).append(open)
								calDocument.append(hidStart).append(hidEnd).append(top).append(middle)
								$('.calenderSearchList_body').append(calDocument)
								
								$(".calenderSearchListModal").css("display","flex")
								
							})
						}
						
					},
					err:function(){
						console.log("실패")
					}
				})
			}else{ 
					
				$("#alert_title .title_name").text("검색어 확인");
				$("#alert_body .alert_content").html("검색어가 존재 하지 않습니다.");
				$("#alertBackground").css({"display":"block"})
			}
		})
		
		// 목록 클릭시 상세조회로 이동
		function calenderDetail(startDate, endDate, writerNo) {
			// ajax 를 먼저 실행 한 후에 그 값을 받아와서 
			// 그 값을 include된 jsp 파일에 뿌려준다? let td = fkkdsdok;
			// include된 파일에 존재하는 태그들 안에 append를 해주거나, 화면에만 보여주면 되니까 text나 val()에 넣어준다
			//display : flex; 해주고
			console.log("시작일 : "+startDate)
			console.log("종료일 : "+endDate)
			console.log("진짜 작성자 번호 : "+writerNo)
			$.ajax({
				url:"calenderDetailView.do",
				data:{
					startDate:startDate,
					endDate:endDate,
					writerNo:writerNo
				},
				type:"get",
				success:function(value){
					console.log("성공")
					
					let start = value.startDate; 		// 시작일
					let end = value.endDate; 			// 종료일
					let writerNo = value.writerNo;		// 작성자번호
					let department = value.department;	// 부서명
					let selectColor = value.selectColor;// 색상코드
					let title = value.title;			// 일정명
					let openOption = value.openOption;	// 공개여부
					let alarm = value.alarm;			// 알림
					let place = value.place;			// 장소
					let memo = value.memo;				// 메모
					let sectionName = value.sectionName;// 구분명
					let realWriter = value.realWriter;	// 진짜 작성자
					
					console.log(department);
					console.log(alarm);
					console.log(memo);
					console.log(place);
					console.log(sectionName);
					console.log(title);
					
					$(".calenderModal_Title").html(title).css({"font-size":"20px","font-weight":"bold"});
					if(department != undefined){
						$(".openOption").text(department).css({"background":"#"+selectColor,"font-weight":"500"});
					}else{
						$(".openOption").text(openOption).css("background","#"+selectColor);
					}
					
					$(".calhidden-writerNo").val(writerNo)
					$('.calhidden-realwriter').val(realWriter).trigger('change');
					$(".cal-date").text(start.substring(0,4)+"년 "+start.substring(5,7)+"월 "+start.substring(8,10)+"일 "+start.substring(11,16)+" ~ "+end.substring(0,4)+"년 "+end.substring(5,7)+"월 "+end.substring(8,10)+"일 "+end.substring(11,16))
					$('.hidden-startDate').val(start)
					$('.hidden-endDate').val(end)
					$(".cal-section").text(sectionName)
					$(".cal-place").html(place)
					$(".cal-openOption").text(openOption)
					$(".cal-alarm").text(alarm)
					$(".cal-memo").html(memo)
					$(".calenderModal_BigDiv").css("display","flex");
				},
				err:function(){
					console.log("실패")
				}
			})
		}
		
		// alert 확인 버튼시
		$(".cancel_btn").click(function(){
			$("#alertBackground").hide();
			location.reload();
		})
		
		// 삭제하기 버튼 클릭 시 삭제되었습니다 alret
		$(".calenderModal_Footer .delete_btn").click(function() {
			
			let startDate = $('.hidden-startDate').val()
			let endDate = $('.hidden-endDate').val()
			let realWriter = $(".calhidden-realwriter").val()
			
			console.log("시작일 : "+startDate)
			console.log("종료일 : "+endDate)
			console.log("작성자 번호 : "+realWriter)
			
			$.ajax({
				url:"deleteCalender.do",
				data:{
					startDate:startDate,
					endDate:endDate,
					realWriter:realWriter
				},
				type:"get",
				success:function(val){
					
					if(val == "성공"){
						console.log(val)
						$(".calenderModal_BigDiv").css("display","none");
						$(".calenderModal_Title").empty();
						$(".openOption").empty();
						$(".openOption").empty();
						$(".cal-date").empty();
						$('.hidden-startDate').val("")
						$('.hidden-endDate').val("")
						$(".cal-section").empty();
						$(".cal-place").empty();
						$(".cal-openOption").empty();
						$(".cal-alarm").empty();
						$(".cal-memo").empty();
						$('.calhidden-realwriter').val("")
						
						$("#alert_title .title_name").text("스케쥴 삭제 확인");
						$("#alert_body .alert_content").html("삭제가 완료되었습니다.");
						$("#alertBackground").css({"display":"block"})
					}
				},
				err:function(){
					console.log("실패")
				}
			})
			
		})
		
		// 호버시 display : block
		$("li").mouseenter(function(){
			//var reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
			let block = $(this).attr("class")
			block = block.replace(/&nbsp/gi, "").replace(/&nbsp;$/gi, "");
			console.log(block)
			$("."+block).not("li").css({"display": "block","height":"15%"})
		})
		
		// 마우스가 떠났을 시 display : none
		$("li").mouseleave(function(){
			let none = $(this).attr("class")
			none = none.replace(/&nbsp/gi, "").replace("&nbsp;$", "");
			console.log(none)
			$("."+none).not("li").css({"display": "none","height":"15%"})
		})
		
		// 시작날짜부터 종료날짜까지 색칠 하기
		$(function() {		
			let arr = new Array();	
			
			<c:forEach items="${monthList}" var="scheduleList">
				arr.push({startDate : new Date('${fn:substring(scheduleList.startDate, 0, 10)}'),
						  endDate : new Date('${fn:substring(scheduleList.endDate, 0, 10)}'),
						  writerNo : ${scheduleList.writerNo},
						  sectionOption : ${scheduleList.sectionOption},
						  selectColor : '${scheduleList.selectColor}',
						  title : '${scheduleList.title}',
						  openOption : '${scheduleList.openOption}',
						  alarm : ${scheduleList.alarm},
						  <c:choose><c:when test="${fn:length(scheduleList.place) == 0}"></c:when><c:otherwise>place : '${scheduleList.place}',</c:otherwise></c:choose>
						  <c:choose><c:when test="${fn:length(scheduleList.memo) == 0}"></c:when><c:otherwise>memo : '${scheduleList.memo}'</c:otherwise></c:choose>
						  })
			</c:forEach>
			console.log(arr)
			
			arr.forEach(function(val){
				let start = val.startDate;
				let end = val.endDate;
				

				// 하루종일 이거나 검색달 내에 끝나면 탐
				if(start.getMonth() == end.getMonth()){
					if(start.getDate() == end.getDate()){// 하루종일인 경우
						console.log(val.title+" 은 하루종일 " + start.getDate() + "일")
						
					}else{// 검색 달 내에 끝나는 경우
						console.log(val.title+" 은 한달내에 끝남 " + start.getDate() + "일 ~ " + end.getDate() +"일")

						for(let i = start.getDate()+1 ; i < end.getDate() ; i++){
							let colordiv = $("<div>").css({"background":"#"+val.selectColor,"display":"none"}).addClass(val.title.replace(/&nbsp/gi, "")).append("ㅤ")
							let td = $(".td"+i)//.append(div);
							
							console.log(colordiv)
							console.log(td)
							td.append(colordiv)
							
						}
					}
				}else if(start.getFullYear() == ${today_info.search_year} && 1+start.getMonth() == ${today_info.search_month} && 1+end.getMonth() != ${today_info.search_month}){
					// 시작일이 검색 달이면 탐
					console.log(val.title+" 은 시작일이 검색달임 " + start.getDate() + "일")
					let lastDay = new Date(start.getFullYear(), start.getMonth()+1, 0);
					
					console.log("말 일 : "+lastDay)
					for(let i = start.getDate()+1 ; i <= lastDay.getDate() ; i++){
						let colordiv = $("<div>").css({"background":"#"+val.selectColor,"display":"none"}).addClass(val.title.replace(/&nbsp/gi, "")).append("ㅤ")
						let td = $(".td"+i)//.append(div);
						
						console.log(colordiv)
						console.log(td)
						td.append(colordiv)
					}
				}else if(end.getFullYear() == ${today_info.search_year} && 1+end.getMonth() == ${today_info.search_month} && 1+start.getMonth() != ${today_info.search_month}){
					// 종료일이 검색 달이면 탐
					console.log(val.title+" 은 종료일이 검색달임 " + end.getDate() + "일")
					let firstDay = new Date(end.getFullYear(), end.getMonth(), 1);
					
					console.log("첫 일 : "+firstDay)
					for(let i = firstDay.getDate()  ; i < end.getDate() ; i++){
						let colordiv = $("<div>").css({"background":"#"+val.selectColor,"display":"none"}).addClass(val.title.replace(/&nbsp/gi, "")).append("ㅤ")
						let td = $(".td"+i)//.append(div);
						
						console.log(colordiv)
						console.log(td)
						td.append(colordiv)
					}
				}else{ // 시작일이 이전달(이전부터) 다음달(이후까지) 사이에 있는 애면
					let firstDay = new Date(${ today_info.search_year }, ${ today_info.search_month }, 1);
					let lastDay = new Date(${ today_info.search_year }, ${ today_info.search_month }+1, 0);
					
					for(let i = firstDay.getDate() ; i <= lastDay.getDate() ; i++){
						let colordiv = $("<div>").css({"background":"#"+val.selectColor,"display":"none"}).addClass(val.title.replace(/&nbsp/gi, "")).append("ㅤ")
						let td = $(".td"+i)//.append(div);
						
						console.log(colordiv)
						console.log(td)
						td.append(colordiv)
					}
				}
			})
			
			
			// 오늘의 일정이 존재 할 시에 "오늘 예정된 일정이 없습니다."가 가려진다
			if($(".todayList").find("li").length != 1){
				console.log("존재함")
				$(".not-today").css("display","none");
			}
			
		})
		
	</script>
</body>
</html>