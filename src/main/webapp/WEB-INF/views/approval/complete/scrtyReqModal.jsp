<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보안 요청 모달창</title>
<style type="text/css">

	.scrtyReq_title {
		font-size: 21px;
		font-weight: bold;
	}
	
	.scrtyReason_body {
		/*border: 1px solid black;*/
		margin: 30px 0 30px 0;
	}
	
	hr {
		margin: 30px 0 30px 0;
	}
	
	.scrtyReason_textarea {
		margin-top: 10px;
	}
	
	#scrtyReason {
		width: 496px;
		height: 300px;
		resize: none;
		font-size: 15px;
	}
	
	.errorMsg {
		color: red;
	}
	
	.scrtyReqText {
		font-size: 17px;
		font-weight: bold;
	}
	
	.scrtyReq_footer {
		height: 50px;
		/*border: 1px solid black;*/
		margin-bottom: 6%;
	}
	
	.scrtyReq_footer .commonButton1 {
		width: 75px;
		height: 45px;
	}
	
	.scrtyReq_footer .cancel_btn {
		background-color: #c8c8c8 !important;
		box-shadow: 0px 5px 0px 0px #afafaf !important;
	}
	
	.scrtyReq_footer .cancel_btn:hover {
		box-shadow: 0px 0px 0px 0px #afafaf !important;
	}

</style>
</head>
<body>

    <div id="modal_background" class="modal_background scrtyReq_modal">
        <div id="modal_container" class="size600">
            <div class="modal_header scrtyReq_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title scrtyReq_title">문서 보안 요청</span>
            </div>
            
            <form class="scrtyReq_form">
	            <div class="modal_body scrtyReason_body">
					<div class="scrtyReqDate_area">
						<span class="scrtyReqText">문서 번호 :</span>
						<span>${ docNo }</span>
					</div>
					<hr>
					<div class="scrtyReason_area">
						<span class="scrtyReqText">보안 요청 사유</span> &nbsp;
						<span class="errorMsg"></span>
						<div class="scrtyReason_textarea">
							<textarea id="scrtyReason" name="scrtyReason" maxlength="500"></textarea>
						</div>
					</div>
	            </div>
	            <div class="modal_footer scrtyReq_footer">
	               	<button class="commonButton1 modal_nextBtn next_btn" type="button">보안요청</button>
	               	<button class="commonButton1 modal_cascelBtn cancel_btn" type="button" data-dismiss="modal">취소</button>
	           	</div>
           	</form>
           	
        </div>
    </div>
    
    <script type="text/javascript">
	    
		// 보안 요청 버튼 클릭 시 
		$(document).on("click", ".modal_nextBtn", function() {
			
			$(".errorMsg").empty();
			
			let scrtyReason = $("#scrtyReason").val();
			
			
			// 유효성 검사
			if(scrtyReason == null || scrtyReason == "") {
				
				$(".errorMsg").text("보안 요청 사유를 작성해주세요.");
				$("#scrtyReason").focus();
				
			} else {
				// 일단 보안 문서에 등록하고
				// 관리자가 보안 처리한 문서만 문서 상태값 변경
				
				let form = $(".scrtyReq_form, .detailViewForm").serialize();
				let docNo = $("#docNo").val();
				
				form += "&docNo=" + docNo; // 문서 번호 쿼리스트링으로 붙여서 같이 넘기기
				
				$.ajax({
					
					type: "post",
	                url: "scrtyRequest.do",
	                data: form,
	                success: function (result) {
	                	
	                	
	                    if(result == "success") {
							
	                    	$(".scrtyReq_modal").hide();
	                    	
	                    	let content = "보안 요청이 성공적으로 완료되었습니다.";
	                    	reResultFn(content);
 	           	 		
	                    } else {
	                    	
	                    	$(".scrtyReq_modal").hide();
	                    	
	                    	let content = "보안 요청에 실패하였습니다.";
	                    	reResultFn(content);
	               		}
	                }
					
				});
			}
			
		});
		
		
		// 보안 요청 버튼 클릭 시 결과에 따라 모달 띄우는 함수
		function reResultFn(content) {
		
			$("#alert_container .title_name").text("보안 요청 확인");
			$("#alert_body .alert_content").text(content);
			$("#alertBackground").css("display","block");
			// 클릭 버튼 취소 시 모달 사라지고
			$(document).on("click", ".cancel_btn", function() {
	 			
				$("#alertBackground").css("display","none");
				// 새로고침 (보안 설정 반영해주기 위해)
				scrtyCheckFn();
			})
		
		}
    
    </script>
    
    
</body>
</html>