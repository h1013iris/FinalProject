<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/calender/calenderModal.css">
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
            	<input type="hidden" class="calhidden-writerNo"/>
            	<input type="hidden" class="calhidden-realwriter"/>
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
            			<p class="cal-date">읽어오기 실패하였습니다. 관리자에게 문의하세요.</p>
            			<input type="hidden" class="hidden-startDate"/>
            			<input type="hidden" class="hidden-endDate"/>
            			<p class="cal-section">구분</p>
            			<p class="cal-place">정보가 존재 하지 않습니다.</p>
            			<p class="cal-openOption">공개여부</p>
            			<p class="cal-alarm">정보가 존재 하지 않습니다.</p>
            			<p><textarea rows="18" cols="50" class="cal-memo" placeholder="메모가 존재하지 않습니다." readonly></textarea></p>
            		</div>
            	</div>
            </div>
            <div class="modal_footer calenderModal_Footer">
                <button class="delete_btn commonButton1" type="button" style="display:none;">삭제하기</button>
                <button class="cal-update_btn commonButton1" type="button" style="display:none;">수정하기</button>
                <button class="cal-cancel_btn commonButton1" type="button">목록으로</button>
            </div>
        </div>
    </div>
	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
  	<script>
  		$(document).on('DOMSubtreeModified', ".calhidden-realwriter", function() {
  			let loginUser = '${ loginUser.empNo }';
  	  		let realWriter = $(".calhidden-realwriter").val()
  			
  	  		if(loginUser == realWriter){
  	  			$(".calenderModal_Footer .delete_btn").css("display","inline")
  	  			$(".calenderModal_Footer .cal-update_btn").css("display","inline")
  	  		}
		})
  		
  		$(".calenderModal_Footer .cal-cancel_btn").click(function() {
  			$(".calenderModal_BigDiv").css("display","none");
		})
		$(".calenderModal_Footer .cal-update_btn").click(function() {
			let startDate = $(".hidden-startDate").val()
			let endDate = $(".hidden-endDate").val()
			let realWriter = $('.calhidden-writerNo').val()
  			location.href = "updatedCalenderEnrollForm.do?startDate="+startDate+"&endDate="+endDate+"&realWriter="+realWriter;
		})
  	</script>
</body>
</html>