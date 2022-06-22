<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경창</title>
<style type="text/css">
#85cdff
* {
	margin: 0;
	padding: 0;
}

.tabcontent{
	width:500px;
	height:300px; 
	text-align: center;
	border-top:10px solid #85cdff;
	border-bottom:10px solid #85cdff;
	position: relative;
	display:inline-block;
	top:50%;
}
.tab {
	position: absolute;
    top: 50%;
    transform: translate(-50%,-50%);
    left: 50%;
}


.tabcontent form{
	position:absolute;
	top:50%;
	left:50%;
	transform: translate(-50%, -50%);
}

.input_title{
	width:150px;
}

.find tr{
	height:40px;
}

.btn {
	text-align: center;
	margin: 20px;
}

.input {
	width: 200px;
}

#logo{
    width:480px;
    text-align: center; 
    margin-bottom: 10px;
            
}
.find{
    table-layout: fixed;
    width: 450px;
}
.commonButton1 {
	padding: 0;
	font-weight: 600;
	text-align: center;
	line-height: 30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background: #85cdff;
	border: #85cdff;
	box-shadow: 0px 5px 0px 0px #4c87b099;
	width: 100px;
	margin: 0px;
}

.commonButton1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}

</style>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">	
<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>
<script

	src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
	
<body>
<jsp:include page="../common/alert.jsp"/>
<script type="text/javascript">
let msg ='${msg}';
let msgTitle ='${msgTitle}';
if(msg){
	myAlert(msgTitle,msg);
}
</script>
	<div class="tab">
	<div><a href="login.do"><img src=resources/images/member/header_logo.png alt="메인으로 이동" id="logo"/></a></div>
		
		<div class="tabcontent">
		<div class="out"></div>
		
				<form action="updatePw" method="post">
					<table class="find">
						<tr>
							<td class="input_title">변경할 비밀번호</td>
							<td><input type="text" id="changePw" class="input" name="userPw"><div id="check"></div></td>
						
						</tr>

						<tr>
							<td class="input_title">비밀번호 재확인</td>
							<td><input type="password" id="checkPw" class="input" ><div id="check2"></div></td>
						
						</tr>
					</table>
					<div class="btn">
					<input type="hidden" name="userId" value="${userId}">
						<button type="submit" id="subBtn" class="commonButton1" disabled>비밀번호 변경</button>
					</div>
				</form>
			<div class="out"></div>
			</div>
			
		</div>
		
		<script type="text/javascript">
		
		//비밀번호 유효성검사
		 $(function(){
            $("#changePw").on("input",function(){
                var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;

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
           
           //비밀번호 변경 버튼 누르고나서 
           $("#subBtn").on("click",function(){
           	   var pw = $("#changePw").val();
           	   var pwregex =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
           
           	   var pwregex = pwregex.exec(pw);
           	   if(pwregex === null){
           		   myAlert("비밀번호 재확인","비밀번호를 확인해주세요");
           		   $('#changePw').focus();
             			return false;
           		} //비밀번호 일치여부 재확인
    		        else if ($("#changePw").val() != $("#checkPw").val()) {
    		         myAlert("비밀번호 불일치","비밀번호 일치여부를 다시 확인해주세요");
    		          $('#checkPw').focus();
    		          return false;
    		        }else {
    		          //비밀번호 변경 성공
    		           $("#subBtn").prop('disabled',false);
    		          myAlert("비밀번호 변경","비밀번호 변경 되었습니다");
    		        	   $("#subBtn").submit();
    		           }
           	   
           });
</script>
</body>
<!-- 비밀번호 확인하기 -->

</html>
