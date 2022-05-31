<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체주소록 검색결과</title>
</head>
<style>
    #search{
        width: 20px;
        height: 20px;
    }
</style>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="main_section">
    <div id="container">
        <div id="main">
            <form action="allAddSearch">
            <div id="searchDiv"><img id="search" src="" alt="검색모양아이콘">
                <input type="text" name="search">
                <input type="submit" value="검색"></div>
            </form>
        </div>
        </div>
    </div>
</body>
</html>