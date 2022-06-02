<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 요청함</title>

<style type="text/css">
	
	.requestList_main {
		margin: auto;
	}

	.requestList_table, .requestList_table tr, .requestList_table td, .requestList_table th{
		border: 1px solid black;
		text-align: center;
	}
	
	.requestList_table>tbody>tr:hover{
		background: rgb(174, 217, 248);
		cursor: pointer
	}

</style>

</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
	<div class="main_section">
        
		<div class="requestList_main">
			<div> 결재 요청 목록 </div>
			<table class="requestList_table">
				<thead class="text-primary">
					<tr>
                 		<th>No</th>
	                  	<th>유형</th>
	                   	<th>제목</th>
	                   	<th>기안자</th>
	                   	<th>기안일</th>
	                   	<th>요청일</th>
                 	</tr>
       			</thead>
       			<tbody id="boardList">
					<tr>
						<td>sdfsdf</td>
						<td>sdfsdf</td>
						<td>sdfsdf</td>
						<td>sdfsdf</td>
						<td>sdfsdf</td>
						<td>sdf</td>
					</tr>

        		</tbody>
         	</table>

    	</div>  
			        
    </div>

</body>
</html>