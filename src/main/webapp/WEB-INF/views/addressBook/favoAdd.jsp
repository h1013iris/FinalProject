<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 즐겨찾기</title>
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
#container {
	height: 100vh;
	display: flex;
	align-items: center;
}

#addcon {
	margin: 0 auto;
	text-align: center;
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
.boxAddList{
	height:300px;
	width:1100px;
	margin-bottom:30px;
	margin-left: auto;
	margin-right: auto;
	
}

.boxTitle{
	width:400px;
	font-size: 20px;
	margin: auto;
}

</style>

	<div class="main_section">
		<div id="container">
			<div id="addcon">
					<div class="boxAddList">
					
						<div class="boxTitle">즐겨찾기 페이지</div>

						<table>
							<tr>
								<th></th>
								<th>이름</th>
								<th>부서명</th>
								<th>직급</th>
								<th>이메일</th>
								<th>휴대폰</th>
							</tr>
							<c:forEach items="${favoAddList}" var="favo">
								<tr>
									<td><input type="text" name="empNo"
										value="${favo.empNo}" id="empNo"></td><!-- empNo로 해서 즐겨찾기에서 해당 사번 체크해제하면 지워지게끔? -->
									<td>${favo.empName}</td>
									<td>${favo.departmentTitle}</td>
									<td>${favo.jobName}</td>
									<td>${favo.email}</td>
									<td>${favo.phone}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
</body>

</html>