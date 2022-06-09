<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 완료 상세 페이지</title>
<style type="text/css">
	.main_section {
		/*border: 1px solid black;*/
		padding: 100px;
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
		padding: 0 25px 25px 25px;
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
	
	.completeList_btn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.completeList_btn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
	
	.scrtyCheckMsg {
		/*border: 1px solid blue;*/
		height: 25px;
		width: 250px;
		font-size: 20px;
		font-weight: bold;
		background-color: #a3d1ff;
		color: #484848;
		box-shadow: 0 0 8px #a3d1ff;
		margin: 70px 0 10px 100px;
		text-align: center;
		line-height: 25px;
	}
	
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	<jsp:include page="scrtyReqModal.jsp"/>
	
	<div class="main_section">
        <div class="docDetailViewDiv">
        	<div class="docDetailBackground">
        	
        		<div class="scrtyCheckMsg">
					보안 요청된 문서입니다.
				</div>
				
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
					<%-- 직급이 부장인 경우에만 버튼 활성화 --%>
					<c:if test="${ loginUser.jobNo == 7}">
						<button class="commonButton1 sequrity_btn docDetailBtn" type="button">보안요청</button>
					</c:if>
					<button class="commonButton1 completeList_btn docDetailBtn" onclick="location.href='completeMain.do'" type="button">목록으로</button>
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
			
			$(".scrtyCheckMsg").hide();
			
			scrtyCheckFn();
		});
    	
    	
    	// 보안 요청 버튼 클릭 시
    	$(".sequrity_btn").click(function() {
    		
    		let title = "문서 보안 요청 확인";
    		let content = "해당 문서를 보안 요청하시겠습니까?";
    		
    		// confirm 모달 띄우고 
    		myConfirm(title, content);
    		
    		// 취소 버큰 클릭 시 confirm 모달창 닫기
    		$(document).on("click", ".false_btn", function() {
    		    
    			$("#helpmeCOnfirm").hide();
    		});
    		
    		
    		// 확인 버튼 클릭 시 보안 사유 작성하는 모달 띄우기
    		$(document).on("click", ".true_btn", function() {
    		
    			$("#helpmeCOnfirm").hide();
    			
    			// 보안 사유 작성하는 모달
    			$(".scrtyReq_modal").css("display", "flex");
    			
    		});
    		
    	});
    	
    	
    	
    	// 해당 문서가 보안 요청 되어있는지 확인하는 함수
    	function scrtyCheckFn() {
    		
    		$.ajax({
    			
    			type: "post",
    			url: "docScrtyReqCheck.do",
    			data: { docNo : "${ docNo }" },
    			success: function(result) {
    				console.log(result);
    				
    				// 조회 결과가 존재하면
    				if(result == "yes") {
    					console.log("보안 요청 불가능");
    					
    					$(".sequrity_btn").hide(); // 해당 버튼 숨기고
    					$(".scrtyCheckMsg").show(); // 메시지 띄우기
    					$(".docDetailBtnsArea").css("padding-top", "0"); // 버튼 위치 조정
    					$(".docDetailMainArea").css("padding", "0 0 0 100px");
    					
    				
    				// 존재하지 않으면
    				} else if(result == "no") {
    					console.log("보안 요청 가능");
    					
    					//$(".scrtyCheckMsg").hide(); // 메시지 숨기기
    				}
    				
    			}
    			
    		});
    		
    	}
    	
    	
    	
    </script>
</body>
</html>