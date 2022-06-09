<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/deptManagementPage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
	    <div id="organization_chart_section">
	        <div id="organization_chart">
	            <div id="organization_chart_title_box"><span>조직도</span></div>
	            <div id="dept_insert_box">
	                <span>부서추가</span>
	                <input id="insert_dept_input" type="text" placeholder="추가할 부서명 입력">
	            </div>
	            <div id="dept_list_box">
	                <p id="company_name">LATTE</p>
					<c:forEach items="${ deptList }" var="dept">
		                <p class="dept_name">${ dept.deptTitle }</p>
	                	<div class="agency_member_list_box">
	                		<c:forEach items="${ empList }" var="emp">
	                			<c:if test="${ emp.deptName eq dept.deptTitle }">
									<p class="member_name">${ emp.empName }</p>                		
	                			</c:if>
	                		</c:forEach>
						</div>
					</c:forEach>
	            </div>
	        </div>
	        <div id="dept_controll_box">
	            <div id="dept_controll_box_title"><span>부서명</span></div>
	            <div id="dept_controll_nav">
	                <span id="dept_info_nav">부서정보</span>
	                <span id="dept_member_nav">부서원 목록</span>
					<button type="button" id="deleteDept">부서삭제</button>
	            </div>
	            <div id="dept_info_box">
	                <div>
	                    <span id="dept_name_title">부서명</span>
	                    <span id="dept_name">부서명</span>
	                </div>
	                <div>
	                    <span id="dept_code_title">부서코드</span>
	                    <span id="dept_code">부서코드</span>
	                </div>
	                <div>
	                    <span id="dept_responsible_title">책임자</span>
	                    <span id="dept_responsible">책임자명</span>
						<select name="responsible" id="responsibleUpdate">
							<option value=""></option>
						</select>
	                </div>
	                <div>
	                    <span id="dept_create_date_title">생성일</span>
	                    <span id="dept_create_date">생성일</span>
	                </div>
	            </div>
	            <div id="member_list_box">
	            </div>
	        </div>
	    </div>
    </div>

	<div id="example">
		<div class="member_lists">
			<input type="hidden" class="thisEmpNo">
			<span class="dept_profile_img_box">이미지<img src="" alt=""></span>
			<span class="dept_member_name">OOO</span>
		</div>
	</div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin.js"></script>
</body>
</html>