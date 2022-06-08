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
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/authorityManagementPage.css">
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
                            <div class="emp_profile_img"><img src="" alt="">ㅁㄴ</div>
                            <div class="emp_name_box"><span class="emp_name">${ e.empName }</span></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="emp_search">
                <div class="list_title">
                    <span>사원 검색</span>
                </div>
                <div class="search_input_box">
                    <input id="searchText" type="text" placeholder="검색">
                </div>
                <div class="list_container">
                    <c:forEach items="${ empList }" var="e">
                        <div class="emp_list_content">
                            <input type="hidden" value=${ e.empNo }>
                            <div class="emp_profile_img"><img src="" alt="">ㅁㄴ</div>
                            <div class="emp_name_box"><span class="emp_name">${ e.empName }</span></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="authority_container">
                <div class="list_title">
                    <span>권한 검색, 부여</span>
                </div>
                <div class="search_input_box">
                    <input type="text" id="authority_search">
                </div>
                <div id="authority_list">
                    <c:forEach items="${ authorityList }" var="a">
                        <div class="authoritys">
                            <span class="authority_name">${ a.authorityName }</span>
                            <div class="add_authority_btn btn_position"></div>
                        </div>
                    </c:forEach>
                </div>
                <div id="add_authority_list"></div>
                <button id="authority_all_insert_btn" type="button">권한부여</button>
            </div>
        </div>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin.js"></script>
</body>
</html>