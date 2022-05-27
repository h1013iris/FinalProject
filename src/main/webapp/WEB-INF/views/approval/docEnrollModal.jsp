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
	
	.docEnrollbody {
		/*border: 1px solid black;*/
		height: 65%;
	}
	
	.select_div {
		/*height: 10%;*/
		margin-top: 12%;
	}
	
	.select_title {
		font-size: 17px;
	}
	
	.docEnrollDropdown, .input_docTitle {
		margin-top: 10px;
	}
	
	#docType, #docForm {
		width: 65%;
		padding: 1%;
		font-size: 16px;
	}
	
	#docTitle {
		width: 95%;
		padding: 1%;
		font-size: 16px;
	}
	
	.docEnrollFooter {
		margin-bottom: 30px;
	}
	
</style>
</head>
<body>

	<div id="modal_background" class="modal_background docEnrollModal">
        <div id="modal_container" class="size500">
            <div class="modal_header docEnrollheader">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title docTitle">문서 작성</span>
            </div>
            
            <form class="documentTypeForm" action="docEnrollForm.do" method="post">
            	<div class="modal_body docEnrollbody">
			   		<div class="select_div">
				   		<label class="select_title">문서 타입</label>

				        <div class="dropdown docEnrollDropdown">

					        <select id="docType" name="docType" onchange="docFormChange(this)">
					        	<option value="none">== 선택 ==</option>
					           	<option value="app">신청서</option>
					           	<option value="draft">기안서</option>
					           	<option value="coop">협조문</option>
					        </select>
				        </div>
			        </div>
			        <div class="select_div">
				        <label class="select_title">문서 서식</label>

				        <div class="dropdown docEnrollDropdown">

					        <select id="docForm" name="docForm">
					        </select>
					   	</div>
			        </div>
			        <div class="select_div">
			        	<label class="select_title">문서 제목</label>
			        	<div class="input_docTitle">
			        		<input type="text" id="docTitle" name="docTitle" maxlength="100">
			        	</div>
			        </div>
	            </div>
	            <div class="modal_footer docEnrollFooter">
                	<button class="next_btn" type="submit">확인</button>
                	<button class="cancel_btn" type="button">취소</button>
            	</div>
            </form>
        </div>
    </div>
    
    <script type="text/javascript">
	    
	</script>
	
	<script src="${ pageContext.servletContext.contextPath }/resources/js/approval/docEnrollModal.js"></script>
	
		
</body>
</html>