<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사번입력</title>

<style>
* {
	margin: 0;
	padding: 0;
}

#container {
	height: 100vh;
	display: flex;
	align-items: center;
}

#logo {
	margin-top: 30px;
	width: 250px;
}

#empNo {
	width: 450px;
	height: 300px;
	margin: 0 auto;
	text-align: center;
	border: solid #85cdff 2px;
    border-radius: 10px;
}


.input {
	width: 250px;
	height: 30px;
	margin-top: 30px;
	text-align: center;
}
/*input type number에 (화살표 없애는 스타일)*/
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

/*팀에서 공동 선택한 버튼디자인*/
.commonButton1{
     padding: 0;
     font-weight: 600;
     text-align: center;
     line-height: 30px;
     color: #FFF;
     border-radius: 5px;
     transition: all 0.2s ;
     background: #85cdff;
     border: #85cdff;
     box-shadow: 0px 5px 0px 0px #4c87b099;
     width:50px;
 }
.commonButton1:hover{
    position: relative;
    top: 5px;
    bottom: 5px;
    box-shadow: 0px 0px 0px 0px #4c87b099;
}
</style>
</head>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">	
<body>
	<jsp:include page="../common/alert.jsp"/>
	<jsp:include page="../common/confirm.jsp"/>
	<div id="container">
		<div id="empNo">
			<form action="updateNewMember.do" method="post">
				<img src="resources/images/loginComLogo.png" id="logo" alt="회사로고"><br>
				<small>회원가입 인증을 위해 전달받은 사번을 입력해주세요</small>
				<br>
				<input type="number" name="empNo" placeholder="사번을 입력해주세요"
					class="input" required><br>
				<br>
				<input type="submit" value="입력" class="commonButton1">&nbsp;&nbsp;&nbsp;
				<button type="button" class="commonButton1" onclick="location.href='login.do'">취소</button>
			</form>
		</div>
	</div>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>
	
	<script type="text/javascript">
		
		var msg = '${msg}';
		if(msg){
		//alert(msg);
		myAlert("사번확인",msg);
		}
	</script>
</body>

</html>