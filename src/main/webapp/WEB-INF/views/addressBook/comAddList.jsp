<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 주소록 리스트조회</title>


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
    #left{
    width:30%
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
  

<!--거래처 주소록 폴더들 표시될곳-->

<div id="left">
<!-- 거래처 주소록 메인으로 이동 -->
</div>
<jsp:include page="../addressBook/comAddTitle.jsp"></jsp:include>
<!--고객 주소록 내용이 표시될곳-->
<div id="addcon">
<table>
	<tr>
		<th>회사명</th>
		<th>휴대폰</th>
		<th>이메일</th>
		<th>기타</th>
	</tr>
	
	<c:forEach items="${comList}" var="com" >
	<tr>
	<td><a href="comDetailView.do?compNo=${com.compNo}">${com.comNm}</a></td>
	<td>${com.comPhone}</td>
	<td>${com.comEmail}</td>
	<td>${com.comMemo}</td>
	</tr>
	</c:forEach>
</table>
<form action="comAddWriter.do" method="post">
<input type="submit" value="거래처등록">
</form>
    </div>
    </div>
</div>
</body>
</html>
