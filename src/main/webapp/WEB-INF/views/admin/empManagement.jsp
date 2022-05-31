<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="list_sort">
                    <span class="job_level">직위순</span>
                    /
                    <span class="insert_level">등록순</span>
                </div>
                <div class="list_container">
                    <div class="emp_list_content">
                        <div class="emp_profile_img"><img src="" alt="">ㅁㄴ</div>
                        <div class="emp_name_box"><span class="emp_name">sss 사원</span></div>
                    </div>
                </div>
            </div>
            <div class="emp_search">
                <div class="list_title">
                    <span>사원 검색</span>
                </div>
                <div class="list_sort">
                    <span class="job_level">직위순</span>
                    /
                    <span class="insert_level">등록순</span>
                </div>
                <div class="search_input_box">
                    <input type="text" placeholder="검색">
                </div>
                <div class="list_container">
                    <div class="emp_list_content">
                        <div class="emp_profile_img"><img src="" alt="">asd</div>
                        <div class="emp_name_box"><span class="emp_name">asd</span></div>
                    </div>
                </div>
            </div>
            <div class="emp_insert">
                <button type="button" class="insert_btn">사원추가</button>
            </div>
        </div>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin.js"></script>
</body>
</html>