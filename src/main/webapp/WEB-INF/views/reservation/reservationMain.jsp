<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-예약페이지</title>
<style type="text/css">
	/*임의라인*/
	.reservation-main div{
		border: 1px solid;
		margin: 0 auto;
	}
	table.date-time tr, table.date-time td, table.date-time th {
	    border: 1px solid;
	}
	.res-todayList {
	    border: 1px solid;
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
	.before_after_month:hover{
		color: #85cdff;
	}
	table.date-time {
	    border: 1px solid;
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
	    border: 1px solid;
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
	    border: 1px solid;
	    height: 23.7%;
	    margin: 0 auto;
	}
	.reservation-today .res-today {
	    border: 1px solid red;
	    font-size: 20px;
	    margin: 0 auto;
	    margin-top: 0.5%;
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
	    border: 1px solid;
	}
	.reservation-today ul{
	    overflow-y: scroll;
	    height: 75%;
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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="reservation-main">
        	<div class="reservation-navi">
        		<a class="before_after_month" href="">
					&lt;&lt;
				<!-- 이전달 -->
				</a> 
        		<a class="before_after_month" href="">
					&lt;
				<!-- 이전일 -->
				</a>
				<span class="this_day">
					<!-- ${today_info.searchMonth}
					<c:if test="">
						${today_info.searchDate }
					</c:if> -->
					2022.06
				</span>
        		<a class="before_after_month" href="">
					&gt;
				<!-- 다음일 -->
				</a> 
				<a class="before_after_month" href="">
				<!-- 다음달 -->
					&gt;&gt;
				</a> 
        	</div>
        	<div class="reservation-div">
        		<table class="date-time">
        			<thead>
        				<tr>
        					<th class="reservation-title">회의실 / 시간</th>
        					<th>1시</th>
        					<th>2시</th>
        					<th>3시</th>
        					<th>4시</th>
        					<th>5시</th>
        					<th>6시</th>
        					<th>7시</th>
        					<th>8시</th>
        					<th>9시</th>
        					<th>10시</th>
        					<th>11시</th>
        					<th>12시</th>
        					<th>13시</th>
        					<th>14시</th>
        					<th>15시</th>
        					<th>16시</th>
        					<th>17시</th>
        					<th>18시</th>
        					<th>19시</th>
        					<th>20시</th>
        					<th>21시</th>
        					<th>22시</th>
        					<th>23시</th>
        					<th>24시</th>
        				</tr>
        			</thead>
        			<tbody>
        				<tr class="reservationRoom-line">
        					<td>제 1 회의실</td>
        				</tr>
        				<tr class="reservationRoom-line">
        					<td>제 2 회의실</td>
        				</tr>
        				<tr class="reservationRoom-line">
        					<td>제 3 회의실</td>
        				</tr>
        			</tbody>
        		</table>
        	</div>
        </div>
        <div class="reservation-today">
        	<div class="res-today">내 예약 현황</div>
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
	        	<li class="today-line">
	   				<div class="res-todayList res-thisLine1">예시회의실</div>
	    			<div class="res-todayList res-thisLine2">예시회의명</div>
	     			<div class="res-todayList res-thisLine3">예시예약시간</div>
	     			<div class="res-todayList res-thisLine4">예시예약취소</div>
	     		</li>
	     		<li class="today-line">
	     			<div class="res-todayList res-thisLine1">예시회의실</div>
	     			<div class="res-todayList res-thisLine2">예시회의명</div>
	     			<div class="res-todayList res-thisLine3">예시예약시간</div>
	     			<div class="res-todayList res-thisLine4">예시예약취소</div>
	     		</li>
	     		<li class="today-line">
	     			<div class="res-todayList res-thisLine1">예시회의실</div>
	     			<div class="res-todayList res-thisLine2">예시회의명</div>
	     			<div class="res-todayList res-thisLine3">예시예약시간</div>
	     			<div class="res-todayList res-thisLine4">예시예약취소</div>
	     		</li>
     		</ul>
        </div>
    </div> 
</body>
</html>