<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-예약페이지</title>
<style type="text/css">
	/*임의라인*/
	.reservation-main div{
		margin: 0 auto;
	}
	table.date-time tr, table.date-time td, table.date-time th {
	    border: 1px solid;
	}
	.res-todayList {
        text-align: center;
	    line-height: 37px;
	}
	
	/*임의 아님!!!!!*/
	.reservation-main {
	    width: 100%;
	    height: 70%;
	}
	.reservation-navi {
	    width: 80%;
	    height: 5%;
	    padding-top: 3%;
	    font-size: 30px;
	    text-align: center;
	}
	.reservation-navi {
	    width: 80%;
	    height: 5%;
	    padding-top: 3%;
	    font-size: 30px;
  		text-align: center;
	}
	.reservation-div {
	    width: 95%;
	    height: 75%;
	}
	.before_after_month{
		color:#000;
	}
	.before_after_month:hover{
		color: #85cdff;
	}
	table.date-time {
	    width: 100%;
	    height: 100%;
	}
	th.reservation-title {
	    width: 8%;
	}
	.reservation-main thead {
	    height: 10%;
	}
	table.date-time th:not(:first-child) {
	    width: 3%;
	}
	.reservationRoom-line{
		font-size: 17px;
	}
	table.date-time tr, table.date-time td, table.date-time th {
	    vertical-align: middle;
        text-align: center;
	}
	table.date-time th{
	    font-size: 19px;
    }
	th.reservation-title {
	    width: 8%;
	}
	.reservation-today {
	    width: 98.5%;
	    border-top: 1px solid;
	    height: 23.7%;
	    margin: 0 auto;
	}
	.reservation-today .res-today {		
	    font-size: 20px;
	    margin: 0 auto;
	 	margin-top: 0.8%;
 	    margin-bottom: 0.2%;
	    width: 99.7%;
	    height: 11%;
	}
	.res-columm1{
		width: 13%;
	}
	.res-columm2{
		width: 20%;
	}
	.res-columm3{
		width: 12%;
	}
	.res-columm4{
		width: 5%;
	}
	
	table.today-reservation {
	    width: 100%;
        height: 16%;
	    text-align: center;
	}

	/*오늘 내 현황*/
	table.today-reservation, .today-reservation th, .today-reservation td {
	    border-top: 1px solid;
	    margin-bottom: 3px;
	}
	.reservation-today ul{
	    overflow-y: scroll;
	    height: 63%;		
	}
	.reservation-today ul::-webkit-scrollbar{
	    display: none;
	}
	td.res-columm1, .res-columm2, .res-columm3, .res-columm4 {
	    font-size: 20px;
	    font-weight: 600;
	    vertical-align: middle;
	}
	.today-line{
		display: flex;
		border-top: 1px solid;
	}
	.res-thisLine1{
		width: 25.9%;
	}
	.res-thisLine2{
		width: 39.9%;
	}
	.res-thisLine3{
		width: 23.85%;
	}
	.res-thisLine4{
	    width: 9.9%;
	}
	.res-today p{
		margin-left: 3px;
	}
	button.commonButton1.reservation_Cancel_btn {
	    width: 53%;
	    height: 80%;
	    padding-bottom: 3px;
	    margin-top: 3px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="reservation-main">
        	<div class="reservation-navi">
        	<c:choose>
        	<c:when test="${ todayInfo.searchMonth == 12 and todayInfo.searchDate == 31 }"><!-- 만약 12월 31일이면  -->
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.beforeDate}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate }
				</span>&nbsp;
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.afterYear}&month=${todayInfo.afterMonth}&date=${todayInfo.afterDate}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.afterYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:when>
        	<c:when test="${ todayInfo.searchMonth == 1 and todayInfo.searchDate == 1 }"><!-- 만약 1월 1일이면  -->
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.beforeYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.beforeYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.beforeDate}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate }
				</span>&nbsp;
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.afterDate}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:when>
        	<c:when test="${ todayInfo.searchDate == todayInfo.endDay }">
        	<!-- 말일이면  -->
				<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.beforeDate}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate }
				</span>&nbsp;
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.afterDate}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:when>
			<c:when test="${ todayInfo.searchDate == 1 }">
        	<!-- 첫날이면  -->
				<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.beforeDate}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate }
				</span>&nbsp;
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.afterDate}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:when>
        	<c:otherwise><!-- 말일이 아니면  -->
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.beforeDate}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate }
				</span>&nbsp;
        		<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.afterDate}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/roomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:otherwise>
			</c:choose>
        	</div>
        	<div class="reservation-div">
        		<table class="date-time">
        			<thead>
        				<tr>
        					<th class="reservation-title">회의실 / 시간</th>
        					<th colspan="2">1시</th>
        					<th colspan="2">2시</th>
        					<th colspan="2">3시</th>
        					<th colspan="2">4시</th>
        					<th colspan="2">5시</th>
        					<th colspan="2">6시</th>
        					<th colspan="2">7시</th>
        					<th colspan="2">8시</th>
        					<th colspan="2">9시</th>
        					<th colspan="2">10시</th>
        					<th colspan="2">11시</th>
        					<th colspan="2">12시</th>
        					<th colspan="2">13시</th>
        					<th colspan="2">14시</th>
        					<th colspan="2">15시</th>
        					<th colspan="2">16시</th>
        					<th colspan="2">17시</th>
        					<th colspan="2">18시</th>
        					<th colspan="2">19시</th>
        					<th colspan="2">20시</th>
        					<th colspan="2">21시</th>
        					<th colspan="2">22시</th>
        					<th colspan="2">23시</th>
        					<th colspan="2">24시</th>
        				</tr>
        			</thead>
        			<tbody>
        				<c:forEach items="${roomList}" var="room" varStatus="st">
	        				<tr class="reservationRoom-line">
	        					<td class="name${st.index}">${room.SRoomName}</td>
       							<c:forEach items="${timeInfo}" var="time" varStatus="status1">
     								<td class="time${time.key}"></td>
	        					</c:forEach>
	        				</tr>
        				</c:forEach>
        			</tbody>
        		</table>
        	</div>
        </div>
        <div class="reservation-today">
        	<div class="res-today"><p>내 예약 현황</p></div>
        	<table class="today-reservation">
        		<thead>
        			<tr class="reservation-columm">
        				<td class="res-columm1">회의실</td>
        				<td class="res-columm2">회의명</td>
        				<td class="res-columm3">예약시간</td>
        				<td class="res-columm4">예약취소</td>
        			</tr>
        		</thead>
        	</table>
        	<ul>
        		<c:forEach var="today" items="${myList}">
		        	<li class="today-line">
		   				<div class="res-todayList res-thisLine1">${today.SRoomName}</div>
		    			<div class="res-todayList res-thisLine2">${today.meetingName}</div>
		     			<div class="res-todayList res-thisLine3">${fn:substring(today.startDate, 5, 7)}월 ${fn:substring(today.startDate, 8, 10)}일 ${fn:substring(today.startDate, 11, 16)} ~ ${fn:substring(today.endDate, 5, 7)}월 ${fn:substring(today.endDate, 8, 10)}일 ${fn:substring(today.endDate, 11, 16)}</div>
		     			<c:if test="${today.status eq 'Y'}">
			     			<div class="res-todayList res-thisLine4">
			     				<button type="button" class="commonButton1 reservation_Cancel_btn">예약 취소</button>
			     			</div>
		     			</c:if>
		     		</li>
	     		</c:forEach>
     		</ul>
        </div>
    </div> 
    <script>
    	$(function() {
    		
    		// 검색 일 예약 현황을 위해 배열 선언
			let arr = new Array();

			let count = 0; 
			<c:forEach var="reserve" items="${list}">
				arr.push({num:count,
					reserveNo : ${reserve.reserveNo},
					empNo : ${reserve.empNo},
					roomSmallNo : ${reserve.roomSmallNo},
					sRoomName : '${reserve.SRoomName}',
					startDate : new Date("${reserve.startDate}"),
					endDate : new Date("${reserve.endDate}"),
					meetingName : '${reserve.meetingName}',
					status : '${reserve.status}'
					})
				count++;
			</c:forEach>
			console.log(arr)
			
			
			// 타임 값 비교를 위해 배열 선언
			let timeInfo = new Array();
			<c:forEach var="val" items="${timeInfo}">
				timeInfo.push({key:${val.key},
					value : '${val.value}'
					})
			</c:forEach>
			
			
			let dd = $('.this_day').text().trim()
			
			// 시작일부터 종료일까지 땅따먹기
			// 각 arr의 값을 다루기 위해 foreach문
			arr.forEach(function(val) {
				let start = val.startDate;
				let startTime = ((start.getHours()+"").length == 1)? "0"+start.getHours()+":"+start.getMinutes() : start.getHours()+":"+start.getMinutes();
				let end = val.endDate;
				let resNo = val.reserveNo;
				let meeting = val.meetingName;
				console.log(startTime)
				
				// 시작일자와 종료일자가 같으면 탐
				if(start.getDate() == end.getDate()){
					
					// 셀 병함 시작할 클래스 넘버
					let classNo = 0;
					
					let count = 0; // 셀 병합 할 카운트 수
					// 셀병합랄 클래스 찾을려면 timeInfo의 value 값이 val.startDate의 시간과 같아야함
					// 그럼 먼저 변수 선언 후에 일치하면 값을 가져온다
					let cols = "";
					
					for(let j = 0 ; j < timeInfo.length ; j++){
						// value값
						let value = timeInfo[j].value;
						console.log(value)
						
						// value값과 startDate의 값이 같으면
						if(startTime == value){
							// 클래스 넘버를 넣고 break;
							classNo = timeInfo[j].key;
							break;
						}
						
					}
					console.log(classNo)
					// 합쳐질 셀대상을 변수로 담기
					cols = $('.time'+classNo)
					
					// 땅따먹기 + 색칠
					// 방법 - time이란 클래스를 찾아서 차이 만큼 셀 병합 
					for(let i = start ; i < end ; i.setMinutes(i.getMinutes()+30)){
						
						count++;
						// 카운트 수가 1 이상이면 셀 병합
				        if (count > 1) {
				        	// 카운트 수만큼 셀 별합
							cols.attr("colspan", count).text(meeting);
							// 나머지를 지움
							//cols.next().remove();
				        }
					}
					
					// 필요없는 컬럼 지우기
					console.log(count) // 카운트 수 확인
					// 카운트 수의 -1 을 하여 시작시간을 제외하여 삭제
					for(let i = 0 ; i < count-1 ; i++){
						cols.next().remove();
					}

					
				// 시작일만 오늘이면 탐
				}else if(start.getDate() == dd.substring(dd.length-2)){
					
					// 색칠 
					for(let i = start ; i < end ; i.setMinutes(i.getMinutes()+30)){
						
					}
				// 종료일만 오늘이면 탐
				}else if(end.getDate() == dd.substring(dd.length-2)){
					
					// 색칠 
					for(let i = start ; i < end ; i.setMinutes(i.getMinutes()+30)){
						
					}
				}
			})
			
		})
    </script>
</body>
</html>