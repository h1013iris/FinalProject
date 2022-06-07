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
	}
	
	.docDetailViewDiv {
		margin-right: 3%;
		width: 84vw;
	}
	
	.docDetailBackground {
		width: 1400px;
		height: 720px;
		border: 1px solid #e6e6e6;
		background-color: #e6e6e6;
		border-radius: 15px;
		box-shadow: 0 0 8px #afafaf;	
	}
	
	.docDetailMainArea {
		/*border: 1px solid red;*/
		padding: 60px 0 60px 10%;
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
		margin-left: 72%;
		padding-top: 60px;
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
		background-color: #c0e3ff;
		margin: 40px 20px 0 72.5%;
		padding: 15px;
		/*border: 1px solid blue;*/
		font-size: 17px;
		font-weight: bold;
	}
	
	.returnText {
		font-size: 15px !important;
		font-weight: normal !important;
		margin-top: 10px;
	}
	
	hr {
		margin: 15px 0 15px 0;
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
					<button class="commonButton1 returnList_btn docDetailBtn" onclick="location.href='returnMain.do'" type="button">목록으로</button>
				</div>
				<div class="returnReasonArea">
					<div class="returnReason_main">
						반려자
						<div class="returnText" id="reFrom"></div>
						
						<hr>
						반려 사유
						<div class="returnText" id="reReason"></div>
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
			
				$.ajax({
	    			
	    			type: "post",
	    			url: "selectReReason.do",
	    			data: { docNo : ${ docNo } },
	    			success: function(data) {
	    				console.log(data);
	    				
	    				document.getElementById("reFrom").innerHTML = data.reFromName;
	    				document.getElementById("reReason").innerHTML = data.reReason;
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
    					
    					let content = "해당 문서의 기안자만 삭제할 수 있습니다.";
    					
    					alertFn(content);
    				
    				} else if(drafter == loginUser) {
    					
    					let content = "문서를 삭제하시겠습니까?";
        					
    					alertFn(content);
       					
    				}
    			}
    		});
    		
    	});
    	
    	
    	function alertFn(content, result) {
    		
    		$("#alert_container .title_name").text("반려 문서 삭제");
    		$("#alert_body .alert_content").text(content);
    		$("#alertBackground").css("display","block");
    		// 클릭 버튼 취소 시 모달 사라지고
    		$(document).on("click", ".cancel_btn", function() {
     			
    			$("#alertBackground").css("display","none");
    			
    			if(result == 2) {
    				// 문서 삭제하는 ajax 실행
   					$.ajax({
   						
   						type: "post",
   						url: "deleteReturnDoc.do",
   						data: { docNo : ${ docNo } },
   						success: function(result) {
   							
   							if(result == "success") {
   								
   	 	                    	let content = "문서가 성공적으로 삭제되었습니다.";
   	 	                    	alertFn(content, 1);
   		 	           	 		
   	 	                    } else {
   	 	                    	
   	 	                    	let content = "문서 삭제에 실패하였습니다.";
   	 	                    	alertFn(content, 2);
   	 	               		}
   						}

   					});
    			}
     		})
    	}
    
    
    </script>
</body>
</html>