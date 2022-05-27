<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
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
.input{
	width:200px;
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

<body>
	<div class="tab">
          <ul class="tabnav">
            <li><a href="#tab01">아이디찾기</a></li>
            <li><a href="#tab02">비밀번호 찾기</a></li>
          </ul>
          <div class="out"></div>
          <div class="tabcontent">
            <div id="tab01">   
                <form>
              <table class="find">
                  <tr>
                      <td>이름</td>
                      <td><input type="text" class="input"></td>
                      <td></td>
                  </tr>
                  
                  <tr>
                      <td>부서</td>
                      <td>
                          <select class="input">
                              <option value="IT개발부">IT개발부</option>
                              <option value="총무부">총무부</option>  
                          </select>
                      </td>
                      <td></td>
                  </tr>
                  
                  <tr>
                      <td>생년월일</td>
                      <td><input type="text" class="input"
								placeholder="생년월일 6자리를 입력해주세요"></td>
                      <td></td>
                  </tr>
                  <tr>
                      <td>휴대폰번호</td>
                      <td><input type="text" class="input"
								placeholder="전화번호 11자리를 입력해주세요"></td>
                      <td></td>
                  </tr>
                  </table>
                  <div class="btn">
						<input type="submit" value="아이디찾기">
					</div>
                  
          </form>
			</div>
            <div id="tab02">
              <form>   
                  <table class="find">
                      <tr>
                          <td>이름</td>
                          <td><input type="text" class="input"></td>
                          <td></td>
                      </tr>
                      
                      <tr>
                          <td>아이디</td>
                          <td><input type="text" class="input"></td>
                          <td></td>
                      </tr>
                      
                      <tr>
                          <td>생년월일</td>
                          <td><input type="text" class="input"
								placeholder="생년월일 6자리를 입력해주세요"></td>
                          <td></td>
                      </tr>
                      
                      <tr>
                          <td>이메일</td>
                          <td><input type="text" class="input"></td>
                          <td><input type="button" value="인증하기"> </td>
                      </tr>
                      
                      <tr>
                          <td></td>
                          <td><input type="text" class="input"
								placeholder="인증번호를 입력해주세요"></td>
                          <td><input type="button" value="인증확인"></td>
                      </tr>
                     
                      </table>
                      <div class="btn">
						<input type="submit" value="비밀번호 찾기">
					</div>
                  </form>
            </div>
          </div>
          <div class="out"></div>  
      </div>
	<!--tab--></body>



</html>