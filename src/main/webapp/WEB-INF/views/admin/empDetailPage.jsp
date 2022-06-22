<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.emp_detail_container{
        width: 400px;
        margin: 15vh auto;
	}
	
    .emp_detail_label{
        position: absolute;
		left: 50%;
		transform: translateX(-50%);
        padding-bottom: 100px;
    }
    .emp_content_box {
        height: 50px;
    }
    .emp_content_box .emp_title{
        display: inline-block;
        width: 200px;
    }
    
    .page_back {
    	text-align: center;
    }
    
    .detail_back_btn{
        width: 100px;
    }

    .emp_detail_label .commonButton1{
        width: 100px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="emp_detail_container">
            <div class="emp_detail_label">
            	<div>
            		<img alt="" src="프로필 사진">
            	</div>
                <div class="emp_content_box">
                    <span class="emp_no emp_title">사원번호</span>
                    <span class="emp_no empNo">${ emp.empNo }</span>
                </div>
                <div class="emp_content_box">
                    <span class="emp_name emp_title">이름</span>
                    <span class="emp_name">${ emp.empName }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_city_no emp_title">주민등록번호</span>
                    <span class="emp_city_no">${ emp.cityNo }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_email emp_title">이메일</span>
                    <span class="emp_email">${ emp.email }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_phone emp_title">전화번호</span>
                    <span class="emp_phone">${ emp.phone }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_address emp_title">주소</span>
                    <span class="emp_address">${ emp.address }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_hire_date emp_title">입사일</span>
                    <span class="emp_hire_date">${ emp.hireDate }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_job_no emp_title">직위</span>
                    <span class="emp_job_no">${ emp.jobName }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_dept_no emp_title">부서</span>
                    <span class="emp_dept_no">${ emp.deptName }</span>

                </div>
                <div class="page_back">
                    <button type="button" id="emp_update_btn" class="commonButton1">수정</button>
                    <button type="button" onclick="history.back()" class="commonButton1 detail_back_btn">되돌아 가기</button>
                </div>
            </div>
        </div>
    </div> 
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin.js"></script>
    <script>
        $(function(){
            $(".page_title .title_name").text("사원상세")

            $("#emp_update_btn").click(function(){
                location.href = "empUpdatePage?empNo="+$(".empNo").text();
            })
        })
    </script>
</body>
</html>