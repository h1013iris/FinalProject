<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행 상태 확인 상세 페이지</title>
<style type="text/css">
	
	.main_section {
		/*border: 1px solid black;*/
		padding: 100px;
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
		margin-left: 84%;
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
	
	.statusList_btn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.statusList_btn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
	
	.returnReasonArea {
		width: 400px;
		height: 460px;
		margin: 40px 20px 0 64.8%;
		padding: 15px;
		border: 3px solid #85cdff;
		background-color: #c0e3ff;
		border-radius: 15px;
		/*box-shadow: 0 0 8px #85cdff;*/
		font-size: 17px;
		font-weight: bold;
	}
	
	.returnText {
		font-size: 15px !important;
		font-weight: normal !important;
		margin-top: 10px;
	}
	
	.reDate_div {
		padding-top: 10px;
	}
	
	#reFrom, #reDate {
		padding-left: 10px;
	}
	
	.returnModal_hr {
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
					<button class="commonButton1 statusList_btn docDetailBtn" 
							onclick="location.href='statusMain.do'" type="button">목록으로</button>
				</div>
				<div class="returnReasonArea">
					<div class="returnReason_main">
						<div class="reFrom_div">
							반려자
							<span class="returnText" id="reFrom"></span>
						</div>
						<div class="reDate_div">
							반려일
							<span class="returnText" id="reDate"></span>
						</div>
						<hr class="returnModal_hr">
						<div class="reReason_div">
							반려 사유
							<div class="returnText" id="reReason"></div>
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
				
				selectApproverFn();	// 결재자 조회
				
				$(".returnReasonArea").hide(); // 반려 문서 관련 div 숨기기
				
				let aprvStatus = ${ aprvStatus };
				
				// 반려 문서라면
				if(aprvStatus == 4) {
					
					reReason();  // 반려 관련 내용 조회하는 함수 실행
					
					// css 조정
					$(".docDetailBackground").css("width", "1500px");
					$(".docDetailBtnsArea").css("margin-left", "64.4%");
					
					$(".returnReasonArea").show();  // 반려 문서 관련 div 보이게
				}
			}
		});
    	
    	
    	// 결재자 조회
    	function selectApproverFn() {
    		
	 		$.ajax({
	 			
	 			type: "post",
                url: "selectDocApprover.do",
                data: { docNo : ${ docNo } },
                success: function (list) {
					console.log(list);
					if(list != null) {
						for(var i in list) {
							if(list[i] != null) {
								$("#aprv" + i).val(list[i].empNo);
								$("#aprvName" + i).val(list[i].empName);
								$("#aprvJobName" + i).val(list[i].jobName);
							}
						}
						/*$("#firstAprv").val(list[0].empNo);
						$("#firstAprvName").val(list[0].empName);
						$("#firstAprvJob").val(list[0].jobName);
						$("#secondAprv").val(list[1].empNo);
						$("#secondAprvName").val(list[1].empName);
						$("#secondAprvJob").val(list[1].jobName);
	                	}*/
	                }
		 		}
	 		});
    	}
    	
    	
    	
    	// 반려 관련 내용 조회하는 함수
    	function reReason() {
    		
    		$.ajax({
    			
    			type: "post",
    			url: "selectReReason.do",
    			data: { docNo : ${ docNo } },
    			success: function(data) {
    				console.log(data);
    				
    				document.getElementById("reFrom").innerHTML = data.reFromName;
    				document.getElementById("reReason").innerHTML = data.reReason;
    				document.getElementById("reDate").innerHTML = data.reDate;
    			}
    			
    		});
    	}
    	
    	
    </script>
</body>
</html>