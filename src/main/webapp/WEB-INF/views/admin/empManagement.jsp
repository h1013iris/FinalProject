<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 페이지 css */
    .main_section{
        padding-top: 50px !important;
        overflow-y: hidden !important;
    }

    .emp_list_content {
        cursor: pointer;
    }

    .emp_list_content:hover{
        background-color: rgba(243, 243, 243, 0.4);
    }
</style>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/adminEmpManagementPage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div id="emp_management_container">
            <div class="emp_list">
                <div class="list_title">
                    <span>사원 목록</span>
                </div>
                <div class="list_container">
                    <c:forEach items="${ empList }" var="e">
                        <div class="emp_list_content">
                            <input type="hidden" value=${ e.empNo }>
                            <div class="emp_profile_img"><img src="${ pageContext.servletContext.contextPath }/resources/images/관리자 프로필.png" alt=""></div>
                            <span class="emp_name">${ e.empName } ${ e.jobName }</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="emp_search">
                <div class="list_title">
                    <span>사원 검색</span>
                    <input id="searchText" type="text" placeholder="검색">
                </div>
                <div class="list_container">
                    <c:forEach items="${ empList }" var="e">
                        <div class="emp_list_content">
                            <input type="hidden" value=${ e.empNo }>
                            <div class="emp_profile_img"><img src="${ pageContext.servletContext.contextPath }/resources/images/관리자 프로필.png" alt=""></div>
                            <span class="emp_name">${ e.empName } ${ e.jobName }</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="emp_insert">
                <button type="button" class="insert_btn commonButton2">사원추가</button>
            </div>
        </div>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin.js"></script>
    <script>
        $(function(){
            $(".page_title .title_name").text("사원관리")
        })
    </script>
</body>
</html>