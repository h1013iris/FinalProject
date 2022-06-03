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
 
</style>

<!-- 버튼이 계속 사라진다ㅜㅜㅜㅜ -->
<body>
<div id = "leftTitle">
<form action="comAdd.do" method="get">
<span><input type="submit" value="전체조회"></span><br>
</form>
<form action="selectSearchComFolList" method="post">
<c:forEach items="${comFolList}" var="comF">
<span class="comF" ><input type="submit" name= "inFolder" value="${comF.inFolder}"></span><br>
</c:forEach>
</form>
</div>
</body>
</html>
