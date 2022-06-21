<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="modal_background" class="detailToDoListModal">
        <div id="modal_container" class="size500">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">ToDoList 상세</span>
            </div >
            <div class="modal_body">
                <input type="hidden" id="listNoInput">
                <div id="date_box">
                    <div id="work_date">
                        <input name="todoDate" type="date" id="date" readonly>
                    </div>
                    <div id="work_time">
                        <input name="time" type="time" id="time" readonly>
                    </div>
                </div>
                <div id="main_content_box">
                    <textarea name="content" id="content" readonly></textarea>
                </div>
            </div>
            <div class="modal_footer">
                <button id="addclass" class="next_btn update_btn commonButton1" type="button">수정</button>
                <button class="cancel_btn commonButton1" type="button">취소</button>
            </div>
        </div>
    </div>
</body>
</html>