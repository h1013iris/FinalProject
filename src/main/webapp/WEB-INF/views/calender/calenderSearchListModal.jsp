<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
</head>
<body>
    <div id="modal_background" class="calenderSearchListModal">
        <div id="modal_container" class="size800 calenderSearchList_container">
            <div class="modal_header calenderSearchList_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title calenderSearchList_title">일시</span>
            </div>
            <div class="modal_body calenderSearchList_body">
            </div>
            <div class="modal_footer calenderSearchList_footer">
                <button class="commonButton1 backCalender-button" type="button">뒤로가기</button>
            </div>
        </div>
    </div>
</body>
</html>