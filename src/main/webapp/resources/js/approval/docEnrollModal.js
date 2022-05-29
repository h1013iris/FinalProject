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



		// 폼 제출 시
		$("form").submit(function() {
	    	// 문서 타입, 폼 유형 변수에 담아서
			let type = $("#docType").val();
	    	let form = $("#docForm").val();
	    	
	    	// 타입 비어 있으면 폼 액션 태그 제거
	    	if(type == "none") {
	    		$(this).removeAttr("action");
	    		
	    		return false;
	    	
	    	// 폼 유형 비어 있으면 폼 액션 태그 제거
	    	} else if (form == "none") {
	    		$(this).removeAttr("action");
	    		
	    		return false;
	    	
	    	// 잘 작성되어 있으면
	    	} else {
	    		// 제거했던 액션 태그 다시 추가해서 잘 진행되도록
				$(this).attr("action", "docEnrollForm.do");
				
				/*let submit = $(".documentTypeForm").serialize();
	
				$.ajax({
			
				type: "post",
			        url: "docEnrollForm.do",
			        data: submit,
			        success: function (data) {
			            console.log(data);
					 }
				 })*/
	    	}
	    })
	    
	    
    