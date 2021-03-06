<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 완료함</title>
<style type="text/css">
	
	.mainDiv {
		padding: 50px 100px 80px 100px;
		text-align: center;
	}
	
	.completeList_area {
		width: 100%;
		border: 1px solid #e6e6e6;
		background-color: #e6e6e6;
		border-radius: 15px;
		box-shadow: 0 0 8px #afafaf;
	}
	
	.completeList_table>tbody>tr:hover {
		background: rgb(174, 217, 248);
		box-shadow: 0 0 8px #4c87b099;
		cursor: pointer;
	}
	
	.completeList_table {
		width: 97%;
		margin: auto;
		table-layout: fixed;
	}
	
	.completeList_table td {
		border-top: 1px solid darkgray;
		padding: 15px;
	}
	
	/* 말줄임표 CSS */
	.completeList_table .completeList_tbody td {
       	white-space: nowrap;
       	text-overflow: ellipsis;
       	overflow: hidden;
	}
	
	.completeList_table th {
		padding: 15px;
		background-color: darogray;
	}
	
	.completeList_thead {
		font-weight: 900;
		font-size: 16px;
	}
	
	.noCompleteList {
		color: blue;
	}
		
	.filter_dropdown, .filter_initialize {
		margin: 5px 10px;
		position: relative;
		display: inline-block;
		border: none;
		cursor: pointer;
	}
	
	.initialize_btn {
		content: '';
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
	
	.pagingArea {
		width: 100%;
		display: flex;
		text-align: center;
		padding-top: 35px;
		justify-content: center;
	}
	
	.pagingArea ul {
		list-style: none;
	    margin: 0;
	    padding: 0;
	}
	
	.pagingArea li {
		margin: 5px;
	    padding: 0;
	    border : 0;
	    float: left;
	    cursor: pointer;
	}
	
	.page-item, .page-num {
		width: 40px;
		height: 40px;
		line-height: 40px !important;
	}
	
	.disabled {
		background-color: #b3ddff !important;
		box-shadow: 0px 5px 0px 0px #97c1e2 !important;
	}
	
	.disabled:hover {
		box-shadow: 0px 0px 0px 0px #97c1e2 !important;
	}
	

</style>

</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
	<div class="main_section">
        <div class="mainDiv">
        
        	<div class="docSearch_area">
        		<div class="filter_initialize">
	        		<button class="initialize_btn">검색 초기화</button>
        		</div>
        		
        		<div class="filter_dropdown">
	        		<button class="dropdown_btn docFormDefault">문서 유형</button>
	        		<ul class="dropdown_content docFormfilter">
	        			<li>전체</li>
	        			<%-- 문서 유형 출력 --%>
	        		</ul>
        		</div>
        		
        		<div class="filter_dropdown">
        			<button class="dropdown_btn conditionDefault">검색 조건</button>
        			<ul class="dropdown_content conditionfilter">
	        			<li>문서 번호</li>
	        			<li>제목</li>
	        			<li>내용</li>
	        		</ul>
        		</div>
        		
        		<div class="search_div">
        			<div class="searchInput_div"><input id="search" name="search"/></div>
        			<div class="searchImg_div"><img src="https://img.icons8.com/material/24/000000/search--v1.png"></div>
        		</div>
        	</div>
        	
			<div class="completeList_area">
				<table class="completeList_table">
					<colgroup>
						<col width="80px">
						<col width="120px">
						<col width="300px">
						<col width="80px">
						<col width="100px">
						<col width="100px">
					</colgroup>
					
					<thead class="completeList_thead">
						<tr>
	                 		<th>No</th>
		                  	<th>문서 유형</th>
		                   	<th>제목</th>
		                   	<th>기안자</th>
		                   	<th>기안일</th>
		                   	<th>완료일</th>
	                 	</tr>
	       			</thead>
	       			<tbody class="completeList_tbody">
						
	        		</tbody>
	         	</table>
	    	</div>
	    	
	    	<!-- 페이징바 만들기 -->
			<div class="pagingArea">
				<%-- 페이징바 들어갈 부분 --%>
			</div>
	       	
		</div>
    </div>


	<script type="text/javascript">
	
		// 화면 로드 시 리스트 불러오기
		$(document).ready(function() {
			
			$(".page_title>.title_name").text("결재 완료 문서함");
			
			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {
				loginFn(); // 로그인 먼저
			
			} else {
				docTypeListFn(); 	// 문서 타입 리스트 조회해서 li에 넣는 함수 실행
				completeListFn();	// 요청 리스트 조회
			}

		});
		
		
		// 리스트 조회
		function completeListFn(num) {
			
			$.ajax({
				
				type: "post",
                url: "completeList.do",
                data: { drafter : "${ loginUser.empNo }",
                		currentPage : num },
                success: function (result) {
					                	
                	$tbody = $('.completeList_tbody'); // 리스트가 들어갈 tbody
                	$tbody.html('');
                	
                	if(result.list.length == 0) {
                		
                		var $noListTh = $("<th colspan='6'>").text("결재 완료된 문서가 존재하지 않습니다.").addClass("noCompleteList");
                		var $noListTr = $('<tr>').append($noListTh);
                		
						$tbody.append($noListTr);
                	
                	} else {
						
                		$.each(result.list, function(i, obj) {
                			
                			var $tr = $('<tr>').addClass("yesCompleteList");
                			var $docNo = $('<td>').text(obj.docNo);
                			var $docForm = $('<td>').text(obj.docForm).attr("title", obj.docForm);
                			
                			if(obj.docTitle != null) {
                				var $docTitle = $('<td>').text(obj.docTitle).attr("title", obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<td>').text(obj.docForm);
                			}
                			
                			var $drafter = $('<td>').text(obj.drafter).attr("title", obj.drafter);
                			var $draftDate = $('<td>').text(obj.draftDate).attr("title", obj.draftDate);
                			var $proDate = $('<td>').text(obj.proDate).attr("title", obj.proDate);
                			
                			$tr.append($docNo);
                			$tr.append($docForm);
                			$tr.append($docTitle);
                			$tr.append($drafter);
                			$tr.append($draftDate);
                			$tr.append($proDate);
                			
                			$tbody.append($tr);
                		});
                		
                		// 페이징 처리
                        let bar = '';
                        let currentPage = result.currentPage;	// 현재 페이지
                        let startPage = result.startPage;		// 시작 페이지
                        let endPage = result.endPage; 			// 끝 페이지
                        let maxPage = result.maxPage; 			// 최대 페이지
                        
                        bar += '<ul class="pagination">';
                        
                        if(currentPage != 1) {
                        	bar += '<li class="page-item commonButton1" onclick="completeListFn(' + parseInt(currentPage-1) + ');"><</li>'
                        
                        } else {
                        	bar += '<li class="page-item disabled commonButton1"><</li>'
                        }
                            
                        for(var i = startPage; i <= endPage; i++) {
                           
                        	if(i != currentPage) {
                        	   bar += '<li class="page-num commonButton1" onclick="completeListFn(' + i + ');">'+ i +'</li>'
                           
                           } else {
                        	   bar += '<li class="page-num disabled commonButton1">'+ i +'</li>'
                           }
                        }
                             
                       	if(currentPage != maxPage) {
                            bar += '<li class="page-item commonButton1" onclick="completeListFn(' + parseInt(currentPage+1) + ');">></li>'
                        
                       	} else {
                        	bar += '<li class="page-item disabled commonButton1">></li>'
                        }
                             
                        bar += '</ul>';
                            
                        $(".pagingArea").html(bar);
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
		
		
		// 초기화 버튼 클릭 시
		$(document).on("click", ".initialize_btn", function() {
			// 전체 리스트 조회하는 함수 실행
			completeListFn();
			// 필터 비워주기
			$(".docFormDefault").text("문서 유형");
			$(".conditionDefault").text("검색 조건");
			$("#search").val("");
		});
		
		
		// 문서 유형
		$(".docFormfilter").on("click", "li", function() {
			// 각 필터와 검색어 변수에 담기
			let docForm = $(this).text();
			let condition = $(".conditionDefault").text();
			let search = $("#search").val();
			
			// 버튼 text 변경
			$(".docFormDefault").text(docForm);
			
			// 필터 및 검색어에 따른 리스트 조회
			filterCompleteListFn(docForm, condition, search);
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
			let docForm = $(".docFormDefault").text();
			let condition = $(".conditionDefault").text();
			let search = $("#search").val();
			
			// 필터 및 검색어에 따른 리스트 조회
			filterCompleteListFn(docForm, condition, search);
		});
		
		
		// 필터 및 검색 내용에 따른 리스트 조회
		function filterCompleteListFn(docForm, condition, search, num) {
			
			$.ajax({
				
				type: "post",
                url: "completeList.do",
                data: { drafter : "${ loginUser.empNo }",
						docForm : docForm,
						condition : condition,
						search : search,
						currentPage : num },
                success: function (result) {
					                	
                	$tbody = $('.completeList_tbody'); // 리스트가 들어갈 tbody
                	$tbody.html('');
                	
                	if(result.list.length == 0) {
                		
                		var $noListTh = $("<th colspan='6'>").text("검색 조건에 해당하는 문서가 존재하지 않습니다.").addClass("noCompleteList");
                		var $noListTr = $('<tr>').append($noListTh);
                		
						$tbody.append($noListTr);
                	
                	} else {
						
                		$.each(result.list, function(i, obj) {
                			
                			var $tr = $('<tr>').addClass("yesCompleteList");
                			var $docNo = $('<td>').text(obj.docNo);
                			var $docForm = $('<td>').text(obj.docForm).attr("title", obj.docForm);
                			
                			if(obj.docTitle != null) {
                				var $docTitle = $('<td>').text(obj.docTitle).attr("title", obj.docTitle);
                			
                			} else {
                				var $docTitle = $('<td>').text(obj.docForm);
                			}
                			
                			var $drafter = $('<td>').text(obj.drafter).attr("title", obj.drafter);
                			var $draftDate = $('<td>').text(obj.draftDate).attr("title", obj.draftDate);
                			var $proDate = $('<td>').text(obj.proDate).attr("title", obj.proDate);
                			
                			$tr.append($docNo);
                			$tr.append($docForm);
                			$tr.append($docTitle);
                			$tr.append($drafter);
                			$tr.append($draftDate);
                			$tr.append($proDate);
                			
                			$tbody.append($tr);
                		});
                		
                		// 페이징 처리
                        let bar = '';
                        let currentPage = result.currentPage;	// 현재 페이지
                        let startPage = result.startPage;		// 시작 페이지
                        let endPage = result.endPage; 			// 끝 페이지
                        let maxPage = result.maxPage; 			// 최대 페이지
                        
                        bar += '<ul class="pagination">';
                        
                        if(currentPage != 1) {
                        	bar += '<li class="page-item commonButton1" onclick="filterCompleteListFn(`' + docForm + '`,`' + condition + '`,`' + search + '`,`' + parseInt(currentPage-1) + '`);"><</li>'
                        
                        } else {
                        	bar += '<li class="page-item disabled commonButton1"><</li>'
                        }
                            
                        for(var i = startPage; i <= endPage; i++) {
                           
                        	if(i != currentPage) {
                        	   bar += '<li class="page-num commonButton1" onclick="filterCompleteListFn(`' + docForm + '`,`' + condition + '`,`' + search + '`,`' + i + '`);">'+ i +'</li>'
                           
                           } else {
                        	   bar += '<li class="page-num disabled commonButton1">'+ i +'</li>'
                           }
                        }
                             
                       	if(currentPage != maxPage) {
                            bar += '<li class="page-item commonButton1" onclick="filterCompleteListFn(`' + docForm + '`,`' + condition + '`,`' + search + '`,`' + parseInt(currentPage+1) + '`);">></li>'
                        
                       	} else {
                        	bar += '<li class="page-item disabled commonButton1">></li>'
                        }
                             
                        bar += '</ul>';
                            
                        $(".pagingArea").html(bar);
                	}
                }
			});
		}
		
	
		// 게시글 클릭 시
		$(".completeList_table tbody").on("click", ".yesCompleteList", function() {
			
			let docNo = $(this).find("td:eq(0)").text(); // 클릭한 문서의 문서 번호 가져와서 담기
			location.href = "completeDetail.do?docNo=" + docNo;
		});
	
	</script>

	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
	
</body>
</html>