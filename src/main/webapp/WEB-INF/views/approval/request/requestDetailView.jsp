<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 요청 문서 상세 페이지</title>
<style type="text/css">
	.main_section {
		/*border: 1px solid black;*/
	}
	
	.docDetailViewDiv {
		/*border: 1px solid blue;*/
		margin-right: 3%;
		width: 84vw;
	}
	
	.docDetailMainArea {
		/*border: 1px solid red;*/
		padding-left: 10%;
		/*width: 1000px;*/
		/*float: left;*/
	}
	
	.docDetailTable {	
		padding: 0 25px 25px 25px;
	}
	
	.docDetailArea {
		border: 1px solid black;
		padding: 0 25px 25px 25px;
		float: left;
	}
	
	.docDetailBtnsArea {
		/*padding-top: 34%;*/
		padding-left: 20px;
	}
	
	.docDetailBtn {
		margin: 5px;
		width: 80px;
		height: 50px;
	}
	
	.fix_input {
		border:0 solid black;
	}
	
	.approverName {
		width: 100px;
	}
	
	.approverJop {
		width: 50px;
		/*text-align: right;*/
	}
	
	.aprvCancle_btn {
		background-color: rgb(174, 217, 248) !important;
		box-shadow: 0px 5px 0px 0px #92bddc !important;
	}
	
	.aprvCancle_btn:hover {
		box-shadow: 0px 0px 0px 0px #92bddc !important;
	}
	
	.requesstList_btn {
		background-color: #c8c8c8 !important;
		box-shadow: 0px 5px 0px 0px #afafaf !important;
	}
	
	.requesstList_btn:hover {
		box-shadow: 0px 0px 0px 0px #afafaf !important;
	}
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
	<div class="main_section">
        <div class="docDetailViewDiv">
	        <%-- 문서 서식에 맞게 폼 뜨도록 --%>
	        <c:choose>
	        	<c:when test="${ docType == 10 }">
	        		<jsp:include page="../documentDetailView/leaveFormDetailView.jsp"/>
	        	</c:when>
	        	<c:when test="${ docType == 11 }">
	        		<jsp:include page="../documentDetailView/cmtUpdateFormDetailView.jsp"/>
	        	</c:when>
	        	<c:when test="${ docType == 20 }">
	        		<jsp:include page="../documentDetailView/busDraftFormDetailView.jsp"/>
	        	</c:when>
	        	<c:when test="${ docType == 30 }">
	        		<jsp:include page="../documentDetailView/busCoopFormDetailView.jsp"/>
	        	</c:when>
        	</c:choose>
		</div>
    </div>
    
    <script type="text/javascript">
    
    </script>
    
</body>
</html>