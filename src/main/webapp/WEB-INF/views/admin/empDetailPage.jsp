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
        margin: 80px auto;
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
                    <span class="emp_no">${ emp.empNo }</span>
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
                <div class="emp_content_box">
                    <span class="emp_car_status emp_title">차량 유무</span>
                    <span class="emp_car_status">${ emp.carStatus }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_career emp_title">경력</span>
                    <c:if test="${ emp.career ne null} ">
                    	<span class="emp_career">${ emp.career }</span>
                    </c:if>
                    <c:if test="${ emp.career eq null}">
                    	<span class="emp_career">정보없음</span>
                    </c:if>

                </div>
                <div class="emp_content_box">
                    <span class="emp_awards emp_title">수상경력</span>
                    <c:if test="${ emp.awards ne null}">
                    	<span class="emp_awards">${ emp.awards }</span>
                    </c:if>
					<c:if test="${ emp.awards eq null}">
						<span class="emp_awards">정보없음</span>
					</c:if>
                </div>
                <div class="emp_content_box">
                    <span class="emp_bank_name emp_title">거래은행</span>
                    <c:if test="${ emp.bankName ne null}">
                    	<span class="emp_bank_name">${ emp.bankName }</span>
                    </c:if>
					<c:if test="${ emp.bankName eq null}">
						<span class="emp_bank_name">정보없음</span>
					</c:if>
                </div>
                <div class="emp_content_box">
                    <span class="emp_bank_no emp_title">계좌번호</span>
                    <c:if test="${ emp.bankNo ne null}">
                    	<span class="emp_bank_no">${ emp.bankNo }</span>
                    </c:if>
					<c:if test="${ emp.bankNo eq null}">
						<span class="emp_bank_no">정보없음</span>
					</c:if>
                </div>
                <div class="emp_content_box">
                    <span class="emp_holder_name emp_title">계좌주</span>
                    <c:if test="${ emp.holderName ne null}">
                    	<span class="emp_holder_name">${ emp.holderName }</span>
                    </c:if>
					<c:if test="${ emp.holderName eq null}">
						<span class="emp_holder_name">정보없음</span>
					</c:if>
                </div>
                <div class="emp_content_box">
                    <span class="emp_home_status emp_title">자택 유무</span>
                    <c:if test="${ emp.homeStatus ne null}">
                    	<span class="emp_home_status">${ emp.homeStatus }</span>
                    </c:if>
					<c:if test="${ emp.homeStatus eq null}">
						<span class="emp_home_status">정보없음</span>
					</c:if>
                </div>
                <div class="emp_content_box">
                    <span class="emp_marriage emp_title">결혼 유무</span>
                    <c:if test="${ emp.marriage ne null}">
                    	<span class="emp_marriage">${ emp.marriage }</span>
                    </c:if>
					<c:if test="${ emp.marriage eq null}">
						<span class="emp_marriage">정보없음</span>
					</c:if>
                </div>
                <div class="emp_content_box">
                    <span class="emp_children_count emp_title">자녀수</span>
                    <span class="emp_children_count">${ emp.childrenCount }</span>

                </div>
                <div class="emp_content_box">
                    <span class="emp_last_educational emp_title">최종학력</span>
                    <c:if test="${ emp.lastEducational ne null}">
                    	<span class="emp_last_educational">${ emp.lastEducational }</span>
                    </c:if>
					<c:if test="${ emp.lastEducational eq null}">
						<span class="emp_last_educational">정보없음</span>
					</c:if>
                </div>
                <div class="page_back">
                    <button type="button" onclick="history.back()">되돌아 가기</button>
                </div>
            </div>
        </div>
    </div> 
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin.js"></script>
</body>
</html>