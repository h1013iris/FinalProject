<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 주소록 리스트조회</title>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<style>
* {

	margin: 0;
	padding: 0;
}

#container {
	margin: 0 auto;
	text-align: center;
}

#addcon {
	margin: 0 auto;
	text-align: center;
}

#main {
	display: flex;
	align-items: center;
}

#left {
 float:left;
	width:180px;
	margin-left: 10px;
	height: 400px;
	overflow-y: scroll;
}

#listMain {
 display:inline-block; 
	height: 400px;
	overflow-y: scroll;
}

.sc::-webkit-scrollbar {
	display: none;
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
	width: 230px;
}

.listAdd th {
	border: 2px rgb(223, 238, 255) solid;
	padding: 5px 10px;
	width: 230px;
}

.a {
	width: 200px;
	display: inline-block;
	margin: 2px;
	height: 30px;
	text-align: center;
}

.trSt:hover {
	background-color: #d3edff;
	cursor: pointer;
}

#btnT {
	margin: 50px;
}
/*팀에서 공동 선택한 버튼디자인*/
.commonButton1a {
	padding: 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background: #85cdff;
	border: #85cdff;
	box-shadow: 0px 5px 0px 0px #4c87b099;
	width: 200px;
	margin: 0px;
}

.commonButton1a:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}

.commonButton1_1 {
	padding: 0;
	font-weight: 600;
	text-align: center;
	line-height: 40px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background: #85cdff;
	border: #85cdff;
	box-shadow: 0px 5px 0px 0px #4c87b099;
	width: 100px;
	margin: 10px;
	height: 40px;
}

.commonButton1_1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}

.oneT {
	height: 25px;
	line-height: 25px;
	margin-bottom: 5px;
}

.comAddList {
	height: 450px;
	width: 1400px;
	margin-bottom: 30px;
	margin-left: auto;
	margin-right: auto;
	background-color: rgb(209, 209, 209);
	border-radius: 20px;
	padding: 20px;
}
</style>
	<div class="main_section">
		<div id="container">
			<div id="btnT">
				<button type="button" class="commonButton1a"
					onclick="location.href='comAdd.do'">거래처주소록</button>
				<button type="button" class="commonButton1a"
					onclick="location.href='custoAdd.do'">고객주소록</button>
			</div>
			<div id="main">
				<div id="addcon">
					<div class="comAddList">
						<div id="left" class="sc">
							<jsp:include page="../addressBook/comAddTitle.jsp"></jsp:include>
						</div>
						<div id="all">
							<table class="listAdd oneT">
								<tr>
									<th>회사명</th>
									<th>휴대폰</th>
									<th>이메일</th>
									<th style="width: 400px">기타</th>
								</tr>
							</table>
							<div id="listMain" class="sc">
								<table class="listAdd">
									<c:forEach items="${comList}" var="com">
										<tr class="trSt"
											onclick="location.href='comDetailView.do?compNo=${com.compNo}'">
											<td>${com.comNm}</td>
											<td>${com.comPhone}</td>
											<td>${com.comEmail}</td>
											<td style="width: 400px">${com.comMemo}</td>
										</tr>
									</c:forEach>
								</table>
							</div>	
						</div>
					</div>
					<form action="comAddWriter.do" method="post">
						<input type="submit" class="commonButton1_1" value="거래처등록">
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		var msg = '${msg}';
		if (msg != null && msg != "") {
			alert(msg);
		}

		$(function() {
			$(".page_title>.title_name").text("거래처 주소록");
		})
	</script>
</body>
</html>
