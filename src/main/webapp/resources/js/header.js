$(function(){

	//부서별 페이지 공지사항 클릭했을 시에 
	$(document).on("click",".annoDepart",function(){
		$("#modal_background").css("display","flex");
	})
	
	//부서별 페이지 공지사항 작성하기 버튼 클릭시
	$(".annoDepartEnrollButton").click(function(){
		location.href="enrollFormAnnoDepart.do";
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
	//모달창 취소
	$(document).on("click",".cancel_btn",function(){
		$("#modal_background").hide();
	})
	
	
	
})