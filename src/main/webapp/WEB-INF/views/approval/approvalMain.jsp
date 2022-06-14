<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 메인</title>
<style type="text/css">
	
	.aprvMain_div {
		text-align: center;
		margin: 0 auto;
		padding-top: 30px;
		padding-left: 100px;
		padding-right: 100px;
		border: 1px solid;
	}
	
	.aprvMain_upper {
		border: 1px solid blue;
		width: 100%;
		height: 40vh;
		display: flex;
		justify-content: space-between;
	}
	
	.aprvMain_lower {
		border: 1px solid blue;
		margin-top:15px;
		width: 100%;
		display: flex;
		height: 40vh;
		justify-content: space-between;
	}
	
	.request_list {
		border: 1px solid red;
		width: 35%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.waiting_list {
		border: 1px solid red;
		width: 35%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.complete_list {
		border: 1px solid red;
		width: 35%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.status_list {
		border: 1px solid red;
		width: 100%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	
	.search_area {
		border: 1px solid blue;
		width: 100%;
		display: flex;
		margin-top:15px;
		height: 5vh;
		justify-content: space-between;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="main_section">
       	
       	<div class="aprvMain_div">
	       	<!-- 상단 -->
	       	<div class="aprvMain_upper">
	       		<%-- 직급이 대리보다 낮은 경우 요청 리스트 띄우기 --%>
	        	<c:if test="${ loginUser.jobNo } lt 4">
	        		<div class="request_list">
	        		
	        		</div>
	        	</c:if>
	        	<%-- 직급이 대리 이상인 경우 대기 리스트 띄우기 --%>
	        	<c:if test="${ loginUser.jobNo } ge 4">
	        		<div class="waiting_list">
	        	
	        	</div>
	        	</c:if>
	        	
	        	<div class="complete_list">
	        		
	        	</div>
	       	</div>
	       	
	       	<!-- 하단 -->
	       	<div class="aprvMain_lower">
	        	<div class="status_list">
	        		
	        	</div>
	      	</div>  
	        <%-- 검색창 --%>
	        <div class="search_area">
		        <%-- 검색하기 버튼 클릭 시 검색 서블릿으로 넘어가도록 --%>
			   	<form class="searchArea" action="" method="get">
			        <select id="condition" name="condition">
			        	<option>검색 조건</option>
			           	<option value="docNo">문서 번호</option>
	        			<option value="docType">유형</option>
	        			<option value="docTitle">제목</option>
			        </select>
			        <input type="search" id="search" name="search">
			        <button class="searchBtn" type="submit">검색</button>
			  	</form>
	        </div>
		</div>
    </div>
    
    <script type="text/javascript">
    
	 	// 화면 로드 시 리스트 불러오기
		$(document).ready(function() {
			
			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {
				
				loginFn(); // 로그인 먼저
		
			}
		});
    
    </script>

</body>
</html>