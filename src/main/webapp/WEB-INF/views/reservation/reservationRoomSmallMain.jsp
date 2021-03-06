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
	    line-height: 53px;
	}
	.res-notList{
        text-align: center;
	    line-height: 53px;
	    border-bottom: 1px solid
	}
	
	/*임의 아님!!!!!*/
	.reservation-main {
	    width: 100%;
	    height: 50%;
	}
	.reservation-navi {
	    width: 80%;
	    height: 9%;
	    padding-top: 4%;
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
	    height: 43.8%;
	    margin: 0 auto;
	}
	.reservation-today .res-today, .res-list {		
	    font-size: 20px;
	    margin: 0 auto;
	    width: 99.7%;
	    height: 9%;
	    line-height: 40px;
	}
	.res-list {
	    height: 10%;
	    line-height: 39px;
	}
	.res-list, .res-today {
	    background: #d2eaff;
	}
	.reservation-list {
	    width: 98.5%;
	    border-top: 1px solid;
	    height: 23.7%;
	    margin: 0 auto;
	    height: 77%;
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
        height: 9%;
	    text-align: center;
	}
	
	.reservation-main ul {
	    height: 76%;
	}

	/*오늘 내 현황*/
	table.today-reservation, .today-reservation th, .today-reservation td {
	    border-top: 1px solid;
   	    border-bottom: 1px solid;	
	    padding-top: 12px;
	    padding-bottom: 8px;
	}
	.reservation-today ul{
	    overflow-y: scroll;
	    height: 81%;		
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
		border-bottom: 1px solid;
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
	.res-thisLine4 {
	    width: 9.9%;
	    text-align: center;
	    margin-left: 10px;
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
	.res_tdtimes:not(li) {
	    background: rgb(174, 217, 248);
	}
	.res_tdtimes:hover {
	    background: #7bbce93d;
	}
	.colscolor {
	    background: aliceblue;
	}
	td[class *= time] {
	    width: 42px;
	}
	.reservation_dontTouch_btn{
	    width: 53%;
	    height: 80%;
	    padding-bottom: 3px;
	    margin-top: 3px;
	    background-color: gray !important;
	}
	.reservation-main .reservation_dontTouch_btn{
		background-color: #9e9e9e;
		box-shadow: 0px 5px 0px 0px #d3d3d3;
	}
	.reservation-main .reservation_dontTouch_btn:hover{
		box-shadow: 0px 0px 0px 0px #d3d3d3;
	}
	.reservation-today.resvation-history {
	    height: 72%;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../reservation/reservationDetailModal.jsp"></jsp:include>
	<div class="main_section">
        <div class="reservation-main">
        	<div class="reservation-navi">
        	<c:choose>
        	<c:when test="${ todayInfo.searchMonth == 12 and todayInfo.searchDate == 31 }"><!-- 만약 12월 31일이면  -->
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.beforeDate}&roomSmallNo=${roomSmallNo}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate}
				</span>&nbsp;
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.afterYear}&month=${todayInfo.afterMonth}&date=${todayInfo.afterDate}&roomSmallNo=${roomSmallNo}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.afterYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:when>
        	<c:when test="${ todayInfo.searchMonth == 1 and todayInfo.searchDate == 1 }"><!-- 만약 1월 1일이면  -->
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.beforeYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.beforeYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.beforeDate}&roomSmallNo=${roomSmallNo}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate }
				</span>&nbsp;
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.afterDate}&roomSmallNo=${roomSmallNo}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:when>
        	<c:when test="${ todayInfo.searchDate == todayInfo.endDay }">
        	<!-- 말일이면  -->
				<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.beforeDate}&roomSmallNo=${roomSmallNo}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate }
				</span>&nbsp;
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.afterDate}&roomSmallNo=${roomSmallNo}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:when>
			<c:when test="${ todayInfo.searchDate == 1 }">
        	<!-- 첫날이면  -->
				<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.beforeDate}&roomSmallNo=${roomSmallNo}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate }
				</span>&nbsp;
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.afterDate}&roomSmallNo=${roomSmallNo}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:when>
        	<c:otherwise><!-- 말일이 아니면  -->
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.beforeMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
					&lt;&lt;&nbsp;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.beforeDate}&roomSmallNo=${roomSmallNo}">
					&lt;
				<!-- 이전일 -->
				</a>&nbsp;
				<span class="this_day">
					${todayInfo.searchYear} . <c:if test="${todayInfo.searchMonth < 10}">0</c:if>${todayInfo.searchMonth} . <c:if test="${todayInfo.searchDate < 10}">0</c:if>${todayInfo.searchDate }
				</span>&nbsp;
        		<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.searchMonth-1}&date=${todayInfo.afterDate}&roomSmallNo=${roomSmallNo}">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="/smallRoomReservation.do?year=${todayInfo.searchYear}&month=${todayInfo.afterMonth}&date=${todayInfo.searchDate}&roomSmallNo=${roomSmallNo}">
				<!-- 다음달 -->
					&nbsp;&gt;&gt;
				</a> 
			</c:otherwise>
			</c:choose>
        	</div>
        	<div class="reservation-today resvation-history">
        	<div class="res-list"><p> 예약 현황</p></div>
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
        		<c:forEach var="reserve" items="${list}">
        			<c:if test="${fn:length(list) > 0}">
			        	<li class="today-line res_tdtimes" onclick="detailresGo(${reserve.reserveNo}); notuse(event);">
			        		<input type="hidden" value="${reserve.reserveNo}"/>
			   				<div class="res-todayList res-thisLine1">${reserve.smallRoomName}</div>
			    			<div class="res-todayList res-thisLine2">${reserve.meetingName}</div>
			     			<div class="res-todayList res-thisLine3">${fn:substring(reserve.startDate, 5, 7)}월 ${fn:substring(reserve.startDate, 8, 10)}일 ${fn:substring(reserve.startDate, 11, 16)} ~ ${fn:substring(reserve.endDate, 5, 7)}월 ${fn:substring(reserve.endDate, 8, 10)}일 ${fn:substring(reserve.endDate, 11, 16)}</div>
			     			<c:choose>
				     			<c:when test="${reserve.status eq 'Y' and loginUser.empNo == reserve.empNo}">
					     			<div class="res-todayList res-thisLine4">
					     				<button type="button" class="commonButton1 reservation_Cancel_btn" onclick="deleteReservation(${reserve.reserveNo})">예약 취소</button>
					     			</div>
				     			</c:when>
				     			<c:when test="${reserve.status eq 'Y' and loginUser.empNo != reserve.empNo}">
					     			<div class="res-todayList res-thisLine4">
					     				<button type="button" class="commonButton1 reservation_dontTouch_btn" disabled>예약 취소</button>
					     			</div>
				     			</c:when>
			     			</c:choose>
			     		</li>
			     	</c:if>

	     		</c:forEach>
	     		<c:if test="${fn:length(list) == 0}">
	     			<li class="res_tdtimes">
		     			<div class="res-notList">
		     				예약된 리스트가 존재하지 않습니다
	     				</div>
	     			</li>
	     		</c:if>
    		</ul>
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
        			<c:if test="${fn:length(myList) > 0}">
			        	<li class="today-line res_tdtimes" onclick="detailresGo(${today.reserveNo}); notuse(event);">
			   				<div class="res-todayList res-thisLine1">${today.smallRoomName}</div>
			    			<div class="res-todayList res-thisLine2">${today.meetingName}</div>
			     			<div class="res-todayList res-thisLine3">${fn:substring(today.startDate, 5, 7)}월 ${fn:substring(today.startDate, 8, 10)}일 ${fn:substring(today.startDate, 11, 16)} ~ ${fn:substring(today.endDate, 5, 7)}월 ${fn:substring(today.endDate, 8, 10)}일 ${fn:substring(today.endDate, 11, 16)}</div>
			     			<c:if test="${today.status eq 'Y'}">
				     			<div class="res-thisLine4">
				     				<button type="button" class="commonButton1 reservation_Cancel_btn" onclick="deleteReservation(${today.reserveNo})">예약 취소</button>
				     			</div>
			     			</c:if>
			     		</li>
		     		</c:if>
	     		</c:forEach>
	     		<c:if test="${fn:length(myList) == 0}">
	     			<li class="res_tdtimes">
		     			<div class="res-notList">
		     				예약된 리스트가 존재하지 않습니다
	     				</div>
	     			</li>
	     		</c:if>
     		</ul>
        </div>
    </div> 
	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
    <script>
	 	// 전체 회의실 페이지 이름
		$(function(){
	         $(".page_title>.title_name").text("${roomList[0].smallRoomName} 예약 현황");
		})
	 	
		// 특정 클래스 선택 시 상세조회 모달보이기 res_tdtimes
    	function detailresGo(resNo){
    		//event.stopPropagation()
    		$.ajax({
    			url:"selectOneReservation.do",
    			data:{
    				resNo:resNo
    			},
    			type:"get",
    			success:function(obj){
    				
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
				}
			})
		}
    	
    </script>
</body>
</html>