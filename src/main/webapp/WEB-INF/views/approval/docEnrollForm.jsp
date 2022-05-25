<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 등록 폼</title>
<style type="text/css">

	.main_section {
		border: 1px solid black;
	}
	
	.docEnrollForm {
		border: 1px solid black;
		margin-right: 3%;
		padding: auto;
		width: 83vw;
		
	}
	
	.mainDiv {
		border: 1px solid black;
		width: 80%;
		float: left;
	}
	
	.btnsArea {
		width: 5%;
		padding: 30% 0 5% 5%;
	}
	
	button {		
		margin: 5%;
		width: 80%;
	}

</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="main_section">
        
        <form class="docEnrollForm" action="docEnroll.do" method="post">
	        <%-- 문서 서식에 맞게 폼 뜨도록 --%>
	        <c:choose>
	        	<c:when test="${ docForm == 10 }">
	        		<jsp:include page="documentForm/leaveForm.jsp"/>
	        	</c:when>
	        	<c:when test="${ docForm == 11 }">
	        		<jsp:include page="documentForm/cmtUpdateForm.jsp"/>
	        	</c:when>
	        	<c:when test="${ docForm == 20 }">
	        		<jsp:include page="documentForm/busDraftForm.jsp"/>
	        	</c:when>
	        	<c:when test="${ docForm == 30 }">
	        		<jsp:include page="documentForm/busCoopForm.jsp"/>
	        	</c:when>
	        </c:choose>
	        
	        <div class="btnsArea">
	        	<button class="submit_btn" type="submit">결재요청</button> <br>
	        	<button class="outbox_btn" type="button">임시저장</button> <br> <%-- 임시저장 기능 --%>
	        	<button class="cancle_btn" type="button">취소</button>
	        </div>
        </form>
		
    </div>
    
</body>
</html>