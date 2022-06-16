<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
	#res-alertBackground {
	    background-color: rgba(0, 0, 0, 0.2);
	    position: absolute;
	    top: 0;
	    left: 0;
	    bottom: 0;
	    right: 0;
	    display: none;
	    justify-content: center;
	    align-items: center;
	    z-index: 9999 ;
	}
	#res-alert_container{
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 400px;
	    height: 150px;
	    border: 1px solid #85cdff;
	    box-shadow: 4px 3px #b9b9b9;
	    border-radius: 5px;
	    z-index: 99;
	    background-color: white;
	}
	
	#res-alert_title{
	    height: 40px;
	    line-height: 40px;
	}
	
	#res-alert_title .title_name {
	    margin-left: 30px;
	    font-size: 22px;
	    font-weight: 600;
	}
	
	#res-alert_body{
	    width: 100%;
	    height: 70px;
	    line-height: 70px;
	}
	
	#res-alert_body .res-alert_content{
	    margin-left: 20px;
	}
	
	#res-alert_footer{
	    width: 100%;
	    height: 40px;
	    line-height: 40px;
	}
	
	#res-alert_footer button {
	    float: right;
	    margin-right: 30px;
	}
</style>
</head>
<body>
	<div id="res-alertBackground">
	    <div id="res-alert_container">
	        <div id="res-alert_title">
	            <span class="title_name">${msgTitle}</span>
	        </div>
	        <div id="res-alert_body">
	            <span class="res-alert_content">${msg}</span>
	        </div>
	        <div id="res-alert_footer">
	            <button type="button" class="res-Cancel-btn">확인</button>
	        </div>
	    </div>
    </div>
    <script>
		 // alert 확인 버튼시
		$(".res-Cancel-btn").click(function(){
			$("#res-alertBackground").hide();
			$(".reservationEnrollFormModal").show();	
		})
    </script>
</body>
</html>