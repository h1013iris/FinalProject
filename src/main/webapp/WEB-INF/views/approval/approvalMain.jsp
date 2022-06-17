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
		/*border: 1px solid;*/
	}
	
	.aprvMain_upper {
		/*border: 1px solid blue;*/
		width: 100%;
		height: 38vh;
		display: flex;
		justify-content: space-between;
	}
	
	.aprvList_title_div {
		display: flex;
		justify-content: space-between;
		height: 10%;
		padding-bottom: 5px;
		margin-bottom: 1%;
		border-bottom: 1px solid;
	}
	
	.aprvMenu {
		list-style: none;
		color: black;
		text-decoration: none;
	}
	
	.aprvMenu:hover {
		cursor: pointer;
		color: #40A0FF;
	}
	
	.docRequest_list {
		width: 46%;
		background-color: #f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.docWaiting_list {
		width: 46%;
		background-color: #f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.docComplete_list {
		width: 46%;
		background-color: #f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.aprvMain_lower {
		/*border: 1px solid blue;*/
		margin-top: 15px;
		width: 100%;
		display: flex;
		height: 38vh;
		justify-content: space-between;
	}
	
	.docStatus_list {
		width: 100%;
		background-color: #f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.aprvList_title {
		font-size: 23px;
		font-weight: 650;
	}
	
	.aprvList_header {
		display: flex;
		flex-wrap: wrap;
		align-content: center;
	    text-align: center;
	    line-height: 3vh;
	}
	
	.aprvList_header div {
		border-top: 1px solid #afafaf;
		border-bottom: 1px solid #afafaf;
	    flex: 1 1 13%;
	    height: 3vh;
	    background-color: #afafaf;
	    font-size: 17px;
	    font-weight: bold;
	}
	
	.aprvList_main {
		height: 26vh;
		overflow-y : scroll;
	}
	
	.aprvList_main::-webkit-scrollbar{
    	display: none;
	}
	
	.aprvList_row {
		display: flex;
		flex-wrap: wrap;
		align-content: center;
	    text-align: center;
	    line-height: 3vh;
	}
	
	.aprvList_row div {
		border-bottom: 1px solid darkgray;
	    flex: 1 1 13%;
	    height: 3vh;
	    background-color: lightgray;
	}
	
	.aprvList_row div:hover {
		cursor: pointer;
		background-color: rgb(174, 217, 248);
		box-shadow: 0 0 8px #4c87b099;
	}
	
	.status1 { color: blue; }
	
	.status4 { color: red; }

	
	.search_area {
		border: 1px solid blue;
		width: 100%;
		display: flex;
		margin-top: 15px;
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
	        	<c:if test="${ loginUser.jobNo < 4 }">
	        		<div class="docRequest_list">
	        			<div class="aprvList_title_div">
		        			<div class="aprvList_title"><span>결재 요청</span></div>
		        			<div>
		        				<a class="aprvMenu requestMenu" href="requestMain.do">> 더보기</a>
	        				</div>
	        			</div>
	        			<div class="">
	        				<div class="aprvList_header">
	        					<div>문서 번호</div>
	        					<div>제목</div>
	        					<div>요청일</div>
	        				</div>
	        				<div class="aprvList_main requestList_main">
	        					
	        				</div>
	        			</div>
	        		</div>
	        	</c:if>
	        	<%-- 직급이 대리 이상인 경우 대기 리스트 띄우기 --%>
	        	<c:if test="${ loginUser.jobNo >= 4 }">
	        		<div class="docWaiting_list">
	        			<div class="aprvList_title_div">
		        			<div class="aprvList_title"><span>결재 대기</span></div>
		        			<div>
		        				<a class="aprvMenu waitingMenu" href="waitingMain.do">> 더보기</a>
	        				</div>
	        			</div>
	        			<div class="">
	        				<div class="aprvList_header">
	        					<div>문서 번호</div>
	        					<div>제목</div>
	        					<div>기안자</div>
	        				</div>
	        				<div class="aprvList_main waitingList_main">
	        					
	        				</div>
	        			</div>
	        		</div>
	        	</c:if>
	        	
	        	<div class="docComplete_list">
	        		<div class="aprvList_title_div">
		        		<div class="aprvList_title"><span>결재 완료</span></div>
		        		<div>
		        			<a class="aprvMenu completeMenu" href="completeMain.do">> 더보기</a>
		        		</div>
	        		</div>
	        		<div class="">
	        			<div class="aprvList_header">
	       					<div>문서 번호</div>
	       					<div>제목</div>
        					<div>기안자</div>
        				</div>
        				<div class="aprvList_main completeList_main">
        					
        				</div>
        			</div>
	        	</div>
	       	</div>
	       	
	       	<!-- 하단 -->
	       	<div class="aprvMain_lower">
	        	<div class="docStatus_list">
	        		<div class="aprvList_title_div">
		        		<div class="aprvList_title"><span>진행 상황 확인</span></div>
		        		<div>
		        			<a class="aprvMenu statusMenu" href="statusMain.do">> 더보기</a>
	        			</div>
	        		</div>
	        		<div class="">
	        			<div class="aprvList_header">
	       					<div>문서 번호</div>
	       					<div>제목</div>
	       					<div>기안자</div>
	       					<div>상태</div>
	       				</div>
	       				<div class="aprvList_main statusList_main">
		       				
	       				</div>
        			</div>
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
			
			} else {
			
				requestListFn();	// 결재 요청 리스트
				
				waitingListFn();	// 결재 대기 리스트
				
				completeListFn();	// 결재 완료 리스트
				
				statusListFn();		// 진행 상황 확인 리스트
			}
			
		});
	 	
	 	
	 	// 결재 요청 리스트
	 	function requestListFn() {
	 		
	 		$.ajax({
	 			
	 			type: "post",
                url: "requestList.do",
                data: { empNo : "${ loginUser.empNo }",
                		jobNo : "${ loginUser.jobNo }" },
                success: function (list) {
					
                	console.log(list)
                	
                	$tbody = $('.requestList_main'); // 리스트가 들어갈 div
                	$tbody.html('');
                	
                	if(list.length == 0) {
                		
                		var $noListTd = $("<div>").text("결재 요청한 문서가 존재하지 않습니다.").addClass("noRequestList");
                		var $noListTr = $('<div>').append($noListTd);
                		
						$tbody.append($noListTr);
                	
                	} else {
						
                		$.each(list, function(i, obj) {
                			
                			var $tr = $('<div class="aprvList_row">');
                			var $docNo = $('<div>').text(obj.docNo);
                			var $docType = $('<input type="hidden" id="docType" name="docType" value=' 
    								+ obj.docType+'/>');
                			
                			if(obj.docTitle != null) {
                				var $docTitle = $('<div>').text(obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<div>').text(obj.docForm);
                			}
                			
                			var $proDate = $('<div>').text(obj.proDate);
                			
                			$tr.append($docNo);
                			$tr.append($docTitle);
                			$tr.append($proDate);
                			
                			$tbody.append($tr);
                		});
                	}
                }
                		
	 		});
	 	}
	 	
	 	
	 	// 결재 대기 리스트
	 	function waitingListFn() {
	 		
	 		$.ajax({
				
				type: "post",
                url: "waitingList.do",
                data: { empNo : "${ loginUser.empNo }",
                		jobNo : "${ loginUser.jobNo }" },
                success: function (list) {
					
                	console.log(list)
                	
                	$tbody = $('.waitingList_main'); // 리스트가 들어갈 tbody
                	$tbody.html('');
                	
                	if(list.length == 0) {
                		
                		var $noListTd = $("<div>").text("결재 대기 중인 문서가 존재하지 않습니다.").addClass("noWaitingList");
                		var $noListTr = $('<div>').append($noListTd);
                		
						$tbody.append($noListTr);
                	
                	} else {
						
                		$.each(list, function(i, obj) {
                			
                			var $tr = $('<div class="aprvList_row">');
                			var $docNo = $('<div>').text(obj.docNo);
                			var $docType = $('<input type="hidden" id="docType" name="docType" value='+obj.docType+'/>');
                			
                			if(obj.docTitle != null) {
                				var $docTitle = $('<div>').text(obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<div>').text(obj.docForm);
                			}
                			
                			var $drafter = $('<div>').text(obj.drafter);
                			
                			$tr.append($docNo);
                			$tr.append($docType);
                			$tr.append($docTitle);
                			$tr.append($drafter);
                			
                			$tbody.append($tr);
                		});
                	}
                }
			});
	 	}
	 	
	 	
	 	// 결재 완료 리스트
	 	function completeListFn() {
	 		$.ajax({
				
				type: "post",
                url: "completeList.do",
                data: { empNo : "${ loginUser.empNo }",
                		jobNo : "${ loginUser.jobNo }" },
                success: function (list) {
					
                	console.log(list)
                	
                	$tbody = $('.completeList_main'); // 리스트가 들어갈 tbody
                	$tbody.html('');
                	
                	if(list.length == 0) {
                		
                		var $noListTd = $("<div>").text("결재 완료된 문서가 존재하지 않습니다.").addClass("noCompleteList");
                		var $noListTr = $('<div>').append($noListTd);
                		
						$tbody.append($noListTr);
                	
                	} else {
						
                		$.each(list, function(i, obj) {
                			
                			var $tr = $('<div class="aprvList_row">');
                			var $docNo = $('<div>').text(obj.docNo);
                			var $docType = $('<input type="hidden" id="docType" name="docType" value=' 
    								+ obj.docType+'/>');
                			
                			if(obj.docTitle != null) {
                				var $docTitle = $('<div>').text(obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<div>').text(obj.docForm);
                			}
                			
                			var $drafter = $('<div>').text(obj.drafter);
                			
                			$tr.append($docNo);
                			$tr.append($docTitle);
                			$tr.append($drafter);
                			
                			$tbody.append($tr);
                		});
                	}
                }
			});
	 	}
	 
	 	
	 	// 진행 상황 확인 리스트
	 	function statusListFn() {
	 		
			$.ajax({
				
				type: "post",
                url: "statusList.do",
                data: { drafter : "${ loginUser.empNo }" },
                success: function (list) {
					
                	console.log(list)
                	
                	$tbody = $('.statusList_main'); // 리스트가 들어갈 tbody
                	$tbody.html('');
                	
                	if(list.length == 0) {
                		
                		var $noListTd = $("<div>").text("진행 상태를 확인할 문서가 존재하지 않습니다.").addClass("noStatusList");
                		var $noListTr = $('<div>').append($noListTd);
                		
						$tbody.append($noListTr);
                	
                	} else {
						
                		$.each(list, function(i, obj) {
                			
                			var $tr = $('<div class="aprvList_row">');
                			var $docNo = $('<div>').text(obj.docNo);
                			var $docType = $('<input type="hidden" id="docType" name="docType" value=' 
                								+ obj.docType+'/>');
                			
                			if(obj.docTitle != null) {
                				var $docTitle = $('<div>').text(obj.docTitle).addClass("docTitleTd").attr("title", obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<div>').text(obj.docForm).addClass("docTitleTd");
                			}
                			
                			var $drafter = $('<div>').text(obj.drafter);
                			var $aprvStatusName = $('<div>').text(obj.aprvStatusName).addClass("statusName");
                			
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
                			$tr.append($docType);
                			$tr.append($docTitle);
                			$tr.append($drafter);
                			$tr.append($aprvStatusName);
                			
                			$tbody.append($tr);
                		});
                	}
                }
			});
	 	}
	 	
	 	
	 	
	 	
	 	
	 	
    
    </script>

</body>
</html>