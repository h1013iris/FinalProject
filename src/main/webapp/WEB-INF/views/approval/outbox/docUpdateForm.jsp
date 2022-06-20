<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 수정 페이지</title>
<style type="text/css">

	.main_section {
		/*border: 1px solid black;*/
		padding: 100px;
	}
	
	.docUpdateFormDiv {
		/*margin-right: 3%;
		width: 84vw;*/
	}
	
	.docUpdateBackground {
		width: 1150px;
		height: 780px;
		border: 1px solid #e6e6e6;
		background-color: #e6e6e6;
		border-radius: 15px;
		box-shadow: 0 0 8px #afafaf;	
	}
	
	.formMainArea {
		/*border: 1px solid red;*/
		padding: 70px 0 0 100px;
	}
	
	.docUpdateForm {	
		/*maring: 0 25px 25px 25px;*/
	}
	
	.formArea {
		border: 1px solid darkgray;
		background-color: white;
		padding: 0 25px 25px 25px;
		float: left;
	}
	
	.docUpdateBtnsArea {
		padding-top: 0;
		padding-left: 82.5%;
	}
	
	.docUpdateFormBtn {
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
	
	.docUpdate_btn {
		background-color: #6a6a6a !important;
		box-shadow: 0px 5px 0px 0px #545454 !important;
	}
	
	.docUpdate_btn:hover {
		box-shadow: 0px 0px 0px 0px #545454 !important;
	}
	
	.cancle_btn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.cancle_btn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
	
	.outboxNo_div {
		/*border: 1px solid blue;*/
		padding: 5px;
	}
	
	.approverList {
		width: 100%;
	}
	
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>

	<div class="main_section">
        <div class="docUpdateFormDiv">
	        <div class="docUpdateBackground">
		        <%-- 문서 서식에 맞게 폼 뜨도록 --%>
		        <c:choose>
		        	<c:when test="${ docForm == 10 }">
		        		<jsp:include page="docUpdateForm/leaveUpdateForm.jsp"/>
		        	</c:when>
		        	<c:when test="${ docForm == 11 }">
		        		<jsp:include page="docUpdateForm/cmtUpdateUpdateForm.jsp"/>
		        	</c:when>
		        	<c:when test="${ docForm == 20 }">
		        		<jsp:include page="docUpdateForm/busDraftUpdateForm.jsp"/>
		        	</c:when>
		        	<c:when test="${ docForm == 30 }">
		        		<jsp:include page="docUpdateForm/busCoopUpdateForm.jsp"/>
		        	</c:when>
	        	</c:choose>
        	</div>
		</div>
    </div>
    
    <script type="text/javascript">
    	
    	// 문서 등록 페이지에서 취소 버튼 클릭 시
    	$(".cancle_btn").click(function() {
			
    		$("#confirm_container .title_name").text("문서 수정 취소 확인");
    		$("#confirm_body .confirm_content").text("문서 수정을 취소하시겠습니까?");
    		$("#helpmeCOnfirm").css("display","block");
    		
    		// 확인 버튼 클릭 시 모달 사라지고
    		$(document).on("click", ".true_btn", function() {
     			
    			$("#helpmeCOnfirm").css("display","none");
    			
    			location.href=document.referrer; //이전 페이지로 이동
    			// document.referrer : 마지막 페이지의 url을 가져오면 이전 정보는 가져올 수 없음
     		});
    		
    		$(document).on("click", ".false_btn", function() {
    			$("#helpmeCOnfirm").css("display","none");
    		});
			
		})
		
    </script>
    
</body>
</html>