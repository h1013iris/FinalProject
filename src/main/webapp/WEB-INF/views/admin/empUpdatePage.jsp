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

    .emp_detail_container select {
        width: 171px;
        height: 25px;
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
            <form class="emp_detail_label" method="post" action="updateEmployee">
                <div class="emp_content_box">
                    <span class="emp_no emp_title">사원번호</span>
                    <span class="emp_no"><input type="text" name="empNo" value=${ emp.empNo } readonly></span>
                </div>
                <div class="emp_content_box">
                    <span class="emp_name emp_title">이름</span>
                    <span class="emp_name"><input id="empName" type="text" name="empName" value=${ emp.empName } maxlength="20" oninput="this.value = this.value.replace(/[0-9.^\s^!@#$%^&*_+{}|;'?><,.(\..*)\.]+$/g ,'');"></span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_city_no emp_title">주민등록번호</span>
                    <span class="emp_city_no"><input type="text" name="cityNo" value=${ emp.cityNo } maxlength="13" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_email emp_title">이메일</span>
                    <span class="emp_email"><input type="text" name="email" value=${ emp.email } maxlength="30"></span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_phone emp_title">전화번호</span>
                    <span class="emp_phone"><input type="text" name="phone" value=${ emp.phone } maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_address emp_title">주소</span>
                    <span class="emp_address"><input type="text" name="address" value=${ emp.address }></span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_hire_date emp_title">입사일</span>
                    <span class="emp_hire_date">${ emp.hireDate }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_job_no emp_title">직위</span>
	                <select name="jobNo" id="job_name">
	                	<c:forEach items="${ jobList }" var="j">
		                    <c:choose>
		                        <c:when test="${ j.jobNo eq emp.jobNo }">
				                    <option value="${ j.jobNo }" selected>${ j.jobName }</option>              	                            	
                            	</c:when>
                            	<c:otherwise>
				                    <option value="${ j.jobNo }">${ j.jobName }</option>              	                            	
                            	</c:otherwise>
                           	</c:choose>     	
	                	</c:forEach>
	                </select>
                </div>
                <div class="emp_content_box">
                    <span class="emp_dept_no emp_title">부서</span>
                    <select name="deptNo" id="dept">
	                	<c:forEach items="${ deptList }" var="d">
                            <c:choose>
                            	<c:when test="${ d.deptNo eq emp.deptNo }">
				                    <option value="${ d.deptNo }" selected>${ d.deptTitle }</option>              	                            	
                            	</c:when>
                            	<c:otherwise>
				                    <option value="${ d.deptNo }">${ d.deptTitle }</option>              	                            	
                            	</c:otherwise>
                            </c:choose>
	                	</c:forEach>
	                </select>
                </div>
                <div class="page_back">
                    <button type="submit" class="commonButton1">저장</button>
                    <button type="button" onclick="history.back()" class="commonButton1 detail_back_btn">되돌아 가기</button>
                </div>
            </form>
        </div>
    </div> 
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin.js"></script>
    <script>
        $(function(){
            $(".page_title .title_name").text("사원상세")

        })
    </script>
</body>
</html>
