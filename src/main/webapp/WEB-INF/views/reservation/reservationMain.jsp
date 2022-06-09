<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-예약페이지</title>
<style type="text/css">
	.reservation-main div{
		border: 1px solid;
		margin: 0 auto;
	}
	.reservation-main {
	    width: 100%;
	    height: 100%;
	}
	.reservation-navi {
	    width: 80%;
	    height: 5%;
	    padding-top: 3%;
	    font-size: 30px;
  		text-align: center;
	}
	.reservation-div {
	    width: 80%;
	    height: 50%;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="reservation-main">
        	<div class="reservation-navi">
        		<a class="before_after_month" href="">
					&lt;
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
					&gt;
				</a> 
        	</div>
        	<div class="reservation-div">
        		<table class="date-time">
        			
        		</table>
        	</div>
        </div>
        <div class="reservation-today">
        	
        </div>
    </div> 
</body>
</html>