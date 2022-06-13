<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 보관함 상세 페이지</title>
<style type="text/css">
	.main_section {
		/*border: 1px solid black;*/
		padding: 100px;
	}
	
	.docDetailBackground {
		width: 1150px;
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
		margin-left: 85.4%;
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
	
	.docUpdateForm_btn {
		background-color: #6a6a6a !important;
		box-shadow: 0px 5px 0px 0px #545454 !important;
	}
	
	.docUpdateForm_btn:hover {
		box-shadow: 0px 0px 0px 0px #545454 !important;
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
		        		<jsp:include page="../outboxDocDetailView/leaveOutboxDView.jsp"/>
		        	</c:when>
		        	<c:when test="${ docType == 11 }">
		        		<jsp:include page="../outboxDocDetailView/cmtUpdateOutboxDView.jsp"/>
		        	</c:when>
		        	<c:when test="${ docType == 20 }">
		        		<jsp:include page="../outboxDocDetailView/busDraftOutboxDView.jsp"/>
		        	</c:when>
		        	<c:when test="${ docType == 30 }">
		        		<jsp:include page="../outboxDocDetailView/busCoopOutboxDView.jsp"/>
		        	</c:when>
	        	</c:choose>
				<div class="docDetailBtnsArea">
					<button class="commonButton1 approve_btn docDetailBtn" type="button">결재요청</button><br>
					<button class="commonButton1 docUpdateForm_btn docDetailBtn" type="button">수정</button><br>
					<button class="commonButton1 outboxDocDelete_btn docDetailBtn" type="button">삭제</button><br>
					<button class="commonButton1 outboxList_btn docDetailBtn" onclick="location.href='outboxMain.do'" type="button">목록으로</button>
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
	    					docType : ${ docType } },
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