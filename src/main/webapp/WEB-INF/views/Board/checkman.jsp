<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간편 프로젝트 생성 모달</title>
<style type="text/css">
	.buttonSection{
		height: 80px;
	}
	.spmodal_can, .spmodal_next{
		width: 50px;
		height: 35px;
		line-height: 20px;
	}
	.spmodal_body{
		height: 40%;
		width: 100%;
		margin-left: 5px;
	}
	.spmodal_body_name{
		font-size: 20px;
		margin-top: 17px;
		margin-bottom: 5px;
	}
	.spr_body_text, #insertDJSimple{
	    margin-top: 10px;
	    height: 59%;
    	width: 85%;
	    float:none;
	    line-height: 20px;
	}

.checkmanfootermodal{
margin-top: 30%;
}
</style>
</head>
<body>
	<!-- 모달 시작부분 -->
	<div id="modal_background" class="modal_background checkmans">
        <div id="modal_container" class="size600 heightSizech" style="height: 600px;">
           	<!-- 모달 헤더 부분 -->
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">읽은 사람</span>
            </div>
            <!-- 모달 바디 부분 -->
            <div class="modal_body spmodal_body ">
            	
            	<br><br>
            	<table id="userList" class="table table-hover" align="center">
				
					
						</table>
            </div>
            <div class="modal_footer buttonSection checkmanfootermodal">           
                <button class="checkman_cancel_btn commonButton1" type="button">돌아가기</button>                    
            </div>
        </div>
    </div>
    <script>
    $(".checkman_cancel_btn").click(function() {
    	$(".checkmans").hide();
	})
    </script>
  	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
  	<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>
	
</body>
</html>