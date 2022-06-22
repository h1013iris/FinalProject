<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보</title>
<style type="text/css">
	#card_img{
        width: 400px;
        margin-top: 40px;
    }
    #businessCard_box_depart{
        position: relative;
        width: 600px;
        height: 300px;
        border: 1px solid black;
    }

    #main_businessCard_section_div{
        width: 600px;
        margin-left: 55px;
        background-color: white;
    }
    #information_container_depart{
        width: 270px;
        height: 230px;
        bottom: 10px;
    }
    #info_form_depart{
        margin-left: 60px;
    }

    #info_form_depart p {
        margin-top: 16px;
        margin-bottom: 16px;
    }

    #info_form_depart p:nth-child(2n){
        margin-left: 30px;
    }
    .down_button, .back_out_button, .back_out_button_FI{
    	width: 7vw;
    }
    .imgSHowMOdalInfo::-webkit-scrollbar{
    	display: none;
	}
	.imgSHowMOdalInfo>div{
		flex: 1 1 40%;
	}
	
	.imgSHowMOdalInfo{
		height: 80%;
		display: flex;
		flex-wrap: wrap;
		overflow-y:scroll;
		text-align: center;
	}
	.sizecontroll{
		height: 48%;
	}
	.modalInfoList{
		margin-top: 10px;
    	height: 322px !important;
	}
	.modalSectionCH img{
		height: 13vh;
		width: 10vw;
		margin-bottom: 10px;
	}
	.modalSectionCH{
		margin-bottom: 5px;
	}
	.changeModalINFOdep{
		margin-top: 0 !important;
	}
</style>
</head>
<body>
    <div id="modal_background" class="showModalInfoDepart">
        <div id="modal_container" class="size800 ">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">전자명함</span>
            </div >
            <div class="modal_body">
                <div id="main_businessCard_section_div">
		            <div id="businessCard_box_depart" style="width: 600px; height: 300px; border: 1px solid black;background-color: white;">
		                <img id="card_img" src="../../../resources/images/facebook_cover_photo_1.png" alt="" style="width: 400px; margin-top: 40px">
		                <div id="information_container_depart" style="width: 270px;height: 230px;position: absolute;right: 0;bottom: 10px;">
		                    <div id="info_form_depart" style="margin-left: 60px;">
		                        <p>Name</p>
		                        <p id="emp_name_modal_depart"  class="emp_name_modal_depart" style="margin-left: 30px;"></p>
		                        <p>Tel</p>
		                        <p id="emp_phone_modal_depart"  class="emp_phone_modal_depart" style="margin-left: 30px;"></p>
		                        <p>Email</p>
		                        <p id="emp_email_modal_depart" class="emp_email_modal_depart" style="margin-left: 30px;"></p>
		                    </div>
		                </div>
		            </div>
		        </div>
            </div>
            <div class="modal_footer ">
                <button  type="button" class="down_button commonButton1">이미지다운</button>
                <button class="back_out_button commonButton1" type="button">취소</button>
            </div>
        </div>
    </div>
    
    <div id="modal_background" class="showListDeptP">
        <div id="modal_container" class="size800 sizecontroll">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">사원 리스트</span>
            </div >
            <div class="modal_body">
                <div class="annoDepartLowers imgSHowMOdalInfo modalInfoList">
        			
        		</div>
            </div>
            <div class="modal_footer changeModalINFOdep">
                <button class="back_out_button_FI commonButton1" type="button">닫기</button>
            </div>
        </div>
    </div>
  	<script type="text/javascript">
  		$(function(){
     		 $(".down_button").click(function() { 
        	  html2canvas($("#businessCard_box_depart"), {
              onrendered: function(canvas) {
                  canvas.toBlob(function(blob) {
                      saveAs(blob, 'image.png');
                  });
              }
         	 });
     	 });
      });
  		$(".back_out_button").click(function(){
  			$(".showModalInfoDepart").css("display","none");
  		})
  		$(".back_out_button_FI").click(function(){
  			$(".showListDeptP").css("display","none");
  		})
		function showModalInfoIMG(empName, phone, email){
    		
    		
    		
    		
    		$(".emp_name_modal_depart").text(empName);
    		$(".emp_phone_modal_depart").text(phone);
    		$(".emp_email_modal_depart").text(email);
    		$(".showModalInfoDepart").css("display","flex");
    		$(".showListDeptP").css("display","none");
    	}
  		
  	</script>
</body>
</html>