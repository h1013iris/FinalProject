<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ page import = "java.util.Date" %>
	<c:set var="sysdate"><fmt:formatDate value="<%= new Date(new Date().getTime()) %>" pattern="yyyy-MM-dd" /></c:set>
    <c:set var="tomorrow"><fmt:formatDate value="<%= new Date(new Date().getTime() + 60*60*24*1000) %>" pattern="yyyy-MM-dd" /></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/mypage/ToDoList.css">
</head>
<body>
	<jsp:include page="./insertToDoListModal.jsp"></jsp:include>
	<jsp:include page="./detailToDoListModal.jsp"></jsp:include>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div id="todoList_main_section">
            <div id="total_percent_box">
                <div id="gauge_bar"></div>
                <span id="percentaige">0%</span>
            </div>
            <div id="todoListSearch">
                <span>검색</span>
                <input type="date" id="searchDate">
            </div>
            <div>
                <button id="todoInsert" type="button">할 일 추가</button>
            </div>
            <div id="todayList_box">
                <p>오늘 할 일</p>
                <div id="todayLists">
                	<c:forEach items="${ list }" var="a">
                		<c:if test="${ a.todoDate == sysdate }">
		                    <div class="todayList">
                                <input class="thisListNo" type="hidden" value="${a.listNo}">
                                <c:if test="${ a.percent == '100'}">
                                    <input type="checkbox" class="checkboxInput" checked>
                                </c:if>
                                <c:if test="${ a.percent != '100'}">
                                    <input type="checkbox" class="checkboxInput">	                    		
                                </c:if>
                                <c:if test="${ a.percent == '100'}">
                                    <span class="todoTitle" style="text-decoration:line-through;">${ a.content }</span>
                                </c:if>
                                <c:if test="${ a.percent != '100'}">
                                    <span class="todoTitle">${ a.content }</span>	                    		
                                </c:if>
		                        <span class="work_time">${ a.time }</span>
                                <c:if test="${ a.percent != '0'}">
                                    <input type="text" placeholder="0" class="percent_text" maxlength="3" value=${ a.percent }>%
                                </c:if>
                                <c:if test="${ a.percent == '0'}">
                                    <input type="text" placeholder="0" class="percent_text" maxlength="3">%
                                </c:if>
		                    </div>
	                    </c:if>
                	</c:forEach>
                </div>
            </div>
            <div id="selectDayList_box" class="removeClass">
                <p>내일 할 일</p>
                <c:forEach items="${ list }" var="a">
	                <c:if test="${ a.todoDate == tomorrow }">
		                <div id="todayLists">
		                    <div class="todayList">
                                <input class="thisListNo" type="hidden" value="${a.listNo}">
		                        <span class="todoTitle">${ a.content }</span>
		                        <span class="work_time">${ a.time }</span>
		                    </div>
		                </div>
	                </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
    <div id="htmlBox" style="display:none;">
        <p></p>
        <div id="todayLists">
            <div class="todayList">
                <input class="thisListNo daythisListNo" type="hidden">
                <span class="todoTitle day_todoTitle"></span>
                <span class="work_time day_work_time"></span>
            </div>
        </div>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/mypage/mypage.js"></script>
</body>
</html>