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
			
			} else {
				
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
	    
	    
	    // 결재 취소 버튼 클릭 시
	    $(document).on("click", ".aprvCancle_btn", function() {
	    	
	    	/*	해당 문서의 기안자이며 가장 최근 기록이 기안(D)일 경우에만 삭제 가능
	    	 	뷰 조회해서 aprvDoc 객체에 가장 최근 기록 가져오고
	    	 	기안자와 로그인 유저 비교, 최근 기록 기안(D) 인지 비교해서
	    	 	기안자와 로그인 유저 비교 -> 기안자만 결재를 취소할 수 있습니다 띄우기
	    	 	기안자는 맞지만 이미 승인/반려 가 처리된 경우 -> 이미 승인/반려된 문서로 ~ 띄우기
	    	*/
	    	
	    	// 해당 문서 가장 최근 결재 기록 가져오기
	    	$.ajax({
	    		
	    		type: "post",
	    		url: "lastAprvHistory.do",
	    		data: { docNo : ${docNo} },
	    		success: function(data) {
	    			
	    			console.log(data);
	    			
	    			let drafter = "${ loginUser.empNo }";
	    			
	    			// 기안자가 아닌 경우
	    			if(drafter != data.drafter) {
	    				console.log("기안자가 아니야!");
	    				
	    				myAlert("결재 취소", "기안자만 해당 문서 결재를 취소할 수 있습니다.");
	    			
	    			// 기안자는 맞지만 이미 승인/반려 처리된 경우
	    			} else if(drafter == data.drafter && 'D' != data.aprvCode) {
	    				console.log("기안자는 맞지만 이미 처리된 문서야!!!");
	    				
	    				let content = "이미 " + data.aprvPro + " 처리된 문서입니다."
	    				
	    				myAlert("결재 취소", content);
	    			
	    			// 기안자도 맞고 아직 결재 처리되기 전이라면 결재 취소 가능
	    			} else if(drafter == data.drafter && 'D' == data.aprvCode) {
	    				console.log("결재 취소할 수 있어!!!!!!!");
	    				
	    				// confirm 모달 띄우기
	    		    	myConfirm("결재 취소", "결재를 취소하시겠습니까?");
	    		    	
	    		    	$(".false_btn").click(function() {
	    		    	    $("#helpmeCOnfirm").hide();
	    		    	});
	    		    	
	    		    	// 확인 클릭 시
	    		    	$(".true_btn").click(function() {
	    		    		$("#helpmeCOnfirm").hide();
	    		    		aprvCancleFn(); // 결재 취소 함수 실행
	    		    	});
	    			}
	    		}
	    		
	    	});
	    	
	    });
	    
	    
	    // 결재 취소 함수
	    function aprvCancleFn() {
	    	
	    	let form = $(".detailViewForm").serialize();
	    	let docType = ${ docType };
	    	console.log(docType);
	    	form += "&docType=" + docType;
	    	
	    	$.ajax({
	    		
	    		type: "post",
	    		url: "aprvCancle.do",
	    		data: form,
	    		success: function(result) {
	    			
	    			if(result == "success") {

    					myAlert("결재 취소", "결재가 취소되었습니다.");
    					
    					// 클릭 버튼 취소 시 모달 사라지고
    					$(document).on("click", ".cancel_btn", function() {
    			 			
    						$("#alertBackground").css("display","none")
    						// 결재 요청 메인으로 이동
    						location.href="requestMain.do";
    					})
    					
    					
    				} else {

   						myAlert("결재 취소", "결재 취소를 실패하였습니다.");
    				}
	    		}
	    		
	    	});
	    }
	    
	    
    </script>
    
</body>
</html>