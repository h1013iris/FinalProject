<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-예약수정페이지</title>
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
	    line-height: 53px;
	}
	
	/*임의 아님!!!!!*/
	.reservation-main {
	    width: 100%;
	    height: 62%;
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
	    border: 2px solid;
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
	    height: 31.9%;
	    margin: 0 auto;
	}
	.reservation-today .res-today {
	    font-size: 20px;
	    margin: 0 auto;
	    width: 99.7%;
	    height: 12%;
	    line-height: 40px;
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
	    height: 71%;		
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
	    margin-left: 8%;
	}
	.res_tdtimes:not(li) {
	    background: rgb(174, 217, 248);
	}
	.res_tdtimes:hover {
	    background: #7bbce93d;
	}
	.colscolor {
	    background: aliceblue;
	}
	td[class^='time'] {
	    width: 1%;
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
        					<th class="reservation-title colscolor">회의실 / 시간</th>
        				<c:forEach var="time" items="${timeInfo}">
        					<c:if test="${time.key%2 == 0}">
        						<th class="colscolor" colspan="2">${fn:substring(time.value,0,2)}시</th>
        					</c:if>
        				</c:forEach>
        				</tr>
        			</thead>
        			<tbody>
        				<c:forEach items="${roomList}" var="room" varStatus="st">
	        				<tr class="reservationRoom-line">
	        					<td class="name${st.index} resRoomName colscolor">${room.smallRoomName}</td>
       							<c:forEach items="${timeInfo}" var="time" varStatus="status1">
     								<td class="time${room.roomSmallNo}${time.key}">
     									<input type="hidden" class="resNo"/>
     								</td>
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
		        	<li class="today-line res_tdtimes" onclick="detailresGo(${today.reserveNo}); notuse(event);">
		   				<div class="res-todayList res-thisLine1">${today.smallRoomName}</div>
		    			<div class="res-todayList res-thisLine2">${today.meetingName}</div>
		     			<div class="res-todayList res-thisLine3">${fn:substring(today.startDate, 5, 7)}월 ${fn:substring(today.startDate, 8, 10)}일 ${fn:substring(today.startDate, 11, 16)} ~ ${fn:substring(today.endDate, 5, 7)}월 ${fn:substring(today.endDate, 8, 10)}일 ${fn:substring(today.endDate, 11, 16)}</div>
		     			<c:if test="${today.status eq 'Y'}">
			     			<div class="res-todayList res-thisLine4">
			     				<button type="button" class="commonButton1 reservation_Cancel_btn" onclick="deleteReservation(${today.reserveNo})">예약 취소</button>
			     			</div>
		     			</c:if>
		     		</li>
	     		</c:forEach>
     		</ul>
        </div>
    </div> 
	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
    <script>
	 	// 전체 회의실 페이지 이름
		$(function(){
	         $(".page_title>.title_name").text("전체 회의실 예약 현황 페이지");
		})
	 	
		$(document).on('click',"[class^='time']", function(){
			let resNo = $(this).find('input').val()
			detailresGo(resNo);
		})
	 	
    	// 특정 클래스 선택 시 상세조회 모달보이기 res_tdtimes
    	function detailresGo(resNo){
    		console.log("상세 모달로")
    		console.log(resNo)
    		
    		//event.stopPropagation()
    		$.ajax({
    			url:"selectOneReservation.do",
    			data:{
    				resNo:resNo
    			},
    			type:"get",
    			success:function(obj){
    				console.log("상세모달 성공")
    				
    				let reserNo = obj.reserveNo;					// 예약번호 (업데이트시 끌고가야함)
    				let empNo = obj.empNo;							// 사원번호 (업데이트시 끌고가야함)
    				let roomSmallNo = obj.roomSmallNo;				// 회의실 번호
    				let startDate = new Date(obj.startDate);		// 시작일 (업데이트시 끌고 가야함)
    				let startTime = obj.startDate.substring(11,16);	// 시작 시간 (업데이트시 끌고가야함)
    				let endDate = new Date(obj.endDate);			// 종료일 (업데이트시 끌고가야함)
    				let endTime = obj.endDate.substring(11,16);		// 종료시간 (업데이트시 끌고가야함)
    				let meetingName = obj.meetingName;				// 회의명 (업데이트시 끌고가야함)
    				let smallRoomName = obj.smallRoomName;			// 회의실 명
					
    				// update를 위한 히든값
    				$('.resDetailModal_body .reserveNo').val(reserNo);
    				$('.resDetailModal_body .empNo').val(empNo);
    				
    				$(".resDetail_time").text(startDate.getFullYear()+"년 "+startDate.getMonth()+"월 "+startDate.getDate()+"일 "+startTime+" ~ "+endDate.getFullYear()+"년 "+endDate.getMonth()+"월 "+endDate.getDate()+"일 "+endTime);
    				$('.resDetail_place').text(smallRoomName)
    				$('.resDetailModal_title').text(meetingName)
    				
    				selectOneAttendee(reserNo);
    				
    			},
    			error:function(){
    				console.log("상세모달 실패")
    			}
    		})
    	}

		function notuse(event){
			event.stopPropagation()
		}
    	
    	function selectOneAttendee(reserNo) {
    		$.ajax({
				url:"selectOneAttendee.do",
				data:{
    				resNo:reserNo
    			},
    			type:"get",
    			success:function(obj){
    				console.log("참석자 성공")
    				
    				$.each(obj, function(idx, val){
    					
    					let attendee = val.empName;
    					let at = $('<span>').append(attendee).append(status).addClass("res_att");
    					if(idx < obj.length-1){
    						at.append(", ")
    					}
    					$('.resDetail_attendee').append(at);
						
    					$(".resDetailModal_background").css("display","flex");
    				})
				    
    			},
    			error:function(){
    				console.log("참석자 실패")
    			}
			})
		}
    
    	// 취소 버튼 클릭시 ajax실행
    	function deleteReservation(reserveNo) {
    		event.stopPropagation()
			myConfirm("회의실 예약 삭제", "예약을 정말로 삭제하시겠습니까?");
			//취소할 시 
			$(".false_btn").click(function() {
			     $("#helpmeCOnfirm").hide();
			});
			
			// 확인 클릭 시
			$(".true_btn").click(function() {
				$("#helpmeCOnfirm").hide();
				console.log("확인 클릭함")
				deleteresGo(reserveNo);
		    });
	    }
    	
    	function deleteresGo(reserveNo) {

    		$.ajax({
				url:"deleteReservation.do",
				data:{
					reserveNo : reserveNo
				},
				type:"get",
				success:function(index){
					location.reload();
				},
				error:function(error){
					console.log("삭제 실패")
				}
			})
		}
    	$(function() {
    		
    		// 검색 일 예약 현황을 위해 배열 선언
			let arr = new Array();

			let count = 0; 
			<c:forEach var="reserve" items="${list}">
				arr.push({num:count,
					reserveNo : ${reserve.reserveNo},
					empNo : ${reserve.empNo},
					roomSmallNo : ${reserve.roomSmallNo},
					smallRoomName : '${reserve.smallRoomName}',
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
			
			// 룸 넘버 받기 위해 배열 선언
			let roomList = new Array();
			<c:forEach var="val" items="${roomList}">
			roomList.push({roomLargeNo : ${val.roomLargeNo},
					roomSmallNo : ${val.roomSmallNo},
					largeRoomName : '${val.largeRoomName}',
					smallRoomName : '${val.smallRoomName}',
					maxCount : ${val.maxCount},
					status : "${val.status}"
					})
			</c:forEach>
			
			let dd = $('.this_day').text().trim()
			
			// 시작일부터 종료일까지 땅따먹기
			// 각 arr의 값을 다루기 위해 foreach문
			arr.forEach(function(val) {
				let start = val.startDate;
				let startTime = "";
				let end = val.endDate;
				let endTime = "";
				let resNo = val.reserveNo;
				let SroomNo = val.roomSmallNo
				let meeting = val.meetingName;
				
				// 추후 비교를 위해 startTime 받기
				if(start.getMinutes() == 0){
					let hour = ""+start.getHours();
					
					if(hour.length != 1){
						startTime = hour+":00";
					}else{
						startTime = "0"+hour+":00";
					}
				}else if(start.getMinutes() == 30){
					let hour = ""+start.getHours();
					
					if(hour.length != 1){
						startTime = hour+":"+start.getMinutes();
					}else{
						startTime = "0"+hour+":"+start.getMinutes();
					}
				}
				console.log(startTime)
				
				// endTime도 startTime과 마찬가지
				if(end.getMinutes() == 0){
					let hour = ""+end.getHours();
					
					if(hour.length != 1){
						endTime = hour+":00";
					}else{
						endTime = "0"+hour+":00";
					}
				}else if(end.getMinutes() == 30){
					let hour = ""+end.getHours();
					
					if(hour.length != 1){
						endTime = hour+":"+end.getMinutes();
					}else{
						endTime = "0"+hour+":"+end.getMinutes();
					}
				}
				console.log(endTime)
				
				// 시작일자와 종료일자가 같으면 탐
				if(start.getDate() == end.getDate()){
					console.log("시작일자와 종료일자가 같음")
					
					
					let count = 0; // 셀 병합 할 카운트 수
					
					// 셀병합랄 클래스 찾기
					
					// 셀 병함 시작할 클래스 넘버
					let roomNo = "";
					
					// 클래스 넘버 앞에 room넘버를 알아와야하지?
					
					// 1. 룸의 넘버를 알아온다.
					for(let j = 0 ; j < roomList.length ; j++){
						// value 선언 및 룸 넘버 받기
						let value = roomList[j].roomSmallNo;
						
						// value값과 예약한 룸넘버값이 같으면
						if(SroomNo == value){
							// 클래스 넘버를 넣고 break;
							roomNo = value;
							break;
						}
					}
					
					
					// 2. timeInfo의 value 값이 val.startDate의 시간과 같아야함
					// 먼저 변수 선언 후에 일치하면 값을 가져온다
					let cols = "";
					
					let classNo2 = "";
					for(let j = 0 ; j < timeInfo.length ; j++){
						// value값
						let value = timeInfo[j].value;
						
						// value값과 startDate의 값이 같으면
						if(startTime == value){
							// 클래스 넘버를 넣고 break;
							classNo2 = timeInfo[j].key;
							break;
						}
						
					}
					// 합쳐질 셀대상을 변수로 담기
					cols = $('.time'+roomNo+classNo2)
					
					let resNoval = cols.find('.resNo')//.val(resNo);
					console.log(resNoval)
					
					console.log(cols)
					// 땅따먹기 + 색칠
					// 방법 - time이란 클래스를 찾아서 차이 만큼 셀 병합 
					for(let i = start ; i < end ; i.setMinutes(i.getMinutes()+30)){
						
						count++;
						// 카운트 수가 1 이상이면 셀 병합
				        if (count > 1) {
				        	// 카운트 수만큼 셀 별합
							cols.attr("colspan", count).html(meeting);
				        }
					}
					cols.append('<input type="hidden" value="'+resNo+'"/>').addClass("res_tdtimes");
					// 필요없는 컬럼 지우기
					console.log(count) // 카운트 수 확인
					// 카운트 수의 -1 을 하여 시작시간을 제외하여 삭제
					for(let i = 0 ; i < count-1 ; i++){
						cols.next().remove();
					}

					
				// 시작일만 오늘이면 탐
				}else if(start.getDate() == dd.substring(dd.length-2)){
					console.log("시작일만 오늘임")
					let count = 0; // 셀 병합 할 카운트 수
					
					// 셀병합랄 클래스 찾기
					
					// 셀 병함 시작할 클래스 넘버
					let roomNo = "";
					
					// 클래스 넘버 앞에 room넘버를 알아와야하지?
					
					// 1. 룸의 넘버를 알아온다.
					for(let j = 0 ; j < roomList.length ; j++){
						// value 선언 및 룸 넘버 받기
						let value = roomList[j].roomSmallNo;
						
						// value값과 예약한 룸넘버값이 같으면
						if(SroomNo == value){
							// 클래스 넘버를 넣고 break;
							roomNo = value;
							console.log(roomNo)
							break;
						}
					}
					console.log(roomNo)
					
					
					// 2. timeInfo의 value 값이 val.startDate의 시간과 같아야함
					// 먼저 변수 선언 후에 일치하면 값을 가져온다
					let cols = "";
					
					let classNo2 = "";
					for(let j = 0 ; j < timeInfo.length ; j++){
						// value값
						let value = timeInfo[j].value;
						
						// value값과 startDate의 값이 같으면
						if(startTime == value){
							// 클래스 넘버를 넣고 break;
							classNo2 = timeInfo[j].key;
							break;
						}
						
					}
					console.log(classNo2)
					// 합쳐질 셀대상을 변수로 담기
					cols = $('.time'+roomNo+classNo2)
					console.log(cols)
					// 땅따먹기 + 색칠
					// 방법 - time이란 클래스를 찾아서 차이 만큼 셀 병합 
					for(let i = start ; i < end ; i.setMinutes(i.getMinutes()+30)){
						
						count++;
						// 카운트 수가 1 이상이면 셀 병합
				        if (count > 1) {
				        	// 카운트 수만큼 셀 별합
							cols.attr("colspan", count).html(meeting)
				        }
					}
					cols.append('<input type="hidden" value="'+resNo+'"/>').addClass("res_tdtimes")
					// 필요없는 컬럼 지우기
					console.log(count) // 카운트 수 확인
					// 카운트 수의 -1 을 하여 시작시간을 제외하여 삭제
					for(let i = 0 ; i < count-1 ; i++){
						cols.next().remove();
					}
				// 종료일만 오늘이면 탐
				}else if(end.getDate() == dd.substring(dd.length-2)){
					console.log("종료일만 오늘임")
					let count = 0; // 셀 병합 할 카운트 수
					
					// 셀병합랄 클래스 찾기
					
					// 셀 병함 시작할 클래스 넘버
					let roomNo = "";
					
					// 클래스 넘버 앞에 room넘버를 알아와야하지?
					
					// 1. 룸의 넘버를 알아온다.
					for(let j = 0 ; j < roomList.length ; j++){
						// value 선언 및 룸 넘버 받기
						let value = roomList[j].roomSmallNo;
						
						// value값과 예약한 룸넘버값이 같으면
						if(SroomNo == value){
							// 클래스 넘버를 넣고 break;
							roomNo = value;
							console.log(roomNo)
							break;
						}
					}
					console.log(roomNo)
					
					
					// 2. timeInfo의 value 값이 val.endDate의 시간과 같아야함
					// 먼저 변수 선언 후에 일치하면 값을 가져온다
					let cols = "";
					
					let classNo2 = "";
					for(let j = 0 ; j < timeInfo.length ; j++){
						// value값
						let value = timeInfo[j].value;
						
						// value값과 startDate의 값이 같으면
						if(endTime == value){
							// 클래스 넘버를 넣고 break;
							classNo2 = timeInfo[j].key;
							break;
						}
						
					}
					console.log(classNo2)
					// 합쳐질 셀대상을 변수로 담기
					cols = $('.time'+roomNo+classNo2)
					console.log(cols)
					// 찾은 요소 행에서 첫 요소의 다음요소 가져오기
					let firstcols = cols.siblings(":first").next()
					
					console.log(firstcols)
					// 땅따먹기 + 색칠
					// 방법 -
					for(let i = end ; i > start ; i.setMinutes(i.getMinutes()-30)){
						
						// 카운트 수가 1 이상이면 셀 병합
				        if (count > 1) {
				        	// 카운트 수만큼 셀 별합
							cols.attr("colspan", count).html(meeting);
				        }
						
						count++;
					}
					cols.append('<input type="hidden" value="'+resNo+'"/>').addClass("res_tdtimes")
					// 필요없는 컬럼 지우기
					console.log(count) // 카운트 수 확인
					// 카운트 수의 -1 을 하여 시작시간을 제외하여 삭제
					for(let i = 0 ; i < count-1 ; i++){
						// 만약 text가 존재하는 요소를 만나면
						if(cols.prev().hasClass("resRoomName")){
							break;
						}
						cols.prev().remove();
					}
				}
			})
			
		})
    </script>
</body>
</html>