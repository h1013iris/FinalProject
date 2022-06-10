<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous">
</script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
</head>
<body>

	<style>
body {
	width: 100%;
}

body, div, ul, li {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

/*tab css*/
.tab {
	margin: auto;
	width: 500px;
	height: 300px;
}

.tabnav {
	font-size: 0px;
}

.tabnav li {
	display: inline-block;
	width: 200px;
	height: 40px;
	text-align: center;
	border-right: 1px solid #ddd;
}

.tabnav li a:before {
	content: "";
	left: 0;
	top: 0px;
	width: 100%;
	height: 3px;
}

.tabnav li a {
	position: relative;
	border: #0bffff solid;
	display: block;
	background: #fff;
	color: rgb(0, 0, 0);
	padding: 5px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	text-decoration: none;
	font-size: 15px;
}

.tabnav li a:hover, .tabnav li a.active {
	line-height: 50px;
	background: #85cdff;
	color: #fff;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
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

.find {
	margin: auto;
}

.btn {
	text-align: center;
	margin: 20px;
}

.input {
	width: 200px;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
	<script>
		$(function() {
			$('.tabcontent > div').hide();
			$('.tabnav a').click(function() {
				$('.tabcontent > div').hide().filter(this.hash).fadeIn();
				$('.tabnav a').removeClass('active');
				$(this).addClass('active');
				return false;
			}).filter(':eq(0)').click();
		});
	</script>
	<script>
	alert ${msg};
</script>
<body>
	<div class="tab">
		<ul class="tabnav">
			<li><a href="#tab01">아이디찾기</a></li>
			<li><a href="#tab02">비밀번호 찾기</a></li>
		</ul>
		<div class="out"></div>
		<div class="tabcontent">
			<div id="tab01">
				<form action="selectFindId.do" method="post">
					<table class="find">
						<tr>
							<td>이름</td>
							<td><input type="text" class="input" name="empName"></td>
							<td></td>
						</tr>

						<tr>
							<td>부서</td>
							<td><select class="input" name="departmentTitle">
									<c:forEach items="${dtlist}" var="dt">
										<option value="${dt.departmentTitle}">"${dt.departmentTitle}"</option>
									</c:forEach>
							</select></td>
							<td></td>
						</tr>

						<tr>
							<td>생년월일</td>
							<td><input type="number" class="input" name="userNo"
								placeholder="생년월일 6자리를 입력해주세요" maxlength="6"></td>
							<td></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" class="input" name="email"
								placeholder="가입당시 이메일을 입력해주세요"></td>
							<td></td>
						</tr>
					</table>
					<div class="btn">
						<input type="submit" value="아이디찾기">
					</div>

				</form>
			</div>

			<div id="tab02">
				<form id="findPwForm" action="findPwForm.do" method="post">
					<table class="find">
						<tr>
							<td>이름</td>
							<td><input type="text" name="empName" class="input"></td>
							<td></td>
						</tr>

						<tr>
							<td>아이디</td>
							<td><input type="text" name="userId" class="input"></td>
							<td></td>
						</tr>

						<tr>
							<td>생년월일</td>
							<td><input type="text" class="input" name="userNo"
								placeholder="생년월일 6자리를 입력해주세요" minlength="6" maxlength="6"></td>
							<td></td>
						</tr>

						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" class="input mail_input"
								placeholder="가입당시 이메일을 입력해주세요"></td>
							<td><input type="button" class="mail_check_button"
								value="인증하기"></td>
						</tr>

						<tr>
							<td></td>
							<td><input type="text" class="input mail_con_input"
								placeholder="인증번호를 입력해주세요"></td>
							<td><input type="button" class="mail_checkCon_button"
								value="인증확인"></td>
						</tr>

					</table>
					<div class="btn">
						<input type="submit" id="findPw" disabled value="비밀번호 찾기">
					</div>
				</form>
			</div>
		</div>
		<div class="out"></div>
	</div>
	<!--tab-->
	<script>
	
	 var msg = '${msg}';
		if(msg)
		{
			alert(msg);
		}
		
		
var code =""//컨트롤러에서 전달받은 인증번호를 저장하는용도

/*인증번호 전송전 회원정보 있는지 확인*/
	$(".mail_check_button").click(function(){//인증번호 전송 버튼을 눌렀을때
		//1.회원정보를 확인하는 ajax
		$.ajax({
			type:"post",
			url:"selectFindUser",
			data:$("#findPwForm").serialize(),
			success:function(data){
				console.log("사원이 있는가?:"+ data);
				count=data;
			}
		})
		//인증번호 버튼 누르면 이메일전송하는 버튼
		//2-1 회원정보가 있을때 ajax 실행되게
		if(count === '1'){//회원정보가 있을때
		
		var email = $(".mail_input").val();//인풋박스에서 입력한 이메일을 email 변수에 담아줌
		
		//ajax url로 값을 보내도록 GET방식
		$.ajax({
			type:"GET",
			url:"mailCheck?email=" + email,
			success:function(data){
				
			//console.log("인증번호 : "+ data);
			
			//컨트롤러에서 전달받은 인증번호를 선언해준 변수에 저장
			code = data;
			}
			
		});
		alert("이메일로 인증번호가 전송되었습니다");
		//2-2 회원정보가 없다면 alert창으로 정보를 다시 확인해달라 하기
		}else{
			alert("입력한 정보를 다시 확인해주세요!");
		}
	});

/*인증번호 비교*/
//인증확인 버튼을 누르면
$(".mail_checkCon_button").click(function(){
	var inputNum =$(".mail_con_input").val(); //인증번호 확인란에 입력한 값
	
	if(inputNum == code){
		alert("인증번호가 일치합니다");
		$('#findPw').prop('disabled',false);
	}else{
		alert("인증번호가 일치하지 않습니다. 다시 확인해주세요");
		
	}
})

</script>
</body>

</html>