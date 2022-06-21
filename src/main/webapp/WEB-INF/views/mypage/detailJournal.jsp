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
                    <input id="journalNO" type="hidden" name="journalNo" value="${ journal.journalNo }">
                    <div class="title_content"><span id="writer_name">작성자</span></div>
                    <div class="title_content writer_box">${ loginUser.empName }</div>
                    <div class="title_content"><span id="created_date">작성일</span></div>
                    <div class="title_content cDate_box">${ journal.createDate }</div>
                </div>
                <p id="main_content_title">금일 업무 내용</p>
                <div id="main_content">
                    <div id="main_journal">
                        <div id="main_journal_title"><span>업무내용</span></div>
                        <textarea id="main_journal_content" name="content" readonly="readonly">${ journal.content }</textarea>
                    </div>
                    <div id="side_note">
                        <div id="side_note_title"><span>비고</span></div>
                        <textarea id="side_note_content" name="sideNote" readonly="readonly">${ journal.sideNote }</textarea>
                    </div>
                    <div id="uniqueness">
                        <div id="uniqueness_title"><span>특이사항 / 건의사항</span></div>
                        <textarea id="uniqueness_content" name="uniqueness" readonly="readonly">${ journal.uniqueness }</textarea>
                    </div>
                </div>
            </div>
            <button type="button" id="journal_update_btn" class="commonButton1">수정</button>
            <button type="button" id="journal_delete_btn" class="commonButton1">삭제</button>
        </form>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/mypage/mypage.js"></script>
    <script>
        $(function(){
            $(".page_title .title_name").text("업무일지상세")
        })
    </script>
</body>
</html>