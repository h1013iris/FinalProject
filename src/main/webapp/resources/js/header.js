$(function(){
	
	//부서별 페이지 공지사항 작성하기 버튼 클릭시
	$(".annoDepartEnrollButton").click(function(){
		location.href="enrollFormAnnoDepart.do";
	})

	//캘린더 상세메뉴 일정 추가하기 버튼 클릭시
	$(".calenderButton").click(function(){
		location.href="enrollFormCalender.do";
	})
	
	// 문서 작성 버튼 클릭 시 문서 서식 선택하는 모달창
	$(document).on("click",".docEnrollButton",function(){
		$(".docEnrollModal").css("display","flex");
	})
	
	//간편 프로젝트 생성 버튼 클릭시 모달창 
	$(document).on("click",".simplepjMo", function(){
		$(".simpleProjectCreateModal").css("display","flex");
	})
	
	// 예약하기 버튼 클릭 시 페이지 이동
	$(document).on("click",".ReservationRoombtn", function(){
		location.href="enrollFormReservation.do";
	}) 

    $("#main_nav img").mouseenter(function(){
        $(".detail_nav_content").removeClass("enter");
        $(this).parent().next().addClass("enter");
    })



    $("aside").mouseleave(function(){
        $(".detail_nav_content").removeClass("enter");
    })

    if($(".count").text() == 0){
        $(".count").hide();
    }


    $(".status_swap").click(function(){
        if($(".status_list").css("display") == "block"){
            $(".status_list").css("display","none")
        } else {
            $(".status_list").css("display","block")
        }
    })

    $(".status").click(function(){
        alert($(this).text());
        $(".login_status").hide();
    })


    $(".pro_img").click(function(){
        if($(".login_status").css("display") == "none"){
            $(".status_list").css("display","none")
            $(".login_status").css("display","block")
        } else {
            $(".status_list").css("display","none")
            $(".login_status").css("display","none")
        }
    })
    
    
	// 모달창 취소 - 공통
	$(document).on("click",".cancel_btn",function(){
		$("#modal_background").hide();
        $("#alertBackground").hide();
        $(".docEnrollModal").hide();
        $(".returnReason_modal").hide();
        $(".scrtyReq_modal").hide();
	})
	
	//확인창 취소버튼 - 공통
	function confrimCancle(){
		$("#helpmeCOnfirm").hide();
	}
	//확인창 나오게 
	function confrimOpen(){
		
		$("#helpmeCOnfirm").css("display","block");
		inputConfrimContent();
	}

    
	
})
// 이메일API 스크립트
// code fragment
function emailAPI(empName, email, empNo){

var data = {
    service_id: 'service_4pwoxqm',
    template_id: 'template_c9sses7',
    user_id: 'Mafb0wCflnksYAr8I',
    template_params: {
        to_name : empName,
        email : email,
        message : empNo
    }
};
 
$.ajax('https://api.emailjs.com/api/v1.0/email/send', {
    type: 'POST',
    data: JSON.stringify(data),
    contentType: 'application/json'
}).done(function() {
    return "이메일 전송에 성공 하셨습니다.";
}).fail(function(error) {
    return "이메일 전송에 실패 하셨습니다."
});
// code fragment
}

// 컨펌 스크립트
function myConfirm(titleName, content){
    $("#helpmeCOnfirm .title_name").text(titleName);
    $("#helpmeCOnfirm .confirm_content").text(content);
    $("#helpmeCOnfirm").show();
}

//컨펌 콜백 함수
function myConfirmColback(empName, email, empNo){
    $(".false_btn").click(function(){
	    $("#helpmeCOnfirm").hide();
	})

	$(".true_btn").click(function(){
		$("#helpmeCOnfirm").hide();
        var email_result = emailAPI(empName, email, empNo);
        myAlert("이메일 전송 결과",email_result);
	})
}

// alert 스크립트
function myAlert(msgTitle,msg){
    $("#alertBackground .title_name").text(msgTitle);
    $("#alertBackground .alert_content").text(msg);
    $("#alertBackground").show();
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