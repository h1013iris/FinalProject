<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
<style type="text/css">
	.calenderSearchListModal .calenderSearchList_header{
		border-bottom: 1px solid;
		font-size: 30px;
	    padding-bottom: 10px;
	}
	.calenderSearchListModal .cal_document {
	    border-bottom: 1px solid;
	}
	.calenderSearchListModal .cal_document:hover {
	    background-color: #f5f5f5;
	}
	.calenderSearchListModal .cal-sList-top {
	    margin-bottom: 10px;
	    margin-top: 10px;
	}
	.calenderSearchListModal .cal-sList-title {
	    margin-right: 15px;
	    font-size: 18px;
	}
	.calenderSearchListModal .cal-sList-middle {
	    display: flex;
	    padding-bottom: 12px;
        font-size: 15px;
	}
	.calenderSearchListModal .cal-sList-input {
	    margin-left: 20px;
	}
	.calenderSearchListModal .backCalender-button {
	    width: 10%;
	}
	.calenderSearchListModal .cal-sList-open {
	    font-size: 15px;
	}
</style>
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