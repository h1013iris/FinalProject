<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/BoardManagementPage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="content_container">
            <div class="content_box boardMAnage">
                <div class="board_management_article">
                    <c:forEach items="${ list }" var="a">
                    	<div class="board_box">
                            <span class="boardName">${ a.boardName }</span>
                            <c:if test="${ a.boardNo > 4}">
                                <div class="delete_btn bm_btn">
                                    <input type="hidden" value= ${ a.boardNo } >
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
                <div class="insert_btn bm_btn"></div>
            </div>
        </div>  
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin.js"></script>
    <script>
        $(function(){
            $(".page_title .title_name").text("게시판관리")
        })
    </script>
</body>
</html>