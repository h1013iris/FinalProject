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
		height:80vh;
	}
	.annodDepartButton{
		padding:5px;
	}
	
	.annoButtonDiv{
		position: absolute;
	    top: 3px;
	    right: 30px;
	}
	.annoDepartTable{
		width: 100%;
	}
	.annoDepartTable thead{
		border-bottom: 1px solid;
		margin-bottom: 10px;
	}
	.titleDepartArea{
		width: 50%;
		height: 10%;
	}
	#annoDepartArea thead{
		height: 6%;
    	line-height: 30px;
	}
	.annoDepart_detail{
		height: 6%;
    	line-height: 30px;
    	text-align: center;
	}
	.annoDepart_Tilte{
		text-align: left;
		padding-left: 15px;
	}
	.annoDepart_detail:hover{
		cursor: pointer;
		background-color: rgb(174, 217, 248);
	}
	.commonButton1{
		width: 65px;
		height: 45px;
	}
	.buttonSection{
		height: 70px;
	}
</style>
</head>
<body>
	<!-- 모달 시작부분 -->
    <div id="modal_background" class="modal_background annoDepartModal">
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
            		<thead>
            			<tr>
            				<th class="titleDepartArea">제목</th>
            				<th>작성자</th>
            				<th>읽은 사람</th>
            				<th>작성일</th>
            			</tr>
            		</thead>
            		<tbody class="annoDepartListPart">

            		</tbody>
            	</table>
            </div>
            <!-- 모달 푸터 부분 -->
            <div class="modal_footer buttonSection" align="right">
                <button class="next_btn deletebutton commonButton1" type="button">다음</button>
                <button class="cancel_btn closebutton commonButton1" type="button">창 닫기</button>
            </div>
        </div>
	</div>
	<script type="text/javascript">
		
	</script>
	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>
	
</body>
</html>