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
					        <select id="docType" name="docType">
					        	<option value="">== 선택 ==</option>
					        </select>
				        </div>
			        </div>
			        
			        <hr class="select_div_hr">
			        
			        <div class="docEnroll_select_div">
				        <label class="docEnroll_select_title">문서 서식</label>
				        <div class="docEnrollDropdown">
					        <select id="docForm" name="docForm">
					        	<option value="">== 선택 ==</option>
					        </select>
					   	</div>
			        </div>
			        
			        <hr class="select_div_hr end_hr">
			        
			        <div class="select_div docTitleArea">
			        	<label class="docEnroll_select_title">문서 제목</label>
			        	<div class="input_docTitle">
			        		<input type="text" id="modalDocTitle" name="modalDocTitle" maxlength="200">
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
			
		
    	// 문서 유형 select 에 담기
    	$(document).ready(function() {
    		
    		$.ajax({
    			type: "get",
    			url: "selectDocTypeList.do",
    			success: function(list) {
    				
    				$.each(list, function(i) {
    					// 이전 docType 과 이름 똑같으면 넘겨서 각 유형 한 번씩만 들어가도록
    					if(i != 0 && list[i].docType == list[i-1].docType) {
    						i++;
    					} else {
    						$("#docType").append("<option value='" + list[i].docType + "'>" 
				 					+ list[i].docType + "</option>");
    					}
    				});
    			}
    		});
    	});
    
    
    
		// 유형 선택 시 알맞은 서식 가져와서 option에 넣기
		$(document).on("change", "#docType", function() {
			
			// 첫 번째 option 빼고 비워주기
			$("#docForm").children('option:not(:first)').remove();
			
			$.ajax({
    			type: "get",
    			url: "selectDocTypeList.do",
    			data: { docType : $(this).val() },
    			success: function(list) {
    				
    				$.each(list, function(i) {
    					$("#docForm").append("<option value='" + list[i].docTypeNo + "'>" 
    		 					+ list[i].docForm + "</option>");
    				});
    			}
    		});
		});
		
		
		
	 	// 확인 버튼 클릭 시
		$(".next_btn").click(function() {
	    	// 문서 타입, 폼 유형 변수에 담아서
			let type = $("#docType").val();
	    	let form = $("#docForm").val();
	    	
	    	// 문서 타입, 폼 유형 없으면
	    	if(type == "" || form == "") {
	    		return false;
	    	
	    	// 잘 작성되어 있으면
	    	} else {
	    		$(".documentTypeForm").attr("action", "docEnrollForm.do");
	    		$(".documentTypeForm").submit();
	    	}
	
	    })

	    
    	// 문서 타입이 바뀌었는데 신청서인 경우
    	$(document).on("change", "#docType", function() {
    		
    		$("#modalDocTitle").val("");	// 제목 비워주기
    		
    		let docType = $(this).val();
    		
    		if(docType == '신청서') {
    			
    			$(".docTitleArea").hide();
    			$(".end_hr").hide();
    		
    		} else {
    			
    			$(".docTitleArea").show();
    			$(".end_hr").show();
    		}
    		
    	})

	</script>
	
	<script src="${ pageContext.servletContext.contextPath }/resources/js/approval/docEnrollForm.js"></script>
	
		
</body>
</html>