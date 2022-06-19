<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 문서 서식 선택</title>
<style type="text/css">
	
	.docTitle {
		font-size: 21px;
		font-weight: bold;
	}
	
	.docEnroll_select_div {
		/*border: 1px solid black;*/
		margin-top: 25px;
	}
	
	.docEnroll_select_title {
		font-size: 17px;
		font-weight: bold;
	}
	
	.select_div_hr {
		margin: 25px 0 25px 0;
	}
	
	.docEnrollDropdown, .input_docTitle {
		margin-top: 10px;
	}
	
	#docType, #docForm {
		width: 65%;
		padding: 1%;
		font-size: 16px;
	}
	
	#modalDocTitle {
		width: 95%;
		padding: 1%;
		font-size: 16px;
	}
	
	.docEnrollFooter {
		height: 50px;
		/*border: 1px solid black;*/
		margin-bottom: 6%;
	}
	
	.docEnrollNext_btn, .docEnrollCancle_btn {
		font-size: 14px !important;
		height: 45px !important;
		width: 60px !important;
	}
	
	.docEnrollCancle_btn {
		background-color: #c8c8c8 !important;
		box-shadow: 0px 5px 0px 0px #afafaf !important;
	}
	
	.docEnrollCancle_btn:hover {
		box-shadow: 0px 0px 0px 0px #afafaf !important;
	}
	
</style>
</head>
<body>

	<div id="modal_background" class="modal_background docEnrollModal">
        <div id="modal_container" class="size500">
            <div class="modal_header docEnrollHeader">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title docTitle">문서 작성</span>
            </div>
            
            
            
            <form class="documentTypeForm" method="post">
            	<input type="hidden" name="deptNo" value="${ loginUser.departmentNo }"/>
            	<div class="modal_body docEnrollbody">
			   		<div class="docEnroll_select_div">
				   		<label class="docEnroll_select_title">문서 타입</label>

				        <div class="docEnrollDropdown">
					        <select id="docType" name="docType" onchange="docFormChange(this)">
					        	<option value="">== 선택 ==</option>
					           	<option value="app">신청서</option>
					           	<option value="draft">기안서</option>
					           	<option value="coop">협조문</option>
					        </select>
				        </div>
			        </div>
			        
			        <hr class="select_div_hr">
			        
			        <div class="docEnroll_select_div">
				        <label class="docEnroll_select_title">문서 서식</label>
				        <div class="docEnrollDropdown">
					        <select id="docForm" name="docForm"></select>
					   	</div>
			        </div>
			        
			        <hr class="select_div_hr end_hr">
			        
			        <div class="select_div docTitleArea">
			        	<label class="docEnroll_select_title">문서 제목</label>
			        	<div class="input_docTitle">
			        		<input type="text" id="modalDocTitle" name="modalDocTitle" maxlength="100">
			        	</div>
			        </div>
	            </div>
	            <div class="modal_footer docEnrollFooter">
                	<button class="commonButton1 modal_nextBtn next_btn docEnrollNext_btn" type="button">확인</button>
                	<button class="commonButton1 modal_cascelBtn cancel_btn docEnrollCancle_btn" type="button">취소</button>
            	</div>
            </form>
        </div>
    </div>
    
    <script type="text/javascript">

    	// 문서 타입이 바뀌었는데 신청서인 경우
    	$("#docType").change(function() {
    		
    		let docType = $(this).val();
    		
    		if(docType == 'app') {
    			
    			$(".docTitleArea").hide();
    			$(".end_hr").hide();
    		
    		} else {
    			
    			$(".docTitleArea").show();
    			$(".end_hr").show();
    		}
    		
    	})

	</script>
	
	<script src="${ pageContext.servletContext.contextPath }/resources/js/approval/docEnrollModal.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/approval/docEnrollForm.js"></script>
	
		
</body>
</html>