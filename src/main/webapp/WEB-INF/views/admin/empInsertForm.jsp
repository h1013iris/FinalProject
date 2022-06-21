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

        .insert_container span {
            display: inline-block;
            width: 200px;
            text-align: center;
            font-size: 18px;
        }

        .input_box{
            text-align: center;
        }

        .btn_box {
            text-align: center;
            margin-top: 50px !important;
        }

		.insert_container{
			width: 390px;
			/* text-align: center; */
			margin: 100px auto;
		}

		.emp_insert_commit_btn{
			width: 100px;
		}

		.emp_insert_back_btn{
			width: 100px;
		}

		#dept{
			height: 30px;
		}

		#job_name{
			height: 30px;
		}
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
	    <div class="insert_container">
	        <form id="insert_from" class="input_box">
	            <div>
	                <span>이름</span>
	                <input type="text" id="emp_name" name="empName" maxlength="20" oninput="this.value = this.value.replace(/[0-9.^\s^!@#$%^&*_+{}|;'?><,.(\..*)\.]+$/g ,'');">
	            </div>
	            <div>
	                <span>부서</span>
	                <select name="deptNo" id="dept">
	                	<c:forEach items="${ deptList }" var="d">
		                    <option value="${ d.deptNo }">${ d.deptTitle }</option>              	
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
	                <input type="text" id="phone" name="phone" maxlength="13" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	            </div>
	            <div>
	                <span>이메일</span>
	                <input type="text" id="email" name="email" maxlength="30">
	            </div>
	            <div>
	                <span>입사일</span>
	                <input type="date" id="hire_date" name="hireDate">
	            </div>
	            <div>
	                <span>주민등록번호</span>
	                <input type="text" id="city_no" name="cityNo" maxlength="13" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	            </div>
				<div class="btn_box">
					<button type="button" class="commonButton1 emp_insert_back_btn" onclick="history.back()">돌아가기</button>
					<button type="button" class="commonButton1 emp_insert_commit_btn">저장</button>
				</div>
	        </form>
	    </div>
	</div>
	<script>
		$(".btn_box .emp_insert_commit_btn").click(function(){
			var empName = $("#emp_name").val();
			var deptNo = $("#dept option:selected").val();
			var jobNo = $("#job_name option:selected").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var hireDate = $("#hire_date").val();
			var cityNo = $("#city_no").val();
			
			$.ajax({
				url:"insertEmp",
				data:{
					empName : empName,
					deptNo : deptNo,
					jobNo : jobNo,
					phone : phone,
					email : email,
					hireDate : hireDate,
					cityNo : cityNo
				},
				success : function(empNo){

				myConfirm("사원 추가 성공","이메일로 사원번호를 전송 하시겠습니까?",myConfirmColback(empName, email, empNo));
				}
			})
		})


        $(function(){
            $(".page_title .title_name").text("사원추가")
        })

	</script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/API/emailAPI.js"></script>
</body>
</html>