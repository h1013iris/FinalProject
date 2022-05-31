<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세 페이지</title>
<style type="text/css">
	.projectDetailBid{
		border: 1px solid;
		width: 83vw;
	}
	.project_detailContain{
		width: 100%;
		flex-wrap: wrap;
		display: flex;
		justify-content: space-evenly;
	}
	.divonewP, .divtwowP, .divthreewP, .divfourwP{
		background-color: #e4e4e4;
    	width: 23%;
	}
	.detailNameHea{
		margin-top:15px;
		text-align:left;
		font-size: 23px;
		padding-left: 15px;
	}
	.plusNewSemiBu{
		border:1px solid blue;
		text-align: -webkit-center;
		margin-top:20px;
		margin-bottom: 20px;
	}
	.innerNewSeim{
		background-color: #40A0FF;
		width: 90%;
	}
	.nameandControl{
		display: flex;
		width: 100%;
	}
	.tollgeimg{
		float: right;
		width: 13%;
		margin-top:15px;
	}
	.detailNameHea{
		width: 87%;
	}
	.mainshowSection{
		margin-top: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="projectDetailBid">
        	<input type="hidden" id= "proTitleName" value="${p.proTitle}"> 
        	<div class="project_detailContain">
	        	<div class="divonewP">
	        		<div class="nameandControl">
	        			<div class="detailNameHea">${pc.pcOne}</div>
	        			<div class="tollgeimg"><img src="${ pageContext.servletContext.contextPath }/resources/images/menupro.png" width="30"/></div>
	        		</div>
	        		<div class="mainshowSection">
	        		</div>
	        		<div class="plusNewSemiBu">
	        			<div class="innerNewSeim"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="35"></div>
	        		</div>
	        	</div>
	        	<div class="divtwowP">
	        		<div class="nameandControl">
	        			<div class="detailNameHea"><p>${pc.pcTwo}</p></div>
	        			<div class="tollgeimg"><img src="${ pageContext.servletContext.contextPath }/resources/images/menupro.png" width="30"/></div>
	        			</div>
	        		<div class="mainshowSection">
	        		</div>
	        		<div class="plusNewSemiBu">
	        			<div class="innerNewSeim"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="35"></div>
	        		</div>
	        	</div>
	        	<div class="divthreewP">
	        		<div class="nameandControl">
	        			<div class="detailNameHea"><p>${pc.pcThree}</p></div>
	        			<div class="tollgeimg"><img src="${ pageContext.servletContext.contextPath }/resources/images/menupro.png" width="30"/></div>
	        		</div>
	        		<div class="mainshowSection">
	        			<div>
	        				<input type = "text" class="inputSemiPro" placeholder="세미 프로젝트 입력해주세요" >
	        				<button type="button" class="commonButton1"><span></span> </button>
	        			</div>
	        		</div>
	        		<div class="plusNewSemiBu">
	        			<div class="innerNewSeim"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="35"></div>
	        		</div>
	        	</div>
	        	<div class="divfourwP">
	        		<div class="nameandControl">
	        			<div class="detailNameHea"><p>${pc.pcFour}</p></div>
	        			<div class="tollgeimg"><img src="${ pageContext.servletContext.contextPath }/resources/images/menupro.png" width="30"/></div>
	        		</div>
	        		<div class="mainshowSection">
	        		</div>
	        		<div class="plusNewSemiBu">
	        			<div class="innerNewSeim"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="35"></div>
	        		</div>
	        	</div>
        	</div>
        </div>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$(".page_title > .title_name").text($("#proTitleName").val());
    	})
    	
    </script>
</body>
</html>