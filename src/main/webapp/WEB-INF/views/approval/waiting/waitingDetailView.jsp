<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 대기 문서 상세 페이지</title>
<style type="text/css">

	.docDetailViewDiv {
		margin: 30px auto;
		width: 1150px;
	}
	
	.docDetailBackground {
		height: 780px;
		border: 1px solid #e6e6e6;
		background-color: #e6e6e6;
		border-radius: 15px;
		box-shadow: 0 0 8px #afafaf;	
	}
	
	.docDetailMainArea {
		padding: 70px 0 0 100px;
		float: left;
	}
	
	.docDetailArea {
		border: 1px solid darkgray;
		background-color: white;
		padding: 0 25px 25px 25px;
	}
	
	.docDetail_textarea {
		resize: none;
		border: none;
	}
	
	.docDetailBtnsArea {
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
		width: 115px;
	}
	
	.approverJop {
		width: 40px;
	}
	
	.return_btn {
		background-color: #6a6a6a !important;
		box-shadow: 0px 5px 0px 0px #545454 !important;
	}
	
	.return_btn:hover {
		box-shadow: 0px 0px 0px 0px #545454 !important;
	}
	
	.waitingList_btn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.waitingList_btn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	<jsp:include page="returnReasonModal.jsp"/>
	
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
					<button class="commonButton1 approve_btn docDetailBtn" type="button">결재승인</button><br>
					<button class="commonButton1 return_btn docDetailBtn" type="button">반려</button><br>
					<button class="commonButton1 waitingList_btn docDetailBtn" onclick="location.href='waitingMain.do'" type="button">목록으로</button>
				</div>
			</div>
		</div>
    </div>
    
    <script type="text/javascript">
    	
    	$(document).ready(function() {
    		
			$(".page_title>.title_name").text("결재 대기 문서 상세 페이지");

			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {	
				
				loginFn(); // 로그인 먼저
			
			} else {
				selectApproverFn();	// 결재자 조회
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
    	
    
    	// 반려 버튼 클릭 시 모달창 띄우기
  		$(document).on("click", ".return_btn", function() {
  			
  			$("#reReason").val("");
  			$(".returnReason_modal").css("display","flex");
  		})
  		
  		
  		// 결재 승인 버튼 클릭 시 confirm 창 띄우기
  		$(document).on("click", ".approve_btn", function() {
  			
  			let title = "결재 승인 확인";
  			let content = "결재를 승인하시겠습니까?";

  			myConfirm(title, content);
			
  			let loginUser = "${ loginUser.empNo }";
			let firstAprv = $("#aprv0").val();
			let secondAprv = $("#aprv1").val();
			
			
			
					(secondAprv == "" && loginUser == firstAprv));
			
    		// 확인 버튼 클릭 시 confirm 모달 사라지고 결재 승인 진행
    		$(document).on("click", ".true_btn", function() {
     			
    			$("#helpmeCOnfirm").css("display","none");
				
    			// 폼의 모든 데이터 저장해서 변수로 선언
				// 결재 기록 등록하기 위해 디테일뷰도 같이 넘기기
	 			let form = $(".detailViewForm").serialize();
    			
    			let aprvPro = "A"; // 결재 처리 (승인)
    			let aprvStatus = 2; // 결재 진행 상태 (결재 완료) -> 마지막 결재자일 경우
    			
    			let loginUser = "${ loginUser.empNo }";
    			let firstAprv = $("#aprv0").val();
    			let secondAprv = $("#aprv1").val();
    			
    			let url = "";		// 중간. 최종 승인에 따라 url 변경
    			let approve = 0;	// 중간, 최종 승인 구별하기 위한 변수
    			
    			// 중간 승인
    			// 2차 결재자가 null이 아니고, 본인이 1차 결재자일 경우 -> 결재 기록만 등록
    			if(secondAprv != "" && loginUser == firstAprv) {
    				
    				
    				approve = 1;
    			
    			// 최종 승인
    			// 본인이 2차 결재자이거나, 2차 결재자가 null인 문서의 1차 결재자일 경우 -> 기록 등록, 상태값 변경
    			} else if(loginUser == secondAprv || 
    						(secondAprv == "" && loginUser == firstAprv)) {
    				
    				
    				approve = 2;
    			}
    			
    			// 결재 처리 코드, 결재 상태값 쿼리스트링으로 붙여서 같이 넘김
				form += "&aprvPro=" + aprvPro + "&aprvStatus=" + aprvStatus + "&approve=" + approve;
				
				$.ajax({
    				
    				type: "post",
    				url: "documentApprove.do",
    				data: form,
    				success: function(result) {
    					
	                	
	                    if(result == "success") {

	                    	if(approve == 2) {
	                    		reResultFn("최종 승인이 완료되었습니다.");
	                    	} else {
	                    		reResultFn("승인이 완료되었습니다.");
	                    	}

	                    } else {
	                    	
	                    	let content = "결재 승인에 실패하였습니다.";
	                    	reResultFn(content);
	               		}
    				}
    			});
    			
     		});
    		
    		// 취소 클릭 시 confirm 모달 닫기만
    		$(".false_btn").click(function() {
    		    $("#helpmeCOnfirm").hide();
    		})
  			
  		});
    	
    	
  		// 결재 버튼 클릭 시 결과에 따라 모달 띄우는 함수
		function reResultFn(content) {
		
			$("#alert_container .title_name").text("결재 승인 확인");
			$("#alert_body .alert_content").text(content);
			$("#alertBackground").css("display","block");
			// 클릭 버튼 취소 시 모달 사라지고
			$(document).on("click", ".cancel_btn", function() {
	 			
				$("#alertBackground").css("display","none")
				// 결재 대기함 메인으로 이동
				location.href="waitingMain.do";
			})
		
		}

    </script>
</body>
</html>