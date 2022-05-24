<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		td {font-family: "돋움"; font-size: 9pt; color:#595959;}
		th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}


		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

		A:link { font-size:11pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:active { font-family:"돋움";color:#17b6ff; text-decoration:none; }
		A:hover { font-family:"돋움";color:#17b6ff;text-decoration:none;}
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
			width: 64%;
			font-size: 25px;
		}
		.searchLine{
			width: 36%;
			display: flex;
		    justify-content: end;
		}
		/*검색할 text*/
		.searchSchedule {
			width: 150px;
			height: 25px;
		}
		/*검색하기 버튼*/
		.searchcalender {
			height: 25px;
			margin-left: 5px;
			margin-bottom: 3px;
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
			font-size: 19px;
			font-weight: bold;
		}
		.scheduleList{
			padding-top: 10px;
		}
		.today-Schedule, .scheduleList {
			border-top: 1px solid black;
		}
		.today{
		
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
		.titleAndTimeAndPlace{
			display: flex;
		}
		.todayList:hover{
			background-color: #f5f5f5; 
		}
		.todayList a :hover{
			color: black;
		}
	</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
	<form name="calendarFrm" id="calendarFrm" action="" method="GET">
		<div class="calendar" >
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
									<td class="today">
										<div class="date">
											${dateList.date}
										</div>
										<div>
										</div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day">
										<div class="sat">
											${dateList.date}
										</div>
										<div>
										</div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==0}">
					</tr>
					<tr>	
						<td class="sun_day">
							<div class="sun">
								${dateList.date}
							</div>
							<div>
							</div>
						</td>
								</c:when>
								<c:otherwise>
						<td class="normal_day">
							<div class="date">
								${dateList.date}
							</div>
							<div>
							
							</div>
						</td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
	<div class="today-Schedule">
		<div class="schedule-title">오늘 예정된 일정</div>
		<div class="scheduleList">
		<!-- <c:if test="${ todayList == null }">
			<div class="today">
				오늘 예정된 일정이 없음
			</div>
		</c:if>-->
		<%-- <c:if test="${ todayList != null }">
			<c:forEach var="list" items="${todayList}">
				<div class="today">
					${ list }
				</div>
			</c:forEach> 
		</c:if>--%>
			<div class="today">
				<div class="todayList">
					<div class="titleAndTimeAndPlace">
						<div class="title">예시제목</div><div class="range">예시팀</div>
					</div>
					<br>
					<div class="titleAndTimeAndPlace">
						<div class="line">시간</div><div class="time">10:00 ~ 11:30</div>
					</div>
					<div class="titleAndTimeAndPlace">
						<div class="line">장소</div><div class="place">에시 장소</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>