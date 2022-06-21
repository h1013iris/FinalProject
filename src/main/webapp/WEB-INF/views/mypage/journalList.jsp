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
    <script>
        $(function(){
            $(".page_title .title_name").text("업무일지관리")
            var timeOff = new Date().getTimezoneOffset()*60000;
            var now_utc = Date.now()
            let sysdate = new Date(now_utc-timeOff).toISOString().split("T")[0];

            $("#search_input_from").prop("max",sysdate);

            $("#search_input_from").change(function(){
                var date = $(this).val();
                $("#search_input_to").prop("min",date)
            })
        })


    </script>
</body>
</html>