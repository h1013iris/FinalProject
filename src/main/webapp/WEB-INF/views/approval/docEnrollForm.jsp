<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 등록 폼</title>
<style type="text/css">

	.main_section {
		/*border: 1px solid black;*/
	}
	
	.docEnrollFormDiv {
		/*border: 1px solid blue;*/
		margin-right: 3%;
		width: 84vw;
		
	}
	
	.formMainArea {
		/*border: 1px solid red;*/
		padding-left: 10%;
		/*width: 1000px;*/
		float: left;
	}
	
	.docEnrollForm {	
		maring: 0 25px 25px 25px;
	}
	
	.formArea {
		border: 1px solid black;
		padding: 0 25px 25px 25px;
		float: left;
	}
	
	.docEnrollBtnsArea {
		/*padding-top: 34%;*/
		padding-left: 20px;
		
	}
	
	.docEnrollBtn {
		margin: 5px;
		width: 80px;
		height: 50px;
		
	}
	
	.fix_input {
		border:0 solid black;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<!--<c:set var="docTypeNo" value="${ docForm }" />

	<fmt:formatNumber value="${ docTypeNo }" type="number" var="docTypeNo" />-->



	<div class="main_section">
        <div class="docEnrollFormDiv">
		        <%-- 문서 서식에 맞게 폼 뜨도록 --%>
		        <c:choose>
		        	<c:when test="${ docForm == 10 }">
		        		<jsp:include page="documentForm/leaveEnrollForm.jsp"/>
		        	</c:when>
		        	<c:when test="${ docForm == 11 }">
		        		<jsp:include page="documentForm/cmtUpdateEnrollForm.jsp"/>
		        	</c:when>
		        	<c:when test="${ docForm == 20 }">
		        		<jsp:include page="documentForm/busDraftEnrollForm.jsp"/>
		        	</c:when>
		        	<c:when test="${ docForm == 30 }">
		        		<jsp:include page="documentForm/busCoopEnrollForm.jsp"/>
		        	</c:when>
	        	</c:choose>
		</div>
    </div>
    
    <script type="text/javascript">
    	
    	// 문서 등록 페이지에서 취소 버튼 클릭 시 이전 페이지로 이동
    	$(".cancle_btn").click(function() {
			location.href=document.referrer;
			// document.referrer : 마지막 페이지의 url을 가져오면 이전 정보는 가져올 수 없음
		})
		
    </script>
    
</body>
</html>