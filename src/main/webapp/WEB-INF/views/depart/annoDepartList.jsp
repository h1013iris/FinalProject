<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 페이지 모달</title>
<style type="text/css">
	.annoDepartListsize{
		height:700px;
	}
	.annodDepartButton{
		padding:5px;
	}
	.annoButtonDiv{
		position: absolute;
	    top: 3px;
	    right: 30px;
	}
</style>
</head>
<body>
	<!-- 모달 시작부분 -->
    <div id="modal_background" class="annoDepartModal">
        <div id="modal_container" class="size800">
        	<!-- 모달 헤더 부분 -->
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">공지사항</span>
                <div class="annoButtonDiv" >
                	<a class="commonButton1 annodDepartButton"  href="enrollFormAnnoDepart.do">공지사항 작성하기</a>
                </div>
            </div >
            <!-- 모달 바디 부분 -->
            <div class="modal_body annoDepartListsize">
            	<table id="annoDepartArea" align="center" class="annoDepartTable">
            	
            	</table>
            </div>
            <!-- 모달 푸터 부분 -->
            <div class="modal_footer">
                <button class="next_btn deletebutton" type="button">다음</button>
                <button class="cancel_btn closebutton" type="button">취소</button>
            </div>
        </div>
	</div>
	<script type="text/javascript">
	
	</script>
</body>
</html>