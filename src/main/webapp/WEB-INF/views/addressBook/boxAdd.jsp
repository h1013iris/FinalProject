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
	margin: 0px;
	padding: 0px;
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
	background-color: #fff;
	
}

.listAdd td {
	border: 2px rgb(223, 238, 255) solid;
	padding: 5px 10px;
	width: 200px;
}

.listAdd th {
	border: 2px rgb(223, 238, 255) solid;
	padding: 5px 10px;
	width: 200px;
}
#listMain{
	height:150px;
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
	height:250px;
	margin-bottom:30px;
	margin-left: auto;
	margin-right: auto;
	background-color:rgb(209, 209, 209);
  	border-radius: 20px;
  	padding: 20px;
}

.boxTitle{
	width:440px;
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
margin-top: 10px;
}

.trSt:hover{
background-color: #d3edff;
}
.commonButton1_1 {
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
	margin: 10px;
	height: 30px;
}

.commonButton1_1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}
.oneT{
height: 25px;
line-height: 25px;
margin-bottom: 5px;
}

</style>

	<div class="main_section">
		<div id="container">
			<div id="addcon">
				
					<form>
						<div class="boxTitle">거래처 주소록 임시보관함</div>
						<div class="boxAddList">
						<table class="listAdd oneT">
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
					<button type="button" class="deleteComBox commonButton1_1"
					onclick="ComBox(1)">삭제</button>
					<button type="button" onclick="ComBox(2)" id="comBack" class="commonButton1_1">복원</button>
					</div>
					</form>
					</div>
				
					
					
					<form>
						<div class="boxTitle">고객 주소록 임시보관함</div>
						<div class="boxAddList">
						<table class="listAdd oneT">
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
						<button type="button" class="custoBox commonButton1_1" onclick="CustoBox(1)">삭제</button>
						<button type="button" onclick="CustoBox(2)" id="custoBack" class="commonButton1_1">복원</button>
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
				

				$.ajax({
					type : "POST",
					url : "deleteCustoBox.do",
					data : {cusNoArr : cusNoArr},
					success : function(data) {
						
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
				
				//거래처 주소록 임시보관함에서 삭제 ajax
			if (num === 1) {
				$.ajax({
					type : "POST",
					url : "deleteComBox.do",
					data : {comNoArr : comNoArr},
					success : function(data) {
						
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