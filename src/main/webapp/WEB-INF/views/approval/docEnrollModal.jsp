<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 문서 서식 선택</title>
<style type="text/css">
	
	#modal_container {
		height: 400px;
	}
	
	/*.modal_header {
		border: 1px solid black;
	}*/
	
	.modal_title {
		font-size: 19px;
		font-weight: bold;
	}
	
	.modal_body {
		/*border: 1px solid black;*/
		height: 260px;
		padding: 
	}
	
	#docTitle {
		width: 270px;
	}
	
	.select_div {
		height: 80px;
		margin: 10px 10px;
	}
	
	.dropdown, .input_docTitle {
		margin-top: 10px;
	}
	
</style>
</head>
<body>

	<div id="modal_background" class="modal_background docEnrollModal">
        <div id="modal_container" class="size400">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">문서 작성</span>
            </div>
            
            <div class="modal_body">
			   	<form class="documentTypeForm" action="" method="get">
			   		<div class="select_div">
				   		<span class="select_title">문서 타입</span>
				        <div class="dropdown">
					        <select id="docType" name="docType">
					        	<option value="none">=== 선택 ===</option>
					           	<option value="app">신청서</option>
					           	<option value="draft">기안서</option>
					           	<option value="coop">협조문</option>
					        </select>
				        </div>
			        </div>
			        <div class="select_div">
				        <span class="select_title">문서 서식</span>
				        <div class="dropdown">
					        <select id="docForm" name="docForm">
					        	<option value="none">=== 선택 ===</option>
					           	<option value="title">제목</option>
					           	<option value="content">내용</option>
					        </select>
					   	</div>
			        </div>
			        <div class="select_div">
			        	<span class="select_title">문서 제목</span>
			        	<div class="input_docTitle">
			        		<input type="text" id="docTitle" name="docTitle">
			        	</div>
			        </div>
			  	</form>
            </div>
            
            <div class="modal_footer">
                <button class="next_btn" type="button">확인</button>
                <button class="cancel_btn" type="button">취소</button>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
	    
	</script>
		
</body>
</html>