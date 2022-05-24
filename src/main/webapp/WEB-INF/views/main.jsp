<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/메인페이지</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/login.css">

</head>
<body>
    <div id="container">
        <img src="resources/images/loginComLogo.png" alt="회사로고" id="logo"><br>
            
        <div id="con">
          <form action="loginMember.do" method="post">
           <input type="text" class="inf"  name="userId" required placeholder="UserId"><br>
            <input type="password" class="inf" name="userPw" required placeholder="Password"><br> 
            <input type="submit" id="stn" value="로그인">
          </form>
            <br>
            <a href="#">아이디/비밀번호 찾기</a>&nbsp;&nbsp;
            <a href="empNo.do">회원가입</a>
        </div>
    </div>
</html>