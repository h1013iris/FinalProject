<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분류 수정</title>
<style type="text/css">
	#changeTargetName{
		width: 95%;
    	height: 35px;
	}
	.proSi1, .proSi2{
		width: 85px;
		height: 40px;
		line-height: 20px;
	}
	.psFooter{
		margin-top: 5px;
		height:50px;
	}
</style>
</head>
<body>
 <!-- 모달부분 -->
    <div id="modal_background" class="detaileditTarget111">
        <div id="modal_container" class="size400">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">분류 수정</span>
            </div >
            <div class="modal_body">
	            <form action="updateprjectClass.do" id="updateJC" method="post">
	            	<input type="hidden" id="pcName" name="originpc">
	           		<input type="hidden" id="SceeditModalSe" name="sec">
	               <input type="text" id="changeTargetName" name="changepc" placeholder="수정할 분류명을 적어주세요" maxlength="10">
	               <input type="hidden" id="pcNohidden" name="pcNo">
	               <input type="hidden" id="refProNum" name="refPro">
               	</form>
               	<input type="hidden" id = "pcOne" >
               	<input type="hidden" id = "pcTwo" >
               	<input type="hidden" id = "pcThree" >
               	<input type="hidden" id = "pcFour" >
            </div>
            <div class="modal_footer psFooter">
                <button class="next_btn commonButton1 proSi1" type="button">확인</button>
                <button class="cancel_btn commonButton1 proSi2" type="button">취소</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	$(".proSi1").click(function(){
    		if($("#changeTargetName").val() == $("#pcOne").val() ||$("#changeTargetName").val() == $("#pcTwo").val()
    				||$("#changeTargetName").val() == $("#pcThree").val()|| $("#changeTargetName").val() == $("#pcFour").val()){
    			myAlert("중복", "분류명이 중복입니다.");
    		}else{
    			$("#updateJC").submit();
    		}
    			
    		
    	})
    	$(".proSi2").click(function(){
    		$("#changeTargetName").val("");
 		  	$(".detaileditTarget111").hide();
    	})
    	
    </script>
</body>
</html>