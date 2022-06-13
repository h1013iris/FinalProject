<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/mypage/journalList.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div id="journal_list_container">
            <div id="search_container">
                <input type="date" class="search_input" id="search_input_from">
                ~
                <input type="date" class="search_input" id="search_input_to">
            </div>
            <div id="sort_container">
                <span id="sort_desc" class="sort_btn">
                    <input type="hidden" value="1">
                    최신순
                </span>
                /
                <span id="sort_sec" class="sort_btn">
                    <input type="hidden" value="2">
                    오래된순
                </span>
            </div>
            <div id="list_container">
            	<c:forEach items="${ list }" var="a">
	                <div class="journal_list_box">
                        <input type="hidden" value="${ a.journalNo }">
	                    <span class="create_date">${ a.createDate }</span>
	                </div>            	
            	</c:forEach>
            </div>
        </div>
    </div>
    <div id="htmldrow">
        <div class="journal_list_box">
            <input class="journalNoInput" type="hidden">
            <span class="create_date"></span>
        </div> 
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/mypage/mypage.js"></script>
</body>
</html>