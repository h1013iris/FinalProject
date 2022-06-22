<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 수정</title>
<script
	src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
</head>
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


   .main{
      width: 400px;
      height:400px;
        margin:0 auto;
        text-align: center;
        border: solid #85cdff 3px; 
        border-top-left-radius: 150px;
        border-bottom-right-radius: 150px;
        padding-top: 30px;
    }

.main2 {
	margin: 0 auto;
	text-align: center;
}

#buttonLine {
	margin-top: 20px;
	margin-bottom: 20px;
}
/*  #selboxDirect{
    	display: none;
    }*/
textarea {
	resize: none;
	width:180px;
	margin-top: 5px;
}

.inputBox {
	width: 180px;
}

.Title {
	text-align: left;
	vertical-align: top;
}
   .commonButton1_1 {
	padding: 0;
	font-weight: 100px;
	text-align: center;
	line-height: 30px;
	height:30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background: #85cdff;
	border: #85cdff;
	box-shadow: 0px 5px 0px 0px #4c87b099;
	width: 50px;
	position: top:50px;
	
	
}

.commonButton1_1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
	
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
}
.point{
color: red;
}
.Tfont{
font-size: 20px;
font-weight: bold;
margin-bottom: 20px;
}
</style>


<body>
 	<jsp:include page="../common/header.jsp"></jsp:include>
     <div class="main_section">
	<div id="container">
		<div class="main">
			<form action="updateComList.do" method="post">
				<p class="Tfont">거래처 수정</p>
				<table class="main2">
					<tr>
						<td><select id="selbox" name="inFolder">
								<option value="">폴더선택(x)</option>
								<c:forEach items="${comFolList}" var="comF">
									<option value="${comF.inFolder}">${comF.inFolder}</option>
								</c:forEach>
								<option id="direct">직접입력</option></td>
						<td><input type="text" id="selboxDirect" maxlength="9"  class="inputBox" /> </select>
						<td>
					</tr>

					<!--내부폴더는 empNo로 distinct로 중복제거 select해서 목록띄우기-->
					<c:forEach items="${comDetail}" var="com">
						<tr>
							<td class="Title"><label class="point">*</label> 회사명</td>
							<td><input type="text" name="comNm" value="${com.comNm}"  class="inputBox"
								required maxlength="19"></td>
						</tr>
						<tr>
							<td class="Title"><label class="point">*</label> 사업자번호</td>
							<td><input type="number" name="comNo" value="${com.comNo}"
								class="inputBox" oninput="maxCheck(this)" required maxlength="10" placeholder="하이픈빼고 10자리"></td>
						</tr>
						<tr>
							<td class="Title"><label class="point">*</label> 대표번호</td>
							<td><input type="number" name="comTel" value="${com.comTel}"
								required maxlength="11" oninput="maxCheck(this)" class="inputBox"></td>
						</tr>
						<tr>
							<td class="Title"><label class="point">*</label> 대표명</td>
							<td><input type="text" name="comCeo" value="${com.comCeo}"
								maxlength="9" required class="inputBox"></td>
						</tr>
						<tr>
							<td class="Title"><label class="point">*</label> 담당자</td>
							<td><input type="text" name="comPix" value="${com.comPix}"
								required maxlength="9" class="inputBox"></td>
						</tr>
						<tr>
							<td class="Title"><label class="point">*</label> 휴대폰</td>
							<td><input type="number" name="comPhone" required
								value="${com.comPhone}" class="inputBox" oninput="maxCheck(this)" maxlength="11"></td>
						</tr>
						<tr>
							<td class="Title"><label class="point">*</label> 이메일</td>
							<td><input type="email" name="comEmail"
								value="${com.comEmail}" required class="inputBox" maxlength="29"></td>
						<tr>
							<td class="Title">&nbsp;&nbsp;기타</td>
							<td><textarea name="comMemo" class="inputlo" rows="5"
									maxlength="49">${com.comMemo}</textarea></td>
						</tr>
						<input type="hidden" name="compNo" value="${com.compNo }">
						<input type="hidden" name="empNo" value="${com.empNo }">
					</c:forEach>


					<!--나중에 모달창에서 바꾸기-->

				</table>

				<div id="buttonLine">
					<input type="submit" value="등록" class="commonButton1_1"/>
					<button type="button" class="commonButton1_1" onclick="location.href='comAdd.do'">취소</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	<script>
		/*원본
		$(function(){
		  
		      //직접입력시 인풋박스 기존에는 안보이는상태 
		 		$("#selboxDirect").hide();
		 
		  
		   $("#selbox").change(function() {
		  
		  	//직접입력을 누를 때 보임
		      if($("#selbox").val() == "direct") {
		      	$("#selboxDirect").show();

		      }  else {
		     		$("#selboxDirect").hide();
		      }

		  });
		  });*/

		const directBox = document.getElementById('selboxDirect')//selboxDirect id를 가진 태그를 선택한다
		directBox.addEventListener('keyup', function(e) {//태그에 keyup이벤트를 추가한다 (keyup: 손가락을 키보드에서 떼면 함수가 실행됨)
			const directValue = document.getElementById('direct')//direct id를 가진 태그를 선택
			directValue.value = e.currentTarget.value//input에 입력된 값을 선택직접입력 옵션 태그의 value값으로 넣어준다
		})
		$(function() {

			//인풋박스 기존에는 안보이는상태 
			$("#selboxDirect").hide();

			$("#selbox").change(function() {

				//직접입력을 누를 때 보임
				if ($("#selbox option:selected").attr('id') === 'direct') {
					$("#selboxDirect").show();

				} else {
					$("#selboxDirect").hide();
				}
			});
		});
		  
		  //input number 길이제한
		  function maxCheck(object){
		 	 if(object.value.length>object.maxLength){
		 		 object.value = object.value.slice(0,object.maxLength);
		 	 }
		  }
		  $(function() {
				$(".page_title>.title_name").text("거래처 주소록");
			})
	</script>
</body>
</html>