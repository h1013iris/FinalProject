<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 주소록 리스트조회</title>


<body>
<jsp:include page="../common/header.jsp"></jsp:include>
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
<div class="main_section">
<div id="container">
    <div id="deptTitle">


<div id="container">


<!--고객 주소록 내용이 표시될곳-->
<div id="addcon">
<table>
	<tr>
		<th>회사명</th>
		<th>휴대폰</th>
		<th>이메일</th>
		<th>기타</th>
		
	</tr>
	<c:forEach items="${custoList}" var="cus" >
	<tr>
	<td>${cus.comNm}</td>
	<td>${cus.comPhone}</td>
	<td>${cus.comEmail}</td>
	<td>${cus.comMemo}</td>
	</tr>
	</c:forEach>
</table>
<form action="cusAddWriter.do" method="post">
<input type="submit" value="고객등록">
</form>
    </div>
    </div>
</div>
</div>
</div>
</body>
</html>
