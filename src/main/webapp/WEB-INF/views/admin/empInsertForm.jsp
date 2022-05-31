<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        
        .input_box div{
            height: 30px;
            margin: 15px 0;
        }

        .insert_container select{
            width: 180px;
            height: 25px;
        }

        .insert_container input{
            height: 25px;
            width: 170px;
        }

        span {
            display: inline-block;
            width: 200px;
            text-align: center;
            font-size: 18px;
        }

        .input_box{
            text-align: center;
            width: 75vw;
        }

        .btn_box {
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
	    <div class="insert_container">
	        <form class="input_box" method="post" action="insertEmp">
	            <div>
	                <span>이름</span>
	                <input type="text" id="emp_name" name="empName">
	            </div>
	            <div>
	                <span>부서</span>
	                <select name="deptNo" id="dept">
	                	<c:forEach items="${ deptList }" var="d">
		                    <option value="${ d.departmentNo }">${ d.departmentTitle }</option>              	
	                	</c:forEach>
	                </select>
	            </div>
	            <div>
	                <span>직위</span>
	                <select name="jobNo" id="job_name">
	                	<c:forEach items="${ jobList }" var="j">
		                    <option value="${ j.jobNo }">${ j.jobName }</option>            	
	                	</c:forEach>
	                </select>
	            </div>
	            <div>
	                <span>연락처</span>
	                <input type="text" id="phone" name="phone">
	            </div>
	            <div>
	                <span>이메일</span>
	                <input type="text" id="email" name="email">
	            </div>
	            <div>
	                <span>입사일</span>
	                <input type="date" id="hire_date" name="hireDate">
	            </div>
	            <div>
	                <span>주민등록번호</span>
	                <input type="text" id="city_no" name="cityNo">
	            </div>
				<div class="btn_box">
					<button type="submit">저장</button>
				</div>
	        </form>
	    </div>
	</div>
	<script type="text/javascript">
		$(".btn_box button").click(function(){
			$("city_no").val(Number($("#city_no").val()));
		})
	</script>
</body>
</html>