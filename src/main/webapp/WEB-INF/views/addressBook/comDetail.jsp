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

.main {
	width: 500px;
	margin: 0 auto;
	text-align: center;
	border: solid 1px;
}

.main2 {
	margin: 0 auto;
	text-align: center;
}

#buttonLine {
	margin-top: 20px;
	margin-bottom: 20px;
}

textarea {
	resize: none;
}
</style>


<body>
	<div id="container">
		<div class="main">
			<form id="comdetail" action="" method="post">
				<h3>거래처 상세조회</h3>
				<table class="main2">

					<c:forEach items="${comDetail}" var="comD">
						<tr>
							<td>폴더명</td>
							<td><input type="text" name="inFolder"
								value="${comD.inFolder}" readonly></td>

						</tr>

						<tr>
							<td>회사명</td>
							<td><input type="text" name="comNm" value="${comD.comNm }"
								readonly></td>
						</tr>
						<tr>
							<td>사업자번호</td>
							<td><input type="text" name="comNo" value="${comD.comNo }"
								readonly></td>
						</tr>
						<tr>
							<td>대표번호</td>
							<td><input type="text" name="comTel" value="${comD.comTel }"
								readonly></td>
						</tr>
						<tr>
							<td>대표명</td>
							<td><input type="text" name="comCeo" value="${comD.comCeo }"
								readonly></td>
						</tr>
						<tr>
							<td>담당자</td>
							<td><input type="text" name="comPix" value="${comD.comPix }"
								readonly></td>
						</tr>
						<tr>
							<td>휴대폰</td>
							<td><input type="text" name="comPhone"
								value="${comD.comPhone }" readonly></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="comEmail"
								value="${comD.comEmail }" readonly></td>
						<tr>
							<td>기타</td>
							<td><textarea name="comMemo" class="inputlo" rows="5"
									maxlength="50" readonly>${comD.comMemo }</textarea></td>
						</tr>
						<input type="hidden" id="compNo" name="compNo"
							value="${comD.compNo }">
						<input type="hidden" name="empNo" value="${comD.empNo }">
					</c:forEach>


					<!--나중에 모달창에서 바꾸기-->

				</table>

				<div id="buttonLine">
					<button type="button" onclick="choice(1)">수정</button>
					<button type="button" onclick="location.href='comAdd.do'">취소</button>
					<button type="button" onclick="choice(2)">삭제</button>
				</div>
			</form>
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
						console.log("삭제 결과는?: " + data);
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
	</script>
</body>
</html>