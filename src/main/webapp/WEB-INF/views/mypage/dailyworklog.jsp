<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/mypage/dailyworklog.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="main_section">
        <form action="journalInsert" method="post">
            <div id="main_journal_container">
                <div id="main_title_container">
                    <input type="hidden" name="empNo" value="${ loginUser.empNo }">
                    <div class="title_content"><span id="writer_name">작성자</span></div>
                    <div class="title_content writer_box"><input type="text" id="writer" class="input_box" value="${ loginUser.empName }" readonly></div>
                    <div class="title_content"><span id="created_date">작성일</span></div>
                    <div class="title_content cDate_box"><input type="text" id="date" class="input_box" readonly></div>
                </div>
                <p id="main_content_title">금일 업무 내용</p>
                <div id="main_content">
                    <div id="main_journal">
                        <div id="main_journal_title"><span>업무내용</span></div>
                        <textarea id="main_journal_content" name="content"></textarea>
                    </div>
                    <div id="side_note">
                        <div id="side_note_title"><span>비고</span></div>
                        <textarea id="side_note_content" name="sideNote"></textarea>
                    </div>
                    <div id="uniqueness">
                        <div id="uniqueness_title"><span>특이사항 / 건의사항</span></div>
                        <textarea id="uniqueness_content" name="uniqueness"></textarea>
                    </div>
                </div>
            </div>
            <button type="submit" id="journal_insert_btn">저장</button>
        </form>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/mypage/mypage.js"></script>
</body>
</html>