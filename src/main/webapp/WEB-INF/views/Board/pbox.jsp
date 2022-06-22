<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.all{
padding-top : 50px;

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

	text-align:center;
}
.boxlist{
 text-align: -webkit-center;
 padding-top : 20px;
}
.pboxlistanddelete {
	width: 84vw;
	margin-left : 5%;
	margin-bottom:100%;
}
.notpboardwhy{
text-align: center;
}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
	<div class="all">
	<hr>
	<div class ="pboxlistanddelete">
		<div class="boxlist">
				<table id="pboxList" class="table table-hover" align="center">

					<thead>
						<tr>		
						    <th style="width: 150px; height: 40px;">보관번호</th>					
							<th style="width: 700px; height: 40px;">제목</th>						
							<th style="width: 150px; height: 40px;">작성일</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${ list }" var="n">
							<tr>		
							    <th style="height: 70px;" onclick="pboxlist(${n.pno})" >${ n.pno }</th>						   				
								<th style="height: 70px;" onclick="pboxlist(${n.pno})" >${ n.title }</th>							
								<th style="height: 70px;">${ n.pcreateDate }</th>
								 <div>
								  <th><p id="delete" onclick="delpbox(${n.pno})">삭제</p></th>
								 </div>


							</tr>

						</c:forEach>

					</tbody>
					<c:if test="${ empty list }">
						<tr>
							<td colspan="5" class="notpboardwhy">존재하는 게시글이 없습니다.</td>
						</tr>
					</c:if>
				</table>

	
	
	</div>
		<div id="pagingArea">
					<ul class="pagination">
					<c:if test="${pi.currentPage ne 1}">
						<c:choose>					
							<c:when test="${ pi.currentPage ne 1 }">
								<a class="page-link"
									href="pbox.do?userno=${loginUser.empNo}"&currentPage=${ pi.currentPage-1 }"><button
										class="pboxButton1"><</button></a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href=""></a>
								<button class="pboxButton1"><</button>
								</a>
							</c:otherwise>
							
						</c:choose>
						</c:if>

						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<a class="page-link" href="pbox.do?userno=${loginUser.empNo}"&currentPage=${ p }"
										style="color: white"><button class="pboxButton1">${ p }</button></a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href=""><button
											class="pboxButton1" style="color: darkgray">${ p }</button></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

                       <c:if test="${pi.endPage ne pi.maxPage}">
						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<a class="page-link"
									href="pbox.do?userno=${loginUser.empNo}"&currentPage=${ pi.currentPage+1 }"><button
										class="pboxButton1">></button></a>
							</c:when>
							<c:otherwise>
								<a class="page-link"
									href="pbox.do?userno=${loginUser.empNo}"&currentPage=${ pi.currentPage+1 }"><button
										class="pboxButton1">></button></a>
							</c:otherwise>
						</c:choose>
						</c:if>
					</ul>
				</div>
	 </div>
	</div>
			<script>
    
    			function pboxlist(num){
    			location.href="detailpbox.do?pno=" + num
    			
    		}
    	
    	
    	function delpbox(num){
    		$("#confirm_title .title_name").text("보관글 삭제");
    		$("#confirm_body .confirm_content").text("보관글을 삭제하시겠습니까?");
    		$("#helpmeCOnfirm").css("display","block");
       		
    		$("button[name='confirmBtn']").click(function(){
        		
        		if($(this).val()=="true"){
        			location.href="deletepbox.do?pno="+ num +"&userno="+${loginUser.empNo};
        			$("#helpmeCOnfirm").css("display","none");
        		}else{
        			$("#helpmeCOnfirm").hide();
        		}
        	})
    	}
    	$(function(){
            $(".page_title>.title_name").text("임시보관함");
         })
    </script>
</body>
</html>