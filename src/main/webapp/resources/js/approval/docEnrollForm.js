	// 유효성 검사 alert 모달에서 확인 클릭 시 모달 사라지고
	function focusFn(focus) {
		$(document).on("click", ".cancel_btn", function() {
		
			$("#alertBackground").css("display","none")
			$(focus).focus(); // 해당 위치에 포커스
		})
	
	}
	
	
	// 결재 요청하겠냐는 모달 띄우는 함수
	function approveCheckFn() {
	
		let title = "결재 요청 확인";
		let content = "결재를 요청하시겠습니까?";

		myConfirm(title, content);
	}
	
	
	
	// 결재 요청 alert 모달에서 확인 클릭 시 결과에 따라 모달 띄우는 함수
	function resultFn() {
	
		// 클릭 버튼 취소 시 모달 사라지고
		$(document).on("click", ".cancel_btn", function() {
 			
			$("#alertBackground").css("display","none")
			// 결재 메인으로 이동
			location.href="approvalMain.do";
		})
	
	}
	
