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
		padding: 50px 100px 0 100px;
	}
	
	.aprvMain_upper {
		width: 100%;
		height: 40vh;
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
		width: 47.5%;
		background-color: #f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.docWaiting_list {
		width: 47.5%;
		background-color: #f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.docComplete_list {
		width: 47.5%;
		background-color: #f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	
	.aprvMain_lower {
		margin-top: 15px;
		width: 100%;
		display: flex;
		height: 40vh;
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
	    background-color: lightgray;
	}
	
	.aprvList_row div {
		border-bottom: 1px solid darkgray;
	    flex: 1 1 13%;
	    height: 3vh;
	}
	
	.aprvList_row:hover {
		cursor: pointer;
		background-color: rgb(174, 217, 248);
		box-shadow: 0 0 8px #4c87b099;
	}
	
	.status1 { color: blue; }
	
	.status4 { color: red; }

	
	.filter_dropdown * { box-sizing: border-box; }
	
	.filter_dropdown, .filter_initialize {
		margin: 5px 20px 5px 0;
		position: relative;
		display: inline-block;
		border: none;
		cursor: pointer;
	}
	
	.initialize_btn {
		/*content: '';*/
  		display: block;
		border: none;
		border-radius: 4px;
		background-color: #85d0ff;
		width: 120px;
		padding: 7px 0;
		font-size: 15px;
	}
	
	.dropdown_btn {
		content: '';
  		display: block;
		border: none;
		border-radius: 4px;
		background-color: #bce7ff;
		width: 120px;
		padding: 7px 0;
		font-size: 15px;
	}
	
	.docFormDefault { width: 200px; }
	
	.dropdown_content {
		display: none;
		border-radius: 4px;
		position: absolute;
		background-color: #bce7ff;
		box-shadow: 0 8 10 6 rgba(0, 0, 0, 0.2);
		width: 100%;
		top: 40px;
	}
	
	.dropdown_content li {
		color: black;
		padding: 8px;
		text-decoration: none;
		display: block;
	}
	
	.dropdown_content li:hover { 
		background-color: #6ab6e4;
		border-radius: 4px;
		color: white;
	}
	
	.filter_initialize:hover .initialize_btn {
		background-color: #6ab6e4;
		color: white;
	}
	
	.filter_dropdown:hover .dropdown_content { display: block; }
		
	.filter_dropdown:hover .dropdown_btn { 
		background-color: #6ab6e4;
		color: white;
	}
	
	.docSearch_area {
		display: flex;
		padding: 10px 0 15px 0;
	}
	
	.search_div {
		display: flex;
		margin: 0 5px;
		padding: 5px 0;
	}
	
	.search_div input {
		border: 1px solid;
		margin-top: 2px;
		padding: 5px 10px;
		font-size: 15px;
		border-radius: 4px;
		border: 1px solid #93bedc;
		box-shadow: 2px 2px 2px #93bedc;
	}
	
	.search_div input:focus {
		outline: none;
		border: 1px solid #93bedc;
		box-shadow: 2px 2px 2px #93bedc;
	}
	
	.search_div img {
		padding: 7px;
	}
	
	.docList_area {
		width: 100%;
	}
	
	.searchDocList_table>tbody>tr:hover {
		background: rgb(174, 217, 248);
		box-shadow: 0 0 8px #4c87b099;
		cursor: pointer;
	}
	
	.searchDocList_table {
		width: 97%;
		margin: auto;
		table-layout: fixed;
	}
	
	.searchDocList_table td {
		border-top: 1px solid darkgray;
		padding: 15px;
	}
	
	.docTitleTd {
       	white-space: nowrap;
       	text-overflow: ellipsis;
       	overflow: hidden;
	}
	
	.searchDocList_table th {
		padding: 15px;
		background-color: darogray;
	}
	
	.searchDocList_thead {
		font-weight: 900;
		font-size: 16px;
	}
	
	.noSearchDocList {
		color: blue;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="main_section">
		<div class="aprvMain_div">
        	
        	<div class="docList_area">
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
			        		<div class="aprvList_title"><span>진행 상태 확인</span></div>
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
				
				$(".page_title>.title_name").text("전자 결재");
				
				aprvStatusFn();		// 문서 상태값 리스트 조회해서 li에 넣는 함수 실행
				
				docTypeListFn(); 	// 문서 타입 리스트 조회해서 li에 넣는 함수 실행
				
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
                url: "noPagingRequestList.do",
                data: { drafter : "${ loginUser.empNo }" },
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
                			var $docType = $('<input type="hidden" class="docType" name="docType" value=' 
    								+ obj.docType+'/>');
                			
                			if(obj.docTitle != null) {
                				var $docTitle = $('<div>').text(obj.docTitle).addClass("docTitleTd").attr("title", obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<div>').text(obj.docForm).addClass("docTitleTd").attr("title", obj.docForm);
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
                url: "noPagingWaitingList.do",
                data: { drafter : "${ loginUser.empNo }" },
                success: function(list) {
					
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
                				var $docTitle = $('<div>').text(obj.docTitle).addClass("docTitleTd").attr("title", obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<div>').text(obj.docForm).addClass("docTitleTd").attr("title", obj.docForm);
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
                url: "noPagingCompleteList.do",
                data: { drafter : "${ loginUser.empNo }" },
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
                				var $docTitle = $('<div>').text(obj.docTitle).addClass("docTitleTd").attr("title", obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<div>').text(obj.docForm).addClass("docTitleTd").attr("title", obj.docForm);
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
                url: "noPagingStatusList.do",
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
                				var $docTitle = $('<div>').text(obj.docForm).addClass("docTitleTd").attr("title", obj.docForm);
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
	 	
	 	
	 	// 상태값 리스트 조회하는 함수
		function aprvStatusFn() {
			
			$.ajax({
		 			
	 			type: "post",
                url: "selectAprvStatusList.do",
                success: function(list) {
                	
                	if(list != null || list != "") {
                		
                		let value = "";
                		
                		$.each(list, function(i) {
                			value += "<li>" + list[i].aprvStatus
                					+ "<input type='hidden' value='" + list[i].aprvStatusNo  + "'/>"
                					+ "</li>"
                		});
                		
                		$(".statusfilter").append(value);
                	}
                }
	 		});
		}
	 	
	 	
		// 문서 타입 리스트 조회해서 li에 넣는 함수
		function docTypeListFn() {
			
			$.ajax({
				
				type: "post",
				url: "selectDocTypeList.do",
				success: function(list) {
					
					if(list != null || list != "") {
                		
                		let value = "";
                		
                		$.each(list, function(i) {
                			value += "<li>" + list[i].docForm
                					+ "<input type='hidden' value='" + list[i].docTypeNo  + "'/>"
                					+ "</li>"
                		});
                		
                		$(".docFormfilter").append(value);
                	}
				}
			});
		}

		
		// 상태값
		$(".statusfilter").on("click", "li", function() {
			
			// 각 필터와 검색어 변수에 담기
			let aprvStatus = $(this).find("input").val();
			let aprvStatusName = $(this).text(); // 클릭한 상태값 text 변수에 담기
			let docForm = $(".docFormDefault").text();
			let condition = $(".conditionDefault").text();
			let search = $("#search").val();
			
			// 버튼 text 변경
			$(".statusDefault").text(aprvStatusName);
			
			// 필터 및 검색어에 따른 리스트 조회
			searchFilterFn(aprvStatusName, docForm, condition, search);
			
		});
		
		
		// 문서 유형
		$(".docFormfilter").on("click", "li", function() {
			
			// 각 필터와 검색어 변수에 담기
			//let aprvStatus = $(".statusDefault").find("input").val();
			let aprvStatusName = $(".statusDefault").text(); // 클릭한 상태값 text 변수에 담기
			let docForm = $(this).text();
			let condition = $(".conditionDefault").text();
			let search = $("#search").val();
			
			// 버튼 text 변경
			$(".docFormDefault").text(docForm);
			
			// 필터 및 검색어에 따른 리스트 조회
			searchFilterFn(aprvStatusName, docForm, condition, search);
			
		});
		
		
		// 검색 조건
		$(".conditionfilter").on("click", "li", function() {
			
			let condition = $(this).text();
			
			// 버튼 text 변경
			$(".conditionDefault").text(condition);
		});
		
		
		// 검색어
		$(".search_div").on("click", ".searchImg_div", function() {
			
			// 각 필터와 검색어 변수에 담기
			//let aprvStatus = $(this).find("input").val();
			let aprvStatusName = $(".statusDefault").text(); // 클릭한 상태값 text 변수에 담기
			let docForm = $(".docFormDefault").text();
			let condition = $(".conditionDefault").text();
			let search = $("#search").val();
			
			// 필터 및 검색어에 따른 리스트 조회
			searchFilterFn(aprvStatusName, docForm, condition, search);
			
		});
		
		
		// 필터 및 검색 내용에 따른 리스트 조회
		function searchFilterFn(aprvStatusName, docForm, condition, search) {
			
			console.log(aprvStatusName);
			console.log(docForm);
			console.log(condition);
			console.log(search);
			
			
			$.ajax({
				
				type: "get",
				url: "searchAllDocList.do",
				data: { drafter : "${ loginUser.empNo }",
						aprvStatusName : aprvStatusName,
						docForm : docForm,
						condition : condition,
						search : search },
						// AprvDoc 에 있는 필드 이용하기 위해 이름 drafter 로 넘기기
				success: function(list) {
				
					console.log(list);
					
					$listArea = $(".docList_area");
	            	$listArea.html('');
	            	
	            	$listArea.css("border", "1px solid #e6e6e6");
	            	$listArea.css("background-color", "#e6e6e6");
	            	$listArea.css("border-radius", "15px");
	            	$listArea.css("box-shadow", "0 0 8px #afafaf");
	            	
	            	var $table = $('<table>').addClass("searchDocList_table");
	            	var $colgroup = $('<colgroup>');
	            	var $col = '<col width="80px"><col width="120px"><col width="300px"><col width="80px"><col width="100px"><col width="130px">';
					var $thead = $('<thead>').addClass("searchDocList_thead");
					var $tr = $('<tr>');
					var $th1 = $('<th>').text('No');
					var $th2 = $('<th>').text('문서 유형');
					var $th3 = $('<th>').text('제목');
					var $th4 = $('<th>').text('기안자');
					var $th5 = $('<th>').text('기안일');
					var $th6 = $('<th>').text('상태');
					var $tbody = $('<tbody>').addClass("searchDocList_tbody");
					
					$table.append($colgroup);
					$colgroup.append($col);
					$table.append($thead);
					$table.append($tr);
					$table.append($th1);
					$table.append($th2);
					$table.append($th3);
					$table.append($th4);
					$table.append($th5);
					$table.append($th6);
					$table.append($tbody);
					
					$listArea.append($table);
                	
	            	$list = $('.searchDocList_tbody'); // 리스트가 들어갈 tbody
	            	
                	if(list.length == 0) {
                		
                		
                		var $noListTh = $("<th colspan='6'>").text("검색 조건에 해당하는 문서가 존재하지 않습니다.").addClass("noSearchDocList");
                		var $noListTr = $('<tr>').append($noListTh);
                		
						$list.append($noListTr);
                	
                	} else {
						
                		$.each(list, function(i, obj) {
                			
                			var $tr = $('<tr>');
                			var $docNo = $('<td>').text(obj.docNo);
                			var $docForm = $('<td>').text(obj.docForm);
                			var $docType = $('<input type="hidden" id="docType" name="docType" value='
                								+ obj.docType+'/>');
                			var $docTitle = $('<td>').text(obj.docTitle).addClass("docTitleTd").attr("title", obj.docTitle);
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
                						//console.log(approver);
                						
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
                			
                			$list.append($tr);
                		});
                	}
					
				}
				
			});
			
		};
	 	
	 	
    	// 결재 요청 문서 상세 조회
    	$(".requestList_main").on("click", ".aprvList_row", function() {
    		
    		let docNo = $(this).find("div:eq(0)").text();
    		location.href = "requestDetail.do?docNo=" + docNo;
    	});
    	
    	// 결재 대기 문서 상세 조회
    	$(".waitingList_main").on("click", ".aprvList_row", function() {
    		
    		let docNo = $(this).find("div:eq(0)").text();
    		location.href = "waitingDetail.do?docNo=" + docNo;
    	});
    	
    	// 결재 완료 문서 상세 조회
    	$(".completeList_main").on("click", ".aprvList_row", function() {
    		
    		let docNo = $(this).find("div:eq(0)").text();
    		location.href = "completeDetail.do?docNo=" + docNo;
    	});
    	
    	// 진행 상황 확인 문서 상세 조회
    	$(".statusList_main").on("click", ".aprvList_row", function() {
    		
    		let docNo = $(this).find("div:eq(0)").text();
    		location.href = "statusnDetail.do?docNo=" + docNo;
    	});
    
    </script>

</body>
</html>