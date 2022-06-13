<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> ]
<style>
.main_section {
	
	margin:0 auto;
}

#contentArea {
	margin-left: 15%;
}

#contentArea * {
	margin: 5px
}

#contentArea {
	width: 80%;
}

#detailcontent {
	border: 1px solid #85cdff;
	margin-left: 17%;
	width: 60%;
	height: 60%;
}


.commonButton1 {
	padding: 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background: #85cdff;
	border: #85cdff;
	box-shadow: 0px 5px 0px 0px #4c87b099;
}

.commonButton1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}

.replyAREA{
        width: 60%;  
		margin-top: 10px;
		height: 30vh;
		margin-left : 17%;
	}

#concontents {
	margin-left: 17%;
}
.replyWriterName{
		font-size: 18px;
	    height: 18px;
	    font-weight: 550;
	    float: left;
	}
	.replyTitleSe{
		padding-top:4px;
    	height: 27px;
    	width: 92%;
    	padding-bottom: 7px;
	}
	.replywrDateSe{
		font-size: 13px;
		width: 15%;
	}
	.replydelete img:hover{
		cursor: pointer;
		width: 10px;
	}
	.replydelete img{
		width: 10px;
	}
</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
	
		<table id="contentArea" align="center" class="table">
			<tr>
				<th width="100">제목</th>
				<td colspan="3" style="height: 50px;">${ p.title }</td>
			</tr>
			<tr>				
				<th style="height: 50px;">작성일</th>
				<td>${ p.pcreateDate }</td>
			</tr>

			<tr>
				<th style="height: 50px;">내용</th>
				<td colspan="3"></td>
			</tr>

		</table>
		<div id="detailcontent">
			<p style="height: 150px">${ p.content }</p>

		</div>
		<c:if test="${ loginUser.empNo eq p.empno }">
			<div id="cocn">
				<button class="btn btn-primary" onclick="postFormSubmit(1);">글작성하기</button>
				<button class="btn btn-danger" onclick="postFormSubmit(2);">목록으로</button>				
			</div>
		
			<form id="postForm" action="" method="post">
			    <input type="hidden" name="pno" value="${ p.pno }">
                <input type="hidden" name="title" value="${ p.title }">
                <input type="hidden" name="content" value="${ p.content }">
                <input type="hidden" name="userno" value="${loginUser.empNo}">
                <input type="hidden" name="userno" value="${loginUser.departmentNo}">  
			</form>
			<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "enroll.do");
						}else{
							postForm.attr("action", "pbox.do");
						}
						postForm.submit();
					}
				</script>
			<br>
			<br>
		</c:if>
	</div>
	<br>
	<br>
	</div>
	</div>

	<script>

</script>

</body>
</html>