	
	// 신청서 유형 선택 시
	function docFormChange(type) {
	    		
		var app = ["== 선택 ==", "휴가 신청서", "근태 기록 수정 의뢰 신청서"];
		var appVal = ["none", 10, 11];
		var draft = ["== 선택 ==", "업무 기안서"];
		var dftVal = ["none", 20];
		var coop = ["== 선택 ==", "업무 협조문"];
		var coopVal = ["none", 30];
		var target = document.getElementById("docForm");
		
		var form; // option
		var val; // value
		
		if(type.value == 'app') {
			form = app;
			val = appVal;
		} else if(type.value == 'draft') {
			form = draft;
			val = dftVal;
		} else if(type.value == 'coop') {
			form = coop;
			val = coopVal;
		}
		
		target.options.length = 0;
		
		for(i in form) {
			var opt = document.createElement("option");
			opt.value = val[i];
			opt.innerHTML = form[i];
			target.appendChild(opt);
		}
	}
	
	
	
 	// 확인 버튼 클릭 시
	$(".next_btn").click(function() {
    	// 문서 타입, 폼 유형 변수에 담아서
		let type = $("#docType").val();
    	let form = $("#docForm").val();
    	
    	// 문서 타입, 폼 유형 있으면
    	if(type == "none") {
    		return false;
    	
    	} else if (form == "none") {
    		return false;
    	
    	// 잘 작성되어 있으면
    	} else {
    		
    		$(".documentTypeForm").attr("action", "docEnrollForm.do");
    		$(".documentTypeForm").submit();
    	}

    })



    