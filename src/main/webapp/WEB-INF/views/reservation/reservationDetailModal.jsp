<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<style type="text/css">
	.resDetailModal_body{
		display: flex;
	}
	.modal_header.resDetailModal_header {
	    border-bottom: 1px solid;
	    padding-bottom: 12px;
	    font-size: 28px;
	    font-weight: 600;
	    margin-bottom: 14px;
	}
	.modal_body.resDetailModal_body {
	    width: 100%;
	    height: 300px;
	}
	.modal_footer.resDetailModal_footer {
	    text-align: end;
	    margin-right: 30px;
	}
	.resDetail_menu {
	    font-size: 18px;
	    margin-right: 23px;
	    font-weight: 600;
	    width: 10%;
	}
	p.resMenu_p, .resDetail_line {
	    margin-bottom: 20px;
	}
	p.resDetail_time, .resDetail_place, .resDetail_attendee {
	    font-size: 17px;
	    margin-bottom: 22px;
	}
	.res_att{
		padding-right: 8px;
	}
	.resDetailCancel_btn, .resDetailEdit_btn, .resDetailDelete_btn {
	    width: 92px;
	    height: 52px;
	}
	.resDetailModal_container .resDetailDelete_btn{
		background-color: #383838;
		color: #fff;
		box-shadow: 0px 5px 0px 0px #b4b4b4;
	}
	.resDetailModal_container .resDetailDelete_btn:hover{
		box-shadow: 0px 0px 0px 0px #b4b4b4;
	}
	.resDetailModal_container .resDetailCancel_btn{
		background-color: #9e9e9e;
		box-shadow: 0px 5px 0px 0px #d3d3d3;
	}
	.resDetailModal_container .resDetailCancel_btn:hover{
		box-shadow: 0px 0px 0px 0px #d3d3d3;
	}
	p.resDetail_attendee {
	    width: 85%;
	}
</style>
</head>
<body>
    <div id="modal_background" class="resDetailModal_background">
        <div id="modal_container" class="size800 resDetailModal_container">
            <div class="modal_header resDetailModal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title resDetailModal_title">??????</span>
            </div >
            <div class="modal_body resDetailModal_body">
            	<input type="hidden" class="reserveNo" name="reserveNo"/>
            	<input type="hidden" class="empNo realWriter" name="empNo"/>
                <div class="resDetail_menu">
                	<p class="resMenu_p">??????</p>
                	<p class="resMenu_p">??????</p>
                	<p class="resMenu_p">?????????</p>
                </div>
                <div class="resDetail_value">
                	<p class="resDetail_time"></p>
                	<p class="resDetail_place"></p>
                	<p class="resDetail_attendee"></p>
                </div>
            </div>
            <div class="modal_footer resDetailModal_footer">
                <button class="resDetailDelete_btn commonButton1" type="button" style="display:none;">??????????????????</button>
                <button class="resDetailEdit_btn commonButton1" type="button" style="display:none;">??????????????????</button>
                <button class="resDetailCancel_btn commonButton1" type="button">????????????</button>
            </div>
        </div>
    </div>
  	<script>

		// ????????? ????????? ????????? ????????? ??????????????? ??????????????? ?????????
		$(document).on('DOMSubtreeModified', ".resDetail_attendee", function() {
			let loginUser = '${ loginUser.empNo }';
	  		let realWriter = $(".resDetailModal_body .realWriter").val()
	  		if(loginUser == realWriter){
	  			$(".resDetailModal_footer .resDetailDelete_btn").css("display","inline")
	  			$(".resDetailModal_footer .resDetailEdit_btn").css("display","inline")
	  		}
		})
  		// ???????????? ?????? ??? ??????????????? ?????????
  		$(document).on('click','.resDetailEdit_btn', function() {
			$('.resDetailModal_background').css("display","none");
			myConfirm("????????? ?????? ??????", "????????? ????????? ?????????????????????. ?????????????????????????");
			//????????? ??? 
			$(".false_btn").click(function() {
			    $("#helpmeCOnfirm").hide();
				$('.resDetailModal_background').css("display","flex");
			});
			
			// ?????? ?????? ???
			$(".true_btn").click(function() {
				$("#helpmeCOnfirm").hide();
				updateresGo();
		    });
			
		})
		
		function updateresGo() {

			let reserveNo = $('.resDetailModal_body .reserveNo').val() //????????????
			$('.reservationEnroll_title').text("????????? ????????????")
			$('.PushOrUpdate').val(2)
			$('#enrollForm-Reservation .reserveNo').val(reserveNo)
			
			
			$('.reservationEnrollFormModal').css("display","flex");
		}
		
  	
  		// ???????????? ?????? ??? ??????
  		$(document).on('click','.resDetailCancel_btn', function(){
  			$('.resDetail_attendee').empty()
  			$(".resDetailModal_background").css("display","none");
  		})
  		
  		// ?????? ?????? ????????? ajax??????
    	$(document).on('click','.resDetailModal_footer .resDetailDelete_btn',function() {
    		$('.resDetailModal_background').css("display","none");
			myConfirm("????????? ?????? ??????", "????????? ????????? ?????????????????????????");
			
			//????????? ??? 
			$(".false_btn").click(function() {
			     $("#helpmeCOnfirm").hide();
			     $('.resDetailModal_background').css("display","flex");
			});
			
			let reserveNo = $('.reserveNo').val()
			
			// ?????? ?????? ???
			$(".true_btn").click(function() {
				$("#helpmeCOnfirm").hide();
				deleteresGo(reserveNo);
		    });
	    })
  	</script>
</body>
</html>