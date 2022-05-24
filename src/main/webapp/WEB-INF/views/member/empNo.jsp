<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사번입력</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/member/empNo.css" type="text/css">

<style>
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
     margin: 0;
}
</style>
</head>

<body>

    <div id="container"> 
    <div id = "empNo">
        <form action="updateNewMember.do" method="post">
               <img src="resources/images/loginComLogo.png" id="logo" alt="회사로고">
               <p>전달받은사번을 입력해주세요</p>
               <input type="number" name="empNo"placeholder="사번을 입력해주세요" class="input" ><br><br><br>
            <input type="submit" value="입력" class="btn">&nbsp;&nbsp;<input type="button" value="취소" class="btn">
        </form>
    </div>
</div>
</body>

</html>