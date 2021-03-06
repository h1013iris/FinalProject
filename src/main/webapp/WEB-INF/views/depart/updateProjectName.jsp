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
	.spmodal_can_project, .spmodal_next_project{
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
	.spr_body_text_project, #insertDJSimpleProject{
	    margin-top: 10px;
	    height: 59%;
    	width: 85%;
	    float:none;
	    line-height: 20px;
	}
</style>
</head>
<body>
	<!-- 모달 시작부분 -->
	<div id="modal_background" class="modal_background updateProjectName">
        <div id="modal_container" class="size400 heightSizech" style="height: 250px;">
           	<!-- 모달 헤더 부분 -->
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">프로젝트명 수정</span>
            </div>
            <!-- 모달 바디 부분 -->
            <div class="modal_body spmodal_body ">
            	<div class="spmodal_body_name"> <span>프로젝트명 수정 </span></div>
            	<form action="updateProjectName.do" id="insertDJSimpleProject" method="post">
	              	<input type="text" class="spr_body_text_project" id="title" name="proTitle" placeholder="수정할 프로젝트 명을 넣어주세요" required title="프로젝트명을 작성하는 부분입니다." maxlength="42" >
	              	<input type="hidden" id="proNo" name="proNo" class="modalProNo">
              	</form>
            </div>
            <div class="modal_footer buttonSection">
                <button class="next_btn commonButton1 spmodal_next_project" type="submit">등록</button>
                <button class="cancel_btn commonButton1 spmodal_can_project" type="button">취소</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
	   $(".spmodal_can_project").click(function(){
		   $(".spr_body_text_project").val("");
		   $(".updateProjectName").hide();
	   })
	   $(".spmodal_next_project").click(function(){
		   $("#insertDJSimpleProject").submit();
	   })
    </script>
  	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
	
</body>
</html>