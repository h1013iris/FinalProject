<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#boardList {
	text-align: center;
	
	
}

#sort {
	float: right;
}



.noticeButton1 {
	width: 250px;
	height: 80px;
	padding: 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background-color: #c8c8c8;
	border: #85cdff;
	box-shadow: 1px 5px 1px 1px #4c87b099;
}

.noticeButton2 {
	width: 50px;
	height: 50px;
	padding: 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background-color: #85cdff;
	border: #85cdff;
	box-shadow: 1px 10px 1px 1px #808080;
}
.goingsearchdept {
	width: 80px;
	height: 40px;
	padding: 0;
	font-weight: 600;
	text-align: center;
	line-height: 40px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background-color: #85cdff;
	border: #85cdff;
	box-shadow: 1px 4px 1px 1px #4c87b099;
}

.noticeButton1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}

.noticeButton2:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 2px 2px #4c87b099;
}
.goingsearchdept:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}

.ham {
	margin-left: 16%;
}

#bu3 {
	background-color: #85cdff;
}


.noticelist {
	width: 84vw;
	margin-left : 5%;
	
}

#pagingArea {
	text-align: center;
}

#tex {
	width: 300px;
	height: 30px;
}

.dpAll {
	display: flex;
	margin-left: 58%;
    
}
.select {
  -o-appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none; 
    width: 170px;
  height: 40px;
  background-color: #f5f5f5;
  color: rgb(37, 37, 37);
  border: 1px solid rgb(133, 205, 255);

}
.dropdown{
height:110px;
margin-top:1%;
}
.dropdown2{
margin-top:1%;
}

.deptlistboardtable{
 text-align: -webkit-center;
}
.dropdown1{
text-align:center;
}
.all{
padding-top : 50px;
}
.selectdeptsearch {
  -o-appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none; 
    width: 60px;
  height: 40px;
  background-color: #f5f5f5;
  color: rgb(37, 37, 37);
  border: 1px solid rgb(133, 205, 255);

}
.searchconditiondept{
   width: 250px;
  height: 40px;
}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">

		<div class="all">

			<div class="ham">

				<a href="notice.do"><button class="noticeButton1" id="bu1">????????????</button></a>
				<a href="free.do"><button class="noticeButton1" id="bu2">???????????????</button></a>
				<a href="depart.do"><button class="noticeButton1" id="bu3">???????????????</button></a>
				<a href="anonymous.do"><button class="noticeButton1" id="bu4">???????????????</button></a>
			</div>
            <form id="standup" action="standup.do" method="post">
			<div class="dpAll">
				<div id="nold" class="dropdown">
					<select id="noro" class="select" name="nold" onchange="this.form.submit()">		<!-- ????????? ?????? ???????????? -->	
					    	<!-- ?????? ????????? ???????????? controller?????? ??????????????? ?????? ?????? ????????? selected??? ????????? ??? ?????? ??????  -->
						<option id="noro1" class="nol" value="?????????" ${nold == "?????????" ? 'selected="selected"' : '' }>?????????</option>
						<option id="noro2" class="nol" value="????????????"${nold == "????????????" ? 'selected="selected"' : '' }>????????????<option>
					</select>				
				</div>
				<div id="con" class="dropdown2">
					<select id="deptconditions" class="select" name="con" onchange="this.form.submit()">
					<c:forEach items="${ conditions }" var="c">
					<!-- ?????? ????????? ???????????? controller?????? ??????????????? ?????? ?????? ????????? selected??? ????????? ??? ?????? ??????  -->
						<option class="dpt" value="${c.deptno}" ${c.deptno == con ? 'selected="selected"' : ''}>${c.deptname}</option>
						</c:forEach>
					</select>						
				</div>
				</div>
			</form>
			</div>
			<div class="noticelist">
			 <div class="deptlistboardtable">
				<table id="boardList" class="table table-hover" >
					<thead>
						<tr>
							<th style="width: 50px; height: 50px;">?????????</th>
							<th style="width: 700px; height: 50px;">??????</th>
							<th style="width: 150px; height: 50px;">?????????</th>
							<th style="width: 150px; height: 50px;">?????????</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ list }" var="b">
							<tr>
								<td style="height: 70px;">${ b.writeno }</td>
								<td style="height: 70px;">${ b.title }</td>
								<td style="height: 70px;">${ b.writer }</td>
								<td style="height: 70px;">${ b.createDate }</td>
							</tr>
						</c:forEach>
					</tbody>

					<c:if test="${ empty list }">
						<tr>
							<td colspan="5">???????????? ???????????? ????????????.</td>
						</tr>
					</c:if>
				</table>
				</div>
				<br>
				<div id="pagingArea">
					<ul class="pagination">
					 <c:if test="${pi.currentPage ne 1}">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<a class="page-link"
									href="notice.do?currentPage=${ pi.currentPage-1 }"><button
										class="noticeButton2" style="color: white"><</button></a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href=""></a>
								<button class="noticeButton2"><</button>
								</a>
							</c:otherwise>
						</c:choose>
					 </c:if>
                    
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<a class="page-link" href="notice.do?currentPage=${ p }"
										><button class="noticeButton2" style="color: white">${ p }</button></a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="" ><button
											class="noticeButton2" style="color: darkgray">${ p }</button></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
                     
                       <c:if test="${pi.endPage ne pi.maxPage}">
						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<a class="page-link"
									href="notice.do?currentPage=${ pi.currentPage+1 }"><button
										class="noticeButton2" style="color: white">></button></a>
							</c:when>
							<c:otherwise>
								<a class="page-link"
									href="notice.do?currentPage=${ pi.currentPage+1 }"><button
										class="noticeButton2" style="color: white" >></button></a>
							</c:otherwise>
						</c:choose>
					   </c:if>	 
					</ul>
				</div>
				
				<br> <br>
				<div class="serch">
					<div class="dropdown1">
						<form action="searchBoard.do">
							<select name="condition"  class="selectdeptsearch">
								<option value="title">??????</option>
								<option value="content">??????</option>
							</select> 
							<input class="searchconditiondept" type="search" name="search" value="${ search }">
							<input type="hidden" name="cfbo" value=3>
							<input type="hidden" name="userdept" value="${c.deptno}">
							<input type="hidden" name="empno" value="${loginUser.empNo}">
							<button type="submit" class="goingsearchdept">????????????</button>
						</form>
					</div>




				</div>
			</div>
</div>

			<script>
			
		
			$(function(){
				switch('${condition}'){				
				case "title" : $("#searchArea option").eq(1).attr("selected", true); break; 
				case "content" : $("#searchArea option").eq(2).attr("selected", true); break; 
				}
			})
		    
	
    	$(function(){
    		$("#boardList tbody tr").click(function(){
    			location.href="detailBoard.do?bno=" + $(this).children().eq(0).text()+"&uno="+${ loginUser.empNo }
    			
    		});
    	});
    
			$(function(){
		         $(".page_title>.title_name").text("?????? ?????????");
		      })
    </script>
</body>

</html>