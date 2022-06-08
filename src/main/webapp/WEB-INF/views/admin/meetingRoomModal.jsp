<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
    <div id="modal_background" class="meetingRoomModal">
        <div id="modal_container" class="size500">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">회의실 세팅</span>
            </div>
            <div id="modal_body">
                <input type="hidden" id="roomNoSmall">
                <div class="content_title_box">
                    <span class="room_name"></span>
                </div>
                <div class="content_body_box">
                    <div class="maxCount_box">
                        <span class="body_title">최대인원</span>
                        <input type='text' class='maxCountInput' placeholder='숫자만 입력' >
                    </div>
                    <div class="status_box">
                        <span class="body_title">사용가능상태</span>
                        <span class="meetingRoomStatus"></span>
                    </div>
                </div>
            </div>
            <div class="modal_footer">
                <button class="next_btn meetingroom_next_btn" type="button">확인</button>
            </div>
        </div>
    </div>
</body>
</html>