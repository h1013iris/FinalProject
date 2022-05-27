<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별주소록</title>

<style>
    
    #container{
        text-align: center;
    }
    #contain{
      margin:0;
        width: 1000px;
    }
    td, th{
        border : 1px solid black;
        width: 300px;
    }
    table{
        margin: 0;
        text-align: center;

    }
    .a{
        width: 200px;
        display: inline-block;
       	background-color: aqua;
        margin: 2px;
        height: 30px;
        text-align: center;
    }

</style>
<body>

<div id="container">
    <div id="deptTitle">
<!--전체 주소록 내용이 표시될곳-->
<div id="addcon">
<table>
	<tr>
		<th>이름</th>
		<th>직급</th>
		<th>부서명</th>
		<th>이메일</th>
		<th>휴대폰</th>
	</tr>
	<c:forEach items="${deptList}" var="deptAdd" >
	<tr>
	<td>${deptAdd.empName}</td>
	<td>${deptAdd.departmentTitle}</td>
	<td>${deptAdd.jobName}</td>
	<td>${deptAdd.email}</td>
	<td>${deptAdd.phone}</td>
	</tr>
	</c:forEach>
</table>
    </div>
</div>
</div>


</body>
</html>
