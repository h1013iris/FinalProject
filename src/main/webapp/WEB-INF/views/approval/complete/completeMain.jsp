<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 완료함</title>
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
		margin-bottom: 3%;
	}
	
	.table {
		width: 100%;
		margin: auto;
		padding: auto;
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
	
	.pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */

</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
	<div class="main_section">
		<div class="mainDiv">
        
        	<div class="list div">
        		<table class="table">
	        		<thead class="thead">
	   					<tr>
	   						<th width="10%">문서 번호</th>
	   						<th width="13%">유형</th>
	   						<th width="50%">제목</th>
	   						<th width="10%">기안자</th>
	   						<th width="13%">완료일</th>
	   					</tr>
	   				</thead>
	   				<tbody>
						<c:forEach items="${ list }" var="list">
		                    <tr>
		                        <c:if test="${ !empty list }">
		                        	<td>${ list.docNo }</td>
			                        <td>${ list.docType }</td>
			                        <td>${ list.docTitle }</td>
			                        <td>${ list.drafter }</td>
			                        <td>${ list.comDate }</td>
		                        </c:if>
		                        <c:if test="${ empty list }">
		                        	<td>결재 완료된 문서가 없습니다.</td>
		                        </c:if>
		                    </tr>
                    	</c:forEach>
	   				</tbody>
	        	</table>
        	</div>
        	
        	
      		<!-- 페이징바 만들기 -->
			<div class="pagingArea" align="center">
				<!-- 맨 처음으로 (<<) -->
				<button class="btn" onclick="location.href='<%=request.getContextPath()%>/noticeList.do?currentPage=1'" > &lt;&lt; </button>
			
				<!-- 이전페이지로(<) -->
				<c:choose>
					<%-- 현재 페이지가 1인 경우 --%>
					<c:when test="${pi.currentPage == 1}">
						<%-- 이전 페이지로 가는 버튼 비활성화 --%>
						<button class="btn" disabled> &lt; </button>
					</c:when>
					<%-- 그 외에는 --%>
					<c:otherwise>
						<%-- 현재 페이지에서 하나 뺀 페이지로 이동하도록 --%>
						<button class="btn" onclick="location.href='<%= request.getContextPath() %>/noticeList.do?currentPage=${pi.currentPage - 1}'"> &lt; </button>
					</c:otherwise>
				</c:choose>
				 
				<!-- 페이지 목록 -->
				<%-- var : for문 안에서 사용할 변수명 / begin : 초기값 / end : 최대값 / step : 증가값 --%>
				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
					<c:choose>
						<%-- 현재 페이지에 해당하는 버튼 비활성화 --%>
						<c:when test="${p == pi.currentPage}">
							<button class="btn" disabled> ${p} </button>
						</c:when>
						<%-- 그 외에는 클릭하면 해당 페이지로 넘어가도록 --%>
						<c:otherwise>
							<button class="btn" onclick="location.href='<%=request.getContextPath() %>/noticeList.do?currentPage=${p}'"> ${p} </button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음페이지로(>) -->
				<c:choose>
					<%-- 현재 페이지가 마지막 페이지인 경우 --%>
					<c:when test="${pi.currentPage == pi.maxPage}">
						<%-- 다음 페이지로 가는 버튼 비활성화 --%>
						<button class="btn" disabled> &gt; </button>
					</c:when>
					<%-- 그 외에는 --%>
					<c:otherwise>
						<%-- 현재 페이지에서 하나 더한 페이지로 이동하도록 --%>
						<button class="btn" onclick="location.href='<%= request.getContextPath() %>/noticeList.do?currentPage=${pi.currentPage + 1}'"> &gt; </button>
					</c:otherwise>
				</c:choose>
			
				<!-- 맨 끝으로 (>>) -->
				<button class="btn" onclick="location.href='<%=request.getContextPath()%>/noticeList.do?currentPage=${pi.maxPage}'"> &gt;&gt; </button>
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