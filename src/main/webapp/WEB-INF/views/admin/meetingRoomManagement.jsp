<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/meetingRoomManagement.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="./meetingRoomModal.jsp"></jsp:include>
	<div class="main_section">
        <div class="content_container">
            <div class="content_box banW">
                <div class="meetingroom_management_article">
                    <c:forEach items="${ list }" var="a">
                    	<div class="meetingroom_box">
                            <div class="toggle_btn"></div>
                            <span class="large_meetingroom">${ a.LRoomName }</span>
                            <div class=" bm_btn small_insert_btn">
                                <input type="hidden" value= ${ a.roomNoLarge } >
                            </div>
                            <div class="delete_btn bm_btn large_delete_btn">
                                <input type="hidden" value= ${ a.roomNoLarge } >
                            </div>
                        </div>
                        <div id="smallContentBox"></div>
                    </c:forEach>
                </div>
                <div class="insert_btn bm_btn large_insert_btn"></div>
            </div>
        </div>  
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin.js"></script>
    <script>
        $(function(){
            $(".page_title .title_name").text("회의실관리")
        })
    </script>
</body>
</html>