<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 문서 서식 선택</title>
</head>
<body>

	<div id="modal_background" class="modal_doc">
        <div id="modal_container" class="size800">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">문서 서식 선택</span>
            </div >
            
            <div class="modal_body">
                결재 양식 선택
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