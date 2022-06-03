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
	/*기한일 버튼*/
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
	.firstDuetime{
		display: block !important;
	}
	.outseeDueTimeInsert{
		display:none;
		position: absolute;
	    top: 19vh;
	    right: 16.4vw;
	    z-index: 10;
	    width: 8.9vw;
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
	 /*창닫기*/
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
	.outdeletese:hover{
		cursor: pointer;
		background-color: white;
		color:black;
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
		width: 80%;
		text-align: left;
	}
	.logodetailSemi{
		margin-left: 17px;
   		position: static;
   		margin-right: 10px;
	}
	.detailSemiTitle{
		font-size: 19px;
		line-height: 25px;
	}
	.detailSemiTitleCh{
	 	font-size: 19px;
		line-height: 25px;
		width: 85%;
	 }
	.outseeDelete{
		display: none;
	}
	.editdetailSemi{
		margin-top: 5px;
		display:none;
	}
	.senddetailSemiTitle{
		margin-top: 5px;
		display: none;
	}
	.attendDuedate{
		display: flex;
		text-align: left;
		line-height: 1.5;
		width: 100%;
		border-bottom: 1px solid;
		padding-bottom: 10px;
	}
	.attendPersonShow, .dueDateShowDiv{
		width: 50%;
	}
	.semiCheckListDiv{
		margin-top :20px;
		border: 1px solid;
		text-align: left;
	}
	.checkListTitle{
		font-size: 20px;
		margin-bottom: 15px;
	}
	.semiCheckListDiv .checkBoxDiv{
		width: 20px !important;
		height: 20px !important;
	}
	.semiCheckListDiv .contentCheckBox{
		font-size: 18px;
		line-height: 25px;
		margin-left: 8px;
		word-break: break-all;
	}
	.checkBoxDIvflex{
		display: flex;
		margin-bottom: 5px;
	}
	.deleteCheckBox{
		margin-top: 4px;
		margin-left: 5px;
	}
	.deleteCheckBox:hover{
		cursor: pointer;
	}
	.plusNewCheck{
		background-color: #e4e4e4;
		display: flex;
		height: 3vh;
	    line-height: 3vh;
	    width: 16vh;
	    border-radius: 3px;
	    justify-content: center;
	    margin-left: 35px;
	}
	.insertCheckinput{
		width: 35vw;
    	height: 2vh;
    	margin-left: 10px;
    	padding-top: 3px;
	}
	.insertCheckBox{
		display: none;
		margin-top: 15px;
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
                <!--  -->
                <div class="editdetailSemi">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/editName.png" alt="" width="20">
                </div>
                <div class="senddetailSemiTitle">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/changeB.png" alt="" width="20">
                </div>
            </div >
            <div class="modal_body">
            	<!-- 프로젝트 번호 -->
              	<input type="hidden" id ="semiNoDETAIL">
              	<!-- 프로젝트 및 기한일 적는 div -->
              	<div class="attendDuedate">
	              	<!-- 참여자 -->
	              	<div class="attendPersonShow">
	              		<div><span>참여자</span></div>
	              		<div>000/000/000</div>
	              	</div>
	              	<!-- 기한일 -->
	              	<div class="dueDateShowDiv">
	              		<div><span>기한일</span></div>
	              		<div class="dueDateShow"></div>
	              	</div>
              	</div>
              	<!-- 체크리스트 div -->
              	<div class="semiCheckListDiv">
              		<div class="checkListTitle"><span>체크 리스트</span></div>
              		<div class="checkBoxDIvflex">
              			<label><input type="checkbox" class="checkBoxDiv"></label>
              			<div class="contentCheckBox"><span>check</span></div>
              			<div class="deleteCheckBox">
		                    <img src="${ pageContext.servletContext.contextPath }/resources/images/close.png" alt="" width="20">
		                </div>
              		</div>
              		<div class="checkBoxDIvflex">
              			<label><input type="checkbox" class="checkBoxDiv"></label>
              			<div class="contentCheckBox"><span>checkcheckcheckcheckcheckcheckcheckcheckcheckcheckcheckcheckcheckcheckcheck</span></div>
              			<div class="deleteCheckBox">
		                    <img src="${ pageContext.servletContext.contextPath }/resources/images/close.png" alt="" width="20">
		                </div>
              		</div>
              		<div class="checkBoxDIvflex">
              			<label><input type="checkbox" class="checkBoxDiv"></label>
              			<div class="contentCheckBox"><span>check</span></div>
              			<div class="deleteCheckBox">
		                    <img src="${ pageContext.servletContext.contextPath }/resources/images/close.png" alt="" width="20">
		                </div>
              		</div>
              		<div class="checkBoxDIvflex">
              			<label><input type="checkbox" class="checkBoxDiv"></label>
              			<div class="contentCheckBox"><span>check</span></div>
              			<div class="deleteCheckBox">
		                    <img src="${ pageContext.servletContext.contextPath }/resources/images/close.png" alt="" width="20">
		                </div>
              		</div>
              		<div class="checkBoxDIvflex insertCheckBox">
              			<label><input type="checkbox" class="checkBoxDiv"></label>
              			<div class="addinsertCheck"><input type="text" class="insertCheckinput"></div>
              		</div>
              		<!-- 체크리스트 항목 추가 버튼 -->
        			<div class="plusNewCheck" id="insertNewCheck">
        				<img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="25"> 
        				<div ><span>항목 추가</span></div>
       				</div>
              	</div>
            </div>
        </div>
        <div class="outSectionDiv">
       	<div class="outSeeAttend"><span>참여자</span></div>
       	<div class="outseeDuetime"><span>기한일</span></div>
       	<div><input type="date" class="outseeDueTimeInsert" id="currentDate"></div>
       	<div class="outseeChecklist"><span>체크리스트</span></div>
       	<div class="outseeFile"><span>파일첨부</span></div>
       	<div class="outseeMove"><span>이동</span></div>
       	<div class="outdeletese"><span>창닫기</span></div>
       	<div class="outseeDelete"><span>삭제하기</span></div>
       	</div>
    </div>
     
</body>
<script type="text/javascript">
	

	//날짜 넣었을 시에 체크 
	$(".outseeDueTimeInsert").change(function(){
		$(".dueDateShow").empty();
		var today=new Date().toISOString().substring(0, 10);//오늘 날짜
		var semiDue = $("#currentDate").val();//넣어준 날짜
		if(semiDue< today){//오늘날짜보다 넣은 날짜가 이전일때
			var semiNo = $("#semiNoDETAIL").val();//세부 번호
			$.ajax({
				url:"updateSemiDueNull.do",
				type:"post", 
				data:{semiNo:semiNo}, 
				success:(function(result){
					if(result =="1"){
						$(".dueDateShow").text("이전 날짜는 선택할 수 없습니다.");
						$(".dueDateShow").css("color","#85cdff");
						$("#currentDate").val("");
					}
				})
			})
		}else{
			var semiNo = $("#semiNoDETAIL").val();//세부 번호
			$.ajax({
				url:"updateSemi.do",
				type:"post", 
				data:{semiNo:semiNo, semiDue:semiDue}, 
				success:(function(result){
					if(result =="1"){
						$(".dueDateShow").text(semiDue);
						$(".dueDateShow").css("color","black");
					}
				})
			})
		}
	})
	/*프로젝트 제목 수정 버튼 클릭했을 시*/
	$(".editdetailSemi").click(function(){
		//input hidden을 text로 변환
		var f=document.getElementById("CHanTitle");
		f.type="text";
		$(".detailSemiTitle").css("display","none");
		$(".editdetailSemi").css("display","none");
		$(".senddetailSemiTitle").css("display","block");
	})
	/*세부 프로젝트 제목 바꾸기*/
	$(".senddetailSemiTitle").click(function(){
		var semiTitle = $(".detailSemiTitleCh").val();//바꿀 제목 이름
		var semiNo = $("#semiNoDETAIL").val();//세부 번호
		$.ajax({
			url:"updateSemi.do", 
			type:"post", 
			data:{semiTitle:semiTitle, semiNo:semiNo}, 
			success:(function(result){//성공했을시에 
				if(result =="1"){
					var f=document.getElementById("CHanTitle");
					f.type="hidden";
					$(".senddetailSemiTitle").css("display","none");
					$(".detailSemiTitle").text(semiTitle);
					$(".detailSemiTitle").show();
					$(".editdetailSemi").css("display","block");
					
				}
				
			})
		})
	})
	/*창닫기 클릭시 모달창 사라지게 하기*/
	$(".outdeletese").click(function(){
		$(".semiProModal").css("display","none");
		location.reload();
	})
	/*기한일 버튼 클릭시 날짜 정하는거 나오기*/
	$(".outseeDuetime").click(function(){
		if($(".outseeDueTimeInsert").hasClass('firstDuetime')){
			$(".outseeDueTimeInsert").removeClass('firstDuetime');
		}else{
			$(".outseeDueTimeInsert").addClass('firstDuetime');
		}
	})
	//항목 추가 버튼 클릭시에(체크리스트)
	$(".plusNewCheck").click(function(){
		$(".insertCheckBox").css("display","flex");
	})
	
	//체크리스트를 클릭하였을 시에 
	$(".outseeChecklist").click(function(){
		
	})
</script>
</html>