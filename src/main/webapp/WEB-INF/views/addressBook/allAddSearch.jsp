<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>전체주소록 검색하기</title>
</head>
<style>
    #search{
        width: 20px;
        height: 20px;
    }
    
</style>
<body>
    <div id="container" method="post">
        <div id="main">
            <form action="allAddSearch.do">
            <div id="searchDiv"><img id="search" src="돋보기 모양.png" alt="검색모양아이콘">
                <input type="text" name="search" src="돋보기 모양.png">
                <input type="submit" value="검색"></div>
            </form>
        </div>
    </div>
</body>
</html>
