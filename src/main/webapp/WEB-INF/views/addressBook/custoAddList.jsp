<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 주소록 리스트조회</title>
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

#contain {
	margin: 0;
	width: 1000px;
}

#main {
	display: flex;
	align-items: center;
}

#addcon {
	margin: 0 auto;
	text-align: center;
}

#left {
	width: 30%
}

td, th {
	border: 1px solid black;
	width: 300px;
}

table {
	margin: 0;
	text-align: center;
}

.a {
	width: 200px;
	display: inline-block;
	background-color: aqua;
	margin: 2px;
	height: 30px;
	text-align: center;
}
/*팀에서 공동 선택한 버튼디자인*/
.commonButton1 {
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
	margin: 10px;
}

.commonButton1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}
</style>
	<div class="main_section">
		<div id="container">

			<button type="button" class="commonButton1"
				onclick="location.href='comAdd.do'">거래처주소록</button>
			<button type="button" class="commonButton1"
				onclick="location.href='custoAdd.do'">고객주소록</button>

			<!--고객 주소록 폴더들 표시될곳-->
			<div id="left">

				<jsp:include page="../addressBook/custoAddTitle.jsp"></jsp:include>
			</div>
			<!--고객 주소록 내용이 표시될곳-->
			<div id="main">
				<div id="addcon">
					<table>
						<tr>
							<th>회사명</th>
							<th>휴대폰</th>
							<th>이메일</th>
							<th>기타</th>

						</tr>
						<c:forEach items="${custoList}" var="cus">
							<tr>
								<td><a href="custoDetailView.do?cusNo=${cus.cusNo}">${cus.comNm}</a></td>
								<td>${cus.comPhone}</td>
								<td>${cus.comEmail}</td>
								<td>${cus.comMemo}</td>
							</tr>
						</c:forEach>
					</table>
					<form action="cusAddWriter.do" method="post">
						<input type="submit" value="고객등록">
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
