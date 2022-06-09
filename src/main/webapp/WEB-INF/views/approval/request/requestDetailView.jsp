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
		padding: 100px;
		/*text-align: center;*/
	}
	
	.docDetailViewDiv {
		/*margin-right: 3%;
		width: 84vw;*/
	}
	
	.docDetailBackground {
		width: 1150px;
		height: 780px;
		border: 1px solid #e6e6e6;
		background-color: #e6e6e6;
		border-radius: 15px;
		box-shadow: 0 0 8px #afafaf;	
	}
	
	.docDetailMainArea {
		/*border: 1px solid red;*/
		padding: 70px 0 0 100px;
		float: left;
	}
	
	.docDetailTable {	
		/*padding: 0 25px 25px 25px;*/
	}
	
	.docDetailArea {
		border: 1px solid darkgray;
		background-color: white;
		padding: 0 25px 25px 25px;
		/*float: left;*/
	}
	
	.docDetailBtnsArea {
		/*padding-top: 34%;*/
		padding-left: 84%;
		padding-top: 65px;
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
		background-color: #6a6a6a !important;
		box-shadow: 0px 5px 0px 0px #545454 !important;
	}
	
	.aprvCancle_btn:hover {
		box-shadow: 0px 0px 0px 0px #545454 !important;
	}
	
	.requestList_btn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.requestList_btn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
	<div class="main_section">
        <div class="docDetailViewDiv">
        	<div class="docDetailBackground">
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
				<div class="docDetailBtnsArea">
					<button class="commonButton1 aprvCancle_btn docDetailBtn" type="button">결재취소</button><br>
					<button class="commonButton1 requestList_btn docDetailBtn" onclick="location.href='requestMain.do'" type="button">목록으로</button>
				</div>
			</div>
		</div>
    </div>
    
    <script type="text/javascript">
	    $(document).ready(function() {
			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {	
				
				loginFn(); // 로그인 먼저
			}
		});
    </script>
    
</body>
</html>