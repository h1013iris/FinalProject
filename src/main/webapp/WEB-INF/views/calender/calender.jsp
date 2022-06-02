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
	<style TYPE="text/css">
		
		/*body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		}*/

		/*행과 열*/
		#calendarFrm td {font-family: "돋움"; font-size: 9pt; color:#595959;}
		#calendarFrm th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		#calendarFrm select {font-family: "돋움"; font-size: 9pt; color:#595959;}


		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

		#calendarFrm A:link { font-size:11pt; font-family:"돋움";color:#000000; text-decoration:none; }
		#calendarFrm A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		#calendarFrm A:active { font-family:"돋움";color:#17b6ff; text-decoration:none; }
		#calendarFrm A:hover { font-family:"돋움";color:#17b6ff;text-decoration:none;}
		.day{
			width:100px; 
			height:30px;
		    vertical-align: middle;
			font-size:15px;
			font-weight:bold;
			text-align: center;
		}
		.sat{
			color:#3678f1;
		}
		.sun{
			color:red;
		}
		.today_button_div{
			float: right;
		}
		.today_button{
			width: 100px; 
			height:30px;
		}
		.calendar{
			margin: auto;
			width: 80%;
		}
		
		.naviLine{
			display: flex;
		}
		
		/*네비*/
		.navigation{
			margin-bottom:15px;
			text-align: right;
			width: 60%;
			font-size: 25px;
		}
		.searchLine{
			width: 40%;
			display: flex;
		    justify-content: end;
		}
		.searchtext {
		    width: 31%;
		}
		/*검색할 text*/
		.searchSchedule {
			width: 150px;
			height: 25px;
		}
		/*검색하기 버튼*/
		.searchcalender {
			width: 30px;
			height: 30px;	
		}
		
		/*캘린더 바디부분*/
		.calendar_body{
			width:100%;
			background-color: #FFFFFF;
			border:1px solid white;
			border-collapse: collapse;
		}
		.calendar_body .today{
			border:1px solid white;
			height:120px;
			background-color:#b9eeff2e;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .date{
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sat_day{
			border:1px solid white;
			height:120px;
			background-color:#f5F5F5;
			text-align:left;
			vertical-align: top;
		}
		.calendar_body .sat_day .sat{
			color: #3678f1; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sun_day{
			border:1px solid white;
			height:120px;
			background-color:#f5F5F5;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .sun_day .sun{
			color: red; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .normal_day{
			border:1px solid white;
			height:120px;
			background-color:#f5F5F5;
			vertical-align: top;
			text-align: left;
		}
		.before_after_month{
			margin: 10px;
			font-weight: bold;
		}
		.before_after_year{
			font-weight: bold;
		}
		.this_month{
			margin: 10px;
		}
		form#calendarFrm {
			padding-bottom: 30px;
		}
		.schedule-title{
			margin-top: 12px;
			margin-bottom: 12px;
			font-size: 22px;
			font-weight: bold;
		    border-bottom: 1px solid;
    		padding-bottom: 5px;
		}
		.scheduleList {
			border-top: 1px solid black;
		}
		.today-Schedule {
		    width: 15vw;
		    height: 100%;
		    margin-left: 20px;
		    display: flex;
		    flex-direction: column;
		}
		.title {
			font-size: 17px;
			font-weight: 300;
		}
		.line {
			margin-bottom: 7px;
		}
		.title, .line{
			margin-right: 7px;
		}
		.todayList li:hover, .monthSchedule li:hover{
			background-color: #f5f5f5; 
		}
		.todayList a :hover{
			color: black;
		}
		.main-caldiv {
		    width: 83vw;
		    display: flex;
		    height: 100%;
		}
		.calendar { 
			/*border: 1px solid black;*/
			width: 65vw;
		}
		.todaySchedule{
		    height: 40%;
		}
		.monthSchedule{
			height: 60%;
		}
		.monthSchedule ul{
		    overflow-y: scroll;
    		height: 95%;
		}
		.todaySchedule ul{
		    overflow-y: scroll;
		    height: 75%;
		}
		.monthSchedule ul::-webkit-scrollbar, .todaySchedule ul::-webkit-scrollbar{
		    display: none;
		}
		.schedule-this{
			margin-top: 12px;
	    	margin-bottom: 12px;
	    	padding-bottom: 5px;
			font-size: 22px;
			font-weight: bold;
			border-bottom: 1px solid;
		}
		.schedule-list{
			margin-bottom:10px; 
			border-bottom:1px solid;
			padding-bottom:10px;
		}
		.font-small{
			font-size: 12px;
		}
	</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
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
						<div class="search"><button type="button" class="commonButton1 searchcalender"><img src="https://img.icons8.com/material/24/000000/search--v1.png"/></button></div>
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
							<li class="${ list.title }" style="margin-bottom:10px; border-bottom: 1px solid; padding-bottom: 10px;">
								<div style="margin-bottom: 17px;"><span>${list.title }</span><span class="range">예시팀</span></div>
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
						<li class="${ list.title }" style="margin-bottom: 13px; border-bottom: 1px solid; padding-bottom: 10px;">
							<p>예시 제목 : ${ list.title }</p>
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
		
		// 호버시 display : block
		$("li").mouseenter(function(){
			let block = $(this).attr("class").replace(/&nbsp/gi, "")
			console.log(block)
			$("."+block).not("li").css({"display": "block","height":"15%"})
		})
		
		// 마우스가 떠났을 시 display : none
		$("li").mouseleave(function(){
			let none = $(this).attr("class").replace(/&nbsp/gi, "")
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