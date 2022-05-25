<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 세부 페이지</title>
<style type="text/css">
	.annoDetailVeiw{
		width: 83vw;
		border: 1px solid;
	}
	.annoDetailTitle{
		margin-left : 20px;
		font-size: 30px;
		font-weight: 550;
		padding-top: 5vh;
		width: 70%;
	}
	.annoDetailPhoto{
		width: 7vw;
		height: 7vw;
		border:1px solid;
	}
	/*머리부분 div*/
	.annoDetailHead{
		display: flex;
		width: 100%;
	}
	.annoDetailWHo{
		margin-top:15px;
		font-size: 17px;
	}
	.annoDetailWHo span{
		padding-right: 20px;
	}
	.lineAnnoDetail{
		margin-top: 20px;
		border-bottom: 1px solid;
		margin-bottom: 20px;
	}
	.attachmentDetail{
		margin-bottom: 30px;
		font-size: 17px;
		height: 3vh;
	}
	.attachmentDetail span{
		margin-right: 10px;
	}
	.annoDetailContent{
		border: 1px solid red;
		margin-bottom: 30px;
	}
	.annoDetailEdit img:hover{
		cursor: pointer;
	}
	.attachmentDetail a{
		list-style: none;
		text-decoration: none;
		color: black;
	}
	.attachmentDetail a:hover{
		color: #85cdff;
	}

	.controlAnnoDetail>li{
		border:1px solid;
		background-color:white;
		width:90px;
		height:25px;
		text-align:center;
		transform:translateX(190px);
		padding-top:6px;
	}
	.annoDetailEdit{
		width: 20%;
		height:100%;
		text-align: right;
	}
	.controlAnnoDetail li:hover{
		background-color: #85cdff;
		color: white;
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="annoDetailVeiw">
        	<!-- 위에 제목과 사진 나오는 부분 -->
        	<div class="annoDetailHead">
	        	<div class="annoDetailPhoto">사진 part</div>
	        	<div class="annoDetailTitle">
	        		<span>${d.annoTitle}</span>
	        	</div>
	        	<c:if test="${loginUser.empNo eq d.annoWR}">
	        	<div class="annoDetailEdit">
	        	<ul>
	        		<li><a href="#" class="imagehamburger"><img src="${ pageContext.servletContext.contextPath }/resources/images/햄버거.png" width="50"/></a>
	        			<ul class="controlAnnoDetail" >
	        				<li><a onclick="postFormSubmit(1);">수정</a></li>
	        				<li><a onclick="postFormSubmit(2);">삭제</a></li>
	        			</ul>
	        		</li>
        		</ul>
	        	</div>
	        	</c:if>
        	</div>
        	<!-- 입력한 사람의 정보 -->
        	<div class="annoDetailWHo">
        		<span>${d.writerName} ${d.writerJo}</span>
        		<span>조회수 ${d.count}</span>
        		<span>${d.annoChangeDate}</span>
        	</div>
        	<!-- 선 -->
        	<div class="lineAnnoDetail"></div>
        	<!-- 첨부파일 부분 -->
        	<div class="attachmentDetail">
        		<span>첨부파일 </span><span>|</span>
        		<c:if test="${!empty a.originName }">
        			<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${a.changeName}" download="${ a.originName }" title="클릭하시면 첨부파일 다운이 됩니다">${ a.originName }</a>
        		</c:if>
        		<c:if test="${empty a.originName }">
        			<span>첨부파일이 없습니다.</span>	
        		</c:if>
        	</div>
        	<!-- 내용 -->
        	<div class="annoDetailContent"><span>${d.annoContent}</span></div>
        	<!-- 댓글 부분 -->
        	
        </div>
    </div>
    <script type="text/javascript">
    	/*디폴트로 사라지게*/
	    $(document).ready(function(){
			$(".controlAnnoDetail").hide();		
		})
		/*클릭했을시 나오게*/
		$(".imagehamburger").click(function (){
			event.stopPropagation();
			$(".controlAnnoDetail").toggle();
		})
		/*바깥부분 클릭했을시 사라지게*/
		$(document).click(function(){
			$(".controlAnnoDetail").hide();	
		})
    </script>
</body>
</html>