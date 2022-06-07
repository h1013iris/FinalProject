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
	
	.docEnrollBackground {
		width: 1150px;
		height: 720px;
		border: 1px solid #e6e6e6;
		background-color: #e6e6e6;
		border-radius: 15px;
		box-shadow: 0 0 8px #afafaf;	
	}
	
	.formMainArea {
		/*border: 1px solid red;*/
		padding: 60px 0 60px 10%;
		/*float: left;*/
	}
	
	.docEnrollForm {	
		maring: 0 25px 25px 25px;
	}
	
	.formArea {
		border: 1px solid darkgray;
		background-color: white;
		padding: 0 25px 25px 25px;
		float: left;
	}
	
	.docEnrollBtnsArea {
		/*padding-top: 34%;*/
		padding-left: 20px;
		/*padding-top: 60px;*/
	}
	
	.docEnrollBtn {
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
	
	.donEnrollOutboxBtn {
		background-color: #6a6a6a !important;
		box-shadow: 0px 5px 0px 0px #545454 !important;
	}
	
	.donEnrollOutboxBtn:hover {
		box-shadow: 0px 0px 0px 0px #545454 !important;
	}
	
	.donEnrollCancleBtn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.donEnrollCancleBtn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

	<div class="main_section">
        <div class="docEnrollFormDiv">
	        <div class="docEnrollBackground">
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
    </div>
    
    <script type="text/javascript">
    	
    	// 문서 등록 페이지에서 취소 버튼 클릭 시
    	$(".cancle_btn").click(function() {
			
    		$("#confirm_container .title_name").text("문서 등록 취소 확인");
    		$("#confirm_body .confirm_content").text("문서 작성을 취소하시겠습니까?");
    		$("#helpmeCOnfirm").css("display","block");
    		
    		// 확인 버튼 클릭 시 모달 사라지고
    		$(document).on("click", ".true_btn", function() {
     			
    			$("#helpmeCOnfirm").css("display","none");
    			
    			location.href=document.referrer; //이전 페이지로 이동
    			// document.referrer : 마지막 페이지의 url을 가져오면 이전 정보는 가져올 수 없음
     		})
			
		})
		
    </script>
    
</body>
</html>