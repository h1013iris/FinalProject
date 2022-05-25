<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 대기함 메인</title>
</head>
<style>
	.main_section, .div, .table, .thead {
		border: 1px solid black;
		
	}
	
	.mainDiv {
		/*border: 1px solid black;*/
		width: 84vw;
	}
	
	.div {
		padding: auto;
		margin-bottom: 20px;
	}
	
	.table {
		width: 100%;
		margin: auto;
		padding: auto;
		text-align: center;
	}
	
	.table td, .table th {
		border: 1px solid black;
		padding: 10px;
	}
	
	.search {
		text-align: center;
		margin-top: 5%;
		margin-bottom: 4%;
		padding: 20px;
	}

</style>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
	<div class="main_section">
        <div class="mainDiv">
        
        	<div class="list div">
        		<table class="table">
	        		<thead class="thead">
	   					<tr>
	   						<th width="100px">문서 번호</th>
	   						<th width="150px">유형</th>
	   						<th width="400px">제목</th>
	   						<th width="100px">기안자</th>
	   						<th width="150px">기안일</th>
	   						<th width="150px">배정일</th>
	   					</tr>
	   				</thead>
	   				<tbody>
						<tr>
							<td>sdf</td>
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
							<td>sdf</td>
						</tr>
						<tr>
							<td>sdf</td>
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
			   		<%-- 각 메뉴에 맞는 문서들만 조회하기 위해 히든으로 구분해서 넘기기 --%>
			   		<input type="hidden" name="" value=""/>
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

</body>
</html>