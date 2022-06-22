<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 주소록 리스트조회</title>
<style>
 #leftTitle{
 float: left;}
 
  .cusFA{
 background-color: #d3edff;
 width: 130px;
 height:30px;
 border-radius:10px;
 margin-bottom: 5px;
 cursor:pointer;
 border-color: #fff;
 }
 
 
 .cusF{
 background-color: #d3edff;
 width: 110px;
 height:30px;
 border-radius:10px;
 margin-bottom: 5px;
 cursor:pointer;
 border-color: #fff;
 }
  .cusFA:hover{
  background-color: #407ca7;
  color: #fff;
 }
  .cusF:hover{
  background-color: #407ca7;
  color: #fff;
 }
 
</style>

<!-- 전체주소록 조회 + 폴더 조회 하나로 컨트롤러에서 가져오기? -->
<body>
<div id = "leftTitle">
<form action="custoAdd.do" method="get">
<input type="submit" value="전체조회" class="cusFA"><br>
</form>

<form action="selectSearchCustoFolList" method="post">
<c:forEach items="${cusFolList}" var="cusF">
<input type="submit" name= "inFolder" value="${cusF.inFolder}" class="cusF"><br>
</c:forEach>
</form>
</div> 

</body>
</html>
