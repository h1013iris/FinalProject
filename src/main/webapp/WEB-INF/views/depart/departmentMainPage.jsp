<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별 페이지</title>
<style type="text/css">
	.departMainDivBi{
		margin: 0 auto;
		padding-top: 40px;
		padding-left: 100px;
		padding-right: 100px;
	}
	.upperDivDepart{
		border: 1px solid red;
		width: 100%;
		height: 37vh;
		display: flex;
		justify-content: space-between;
	}
	.lowerDivDepart{
		margin-top:15px;
		border: 1px solid blue;
		width: 100%;
		display:flex;
		height: 45vh;
		justify-content: space-between;
	}
	.annoDepartSection{
		width: 32%;
		border: 1px solid red;
	}
	.boardDepartSection{
		width: 32%;
		border: 1px solid red;
	}
	.memberDepartSection{
		width: 32%;
		border: 1px solid red;
	}
	.projectDepartSection{
		width: 66%;
		border: 1px solid blue;
	}
	.chatDepartSection{
		width: 32%;
		border: 1px solid blue;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section ">
		<div class="departMainDivBi">
	        <div class="upperDivDepart">
	        	<!-- 공지사항 -->
	        	<div class="annoDepartSection"></div>
	        	<!-- 부서게시판 -->
	        	<div class="boardDepartSection"></div>
	        	<!-- 팀원 전자모음 -->
	        	<div class="memberDepartSection"></div>
	        </div>
	        <div class="lowerDivDepart">
      			<!-- 프로젝트 -->
	        	<div class="projectDepartSection"></div>
	        	<!-- 채팅 부분 -->
	        	<div class="chatDepartSection"></div>
	        </div>
        </div>
    </div> 
</body>
</html>