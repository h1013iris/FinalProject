<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려 문서 상세 페이지</title>
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
		margin-left: 64.5%;
		padding-top: 65px;
	}
	
	.docDetailBtn {
		margin: 5px;
		width: 80px;
		height: 50px;
	}
	
	.fix_input {border:0 solid black;}
	
	.approverName {
		width: 100px;
	}
	
	.approverJop {
		width: 50px;
		/*text-align: right;*/
	}
	
	.delete_btn {
		background-color: #6a6a6a !important;
		box-shadow: 0px 5px 0px 0px #545454 !important;
	}
	
	.delete_btn:hover {
		box-shadow: 0px 0px 0px 0px #545454 !important;
	}
	
	.returnList_btn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.returnList_btn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
	
	.returnReasonArea {
		width: 400px;
		height: 460px;
		margin: 40px 20px 0 65%;
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
					<button class="commonButton1 delete_btn docDetailBtn" type="button">삭제</button><br>
					<button class="commonButton1 returnList_btn docDetailBtn" 
							onclick="location.href='returnMain.do'" type="button">목록으로</button>
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
				
				// 반려 관련 내용 가져오는 ajax
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
    		
    	});
    	
    	
    	// 삭제 버튼 클릭 시
    	$(".delete_btn").click(function() {
    		
    		let loginUser = ${ loginUser.empNo };
    		
    		// 해당 문서 기안자 조회하는 ajax
    		$.ajax({
    			
    			type: "post",
    			url: "selectDrafter.do",
    			data: { docNo : ${ docNo } },
    			success: function(drafter) {
    				console.log(drafter);
    				
    				// 기안자와 로그인 유저가 일치하지 않으면
    				if(drafter != loginUser) {
    					
    					let title = "반려 문서 삭제 확인";
    		    		let content = "해당 문서의 기안자만 삭제할 수 있습니다.";
    		    		
    		    		myAlert(title, content);
    				
    				} else if(drafter == loginUser) {
    					
    					let title = "반려 문서 삭제 확인";
    					let content = "문서를 삭제하시겠습니까?";
        					
    					myConfirm(title, content);
    					
    					resultFn();
       					
    				}
    			}
    		});
    		
    	});
    	
    	
    	// confirm 결과에 따라 문서 삭제 진행하는 함수
    	function resultFn() {
    		
    		// 취소 버큰 클릭 시 confirm 모달창 닫기
    		$(".false_btn").click(function() {
    		    
    			$("#helpmeCOnfirm").hide();
    		})

    		// 확인 버튼 클릭 시 해당 문서 삭제 진행
    		$(".true_btn").click(function() {
    			
    			$("#helpmeCOnfirm").hide();
    	        
    			// 문서 삭제하는 ajax 실행
				$.ajax({
					
					type: "post",
					url: "deleteReturnDoc.do",
					data: { docNo : ${ docNo } },
					success: function(result) {
						
						if(result == "success") {
							
							let content = "반려 문서가 성공적으로 삭제되었습니다.";
 	                    	returnFn(content);
	 	           	 		
 	                    } else {
 	                    	
 	                    	let content = "반려 문서 삭제에 실패하였습니다.";
 	                    	returnFn(content);
 	               		}
					}

				});
    			
    		})
    		
    	}
    	
    	
    	// 알림 띄우고 반려함 메인으로 돌아가는 함수
    	function returnFn(content) {
    	    
    		$("#alertBackground .title_name").text("반려 문서 삭제");
    	    $("#alertBackground .alert_content").text(content);
    	    $("#alertBackground").show();
    	    
    	 	// 확인 버튼 클릭 시 alert 모달 사라지고
    		$(document).on("click", ".cancel_btn", function() {
     			
    			$("#alertBackground").css("display","none")
    			// 반려 문서함 메인으로 이동
    			location.href="returnMain.do";
    		})
    	}
    	
    	
    	
    
    </script>
</body>
</html>