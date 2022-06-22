<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>거래처 상세보기</title>
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

    textarea{
    resize: none;
    margin-top: 5px;
   
    }
    .inputBox{
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
			<form id="comdetail" action="" method="post">
				<p class="Tfont">거래처 상세조회</p>
				<table class="main2">

					<c:forEach items="${comDetail}" var="comD">
						<tr>
							<td class="Title">폴더명</td>
							<td><input type="text" name="inFolder" class="inputBox"
								value="${comD.inFolder}" readonly></td>

						</tr>

						<tr>
							<td class="Title">회사명</td>
							<td><input type="text" name="comNm" value="${comD.comNm }" class="inputBox"
								readonly></td>
						</tr>
						<tr>
							<td class="Title">사업자번호</td>
							<td><input type="text" name="comNo" value="${comD.comNo }" class="inputBox"
								readonly></td>
						</tr>
						<tr>
							<td class="Title">대표번호</td>
							<td><input type="text" name="comTel" value="${comD.comTel }" class="inputBox"
								readonly></td>
						</tr>
						<tr>
							<td class="Title">대표명</td>
							<td><input type="text" name="comCeo" value="${comD.comCeo }" class="inputBox"
								readonly></td>
						</tr>
						<tr>
							<td class="Title">담당자</td>
							<td><input type="text" name="comPix" value="${comD.comPix }" class="inputBox"
								readonly></td>
						</tr>
						<tr>
							<td class="Title">휴대폰</td>
							<td><input type="text" name="comPhone" class="inputBox"
								value="${comD.comPhone }" readonly></td>
						</tr>
						<tr>
							<td class="Title">이메일</td>
							<td><input type="text" name="comEmail" class="inputBox"
								value="${comD.comEmail }" readonly></td>
						<tr>
							<td class="Title">기타</td>
							<td><textarea name="comMemo" class="inputBox"" rows="5"
									maxlength="50" readonly>${comD.comMemo }</textarea></td>
						</tr>
						<input type="hidden" id="compNo" name="compNo"
							value="${comD.compNo }">
						<input type="hidden" name="empNo" value="${comD.empNo }">
					</c:forEach>


					<!--나중에 모달창에서 바꾸기-->

				</table>

				<div id="buttonLine">
					<button type="button" onclick="choice(1)" class="commonButton1_1">수정</button>
					<button type="button" onclick="location.href='comAdd.do'" class="commonButton1_1">취소</button>
					<button type="button" onclick="choice(2)" class="commonButton1_1">삭제</button>
				</div>
			</form>
		</div>
		</div>
	</div>
	<!--
	<script>
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
	</script>
	-->
	<script>
		function choice(num) {
			var comdetail = $("#comdetail");
			if (num === 1) {
				comdetail.prop("action", "selectupDetailCom.do");
				comdetail.submit();
			} 
			if (num === 2) {
				var compNo = $("#compNo").val();
				$.ajax({
					type : "POST",
					url : "deleteComAdd.do",
					data : {compNo:compNo},
					success : function(data) {
						
						no = data;
						if (no === '1') {
							/*
							모달창으로 바꾸고 나서 적용해보기
							let title = '거래처 주소록 삭제';
							let content='거래처 주소록 삭제에 실패했습니다';
							myAlert(title,content);
							*/
							alert("삭제가 성공했습니다");
							location.href="comAdd.do";
							
						} else {
							alert("삭제를 실패했습니다");
							location.href="comAdd.do";
						}
					}
				})
			}
		};
		
		 $(function() {
				$(".page_title>.title_name").text("거래처 주소록");
			})
	</script>
</body>
</html>
