<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보안 설정 문서 상세 페이지</title>
<style type="text/css">
	
	.main_section { background-color: #f3f3f3; }
	
	.docDetailViewDiv {
		margin: 30px auto;
		width: 1500px;
	}
	
	.docDetailMainArea {
		padding: 70px 0 60px 10%;
		float: left;
	}
	
	.docDetailTable {	
		padding: 0 25px 25px 25px;
	}
	
	.docDetailArea {
		border: 1px solid darkgray;
		background-color: white;
		padding: 15px 25px 25px 25px;
	}
	
	.docDetail_textarea {
		resize: vertical;
		border: none;
	}
	
	.docDetailBtnsArea {
		margin-left: 67.7%;
		padding-top: 68px;
	}
	
	.docDetailBtn {
		margin: 0 5px 10px 5px;
		width: 80px;
		height: 50px;
	}
	
	.fix_input {
		border:0 solid black;
	}
	
	.approverName {
		width: 115px;
	}
	
	.approverJop {
		width: 40px;
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
		height: 410px;
		margin: 40px 20px 0 68.1%;
		padding: 15px;
		border: 3px solid #85cdff;
		background-color: #c0e3ff;
		border-radius: 15px; 
		font-size: 17px;
		font-weight: bold;
	}
	
	.scrtyText {
		font-size: 15px !important;
		font-weight: normal !important;
		margin-top: 10px;
	}
	
	.scrtyReqDate_div, .scrtySetDate_div {
		padding-top: 10px;
	}
	
	#scrtyReqDate, #scrtySetDate {
		padding-left: 10px;
	}
	
	#scrtyReason {
		padding-left: 2px;
		height: 300px;
		word-break:break-all;
		white-space: pre-wrap;
		overflow: auto;
		line-height: 130%;
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
					<button class="commonButton1 docScrtyCancel_btn docDetailBtn" type="button">보안취소</button><br>
					<button class="commonButton1 docscrtyList_btn docDetailBtn" onclick="location.href='securityMain.do'" type="button">목록으로</button>
				</div>
				<div class="scrtyReasonArea">
					<div class="scrtyReason_main">
						<div class="scrtyReqDate_div">
							보안 요청일
							<span class="scrtyText" id="scrtyReqDate"></span>
						</div>
						<div class="scrtySetDate_div">
							보안 설정일
							<span class="scrtyText" id="scrtySetDate"></span>
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
    		
			$(".page_title>.title_name").text("보안 설정 문서 상세 페이지");

			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {	
				
				loginFn(); // 로그인 먼저
			
			} else {
				
				scrtyReasonFn();
				selectApproverFn();
			}
    	});
    	
    	
    	// 결재자 조회
    	function selectApproverFn() {
    		
	 		$.ajax({
	 			
	 			type: "post",
                url: "selectDocApprover.do",
                data: { docNo : ${ docNo } },
                success: function (list) {

                	if(list != null) {
						for(var i in list) {
							if(list[i] != null) {
								$("#aprv" + (parseInt(i) + 1)).val(list[i].empNo);
								$("#aprvName" + (parseInt(i) + 1)).val(list[i].empName);
								$("#aprvJobName" + (parseInt(i) + 1)).val(list[i].jobName);
							}
						}
                	}
		 		}
	 		});
    	}
    	
    	
    	// 보안 요청 사유 조회하는 함수
	    function scrtyReasonFn() {
	    	
	    	$.ajax({
	    	
	    		type: "post",
    			url: "selectScrtyReason.do",
    			data: { docNo : "${ docNo }" },
    			success: function(data) {
    				    				
    				document.getElementById("scrtyReqDate").innerHTML = data.scrtyReqDate;
    				document.getElementById("scrtyReason").innerHTML = data.scrtyReason;
    				document.getElementById("scrtySetDate").innerHTML = data.scrtySetDate;

    			}
	    	});
	    	
	    }
    	
    	
    	
	 	// 보안 요청 버튼 클릭 시
	 	$(document).on("click", ".docScrtyCancel_btn", function() {
	 		
	 		let title = "문서 보안 설정 취소";
	 		let content = "보안을 취소하시겠습니까?";
	 		
	 		myConfirm(title, content);
	 		
	 		// 취소 버튼 클릭 시
	 		$(".false_btn").click(function(){
	 		    $("#helpmeCOnfirm").hide();
	 		});
	 		
	 		// 확인 버튼 클릭 시
	 		$(".true_btn").click(function(){
	 			$("#helpmeCOnfirm").hide();
	 	        
	 			// 보안 취소하는 ajax 실행
	 			$.ajax({
	    			
	    			type: "post",
	    			url: "docScrtyCancel.do",
	    			data: { docNo : "${ docNo }", 
	    					aprvStatus : 2,
	    					status : "Y" },
	    			success: function(result) {
	    				
	    				if(result == "success") {
	                    	
	                    	let content = "보안이 취소되었습니다.";
	                    	reResultFn(content);
		           	 		
	                    } else {
	                    	
	                    	let content = "보안 취소에 실패하였습니다.";
	                    	reResultFn(content);
	               		}
	    			}
				});
	 			
	 		});
    			
	 	});
	 	
	 	
	 	// 결재 버튼 클릭 시 결과에 따라 모달 띄우는 함수
		function reResultFn(content) {
		
			$("#alert_container .title_name").text("보안 설정 취소 확인");
			$("#alert_body .alert_content").text(content);
			$("#alertBackground").css("display","block");
			// 클릭 버튼 취소 시 모달 사라지고
			$(document).on("click", ".cancel_btn", function() {
	 			
				$("#alertBackground").css("display","none")
				// 결재 대기함 메인으로 이동
				location.href="securityMain.do";
			})
		
		}
    	
    
    </script>

</body>
</html>