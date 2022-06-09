<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 보안 관리 상세 페이지</title>
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
		width: 1500px;
		height: 790px;
		border: 1px solid #e6e6e6;
		background-color: #e6e6e6;
		border-radius: 15px;
		box-shadow: 0 0 8px #afafaf;	
	}
	
	.docDetailMainArea {
		/*border: 1px solid red;*/
		padding: 70px 0 60px 10%;
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
		margin-left: 67.8%;
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
	
	.docscrtyList_btn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.docscrtyList_btn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
	
	.docSecurityCancel_btn {
		background-color: #6a6a6a !important;
		box-shadow: 0px 5px 0px 0px #545454 !important;
	}
	
	.docSecurityCancel_btn:hover {
		box-shadow: 0px 0px 0px 0px #545454 !important;
	}
	
	.scrtyReasonArea {
		width: 400px;
		height: 460px;
		margin: 40px 20px 0 68.2%;
		padding: 15px;
		border: 3px solid #85cdff;
		background-color: #c0e3ff;
		border-radius: 15px;
		/*box-shadow: 0 0 8px #85cdff;*/
		font-size: 17px;
		font-weight: bold;
	}
	
	.scrtyText {
		font-size: 15px !important;
		font-weight: normal !important;
		margin-top: 10px;
	}
	
	.scrtyReqDate_div {
		padding-top: 10px;
	}
	
	#scrtyReqDate, #scrtyReason {
		padding-left: 10px;
	}
	
	.scrtyReason_hr {
		margin: 15px 0 15px 0;
		border: 1px solid #85cdff;
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
		        		<jsp:include page="../../approval/documentDetailView/leaveFormDetailView.jsp"/>
		        	</c:when>
		        	<c:when test="${ docType == 11 }">
		        		<jsp:include page="../../approval/documentDetailView/cmtUpdateFormDetailView.jsp"/>
		        	</c:when>
		        	<c:when test="${ docType == 20 }">
		        		<jsp:include page="../../approval/documentDetailView/busDraftFormDetailView.jsp"/>
		        	</c:when>
		        	<c:when test="${ docType == 30 }">
		        		<jsp:include page="../../approval/documentDetailView/busCoopFormDetailView.jsp"/>
		        	</c:when>
	        	</c:choose>
				<div class="docDetailBtnsArea">
					<button class="commonButton1 docSecurity_btn docDetailBtn" type="button">보안설정</button><br>
					<button class="commonButton1 docSecurityCancel_btn docDetailBtn" type="button">보안취소</button><br>
					<button class="commonButton1 docscrtyList_btn docDetailBtn" onclick="location.href='securityMain.do'" type="button">목록으로</button>
				</div>
				<div class="scrtyReasonArea">
					<div class="scrtyReason_main">
						<div class="scrtyReqDate_div">
							보안 요청일
							<span class="scrtyText" id="scrtyReqDate"></span>
						</div>
						<hr class="scrtyReason_hr">
						<div class="scrtyReason_div">
							보안 요청 사유
							<div class="scrtyText" id="scrtyReason"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    
    <script type="text/javascript">
    
	    $(document).ready(function() {
			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {
				
				loginFn(); // 로그인 먼저
			
			} else {
				
				$(".docSecurityCancel_btn").hide(); // 처음에는 숨기고
				
				// 보안 요청 유무 확인 함수 실행
				scrtyCheckFn();
			}
			
		});
	    
	    
	    
	    
	 	// 보안 요청 유무 확인 함수 실행
	    function scrtyCheckFn() {
	    	
			$.ajax({
    			
    			type: "post",
    			url: "docScrtyCheck.do",
    			data: { docNo : "${ docNo }" },
    			success: function(result) {
    				console.log(result);
    				
    				// 조회 결과가 존재하면
    				if(result == "yes") {
    					console.log("보안 설정 불가능");
    					
    					$(".docSecurity_btn").hide(); // 보안 요청 버튼 숨기고
    					$(".docSecurityCancel_btn").show(); // 보안 취소 버튼 띄우기
    					/*$(".docDetailBtnsArea").css("padding-top", "0"); // 버튼 위치 조정
    					$(".docDetailMainArea").css("padding", "0 0 0 100px");*/
    					
    				
    				// 존재하지 않으면
    				} else if(result == "no") {
    					console.log("보안 설정 가능");
    					
    					//$(".scrtyCheckMsg").hide(); // 메시지 숨기기
    				}
    				
    			}
    			
    		});
	    	
	    }
	    
	    
    </script>
</body>
</html>