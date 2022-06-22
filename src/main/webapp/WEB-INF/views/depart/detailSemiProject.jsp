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
		transform: translateX(85px);
	}
	.semiProModalSize::-webkit-scrollbar{
       display: none;
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
	    right: 16.4vw;
	    z-index: 10;
	    top: 15vh;
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
	#upfile{
		height: 4.5vh;
		width: 9vw;
		display: none;
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
	.outdeletese:hover, .outseeDelete:hover, .outseeDuetime:hover, .outseeFile:hover, .outseeChecklist:hover, .outseeMove:hover{
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
		font-size: 17px;
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
		text-align: left !important;
	}
	.checkListTitle{
		font-size: 20px;
		margin-bottom: 10px;
		text-align: left;
		margin-top: 15px;
		display: flex;
	}
	.semiCheckListDiv .checkBoxDiv{
		width: 20px !important;
		height: 20px !important;
	}
	.contentCheckBox{
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
		margin-left: 10px;
	}
	.deleteCheckBox:hover{
		cursor: pointer;
	}
	.plusNewCheck{
		background-color: #e4e4e4;
		display: flex;
		height: 3vh;
	    line-height: 3vh;
	    width: 14vh;
	    border-radius: 3px;
	    justify-content: center;
	    margin-left: 35px;
	}
	.plusNewCheck:hover{
		cursor: pointer;
		background-color: #85cdff;
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
		margin-left: 25px;
	}
	.dtailSemiButtonEn{
		width: 10%;
	    height: 30px;
	    line-height: 30px;
	}
	.dtailSemiButtonCan{
		width: 10%;
	    height: 30px;
	    line-height: 30px;
	    background-color: lightgray;
	    box-shadow: 0px 5px 0px 0px #afafaf !important;
	}
	.dtailSemiButtonCan:hover{
		box-shadow: 0px 0px 0px 0px #afafaf !important;
	}
	.CheckListEditButton{
		margin-bottom: 15px;
		margin-left: 35px;
		display: none;
		text-align: left !important;
	}
	input {
	  	accent-color: #85cdff;
	}
	.checkListTotalDel{
		text-align: right;
		display: none;
	}
	.checkName{
		width: 98%;
	}
	.textDecoration{
		text-decoration: line-through;
	}
	.addWats{
		margin-bottom: 10px;
	}
	.addWats span{
		line-height: 30px;
	}
	.innerPartimgConn{
		width: 7vw;
		display: none;
		background-color: rgb(230, 229, 229);
		justify-content: center;
		border-radius: 5px;
	}
	.updateInnerPartCommne, .updatererPartCommne{
		display: none;
	}
	.commentSubmi, .commentCancel, .commentCancel2{
		margin-top:10px;
	 	height: 3vh;
	 	width: 5vw;
	 	line-height: 3vh;
	}
	.commentCancel, .commentCancel2{
		background-color: lightgray;
	    box-shadow: 0px 5px 0px 0px #afafaf !important;
	}
	.commentCancel:hover, .commentCancel2:hover{
		box-shadow: 0px 0px 0px 0px #afafaf !important;
	}
	.commentText{
		width: 97%;
	}
	.commentDvi{
		display: flex;
		width: 100%;
	}
	.semiMainBody{
		max-height: 640px !important;
		overflow-y: scroll;
	}
	.semiMainBody::-webkit-scrollbar{
       display: none;
   }
	.checkListDIvSemiPro{
		height: 270px;
		overflow-y: scroll;
	}
	.checkListDIvSemiPro::-webkit-scrollbar{
       display: none;
   }
  	.semiReplyPartHE{ 
  		margin-top:15px;
		display: flex;
		font-size: 18px;
		padding-bottom: 10px;
		border-bottom: 1px solid;
   }
   .clickReplyPe{
   		margin-right: 40px;
   }
   .replyButton{
   		width: 9%;
   		height: 27px;
   		margin-bottom: -10px;
   		transform: translateY(-2px);
   }
   #replySum{
   		height: 28px;
   		width: 87%;
   		margin-right: 10px;
   }
   .replySubmitArea{
   		margin-top:	5px;
   		margin-bottom: 10px;
   }
   .replyWriterName{
		font-size: 18px;
	    height: 18px;
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
	.clickReplyPe:hover, .clickAttachPe:hover{
		cursor: pointer;
		background-color: white;
		color:#85cdff;
	}
	.controllPostion{
		position: absolute;
	    top: 27.2vh;
	    right: 6.8vw;
	    z-index: 10;
	    width: 8.9vw;
	    text-align: center;
	    line-height: 30px;
	    background-color: white;
	    display: none;
	}
	.controllPostion div{
		border: 1px solid;
	}
	.controllPostion div:hover{
		background-color: #85cdff;
		cursor: pointer;
	}
	.semiAttachParts{
		display: none;
	} 
	.firstAttactj{
		display: flex;
		width: 100%;
		margin-top: 5px;
	}
	.attachFileName{
		width: 87%;
	}
	.attachFileName a{
		list-style: none;
		text-decoration: none;
		color: black;
	}
	.attachFileName a:hover{
		cursor: pointer;
		color:#85cdff;
	}
	.deleteCheckBox1:hover{
		cursor: pointer;
	}
	.block{
		display: block !important;
	}
	.none{
		display: none !important;
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
	                <input type="hidden" class="detailSemiTitleCh" id="CHanTitle" name="SemiTitleName" width="70%" maxlength="45">
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
            <div class="modal_body semiMainBody" >
            	<!-- 프로젝트 번호 -->
              	<input type="hidden" id ="semiNoDETAIL">
              	<input type="hidden" id ="WriterNoSemiProject">
              	<input type="hidden" id ="refProNum">
              	<input type="hidden" id ="semiWriter">
              	<!-- 설명 적는 부분 -->
              	<div class="addWats" >
              		<div class="innerPartimgConn">
	       				<img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="25"> 
	       				<div><span>설명 추가</span></div>
       				</div>
       				<div class="updateInnerPartCommne">
       					<textarea rows="3" cols="101" style="resize:none;" id = "textareaCommnet"></textarea>
       					<label><button type="button" class="commonButton1 commentSubmi">등록</button></label>
           				<label><button type="button" class="commonButton1 commentCancel">취소</button></label>
       				</div>
       				<div class="commentDvi">
       					<div class="commentText"></div>
       					<div class="editCommnetch"><img src="${ pageContext.servletContext.contextPath }/resources/images/close.png" alt="" width="20"></div>
       				</div>
   				</div>
              	<!-- 프로젝트 및 기한일 적는 div -->
              	<div class="attendDuedate">
	              	<!-- 기한일 -->
	              	<div class="dueDateShowDiv">
	              		<div><span>기한일</span></div>
	              		<div class="dueDateShow"></div>
	              	</div>
              	</div>
              	<!-- 체크리스트 div -->
              	<div class="checkListDIvSemiPro">
	              	<div class="checkListTitle">
	              		<div class="checkName"><span>체크 리스트</span></div>
	              		<div class="checkListTotalDel"><img src='${ pageContext.servletContext.contextPath }/resources/images/close.png' alt='' width='18'></div>
	            	</div>
	              	<div class="semiCheckListDiv">
	              	</div>
	              	<div class="checkBoxDIvflex insertCheckBox">
	           			<div class="addinsertCheck"><input type="text" class="insertCheckinput"></div>
	           		</div>
	           		<!-- 체크리스트 항목 추가 버튼 -->
	           		<div class="CheckListEditButton">
	           			<label><button type="button" class="commonButton1 dtailSemiButtonEn">등록</button></label>
	           			<label><button type="button" class="commonButton1 dtailSemiButtonCan">취소</button></label>
	           		</div>
	       			<div class="plusNewCheck" id="insertNewCheck">
	       				<img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="25"> 
	       				<div><span>항목 추가</span></div>
	   				</div>
   				</div>
   				<!-- 댓글 윗부분 -->
				<div class="semiReplyPartHE">
					<div class="clickReplyPe"><span>댓글</span></div>
					<div class="clickAttachPe"><span>첨부파일 모음</span></div>
				</div>
   				<!-- 댓글 보이는 부분 -->
   				<div class="semiReplyPartS">
   					<!-- 댓글 등록 부분 -->
   					<div class="replySubmitArea">
	        			<input  type="text" id="replySum" placeholder="내용을 입력해주세요">
	        			<button type="button" class="commonButton1 replyButton" style="line-height:normal;"> 등록 </button>
	        		</div>
	        		<div class="replyAREA">
	        			<table id="replyList" >
						</table>
	        		</div>
   				</div>
  				<!-- 첨부파일 부분 -->
   				<div class="semiAttachParts">
   				 	
   				</div>
            </div>
        </div>
        <div class="outSectionDiv">
	       	<div class="outseeDuetime"><span>기한일</span></div>
	       	<div><input type="date" class="outseeDueTimeInsert" id="currentDate"></div>
	       	<div class="outseeChecklist"><span>체크리스트</span></div>
	       	<div class="outseeFile" onclick ="onclickUpload();"><span>파일첨부</span></div>
	       	<div class="outseeMove"><span>이동</span></div>
	       	<div class="controllPostion">
	       		<div class="controllPF changeTitle"><span></span></div>
	       		<div class="controllPS changeTitle"><span></span></div>
	       		<div class="controllPT changeTitle"><span></span></div>
	       	</div>
	       	<div class="outdeletese"><span>창닫기</span></div>
	       	<div class="outseeDelete"><span>삭제하기</span></div>
	       	<form id="insertSemiForm"  enctype="multipart/form-data">
	       		<input type="file" id ="upfile" name="uploadFile"  onchange="fileUpload(this)">
	       		<input type="hidden" id="largeCat" name="largeCat" >
	       		<input type="hidden" id="originName" name="originName">
	       	</form>+
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
				success:function(result){
					if(result =="1"){
						$(".dueDateShow").text("이전 날짜는 선택할 수 없습니다.");
						$(".dueDateShow").css("color","#85cdff");
						$("#currentDate").val("");
					}
				}
			})
		}else{
			var semiNo = $("#semiNoDETAIL").val();//세부 번호
			$.ajax({
				url:"updateSemi.do",
				type:"post", 
				data:{semiNo:semiNo, semiDue:semiDue}, 
				success:function(result){
					if(result =="1"){
						$(".dueDateShow").text(semiDue);
						$(".dueDateShow").css("color","black");
					}
				}
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
			success:function(result){//성공했을시에 
				if(result =="1"){
					var f=document.getElementById("CHanTitle");
					f.type="hidden";
					$(".senddetailSemiTitle").css("display","none");
					$(".detailSemiTitle").text(semiTitle);
					$(".detailSemiTitle").show();
					$(".editdetailSemi").css("display","block");
				}
			}
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
		$(".CheckListEditButton").css("display","block");
		$(".plusNewCheck").css("display","none");
	})
	//항목 추가 취소 버튼 클릭시에 (체크리스트)
	$(".dtailSemiButtonCan").click(function(){
		$(".insertCheckBox").css("display","none");
		$(".CheckListEditButton").css("display","none");
		$(".plusNewCheck").css("display","flex");
		$(".insertCheckinput").val('');
	})
	//체크리스트 입력후 등록버튼 클릭시에(체크리스트)
	$(".dtailSemiButtonEn").click(function(){
		var refSemi = $("#semiNoDETAIL").val();//세부 번호
		var checkContent = $(".insertCheckinput").val();//체크리스트 내용
		var writerNo = ${loginUser.empNo};
		$.ajax({
			url:"insertChecklist.do",
			type:"post",
			data:{refSemi:refSemi, checkContent:checkContent, writerNo:writerNo }, 
			success:function(result){
				if(result=="1"){
					$(".insertCheckinput").val("");//댓글 작성부분 비워주기
					selectCheckList(refSemi);
				}
			}
		})
	})
	//체크리스트를 클릭하였을 시에 
	$(".outseeChecklist").click(function(){
		$(".semiCheckListDiv").css("display", "block");
		$(".checkListTitle").css("display", "flex");
		$(".plusNewCheck").css("display", "flex");
	})
	function selectCheckList(num){
		$.ajax({
			url:"selectCheckList.do", 
			type:"get", 
			data: {refSemi:num}, 
			success:function(list){
				$checkBody = $(".semiCheckListDiv");
				$checkBody.html('');
				if(list.length == 0){//글이 없을시에 div 안보이게 하기 
					$(".semiCheckListDiv").css("display", "none");
					$(".insertCheckBox").css("display","none");
					$(".plusNewCheck").css("display", "none");
					$(".checkListTitle").css("display", "none");
					$(".CheckListEditButton").css("display","none");
				}else if(list.length != 0){
					$.each(list, function(i, obj){
						var $fdiv = $('<div>').addClass("checkBoxDIvflex");
						var $lain = $("<label><input type='checkbox' name ='checkBoxDiv' class='checkBoxDiv checkBoxDiv"+obj.ckeckNo+"' value='contentCheckBox"+obj.ckeckNo+"' >");
						var $cont = $("<div class='contentCheckBox' id='contentCheckBox"+obj.ckeckNo+"'><span> ").text(obj.checkContent);
						if("${loginUser.empNo}"==obj.writerNo){
							var $dele = $("<div class='deleteCheckBox' id='deleteCheckBox' onclick='deleteChecklist("+obj.ckeckNo+")'><img src='${ pageContext.servletContext.contextPath }/resources/images/close.png' alt='' width='18'>");
						}
						var $checkNo = $('<input type="hidden" name="checkNo" value='+obj.ckeckNo+'>');
						$fdiv.append($lain);
						$fdiv.append($cont);
						$fdiv.append($dele);
						$fdiv.append($checkNo);
						$checkBody.append($fdiv);
						if(obj.checkConfirm == 'Y'){
							$("#contentCheckBox"+obj.ckeckNo).addClass("textDecoration");
							$(".checkBoxDiv"+obj.ckeckNo).prop("checked", true);
						}
					})
					
				}
			}
		})
    }
	//자신이 작성한 체크리스트 삭제 
	function deleteChecklist(ckeckNo){
		var refSemi = $("#semiNoDETAIL").val();//세부 번호
		$.ajax({
			url:"deletecheckList.do", 
			type:"post", 
			data:{ckeckNo:ckeckNo}, 
			success:function(result){
				if(result =="1"){
				}
				selectCheckList(refSemi);
			}
		})
	}
	//체크리스트를 아예 삭제 할 때
	$(".checkListTotalDel").click(function(){
		var refSemi = $("#semiNoDETAIL").val();//세부 번호
		var num = $("#semiNoDETAIL").val();
		$.ajax({
			url:"deleteTotcheckList.do", 
			type:"post", 
			data:{refSemi:refSemi},
			success:function(result){
				selectSemiDetailPro(num);
				$(".semiCheckListDiv").css("display", "none");
				$(".checkListTitle").css("display", "none");
				$(".plusNewCheck").css("display", "none");
				$(".checkListTitle").css("display", "none");
				$(".CheckListEditButton").css("display","none");
			}
		})
	})
	//체크박스 클릭시에 글에 라인생기기
	$(document).on("change",".checkBoxDiv",function(){
		var ckeckNo = $(this).val();
		ckeckNo = ckeckNo.replace("contentCheckBox"," ");
		var refSemi = $("#semiNoDETAIL").val();//세부 번호
		if($(this).is(":checked")==false){
			$.ajax({
				url:"updatereckeckList.do", 
				type:"get",
				data:{ckeckNo:ckeckNo}, 
				success: function(result){
					if(result =="1"){
						selectCheckList(refSemi);
					}
				}
			})
		}else if($(this).is(":checked")==true){
			
			$.ajax({
				url:"updateckeckList.do", 
				type:"get",
				data:{ckeckNo:ckeckNo}, 
				success: function(result){
					if(result =="1"){
						selectCheckList(refSemi);
					}
				}
			})
		}
	})
	//설명추가 클릭시에 입력칸으로 변경
	$(".innerPartimgConn").click(function(){
		$(".updateInnerPartCommne").css("display", "block");
		$(".innerPartimgConn").css("display","none");
	})
	//취소버튼 클릭시에 창닫기 
	$(".commentCancel").click(function(){
		$("#textareaCommnet").val('');
		$(".updateInnerPartCommne").css("display", "none");
		$(".innerPartimgConn").css("display","flex");
	})
	//등록버튼 눌렀을시에 제출
	$(".commentSubmi").click(function(){
		var semiNo = $("#semiNoDETAIL").val();//세부 번호
		var semiContent = $("#textareaCommnet").val();//
		$.ajax({
			url:"updateComment.do",
			type:"get", 
			data:{semiNo:semiNo, semiContent:semiContent}, 
			success: function(result){
				if(result == "1"){
					$("#textareaCommnet").val('');
				}
				selectSemiDetailPro(semiNo);
			}
		})
	})
	//설명 삭제 클릭했을 시
	$(".editCommnetch").click(function(){
		var semiNo = $("#semiNoDETAIL").val();//세부 번호
		$.ajax({
			url:"updateComment.do",
			type:"get", 
			data:{semiNo:semiNo}, 
			success:function(result){
				$("#textareaCommnet").val('');
				$(".commentDvi").css("display","none");
				selectSemiDetailPro(semiNo);
			}
		})
	})
	//댓글 등록 버튼을 눌렀을 시에
	$(function(){
   		$(".replyButton").click(function(){
       		var refDepartNo = $("#semiNoDETAIL").val();//세부 번호
       		var replyWriter = ${loginUser.empNo};//댓글 작성자 
       		if($("#replySum").val().trim().length != 0){
       			$.ajax({
       				url:"insertSemiReply.do", 
       				type:"post", 
       				data:{
       					replyTitle:$("#replySum").val(), 
       					refDepartNo:refDepartNo, 
       					replyWriter:replyWriter}, 
      					success:function(result){
      						if(result>0){
      							$("#replySum").val("");
      							selectSemiDetailPro(refDepartNo);
      						}else{
      							myAlert("댓글 등록 실패","댓글을 등록을 실패하였습니다");
      						
      		        			$(".cancel_btn").click(function(){
      		        				$("#alert_container .title_name").text("");
      		            			$("#alert_body .alert_content").text("");
      		        				$("#alertBackground").hide();
      		        			})
      						}
      					}, error:function(){
      					}
       				
       			});
       			
       		}else{//댓글 등록 안하고 클릭시
       			myAlert("댓글 등록","댓글을 등록해주세요");
       			
       			$(".cancel_btn").click(function(){
       				$("#alert_container .title_name").text("");
           			$("#alert_body .alert_content").text("");
       				$("#alertBackground").hide();
       				$("#reply").focus();
       			})
       		}
       	});
   	});
	function selectAnnoReplyList(){//댓글 리스트 가져오는 것
		var semiNo = $("#semiNoDETAIL").val();//세부 번호
		$.ajax({
			url:"selectSemiReplyList.do",
			data:{refDepartNo:semiNo}, 
			type:"get", 
			success:function(list){
				if(list.lenght == 0){
					$("#replyList").html('');
				}else{
					var value ="";
				$.each(list, function(i, obj){
					
					value += "<tr class='replyListTr'>";

					value += "<th class='replyWriterName'>" + obj.writerName +" "+ obj.writerJo + "</th>" ;
					if("${loginUser.empNo}"==obj.replyWriter){
					value += "<th class='replydelete'><img src='${ pageContext.servletContext.contextPath }/resources/images/close.png' alt='' onclick='deleteReply("+obj.replyNo+")' width='10'>"+"</th></tr>";
					} 
					value += "</tr><tr class='contenttot'><td class='replyTitleSe'>" + obj.replyTitle + "</td>" + 
					 "<td class='replywrDateSe'>" + obj.wrDate + "</td>" +
				 	"</tr>";
				})
				$("#replyList").html(value);
				}
			},error:function(){
			}
		})
	}	
	//댓글 삭제 
   	function deleteReply(num){
   		var semiNo = $("#semiNoDETAIL").val();//세부 번호
		$.ajax({
			url:"deleteReplySemi.do", 
			type:"post",
			data:{replyNo:num, refDepartNo:semiNo}, 
			success:function(result){
				if(result == "1"){
					selectSemiDetailPro(semiNo);
					$("#helpmeCOnfirm").css("display","none");
				}
			}
		})
   	}
	//댓글을 클릭하였을 시에
	function onclickUpload(){
		let myInput = document.getElementById("upfile");
        myInput.click();
	}
	//파일 확인 눌렀을 시에 파일 저장 성공
	function fileUpload(fis){
		$("#largeCat").val( $("#semiNoDETAIL").val());
		var originName = fis.value;
		originName = fis.value.substring(originName.lastIndexOf("\\")+1);
		$("#originName").val(originName);
		//let form = $("#insertSemiForm").serialize();
		var form = $('#insertSemiForm')[0];
		var data = new FormData(form);
		$.ajax({
			url:"insertSemiFileUpload.do",
			type:"post",
			processData: false,    
			contentType: false,
			dataType : 'json',
			data:data, 
			success:function(result){
				if(result =="1"){
					selectAttachFile($("#semiNoDETAIL").val());
					$(".semiReplyPartS").css("display","none");
					$(".semiAttachParts").css("display","block");
				}
			}
		})
	}
	//세부 프로젝트 삭제하기 
	$(".outseeDelete").click(function(){
		var semiNo = $("#semiNoDETAIL").val();//세부 번호
		var refPro = $("#refProNum").val();//참조 프로젝트
		location.href="deleteSemiPro.do?semiNo="+semiNo+"&refPro="+refPro;
	})
	//댓글창에서 첨부파일 창으로 전환
	$(".clickAttachPe").click(function(){
		$(".semiReplyPartS").css("display","none");
		$(".semiAttachParts").css("display","block");
	})
	//첨부파일에서 댓글창으로 전환
	$(".clickReplyPe").click(function(){
		$(".semiReplyPartS").css("display","block");
		$(".semiAttachParts").css("display","none");
	})
	//첨부파일 리스트 
	function selectAttachFile(num){
		$.ajax({
			url:"selectlListAttach.do", 
			type:"get",
			data:{largeCat:num},
			success:function(list){
		 		$checkBody = $(".semiAttachParts");
				$checkBody.html('');
			 	if(list.lenght == 0){
			 		$(".semiAttachParts").text("첨부 파일 없음");
			 	}else{
			 		$.each(list, function(i, obj){
						var $fdiv1 = $('<div>').addClass("firstAttactj");

						var $fdiv3 = $('<div>').addClass("attachFileName");
						var $fdiv4 = $('<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/'+obj.changeName+'" download="'+ obj.originName+'" title="클릭하시면 첨부파일 다운이 됩니다">').text(obj.originName);
						var $fdiv2 = $('<div>').text(obj.uploadDate);
						$fdiv3.append($fdiv4);
						var $checkNo1 = $('<input type="hidden" name="changeName" value='+obj.changeName+'>');
						var $checkNo2 = $('<input type="hidden" name="fileNo" value='+obj.fileNo+'>');
						if("${loginUser.empNo}"==$("#semiWriter").val()){
							var $dele = $("<div class='deleteCheckBox1' onclick='deleteAttachSectDi("+obj.fileNo+",`"+obj.changeName+"`)'><img src='${ pageContext.servletContext.contextPath }/resources/images/close.png' alt='' width='18'>");
						}
						$fdiv1.append($fdiv3);
						$fdiv1.append($fdiv2);
						$fdiv1.append($checkNo1);
						$fdiv1.append($checkNo2);
						$fdiv1.append($dele);
						$checkBody.append($fdiv1);
					})
			 	}
			}
		})
	}
	//삭제 (첨부파일 개별)
	function deleteAttachSectDi(fileNo, changeName){
		var semiNo = $("#semiNoDETAIL").val();//세부 번호
		$.ajax({
			url:"deleteAttachOne.do", 
			type:"post", 
			data:{fileNo:fileNo, changeName:changeName}, 
			success: function(result){
				if(result == "1"){
					selectAttachFile(semiNo);
					$(".semiReplyPartS").css("display","none");
					$(".semiAttachParts").css("display","block");
				}
			}
		})
	}
	$(".changeTitle").click(function(){
		var semiNo =  $("#semiNoDETAIL").val();//세부 번호
		var refPc = $(this).children().html();//분류 명
		location.href="updateTagSemi.do?semiNo="+semiNo+"&refPc="+refPc+"&refPro="+$("#refProNum").val();
	})
	$(".outseeMove").click(function(){
		if($(".controllPostion").hasClass("block")){
			$(".controllPostion").removeClass("block");
		}else{
			$(".controllPostion").addClass("block");
		}
	})
</script>
</html>