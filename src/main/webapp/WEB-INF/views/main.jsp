<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/메인페이지</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/login.css">
</head>
<style>
.commonButton1{
     padding: 0;
     font-weight: 600;
     text-align: center;
     line-height: 50px;
     color: #FFF;
     border-radius: 5px;
     transition: all 0.2s ;
     background: #85cdff;
     border: #85cdff;
     box-shadow: 0px 5px 0px 0px #4c87b099;
 }
.commonButton1:hover{
    position: relative;
    top: 5px;
    bottom: 5px;
    box-shadow: 0px 0px 0px 0px #4c87b099;
}
</style>
<body>

    <div id="container">
        <img src="resources/images/loginComLogo.png" alt="회사로고" id="logo"><br>
            
        <div id="con">
          <form action="loginMember.do" method="post">
           <input type="text" class="inf"  name="userId" required placeholder="UserId"><br>
            <input type="password" class="inf" name="userPw" required placeholder="Password"><br> 
            <input type="submit" id="stn" class="commonButton1" value="로그인">
          </form>
            <br>
            <a href="findIdPw.do">아이디/비밀번호 찾기</a>&nbsp;&nbsp;
            <a href="empNo.do">회원가입</a>
        </div> 
        </div>
        <script type="text/javascript"> 
        var msg = '${msg}';
		if(msg)
		{
			alert(msg);
		}
	</script>
</body>
</html>