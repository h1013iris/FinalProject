	// 빈 값 있을 때 alert 모달 띄우고 포커싱 주는 함수
	function alertFn(content, focus) {
		
		$("#alert_container .title_name").text("문서 등록 확인");
		$("#alert_body .alert_content").text(content);
		$("#alertBackground").css("display","block");
		// 클릭 버튼 취소 시 모달 사라지고
		$(document).on("click", ".cancel_btn", function() {
 			
			$("#alertBackground").css("display","none")
 			$(focus).focus(); // 해당 위치에 포커스
 		})
	}
	
	
	// 결재 요청 버튼 클릭 시 결과에 따라 모달 띄우는 함수
	function resultFn(content) {
	
		$("#alert_container .title_name").text("문서 등록 확인");
		$("#alert_body .alert_content").text(content);
		$("#alertBackground").css("display","block");
		// 클릭 버튼 취소 시 모달 사라지고
		$(document).on("click", ".cancel_btn", function() {
 			
			$("#alertBackground").css("display","none")
			// 결재 메인으로 이동
			location.href="approvalMain.do";
		})
	
	}
	
	
	// 로그인 되어있지 않으면 로그인 먼저 하도록 모달 띄우고 화면 전환
	function loginFn() {
	
		$("#alert_container .title_name").text("로그인 확인");
		$("#alert_body .alert_content").text("로그인이 필요합니다.");
		$("#alertBackground").css("display","block");
		// 클릭 버튼 취소 시 모달 사라지고
		$(document).on("click", ".cancel_btn", function() {
 			
			$("#alertBackground").css("display","none")
			// 로그인 화면으로 이동
			location.href="/";
		})
	
	}
	
	
	// 기안일, 휴가 시작 날짜(휴가 신청서) 오늘 날짜로 설정
	/*function todayFn() {
	
		let today = new Date(+ new Date() + 3240 * 10000).toISOString().substring(0, 10);
		// 휴가 시작 날짜, 기안일 오늘 날짜로 기본값 설정
		$("#draftDate").val(today);
		$("#startDate").val(today);
	
	}*/
	
	
	// 로그인 유저 부서명 조회
	/*function selectDept() {
		
		// 로그인 유저 소속(부서명) 조회
 		$.ajax({
 			
 			type: "post",
            url: "selectDeptName.do",
            data: { deptNo : "${ loginUser.departmentNo }" },
            success: function (data) {
				
            	if(data != null || data != "") {
            		
            		$("#drafterDept").val(data);
            	}
            }
 		})
	
	}*/
	
	
	
	