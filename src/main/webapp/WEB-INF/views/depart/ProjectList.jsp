<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 페이지</title>
<style type="text/css">
	.projectBigDiv{
		border: 1px solid;
		width: 83vw;
	}
	.favProjectSection, .allProjectSection{
		border: 2px solid blue;
		display: flex;
		width: 100%;
	}
	.projectNameSection{
		font-size: 28px;
		width: 12%;
		margin-right:5%;
	}
	.flex-container{
		display: flex;
    	flex-wrap: wrap;
    	width: 90%;
	}
	.flex-item{
    	background-color: #e4e4e4;
    	height: 15vh;
    	width: 22%;
		margin: 15px;
		text-align: center;
		line-height: 19vh;
	}
	.allProjectSection{
		margin-top: 10px;
	}
	.MakeNewProject{
		display: none;
		height: 100%;
		line-height: normal;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="projectBigDiv">
        	<!-- 즐겨찾기 부분 -->
        	<div class="favProjectSection">
        		<!-- 이름 부분 -->
        		<div class="projectNameSection">
        			<span> 즐겨 찾기 </span>
        		</div>
        		<!-- 프로젝트 부분 -->
        		<div class="flex-container">
        			<div class="flex-item"></div>
     
        		</div>
        	</div>
        	<!-- 일반 프로젝트 부분 -->
        	<div class="allProjectSection">
        		<!-- 이름 부분 -->
        		<div class="projectNameSection">
        			<span> 내 프로젝트 </span>
        		</div>
        		<!-- 프로젝트 부분 -->
        		<div class="flex-container">
        			<div class="flex-item createNewProject">
        				<a class="cNPchangeButton"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png"></a>
        				<div class="MakeNewProject">
        					<label> 프로젝트 이름 </label>
        					<input placeholder="프로젝트 이름을 입력해주세요">
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
    </div> 
    <script type="text/javascript">
    	$(".cNPchangeButton").click(function(){
    		$(".cNPchangeButton").css("display","none");
    		$(".MakeNewProject").css("display","block");
    	})
    </script>
</body>
</html>