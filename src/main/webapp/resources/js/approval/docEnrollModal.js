function docFormChange(type) {
    		
    		var app = ["휴가 신청서", "근태 기록 수정 의뢰 신청서"];
    		var appVal = [10, 11];
    		var draft = ["업무 기안서"];
    		var dftVal = [20];
    		var coop = ["업무 협조문"];
    		var coopVal = [30];
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
    			opt.innerHTML += form[i];
    			target.appendChild(opt);
    		}
    	}
    