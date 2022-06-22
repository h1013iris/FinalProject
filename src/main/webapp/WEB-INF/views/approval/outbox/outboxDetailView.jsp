<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 보관함 상세 페이지</title>
<style type="text/css">
	
	.main_section { background-color: #f3f3f3; }
	
	.docDetailViewDiv {
		margin: 30px auto;
		width: 1150px;
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
		resize: vertical;
		border: none;
	}
	
	.docDetailBtnsArea {
		padding-left: 84%;
		padding-top: 90px;
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
	
	.outboxDocDelete_btn {
		background-color: #6a6a6a !important;
		box-shadow: 0px 5px 0px 0px #545454 !important;
	}
	
	.outboxDocDelete_btn:hover {
		box-shadow: 0px 0px 0px 0px #545454 !important;
	}
	
	.outboxList_btn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.outboxList_btn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
	
	.outboxNo_div {
		/*border: 1px solid blue;*/
		padding: 5px 0;
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
		        		<jsp:include page="leaveOutboxDView.jsp"/>
		        	</c:when>
		        	<c:when test="${ docType == 11 }">
		        		<jsp:include page="cmtUpdateOutboxDView.jsp"/>
		        	</c:when>
		        	<c:when test="${ docType == 20 }">
		        		<jsp:include page="busDraftOutboxDView.jsp"/>
		        	</c:when>
		        	<c:when test="${ docType == 30 }">
		        		<jsp:include page="busCoopOutboxDView.jsp"/>
		        	</c:when>
	        	</c:choose>
				<div class="docDetailBtnsArea">
					<button class="commonButton1 docUpdateForm_btn docDetailBtn" type="button">수정하기</button><br>
					<button class="commonButton1 outboxDocDelete_btn docDetailBtn" type="button">삭제</button><br>
					<button class="commonButton1 outboxList_btn docDetailBtn" onclick="location.href='outboxMain.do'" type="button">목록으로</button>
				</div>
			</div>
		</div>
    </div>
    
    <script type="text/javascript">
    
	    $(document).ready(function() {
	    	
	    	$(".page_title>.title_name").text("임시 보관 문서 상세 페이지");

			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {	
				loginFn(); // 로그인 먼저
			}
		});
	    
	    
	    // 삭제 버튼 클릭 시
	    $(document).on("click", ".outboxDocDelete_btn", function() {
	    	
	    	let title = "임시 보관 삭제";
	    	let content = "해당 문서를 임시 보관함에서 삭제하시겠습니까?";
	    	
	    	myConfirm(title, content);
	    	
	    	// 취소 버튼 클릭 시 모달 끄기
	    	$(".false_btn").click(function(){
	    	    $("#helpmeCOnfirm").hide();
	    	})

	    	// 확인 버튼 클릭 시 삭제 진행
	    	$(".true_btn").click(function(){
	    		$("#helpmeCOnfirm").hide();
	    		
	    		$.ajax({
	    			
	    			type: "post",
	    			url: "deleteOutboxDoc.do",
	    			data: { outboxNo : ${ outboxNo },
	    					docType : ${ docType },
	    					docNo : $("#docNo").val() },
	    			success: function(result) {
						
	    				if(result == "success") {
							
							let content = "임시 저장 문서가 성공적으로 삭제되었습니다.";
 	                    	returnFn(content);
	 	           	 		
 	                    } else {
 	                    	
 	                    	let content = "임시 저장 문서 삭제에 실패하였습니다.";
 	                    	returnFn(content);
 	               		}
	    			}
	    			
	    		});
	    	})
	    	
	    });
	    
	    
	    
	    // 수정 버튼 클릭 시
	    $(document).on("click", ".docUpdateForm_btn", function() {
	    	
	    	let docType = ${ docType };
	    	let outboxNo = ${ outboxNo };
	    	
	    	location.href = "docUpdateForm.do?outboxNo=" + outboxNo + "&docType=" + docType;
	    });
	    
	    
	    
	    
	 	// 알림 띄우고 임시 보관함 메인으로 돌아가는 함수
    	function returnFn(content) {
    	    
    		$("#alertBackground .title_name").text("임시 저장 문서 삭제");
    	    $("#alertBackground .alert_content").text(content);
    	    $("#alertBackground").show();
    	    
    	 	// 확인 버튼 클릭 시 alert 모달 사라지고
    		$(document).on("click", ".cancel_btn", function() {
     			
    			$("#alertBackground").css("display","none")
    			// 반려 문서함 메인으로 이동
    			location.href="outboxMain.do";
    		})
    	}
	    
    </script>
    
</body>
</html>