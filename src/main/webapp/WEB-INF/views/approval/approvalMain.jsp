<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 메인</title>
<style type="text/css">

	.main_section, .div, .table, .thead {
		border: 1px solid black;
		
	}
	
	.mainDiv {
		/*border: 1px solid black;*/
		width: 84vw;
	}
	
	.divTitle {
		text-align: left;
		font-size: 22px;
		font-weight: bold;
		
	}
	
	.viewMore {
		float: right;
		text-align: right;
	}
	
	.div {
		padding: auto;
		margin-bottom: 3%;
	}
	
	.waiting {
		width: 48.65%;
		float: left;
		padding-right: 1.2%;
	}
	
	.complete {
		width: 48.65%;
		float: left;
		padding-left: 1.2%;
	}
	
	.status {
		clear: both;
	}
	
	.table {
		width: 100%;
		margin-top: 20px;
		padding: 1.5%;
		text-align: center;
	}
	
	.table td, .table th {
		border: 1px solid black;
		padding: 15px;
	}
	
	.search {
		text-align: center;
		margin-top: 5%;
		margin-bottom: 4%;
		padding: 1.5%;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="main_section">
        <div class="mainDiv">
        
		        <div class="waiting div">
		        	<span class="divTitle">결재 대기</span>
		        	<a class="viewMore" href="waitingMain.do">> 더보기</a>
		        	<table class="table">
		        		<thead class="thead">
		   					<tr>
		   						<th width="65%">문서 제목</th>
		   						<th width="15%">기안자</th>
		   						<th width="20%">기안일</th>
		   					</tr>
		   				</thead>
		   				<tbody>
							<tr>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
							</tr>
							<tr>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
							</tr>
							<tr>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
							</tr>
		   				</tbody>
		        	</table>
		        </div>
		               		
				<div class="complete div">
					<span class="divTitle">결재 완료</span>
					<a class="viewMore" href="completeMain.do">> 더보기</a>
					<table class="table">
		   				<thead class="thead">
		   					<tr>
		   						<th width="65%">문서 제목</th>
		   						<th width="15%">기안자</th>
		   						<th width="20%">완료일</th>
		   					</tr>
		  				</thead>
		   				<tbody>
		   					<tr>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
							</tr>
							<tr>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
							</tr>
							<tr>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
							</tr>
		   				</tbody>
		   			</table>
				</div>
		
		        <div class="status div">
		        	<span class="divTitle">진행 상태 확인</span>
		        	<a class="viewMore" href="statusMain.do">> 더보기</a>
		        	<table class="table">
		        		<thead class="thead">
		   					<tr>
		   						<th width="10%">문서 번호</th>
		   						<th width="10%">문서 유형</th>
		   						<th width="53%">문서 제목</th>
		   						<th width="10%">기안일</th>
		   						<th width="17%">진행 상태</th>
		   					</tr>
		   				</thead>
		   				<tbody>
							<tr>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
							</tr>
							<tr>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
							</tr>
							<tr>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
								<td>sdf</td>
							</tr>
		   				</tbody>
		        	</table>
		        </div>
		        
		        <%-- 검색창 --%>
		        <div class="search div">
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