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
 
 .comFA{
 background-color: #d3edff;
 width: 130px;
 height:30px;
 border-radius:10px;
 margin-bottom: 5px;
 cursor:pointer;
 border-color: #fff;
 }
 
 
 .comF{
 background-color: #d3edff;
 width: 110px;
 height:30px;
 border-radius:10px;
 margin-bottom: 5px;
 cursor:pointer;
 border-color: #fff;
 }
 .comFA:hover{
  background-color: #407ca7;
  color: #fff;
 }
  .comF:hover{
  background-color: #407ca7;
  color: #fff;
 }
</style>

<!-- 전체주소록 조회 + 폴더 조회 하나로 컨트롤러에서 가져오기? -->
<body>
<div id = "leftTitle">
<form action="comAdd.do" method="get">
<input type="submit" value="전체조회" class="comFA"><br>
</form>

<form action="selectSearchComFolList" method="post">
<c:forEach items="${comFolList}" var="comF">
<input type="submit" name= "inFolder" value="${comF.inFolder}" class="comF"><br>
</c:forEach>
</form>
</div> 

</body>
</html>
