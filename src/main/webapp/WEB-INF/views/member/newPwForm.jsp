<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경창</title>
<style type="text/css">
.tab {
	margin: auto;
	width: 500px;
	height: 300px;
}
.tabcontent {
	padding: 50px;
	height: 200px;
	border: 1px solid #ddd;
	border-top: none;
	text-align: left;
}

.out {
	background-color: #85cdff;
	height: 10px;
	width: 500px;
	margin-top: 10px;
}

.btn {
	text-align: center;
	margin: 20px;
}

.input {
	width: 200px;
}
</style>
<script
	src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>

<body>
	<div class="tab">
		<div class="out"></div>
		<div class="tabcontent">
			
				<form action="updatePw" method="post">
					<table class="find">
						<tr>
							<td>변경할 비밀번호</td>
							<td><input type="text" id="changePw" class="input" name="userPw"><div id="check"></div></td>
						
						</tr>

						<tr>
							<td>비밀번호 재확인</td>
							<td><input type="password" id="checkPw" class="input" ><div id="check2"></div></td>
						
						</tr>
					</table>
					<div class="btn">
					<input type="hidden" name="userId" value="${userId}">
						<input type="submit" id="subBtn" disabled value="비밀번호 변경">
					</div>
				</form>
			</div>
			<div class="out"></div>
		</div>
		
		<script type="text/javascript">
		
		//비밀번호 유효성검사
		 $(function(){
            $("#changePw").on("input",function(){
                var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

                var result = regex.exec($("#changePw").val())
                //정규식에 일치하지 않으면 null
                if(result != null){
                    $("#check").html("");
                }else{
                    $("#check").html("영어대소문자,숫자,특수문자포함 8-20자리");
                    $("#check").css("color","red");
                    $("#subBtn").prop('disabled',true);
                }
            });
		 });
    	
           //비밀번호 확인    
           $(function(){
              $("#checkPw").on("keyup",function(){
                    if($("#changePw").val()==$("#checkPw").val()){
                       $("#check2").html("비밀번호가 일치합니다");
                       $("#subBtn").prop('disabled',false);
                 
                    }else{
                     $("#check2").html("비밀번호가 일치하지않습니다"); 
                     $("#subBtn").prop('disabled',true);
                     
                    }
               })
		 });

		</script>
</body>
<!-- 비밀번호 확인하기 -->

</html>