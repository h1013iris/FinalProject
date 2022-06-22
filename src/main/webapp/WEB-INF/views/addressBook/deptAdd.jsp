<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별주소록</title>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

<style>
html{
	overflow-y:scroll; 
}	

#container {
	text-align: center;
}

#contain {
	margin: 0;
	width: 1000px;
}

#deptTitle {
	margin: 50px
}

td, th {
	border: 1px solid black;
	width: 200px;
}

table {
	margin: 0;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

#listMain{
	height:400px;
	overflow-y: scroll;
}

.sc::-webkit-scrollbar{
display: none;
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

.a {
	width: 200px;
	display: inline-block;
	margin: 2px;
	height: 30px;
	text-align: center;
}

#a {
	border-style: solid 1px;
}
#searchDiv{
margin: 50px;
text-align: center;
align-items: center;
}

.searchText{
width:300px;
height: 30px;
text-align: center;
border: solid #85cdff 2px; 
border-radius: 5px;
}
.deptN{
width:100px;
height:30px;
background-color: #d3edff;
border: solid 0px;
text-align: center;
border-radius: 30px;
}

.trSt:hover{
background-color: #d3edff;
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
	margin: 30px;
}

.commonButton1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}
input:focus {
outline:none;
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
	width: 100px;
	margin: 30px;
	position: top:50px;
	
	
}

.commonButton1_1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
	
}

</style>

	<div class="main_section">

		<div id="container">

			<div id="container">
				<div id="main">
					
				</div>
			</div>

			<div id="deptTitle">
				<form action="addressMain.do" method="get" class="a">
					<div>
						<input type="submit" value="전체주소록" name="departmentTitle"
							class="commonButton1">
					</div>
				</form>
				<c:forEach items="${deptTitleList}" var="dept">
					<form action="deptAddList" method="get" class="a">
						<div>
							<input type="submit" value="${dept.departmentTitle}"
								name="departmentTitle" class="commonButton1">
						</div>
					</form>
				</c:forEach>

			</div>
			<form action="deptAddSearch.do" method="post">
						<div id="searchDiv">
							<input type="text"	name="search" class="searchText"> <input type="submit"  class=" commonButton1_1" value="검색" />
							<!-- 검색창에 보일 부서명 -->
							<input type="text" readonly="readonly" value="${dept.departmentTitle}"
								name="departmentTitle" class="deptN"/>
						</div>
					</form>

			<!--부서별 주소록 내용이 표시될곳-->
			<div id="addcon">
				<table class="listAdd">
					<tr>
						<th>이름</th>
						<th>부서명</th>
						<th>직급</th>
						<th>이메일</th>
						<th>휴대폰</th>
					</tr>
					</table>
					<div id="listMain" class="sc">
					<table class="listAdd">
					<c:forEach items="${deptList}" var="deptAdd">
						<tr class="trSt">
							<td>${deptAdd.empName}</td>
							<td>${deptAdd.departmentTitle}</td>
							<td>${deptAdd.jobName}</td>
							<td>${deptAdd.email}</td>
							<td>${deptAdd.phone}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		var msg = '${msg}';
		var msgTitle = '${msgTitle}';
		if(msg && msgTitle){
		myAlert(msgTitle,msg); 
		}
		
		$(function(){
	        $(".page_title>.title_name").text("부서별 주소록");
	     })
	</script>
</body>
</html>
