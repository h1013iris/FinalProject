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


  cursor:pointer;
 width: 150px;
 cursor:pointer;
 background-color: rgb(223, 238, 255);
 border-color: #fff;
 height: 50px;
  margin-top:10px;
margin-bottom: 10px;
padding: 5px 10px;
margin-right: 50px;
font-size: 15px;
 }
 
 
 .comF{
 background-color: rgb(223, 238, 255);
 width: 130px;
 height:40px;
 line-height: 40px;
 margin-bottom: 10px;
 cursor:pointer;
 border-color: #fff;
 margin-right: 50px;
 }
 .comFA:hover{
  background-color:#73c5ff;
  color: #fff;
 }
  .comF:hover{
  background-color: #73c5ff;
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
