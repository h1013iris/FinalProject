<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 임시보관함</title>
<script
	src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
<style>

* {
	margin: 0;
	padding: 0;
}

html{
overflow-y: scroll;
}

#container {
	height: 100vh;
	display: flex;
	align-items: center;
}

#addcon {
	margin: 0 auto;
	text-align: center;
}


.listAdd {
	margin: 0;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid;
	
}

.listAdd td {
	border: 1px solid;
	padding: 5px 10px;
	width: 200px;
}

.listAdd th {
	border: 1px solid;
	padding: 5px 10px;
	width: 200px;
}
#listMain{
	height:200px;
	overflow-y: scroll;
}
.a {
	width: 200px;
	display: inline-block;
	background-color: aqua;
	margin: 2px;
	height: 30px;
	text-align: center;
}
.boxAddList{
	height:350px;
	margin-bottom:30px;
	margin-left: auto;
	margin-right: auto;
	
}

.boxTitle{
	width:400px;
	font-size: 20px;
	margin: auto;
	height: 50px;
	background-color: #85cdff;
	text-align: center;
	color: #fff;
	margin-bottom: 10px;
	margin-top: 10px;
	line-height: 50px;
	border-radius: 20px;
}
.sc::-webkit-scrollbar{
display: none;
}

.buttonDiv{
margin-top: 50px;
}

.trSt:hover{
background-color: #d3edff;
}
</style>

	<div class="main_section">
		<div id="container">
			<div id="addcon">
				<div class="boxAddList">
					<form>
						<div class="boxTitle">거래처 주소록 임시보관함</div>
						
						<table class="listAdd">
							<tr>
								<th style="width: 50px"></th>
								<th>회사명</th>
								<th>휴대폰</th>
								<th>이메일</th>
								<th style="width:300px">기타</th>
							</tr>
							</table>
							<div id="listMain" class="sc">
							<table class="listAdd">
							<c:forEach items="${comBoxList}" var="com">
								<tr class="trSt">
									<td style="width: 50px"><input type="checkbox" name="compNo"
										value="${com.compNo}" id="compNo"></td>
									<td>${com.comNm}</td>
									<td>${com.comPhone}</td>
									<td>${com.comEmail}</td>
									<td style="width:300px">${com.comMemo}</td>
								</tr>
							</c:forEach>
						</table>
						</div>
					<div class="buttonDiv">
					<button type="button" class="deleteComBox"
					onclick="ComBox(1)">삭제</button>
					<button type="button" onclick="ComBox(2)" id="comBack">복원</button>
					</div>
					</form>
					</div>
				

					<div class="boxAddList">
					<form>
						<div class="boxTitle">고객 주소록 임시보관함</div>
						
						<table class="listAdd">
							<tr>
								<th style="width: 50px"></th>
								<th>회사명</th>
								<th>휴대폰</th>
								<th>이메일</th>
								<th style="width:300px">기타</th>
							</tr>
							</table>
							<div id="listMain" class="sc">
							<table class="listAdd">
							<c:forEach items="${custoBoxList}" var="custo">
								<tr class="trSt">
									<td style="width: 50px"><input type="checkbox" name="cusNo"
										value="${custo.cusNo}" id="cusNo"></td>
									<td>${custo.comNm}</td>
									<td>${custo.comPhone}</td>
									<td>${custo.comEmail}</td>
									<td style="width:300px">${custo.comMemo}</td>
								</tr>
							</c:forEach>
						</table>
						</div>
						<div class="buttonDiv">
						<button type="button" class="custoBox" onclick="CustoBox(1)">삭제</button>
						<button type="button" onclick="CustoBox(2)" id="custoBack">복원</button>
						</div>
					</form>
					</div>

				</div>
			</div>
		</div>
	<script>
		
		function CustoBox(num) {
			var no = 0;
			var cusNoArr = [];
			$("input:checkbox[name=cusNo]:checked").each(function() {
				var cus = $(this).val();
				cusNoArr.push(cus);
				//cusNoArr+=$(this).val();//체크된 값의 value가져오기

			});
			//고객주소록 임시보관함에서 삭제 ajax
			if (num === 1) {
				console.log("고객 주소록 임시보관함 삭제 체크목록 : " + cusNoArr);

				$.ajax({
					type : "POST",
					url : "deleteCustoBox.do",
					data : {cusNoArr : cusNoArr},
					success : function(data) {
						console.log("삭제결과" + data);
						no = data;
						if (no > 0) {
							alert("삭제 되었습니다.");
							location.href = "boxAdd.do";
						} else if (no < 1) {
							alert("삭제 실패 했습니다.");
							location.href = "boxAdd.do";
						}
					}
				})
			//고객주소록 임시보관함에서 복원 ajax
			}else if(num === 2){
				$.ajax({
					type : "POST",
					url : "backCustoBox.do",
					data : {cusNoArr : cusNoArr},
					success : function(data) {
						console.log("복원결과" + data);
						no = data;
						if (no > 0) {
							alert("복원 되었습니다.");
							location.href = "boxAdd.do";
						} else if (no < 1) {
							alert("복원 실패 했습니다.");
							location.href = "boxAdd.do";
						}
					}
				})
			}
		}
	</script>
	<script>
		
		function ComBox(num) {
			var no = 0;
			var comNoArr = [];
			$("input:checkbox[name=compNo]:checked").each(function() {
				var com = $(this).val();
				comNoArr.push(com);
					
				});
				console.log("거래처 주소록 임시보관함 삭제 체크목록 : " + comNoArr);
				//거래처 주소록 임시보관함에서 삭제 ajax
			if (num === 1) {
				$.ajax({
					type : "POST",
					url : "deleteComBox.do",
					data : {comNoArr : comNoArr},
					success : function(data) {
						console.log("삭제결과" + data);
						no = data;
						if (no > 0) {
							alert("삭제 되었습니다.");
							location.href = "boxAdd.do";
						} else if (no < 1) {
							alert("삭제 실패 했습니다.");
							location.href = "boxAdd.do";
						}
					}
				})
				//거래처 주소록 임시보관함에서 복원 ajax
			}else if(num === 2){
				$.ajax({
					type : "POST",
					url : "backComBox.do",
					data : {comNoArr : comNoArr},
					success : function(data) {
						console.log("복원결과" + data);
						no = data;
						if (no > 0) {
							alert("복원 되었습니다.");
							location.href = "boxAdd.do";
						} else if (no < 1) {
							alert("복원 실패 했습니다.");
							location.href = "boxAdd.do";
				
					}
				}
			})
		}
	}
		
		$(function(){
	        $(".page_title>.title_name").text("임시보관함");
	     });
	</script>
</body>

</html>