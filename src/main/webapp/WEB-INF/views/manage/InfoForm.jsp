<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재직증명서</title>
<style type="text/css">
	#card_img{
        width: 400px;
        margin-top: 40px;
    }
    #businessCard_box{
        position: relative;
        width: 600px;
        height: 300px;
        border: 1px solid black;
    }

    #main_businessCard_section{
        width: 600px;
        margin-left: 55px;
        background-color: white;
    }
    #information_container{
        width: 270px;
        height: 230px;
        bottom: 10px;
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
	.sectionFormList{
		max-height: 90vh !important;
		height: 775px;
	}
	.div_info_part{
		display: flex;
	    flex-wrap: wrap;
	    width: 100%;
	    height: 31px;
    	line-height: 26px;
	}
	.firstDiv_info{
		width: 20%;
		border:1px solid;
		text-align: center;
		background-color: lightgray;
	}
	.secondDiv_info{
		width: 28.7%;
		border:1px solid;
	}
	.tDiv_info{
		width: 29.965%;
		border:1px solid;
	}
	.fDiv_info{
		border: 1px solid;
    	width: 79.333%;
	}
	.contentPart_info{
		margin-top: 155px;
    	text-align: center;
	}
	.underLine_info{
	    margin-top: 65px;
	    float: right;
	    margin-right: 110px;
	    line-height: 22px;
	}
	.infoDIvBIgpartSE{
		height: 900px;
	}
	.footer_info_button{
		margin-top:0 !important;
	}
</style>
</head>
<body>
	<div id="modal_background" class="showModalInfoForm">
        <div id="modal_container" class="size800 infoDIvBIgpartSE">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">재직 증명서</span>
            </div >
            <div class="modal_body sectionFormList">
                <div id="main_InfoForm_section" style="height: 770px;">
		            <div id="inFrom_box" style="width: 700px; height: 780px; border: 1px solid black;background-color: white;">
		                <div id="under_info_part" style="width: 600px;height: 715px; margin-top: 27px !important;margin: 0 auto;">
			                <div style="border: 1px solid; width: 60%;height: 35px; line-height: 35px;text-align: center;font-size: 26px;margin: 0 auto;"><span>재직 증명서</span></div>
			               	<div style="height: 92%;margin-top: 20px;border: 1px solid;">
				               	<div class="div_info_part">
				               		<div class="firstDiv_info" >성명</div>
				               		<div class="secondDiv_info name_part"></div>
				               		<div class="firstDiv_info" >주민등록번호</div>
				               		<div class="tDiv_info no_part"></div>
				               	</div>
				               	<div class="div_info_part">
				               		<div class="firstDiv_info" >주소</div>
				               		<div  class="fDiv_info address_part"></div>
				               	</div>
				               	<div class="div_info_part">
				               		<div class="firstDiv_info" >소속</div>
				               		<div class="secondDiv_info depart_part"></div>
				               		<div class="firstDiv_info" >지위</div>
				               		<div class="tDiv_info job_part"></div>
				               	</div>
				               	<div class="div_info_part">
				               		<div class="firstDiv_info">재직기간</div>
				               		<div  class="fDiv_info work_part"></div>
				               	</div>
				               	<div class="div_info_part">
				               		<div class="firstDiv_info">용도</div>
				               		<div  class="fDiv_info why_part"></div>
				               	</div>
				               	<div class="contentPart_info"><span>상기와 같이 재직하였음을 증명합니다.</span></div>
				               	<div class="contentPart_info cont_part" style="margin-top: 160px !important;"></div>
				               	<div class="underLine_info">
				               		<div>라떼회사</div>
				               		<div>대표이사 라떼 (인)</div>
				               		<img src="${ pageContext.servletContext.contextPath }/resources/images/sig.png" width="240px" style="position: absolute;transform:translateY(-52px);">
				               	</div>
			               	</div>
		               	</div>
		            </div>
		        </div>
            </div>
            <div class="modal_footer footer_info_button">
                <button  type="button" class="down_button_form commonButton1" style="width: 15%;">이미지다운</button>
                <button class="back_out_button commonButton1" type="button">취소</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
	$(function(){
   		 $(".down_button_form").click(function() { 
        	  html2canvas($("#main_InfoForm_section"), {
	              onrendered: function(canvas) {
	                  canvas.toBlob(function(blob) {
	                      saveAs(blob, 'image.png');
	                  });
	              }
         	 });
     	 });
      });
	$(".back_out_button").click(function(){
		$(".showModalInfoForm").css("display","none");
	})
 	</script>
</body>
</html>