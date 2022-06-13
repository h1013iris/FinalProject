<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="modal_background" class="insertToDoListModal">
        <div id="modal_container" class="size500">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">ToDoList 추가</span>
            </div>
            <div class="modal_body">
                <div id="date_box">
                    <div id="work_date">
                        <input name="todoDate" type="date" id="date">
                    </div>
                    <div id="work_time">
                        <input name="time" type="time" id="time">
                    </div>
                </div>
                <div id="main_content_box">
                    <textarea name="content" id="content"></textarea>
                </div>
            </div>
            <div class="modal_footer">
                <button id="todolist_insert_btn" class="next_btn" type="button">저장</button>
                <button class="cancel_btn" type="button">취소</button>
            </div>
        </div>
    </div>
</body>
</html>