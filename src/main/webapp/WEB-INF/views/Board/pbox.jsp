<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.all {
	width: 84vw;
}
#delete{
  color : red;
}
.pboxButton1{
	 width: 50px;
	 height: 50px;
     padding: 0;
     font-weight: 600;
     text-align: center;
     line-height: 50px;
     color: #FFF;
     border-radius: 5px;
     transition: all 0.2s ;
     background: #85cdff;
     border: #85cdff;
     box-shadow: 0px 5px 0px 0px #4c87b099;
 
 }
.pboxButton1:hover{
    position: relative;
    top: 5px;
    bottom: 5px;
    box-shadow: 0px 0px 0px 0px #4c87b099;
}
#pagingArea {
	width: fit-content;
	margin-left: 41%;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
	<div class="all">
	<hr>
		<div class="noticelist" style="padding: 5% 10%;">
				<table id="pboxList" class="table table-hover" align="center">

					<thead>
						<tr>						
							<th style="width: 700px; height: 40px;">제목</th>						
							<th style="width: 150px; height: 40px;">작성일</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${ list }" var="n">
							<tr>								
								<th style="height: 70px;"  >${ n.title }</th>							
								<th style="height: 70px;">${ n.pcreateDate }</th>
								
								<th><a id="delete">삭제</a></th>
								


							</tr>

						</c:forEach>

					</tbody>
					<c:if test="${ empty list }">
						<tr>
							<td colspan="5">존재하는 게시글이 없습니다.</td>
						</tr>
					</c:if>
				</table>

	
	</div>
		<div id="pagingArea">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<a class="page-link"
									href="pbox.do?currentPage=${ pi.currentPage-1 }"><button
										class="pboxButton1"><</button></a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href=""></a>
								<button class="pboxButton1"><</button>
								</a>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<a class="page-link" href="pbox.do?currentPage=${ p }"
										style="color: white"><button class="pboxButton1">${ p }</button></a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="" style="color: white"><button
											class="pboxButton1">${ p }</button></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<a class="page-link"
									href="pbox.do?currentPage=${ pi.currentPage+1 }"><button
										class="pboxButton1">></button></a>
							</c:when>
							<c:otherwise>
								<a class="page-link"
									href="pbox.do?currentPage=${ pi.currentPage+1 }"><button
										class="pboxButton1">></button></a>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
	
	</div>
</body>
</html>