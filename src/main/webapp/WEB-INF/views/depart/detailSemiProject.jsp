<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부프로젝트 모달</title>
<style type="text/css">
	.semiProModalSize{
		height: 80vh;
		text-align: center;
		transform: translateX(85px);
	}
	.semiProTar{
		color:#85cdff;
		font-size: 13px;
	}
	.outSeeAttend{
		background-color: #85cdff;
		height: 4.5vh;
		width: 9vw;
		transform: translateX(95px);
		position: relative;
    	top: -26vh;
    	text-align: center;
	    line-height: 4.5vh;
	    font-size: 20px;
	}
	.outseeDuetime{
		background-color: #85cdff;
		height: 4.5vh;
		width: 9vw;
		transform: translateX(95px);
		position: relative;
    	top: -25vh;
    	text-align: center;
	    line-height: 4.5vh;
	    font-size: 20px;
	}
	.outseeChecklist{
		background-color: #85cdff;
		height: 4.5vh;
		width: 9vw;
		transform: translateX(95px);
		position: relative;
    	top: -24vh;
    	text-align: center;
	    line-height: 4.5vh;
	    font-size: 20px;
	}
	.outseeFile{
		background-color: #85cdff;
		height: 4.5vh;
		width: 9vw;
		transform: translateX(95px);
		position: relative;
    	top: -23vh;
    	text-align: center;
	    line-height: 4.5vh;
	    font-size: 20px;
	}
	.outseeMove{
		background-color: #85cdff;
		height: 4.5vh;
		width: 9vw;
		transform: translateX(95px);
		position: relative;
    	top: -22vh;
    	text-align: center;
	    line-height: 4.5vh;
	    font-size: 20px;
	}
	.outdeletese{
		background-color: #85cdff;
		height: 4.5vh;
		width: 9vw;
		transform: translateX(95px);
		position: relative;
    	top: -21vh;
    	text-align: center;
	    line-height: 4.5vh;
	    font-size: 20px;
	}
	.outseeDelete{
		background-color: #85cdff;
		height: 4.5vh;
		width: 9vw;
		transform: translateX(95px);
		position: relative;
    	top: -20vh;
    	text-align: center;
	    line-height: 4.5vh;
	    font-size: 20px;
	}
	.detialSemiHeader{
		display: flex;
	}
	.headmodaltitle{
		border: 1px solid;
		width: 80%;
		text-align: left;
	}
	.logodetailSemi{
		margin-left: 17px;
   		position: static;
   		margin-right: 10px;
	}
	.detailSemiTitle, .detailSemiTitleCh{
		font-size: 19px;
		line-height: 25px;
		width: 90%;
	}
	.outseeDelete{
		display: none;
	}
	.editdetailSemi{
		margin-top: 5px;
		display:none;
	}
</style>
</head>
<body>
	<div id="modal_background" class="semiProModal">
        <div id="modal_container" class="size800 semiProModalSize">
            <div class="modal_header detialSemiHeader">
                <div class="logo logodetailSemi">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <div class="headmodaltitle">
	               	<!-- 세부 프로젝트 제목 -->
	                <span class="modal_title detailSemiTitle"></span>
	                <input type="hidden" class="detailSemiTitleCh" id="CHanTitle" name="SemiTitleName" width="70%">
	                <!-- 세부 프로젝트 분류명 -->
	                <span class="semiProTar"></span>
                </div>
                <div class="editdetailSemi">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/editName.png" alt="" width="20">
                </div>
            </div >
            <div class="modal_body">
              <input type="hidden" id ="semiNoDETAIL">
            </div>
        </div>
        <div class="outSectionDiv">
       	<div class="outSeeAttend"><span>참여자</span></div>
       	<div class="outseeDuetime"><span>기한일</span></div>
       	<div class="outseeChecklist"><span>체크리스트</span></div>
       	<div class="outseeFile"><span>파일첨부</span></div>
       	<div class="outseeMove"><span>이동</span></div>
       	<div class="outdeletese"><span>창닫기</span></div>
       	<div class="outseeDelete"><span>삭제하기</span></div>
       	</div>
    </div>
     
</body>
<script type="text/javascript">
	$(".editdetailSemi").click(function(){
		var f=document.getElementById("CHanTitle");
		f.type="text";
		$(".detailSemiTitle").css("display","none");
	})
</script>
</html>