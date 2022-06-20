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

.goingsearchnoti {
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
.goingsearchnoti:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}



.ham {
	margin-left: 16%;
}



.dropdown {
	position: relative;
	display: inline-block;
	margin-left: 83%;
	height: 110px;
}

.dropdown1 {
	position: relative;
	display: inline;
	margin-left: 20%;
	height: 10%;
}

.dropbtn_icon {
	font-family: 'Material Icons';
}

.dropbtn {
	border: 1px solid rgb(133, 205, 255);
	border-radius: 4px;
	background-color: #f5f5f5;
	font-weight: 400;
	color: rgb(37, 37, 37);
	padding: 12px;
	width: 200px;
	text-align: left;
	cursor: pointer;
	font-size: 12px;
}

.dropdown-content {
	display: none;
	font-weight: 400;
	background-color: #f9f9f9;
	min-width: 200px;
}

.dropdown-content a {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 12px;
	padding: 12px 20px;
}

.dropdown-content a:hover {
	background-color: #ececec
}

.dropdown:hover .dropdown-content {
	display: block;
}

.noticelist {
	width: 84vw;
	margin-left : 5%;
	margin-bottom:100%;
}

#pagingArea {
 
   text-align:center;
	
}

#tex {
	width: 300px;
	height: 30px;
}
.freelistboardtable{
 text-align: -webkit-center;
}
.dropdown1{
text-align:center;
}
.all{
padding-top : 50px;
}
.selectnotisearch {
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
.searchconditionnoti{
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

				<a href="notice.do"><button class="noticeButton1" id="bu1">공지사항</button></a>
				<a href="allboard.do"><button class="noticeButton1" id="bu2">자유게시판</button></a>
				<a href="depart.do"><button class="noticeButton1" id="bu3">부서게시판</button></a>
				<a href="anonymous.do"><button class="noticeButton1" id="bu4">익명게시판</button></a>



				<div class="dropdown">
					<button class="dropbtn">
						<span id="isRecents" class="dropbtn_icon">최신순</span>
					</button>
					<div class="dropdown-content" id="drp">
						<a id="new" href="allboard.do?boardno=${ boardno}"">최신순</a> 
						<a id="old"	href="allboardold.do?boardno=${ boardno}">오래된순</a>
					</div>
				</div>
			</div>
			<div class="noticelist" >
			<div class="freelistboardtable">
				<table id="boardList" class="table table-hover" align="center">

					<thead>
						<tr>
							<th style="width: 50px; height: 50px;">글번호</th>
							<th style="width: 700px; height: 50px;">제목</th>
							<th style="width: 150px; height: 50px;">작성자</th>
							<th style="width: 150px; height: 50px;">작성일</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${ list }" var="n">
							<tr>
								<td style="height: 70px;">${ n.writeno }</td>
								<td style="height: 70px;">${ n.title }</td>
								<td style="height: 70px;">${ n.writer }</td>
								<td style="height: 70px;">${ n.createDate }</td>


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
				<br>
				<div id="pagingArea">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<a class="page-link"
									href="allboard.do?currentPage=${ pi.currentPage-1 }"><button
										class="noticeButton2"><</button></a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href=""></a>
								<button class="noticeButton2"><</button>
								</a>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<a class="page-link" href="allboard.do?currentPage=${ p }"
										style="color: white"><button class="noticeButton2">${ p }</button></a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="" style="color: white"><button
											class="noticeButton2">${ p }</button></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<a class="page-link"
									href="allboard.do?currentPage=${ pi.currentPage+1 }"><button
										class="noticeButton2">></button></a>
							</c:when>
							<c:otherwise>
								<a class="page-link"
									href="allboard.do?currentPage=${ pi.currentPage+1 }"><button
										class="noticeButton2">></button></a>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<br> <br>
				<div class="serch">
					<div class="dropdown1">
						<form action="searchBoard.do">
						<select name="condition" class="selectnotisearch ">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select> 
							<input class="searchconditionnoti" type="search" name="search" value="${ search }">
							<input type="hidden" name="cfbo" value="${ boardno}">
							<button type="submit" class="goingsearchnoti">검색하기</button>
						</form>
					</div>

					<script>
			$(function(){
				switch('${condition}'){				
				case "title" : $("#searchArea option").eq(1).attr("selected", true); break; 
				case "content" : $("#searchArea option").eq(2).attr("selected", true); break; 
				}
			})
		
          
         if(window.location.pathname === "/spring/allboardold.do"){
            document.getElementById("isRecents").innerText="오래된순";
            }else{
            document.getElementById("isRecents").innerText="최신순";
            } 
			
          
		</script>


				</div>
			</div>


			<script>
    
    	$(function(){
    		$("#boardList tbody tr").click(function(){
    			location.href="detailBoard.do?bno=" + $(this).children().eq(0).text()+"&uno="+${ loginUser.empNo }
    			console.log(bno)
    		});
    	});
    	
    	$(function(){
            $(".page_title>.title_name").text("${bname}");
         })
    </script>
</body>
</body>
</html>