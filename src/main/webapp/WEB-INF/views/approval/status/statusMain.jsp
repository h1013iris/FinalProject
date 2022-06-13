<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행 상태 확인함 메인</title>
<style type="text/css">
	
	.mainDiv {
		padding: 50px 100px 80px 100px;
		text-align: center;
	}
	
	.main_section {
		/*border: 1px solid black;*/
	}
	
	.statusList_area {
		width: 100%;
		border: 1px solid #e6e6e6;
		background-color: #e6e6e6;
		border-radius: 15px;
		box-shadow: 0 0 8px #afafaf;
	}
	
	.statusList_table>tbody>tr:hover {
		background: rgb(174, 217, 248);
		box-shadow: 0 0 8px #4c87b099;
		cursor: pointer;
	}
	
	.statusList_table {
		width: 97%;
		margin: auto;
		table-layout: fixed;
	}
	
	.statusList_table td {
		border-top: 1px solid darkgray;
		padding: 15px;
	}
	
	.docTitleTd {
       	white-space: nowrap;
       	text-overflow: ellipsis;
       	overflow: hidden;
	}
	
	.statusList_table th {
		padding: 15px;
		background-color: darogray;
	}
	
	.statusList_thead {
		font-weight: 900;
		font-size: 16px;
	}
	
	.noStatusList {
		color: blue;
	}
	
	.pagingArea {
		/*border: 1px solid black;*/
		width: fit-content;
		padding-top: 35px;
	}
    /* #pagingArea a{color:black} */
	
	.pagingBtn {
		width: 30px;
		height: 45px;
	}
	
	.searchArea {
		/*border: 1px solid black;*/
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
	
	.status1 {
		color: blue;
	}
	
	.status4 {
		color: red;
	}
	
	.statusfilter_area {
		/*border: 1px solid black;*/
		padding: 10px 0 15px 82.8%;
	}
	
	.statusfilter_select {
		width: 150px;
		height: 25px;
		font-size: 16px;
		/*text-align: center;*/
	}

</style>

</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
	<div class="main_section">
        <div class="mainDiv">
        	<div class="statusfilter_area">
        		<select class="statusfilter_select">
        			<option value="all">전체</option>
        			<%-- 문서 상태값 출력 --%>
        		</select>
        	</div>
			<div class="statusList_area">
				<table class="statusList_table">
					<colgroup>
						<col width="80px">
						<col width="120px">
						<col width="300px">
						<col width="80px">
						<col width="100px">
						<col width="130px">
					</colgroup>
					
					<thead class="statusList_thead">
						<tr>
	                 		<th>No</th>
		                  	<th>문서 유형</th>
		                   	<th>제목</th>
		                   	<th>기안자</th>
		                   	<th>기안일</th>
		                   	<th>상태</th>
	                 	</tr>
	       			</thead>
	       			<tbody class="statusList_tbody">
						
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
				
				// 문서 상태값 리스트 조회해서 select에 넣는 함수 실행
				aprvStatusFn(); 
				
				// 리스트 조회하는 ajax
				statusListFn();
			}

		});
		
		
		// 진행 상태 확인 리스트 조회하는 함수
		function statusListFn() {
			
			$.ajax({
				
				type: "post",
                url: "statusList.do",
                data: { drafter : "${ loginUser.empNo }" },
                success: function (list) {
					
                	console.log(list)
                	
                	$tbody = $('.statusList_tbody'); // 리스트가 들어갈 tbody
                	$tbody.html('');
                	
                	if(list.length == 0) {
                		
                		var $noListTh = $("<th colspan='6'>").text("진행 상태를 확인할 문서가 존재하지 않습니다.").addClass("noStatusList");
                		var $noListTr = $('<tr>').append($noListTh);
                		
						$tbody.append($noListTr);
                	
                	} else {
						
                		$.each(list, function(i, obj) {
                			
                			var $tr = $('<tr>');
                			var $docNo = $('<td>').text(obj.docNo);
                			var $docForm = $('<td>').text(obj.docForm);
                			var $docType = $('<input type="hidden" id="docType" name="docType" value=' 
                								+ obj.docType+'/>');
                			
                			if(obj.docTitle != null) {
                				var $docTitle = $('<td>').text(obj.docTitle).addClass("docTitleTd").attr("title", obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<td>').text(obj.docForm).addClass("docTitleTd");
                			}
                			
                			var $drafter = $('<td>').text(obj.drafter);
                			var $draftDate = $('<td>').text(obj.draftDate);
                			var $aprvStatusName = $('<td>').text(obj.aprvStatusName).addClass("statusName");
                			
                			// 진행 상태에 따른 글자색 변경 위해
                			if(obj.aprvStatus == 1) {
                				$aprvStatusName.addClass("status1");
                				
                				// 상태가 진행 중인 경우 현재 결재자 조회하는 ajax
                				$.ajax({
                					
                					type: "post",
                					url: "selectApprover.do",
                					data: { docNo : obj.docNo },
                					success: function(approver) {
                						console.log(approver);
                						
                						$aprvStatusName.append(" (" + approver + ")");	                					}
                					
                				});
                				
                			} else if(obj.aprvStatus == 4) {
                				$aprvStatusName.addClass("status4");
                			}
                			
                			$tr.append($docNo);
                			$tr.append($docForm);
                			$tr.append($docType);
                			$tr.append($docTitle);
                			$tr.append($drafter);
                			$tr.append($draftDate);
                			$tr.append($aprvStatusName);
                			
                			$tbody.append($tr);
                		});
                	}
                }
			});
			
		}
		
		
		// 상태값 리스트 조회하는 함수
		function aprvStatusFn() {
			
			$.ajax({
		 			
	 			type: "post",
                url: "selectAprvStatusList.do",
                success: function (list) {
					
                	console.log(list);
                	
                	if(list != null || list != "") {
                		
                		$.each(list, function(i) {
                			$(".statusfilter_select").append("<option value='" + list[i].aprvStatusNo + "'>" 
                									 + list[i].aprvStatus + "</option>");
                		});
                	}
                }
	 		});
		}
		
		
		
		// 상태값 option 바뀔 때마다 해당하는 상태값에 따라 리스트 조회
		$(document).on("change", ".statusfilter_select", function() {
			
			// 전체 선택하는 경우
			if($(this).val() == "all") {
				statusListFn(); // 전체 리스트 조회하는 함수 실행
			
			} else {
				
				let aprvStatus = $(".statusfilter_select").val(); // 상태값 변수에 담기
				
				$.ajax({
					
					type: "post",
					url: "statusConditionList.do",
					data: { aprvStatus : aprvStatus,
							drafter : "${ loginUser.empNo }" },
							// AprvDoc 에 있는 필드 이용하기 위해 이름 drafter 로 넘기기
					success: function(list) {
					
						console.log(list);
						
						$tbody = $('.statusList_tbody'); // 리스트가 들어갈 tbody
		            	$tbody.html('');
						
	                	
	                	if(list.length == 0) {
	                		
	                		var $noListTh = $("<th colspan='6'>").text("해당 상태에 대한 문서가 존재하지 않습니다.").addClass("noStatusList");
	                		var $noListTr = $('<tr>').append($noListTh);
	                		
							$tbody.append($noListTr);
	                	
	                	} else {
							
	                		$.each(list, function(i, obj) {
	                			
	                			var $tr = $('<tr>');
	                			var $docNo = $('<td>').text(obj.docNo);
	                			var $docForm = $('<td>').text(obj.docForm);
	                			var $docType = $('<input type="hidden" id="docType" name="docType" value=' 
	                								+ obj.docType+'/>');
	                			
	                			if(obj.docTitle != null) {
	                				var $docTitle = $('<td>').text(obj.docTitle).addClass("docTitleTd").attr("title", obj.docTitle);
	                			
	                			} else {
	                				var $docTitle = $('<td>').text(obj.docForm).addClass("docTitleTd");
	                			}
	                			
	                			var $drafter = $('<td>').text(obj.drafter);
	                			var $draftDate = $('<td>').text(obj.draftDate);
	                			var $aprvStatusName = $('<td>').text(obj.aprvStatusName).addClass("statusName");
	                			
	                			// 진행 상태에 따른 글자색 변경 위해
	                			if(obj.aprvStatus == 1) {
	                				$aprvStatusName.addClass("status1");
	                				
	                				// 상태가 진행 중인 경우 현재 결재자 조회하는 ajax
	                				$.ajax({
	                					
	                					type: "post",
	                					url: "selectApprover.do",
	                					data: { docNo : obj.docNo },
	                					success: function(approver) {
	                						console.log(approver);
	                						
	                						$aprvStatusName.append(" (" + approver + ")");	                					}
	                					
	                				});
	                				
	                			} else if(obj.aprvStatus == 4) {
	                				$aprvStatusName.addClass("status4");
	                			}
	                			
	                			$tr.append($docNo);
	                			$tr.append($docForm);
	                			$tr.append($docType);
	                			$tr.append($docTitle);
	                			$tr.append($drafter);
	                			$tr.append($draftDate);
	                			$tr.append($aprvStatusName);
	                			
	                			$tbody.append($tr);
	                		});
	                	}
						
					}
					
				});
			}
			
		});
		
		
	
		// 게시글 클릭 시
		$(".statusList_table tbody").on("click", "tr", (function() {
			
			let docNo = $(this).find("td:eq(0)").text(); // 클릭한 문서의 문서 번호 가져와서 담기
			let docType = $("#docType").val();
			console.log(docNo);
			console.log(docType);
			
			location.href = "statusnDetail.do?docNo=" + docNo;
		}));
		
		
		$(".searchBtn").click(function() {
			
		})
		
	</script>

</body>
</html>