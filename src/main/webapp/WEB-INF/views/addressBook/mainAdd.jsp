<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록메인</title>

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
    #listAdd{
    border: 1px solid;  
    }
    #listAdd td{
     border: 1px solid; padding:10px 5px;
    }
    #listAdd th{
     border: 1px solid; padding:10px 5px;
    }
    
    .a{
        width: 200px;
        display: inline-block;
       	background-color: aqua;
        margin: 2px;
        height: 30px;
        text-align: center;
    }
    
        #search{
        width: 20px;
        height: 20px;
        }
       #a{
       border-style:solid 1px; 
       }

</style>

<body>


<jsp:include page="../common/header.jsp"></jsp:include>
<div class="main_section">
<div id="container">
 <div id="container">
        <div id="main">
            <form action="allAddSearch.do" method="post">
            <div id="searchDiv"><img id="search" src="" alt="검색모양아이콘">
                <input type="text" name="search">
                <input type="submit" value="검색"></div>
            </form>
        </div>
    </div>
    <div id="deptTitle">
<!-- 클릭하면 부서별 페이지로 이동 각 부서만 뜨게 -->
<!-- 관리자가 입력한 부서명대로 생성됨 부서번호순서로  -->
<form action="addressMain.do" method="get" class="a">
<div>
<input type="submit" value="전체주소록" name="departmentTitle" class="a">
</div>
</form>
<c:forEach items="${deptTitleList}" var="dept">
<form action="deptAddList" method="get" class="a">
	<div >
	<input type="submit" value="${dept.departmentTitle}" name="departmentTitle">
	</div>
</form>
</c:forEach>

</div>


<!--전체 주소록 내용이 표시될곳-->
<div id="addcon">
<table id="listAdd">
	<tr>
		<th>이름</th>
		<th>부서명</th>
		<th>직급</th>
		<th>이메일</th>
		<th>휴대폰</th>
	</tr>
	<c:forEach items="${allAddList}" var="allAdd" >
	<tr>
	<td>${allAdd.empName}</td>
	<td>${allAdd.departmentTitle}</td>
	<td>${allAdd.jobName}</td>
	<td>${allAdd.email}</td>
	<td>${allAdd.phone}</td>
	</tr>
	</c:forEach>
</table>
    </div>
</div>
</div> 
</body>
</html>
