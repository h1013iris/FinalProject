<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
<style>
	.calenderModal_Body{
		margin-bottom: 96px;
    	margin-top: 30px;
	}
	.calenderModal_Container {
	    height: 75%;
	}
	.calModalMiddle {
	    display: flex;
	}
	.calMiddleside {
	    font-size: 19px;
	    font-weight: 500;
        margin-right: 20px;
	}
	.calMiddleside p, .calMiddleMain p {
	    margin-bottom: 15px;
	}
	.calenderModal_Body p.openOption {
	    width: 75px;
	    height: 25px;
	    line-height: 25px;
	    text-align: center;
	    margin-bottom: 13px;
	    margin-left: 4px;
        margin-top: 5px;
	}
	p.cal-date {
	    margin-top: 1px;
	}
	.cal-section, p.cal-place {
	    padding-top: 4px;
	}
	p.cal-openOption {
	    padding-top: 2px;
	}
	p.cal-alarm {
	    padding-top: 3px;
	}
	textarea.cal-memo {
	    margin-top: 3px;
	    resize: none;
	}
	.modal_footer.calenderModal_Footer {
	    text-align: end;
	    padding-right: 30px;
	}
	#modal_container .delete_btn, #modal_container .cal-cancel_btn, #modal_container .update_btn{
		width: 80px;
   		height: 46px;
	}
	#modal_container .delete_btn{
		background-color: #383838;
		color: #fff;
		box-shadow: 0px 5px 0px 0px #b4b4b4;
	}
	#modal_container .delete_btn:hover{
		box-shadow: 0px 0px 0px 0px #b4b4b4;
	}
	#modal_container .cal-cancel_btn{
		background-color: #9e9e9e;
		box-shadow: 0px 5px 0px 0px #d3d3d3;
	}
	#modal_container .cal-cancel_btn:hover{
		box-shadow: 0px 0px 0px 0px #d3d3d3;
	}
</style>
</head>
<body>
    <div id="modal_background" class="calenderModal_BigDiv">
        <div id="modal_container" class="size800 calenderModal_Container">
            <div class="modal_header calenderModal_Header">
                <div class="logo calenderModal_Logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title calenderModal_Title"></span>
            </div >
            <div class="modal_body calenderModal_Body">
           		<p class="openOption"></p>
            	<div class="calModalMiddle">
            		<div class="calMiddleside">
            			<p>일시</p>
            			<p>구분</p>
            			<p>장소</p>
            			<p>공개 여부</p>
            			<p>알람</p>
            			<p id="calModalmemoTitle">메모</p>
            		</div>
            		<div class="calMiddleMain">
            			<p class="cal-date">일시</p>
            			<p class="cal-section">구분</p>
            			<p class="cal-place">정보가 존재하지 않습니다.</p>
            			<p class="cal-openOption">공개여부</p>
            			<p class="cal-alarm">없음</p>
            			<p><textarea rows="18" cols="50" class="cal-memo" readonly>메모</textarea></p>
            		</div>
            	</div>
            </div>
            <div class="modal_footer calenderModal_Footer">
                <button class="delete_btn commonButton1" type="button">삭제하기</button>
                <button class="update_btn commonButton1" type="button">수정하기</button>
                <button class="cal-cancel_btn commonButton1" type="button">목록으로</button>
            </div>
        </div>
    </div>
	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
  	<script>
  		$(".calenderModal_Footer .cal-cancel_btn").click(function() {
  			$(".calenderModal_BigDiv").css("display","none");
		})
  	</script>
</body>
</html>