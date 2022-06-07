<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려 사유 모달창</title>
<style type="text/css">

	.returnReason_title {
		font-size: 21px;
		font-weight: bold;
	}
	
	.returnReason_body {
		/*border: 1px solid black;*/
		margin: 30px 0 30px 0;
	}
	
	hr {
		margin: 30px 0 30px 0;
	}
	
	.returnReason_textarea {
		margin-top: 10px;
	}
	
	#reReason {
		width: 496px;
		height: 300px;
		resize: none;
		font-size: 15px;
	}
	
	.errorMsg {
		color: red;
	}
	
	.returnText {
		font-size: 17px;
		font-weight: bold;
	}
	
	#reFromName {
		border: 0;
		font-size: 16px;
	}
	
	.returnReason_footer {
		height: 50px;
		/*border: 1px solid black;*/
		margin-bottom: 6%;
	}

</style>
</head>
<body>

    <div id="modal_background" class="modal_background returnReason_modal">
        <div id="modal_container" class="size600">
            <div class="modal_header returnReasonHeader">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title returnReason_title">반려 사유</span>
            </div>
            
            <form class="returnReason_form">
            	<input type="hidden" name="aprvPro" value="R"/>
            	<input type="hidden" name="aprvStatus" value="4"/>
            	
	            <div class="modal_body returnReason_body">
					<div class="returnFromArea">
						<span class="returnText">반려자 : 
							<input id="reFromName" name="reFromName" value="${ loginUser.empName }"/>
							<input type="hidden" id="reFrom" name="reFrom" value="${ loginUser.empNo }"/>
						</span>
					</div>
					<hr>
					<div class="returnReason_area">
						<span class="returnText">반려 사유</span> &nbsp;
						<span class="errorMsg"></span>
						<div class="returnReason_textarea">
							<textarea id="reReason" name="reReason" maxlength="500"></textarea>
						</div>
					</div>
	            </div>
	            <div class="modal_footer returnReason_footer">
	               	<button class="commonButton1 modal_nextBtn next_btn" type="button">반려</button>
	               	<button class="commonButton1 modal_cascelBtn cancel_btn" type="button" data-dismiss="modal">취소</button>
	           	</div>
           	</form>
           	
        </div>
    </div>
    
    <script type="text/javascript">
	    
	    // 반려 버튼 클릭 시 
		$(document).on("click", ".modal_nextBtn", function() {
			
			$(".errorMsg").empty();
			
			let reReason = $("#reReason").val();
			
			// 유효성 검사
			if(reReason == null || reReason == "") {
				
				$(".errorMsg").text("반려 사유를 작성해주세요.");
				$("#reReason").focus();
				
			} else {
				
				// 폼의 모든 데이터 저장해서 변수로 선언
				// 결재 기록 등록하기 위해 디테일뷰도 같이 넘기기
	 			let form = $(".returnReason_form, .detailViewForm").serialize();
				
				console.log($("#docNo").val());
				
				$.ajax({
					
					type: "post",
	                url: "aprvReturn.do",
	                data: form,
	                success: function (result) {
	                	console.log(result)
	                	
	                    if(result == "success") {
							
	                    	$(".returnReason_modal").hide();
	                    	
	                    	let title = "결재 반려 확인";
	                    	let content = "결재가 성공적으로 반려되었습니다.";
	                    	reResultFn(content);
 	           	 		
	                    } else {
	                    	
	                    	$(".returnReason_modal").hide();
	                    	
	                    	let content = "결재 반려에 실패하였습니다.";
	                    	reResultFn(content);
	               		}
	                }
				});
			}

		});
	    
	    
		// 반려 버튼 클릭 시 결과에 따라 모달 띄우는 함수
		function reResultFn(content) {
		
			$("#alert_container .title_name").text("결재 반려 확인");
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