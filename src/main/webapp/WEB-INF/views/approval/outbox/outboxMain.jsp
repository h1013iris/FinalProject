<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 보관함 메인</title>
<style type="text/css">
	
	.mainDiv {
		width: 84vw;
		margin: auto;
		text-align: center;
	}
	
	.main_section {
		/*border: 1px solid black;*/
	}
	
	.outBoxList_area {
		width: 100%;
		border: 1px solid #e6e6e6;
		background-color: #e6e6e6;
		border-radius: 15px;
		box-shadow: 0 0 8px #afafaf;
	}
	
	.outBoxList_table>tbody>tr:hover {
		background: rgb(174, 217, 248);
		box-shadow: 0 0 8px #4c87b099;
		
		cursor: pointer;
	}
	
	.outBoxList_table {
		width: 97%;
		margin: auto;
		padding: auto;
	}
	
	.outBoxList_table td {
		border-top: 1px solid darkgray;
		padding: 15px;
		
	}
	
	.outBoxList_table th {
		padding: 15px;
		background-color: darogray;
	}
	
	.outBoxList_thead {
		font-weight: 900;
		font-size: 16px;
	}
	
	.noOutBoxList {
		color: blue;
	}
	
	.pagingArea {
		/*border: 1px solid black;*/
		width: fit-content;
		margin: auto;
		padding-top: 35px;
	}
    /* #pagingArea a{color:black} */
	
	.pagingBtn {
		width: 30px;
		height: 45px;
	}
	
	.searchArea {
		/*border: 1px solid black;*/
		margin: auto;
		padding-top: 35px;
	}
	
	.searchBtn {
		width: 60px;
		height: 45px;
	}
	
	#condition {
		width: 100px;
		font-size: 15px;
	}
	
	#search {
		width: 300px;
		margin: 0 10px 0 10px;
	}
	
	#condition, #search {
		border-radius: 5px;
		height: 30px;
		font-size: 15px;
	}

</style>

</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
	<div class="main_section">
        <div class="mainDiv">
			<div class="outBoxList_area">
				<table class="outBoxList_table">
					<colgroup>
						<col width="80px">
						<col width="120px">
						<col width="300px">
						<col width="80px">
						<col width="100px">
						<col width="100px">
					</colgroup>
					
					<thead class="outBoxList_thead">
						<tr>
	                 		<th>No</th>
		                  	<th>문서 유형</th>
		                   	<th>제목</th>
		                   	<th>기안자</th>
		                   	<th>기안일</th>
		                   	<th>요청일</th>
	                 	</tr>
	       			</thead>
	       			<tbody class="outBoxList_tbody">
						
	        		</tbody>
	         	</table>
	    	</div>
	    	
	    	<!-- 페이징바 만들기 -->
			<div class="pagingArea" align="center">
				<ul id="paginationBox" class="pagination">
					<%-- 페이징바 들어갈 부분 --%>
				</ul>
			</div>
	          
	           
	       	<%-- 검색창 --%>
	       	<div class="searchArea">
	       		<%-- 검색하기 버튼 클릭 시 검색 서블릿으로 넘어가도록 --%>
			   	<form class="searchForm" action="" method="get">
			   		<%-- 각 메뉴에 맞는 문서들만 조회하기 위해 히든으로 구분해서 넘기기 --%>
			   		<input type="hidden" name="" value=""/>
			        <select id="condition" name="condition">
			        	<option>검색 조건</option>
			           	<option value="docNo">문서 번호</option>
	        			<option value="docType">문서 유형</option>
	        			<option value="docTitle">제목</option>
			        </select>
			        <input type="search" id="search" name="search" maxlength="100">
			        <button class="commonButton1 searchBtn" type="button">검색</button>
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
			
			} else {
				
				$.ajax({
					
					type: "post",
	                url: ".do",
	                data: { empNo : "${ loginUser.empNo }",
	                		jobNo : "${ loginUser.jobNo }" },
	                success: function (list) {
						
	                	console.log(list)
	                	
	                	$tbody = $('.outBoxList_tbody'); // 리스트가 들어갈 tbody
	                	$tbody.html('');
	                	
	                	if(list.length == 0) {
	                		
	                		var $noListTh = $("<th colspan='6'>").text("결재 요청한 문서가 존재하지 않습니다.").addClass("noOutBoxList");
	                		var $noListTr = $('<tr>').append($noListTh);
	                		
							$tbody.append($noListTr);
	                	
	                	} else {
							
	                		$.each(list, function(i, obj) {
	                			
	                			var $tr = $('<tr>');
	                			var $docNo = $('<td>').text(obj.docNo);
	                			var $docForm = $('<td>').text(obj.docForm);
	                			var $docType = $('<input type="hidden" id="docType" name="docType" value='+obj.docType+'/>');
	                			
	                			if(obj.docTitle != null) {
	                				var $docTitle = $('<td>').text(obj.docTitle);
	                			
	                			} else {
	                				var $docTitle = $('<td>').text(obj.docForm);
	                			}
	                			
	                			var $drafter = $('<td>').text(obj.drafter);
	                			var $draftDate = $('<td>').text(obj.draftDate);
	                			var $proDate = $('<td>').text(obj.proDate);
	                			
	                			$tr.append($docNo);
	                			$tr.append($docForm);
	                			$tr.append($docType);
	                			$tr.append($docTitle);
	                			$tr.append($drafter);
	                			$tr.append($draftDate);
	                			$tr.append($proDate);
	                			
	                			$tbody.append($tr);
	                		});
	                	}
	                }
				});
			}

		});
		
	
		// 게시글 클릭 시
		$(".outBoxList_table tbody").on("click", "tr", (function() {
			
			let docNo = $(this).find("td:eq(0)").text(); // 클릭한 문서의 문서 번호 가져와서 담기
			let docType = $("#docType").val();
			console.log(docNo);
			console.log(docType);
			
			location.href = ".do?docNo=" + docNo;
		}));
		
		
		$(".searchBtn").click(function() {
			
		})
		
	
	</script>

	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
	

</body>
</html>