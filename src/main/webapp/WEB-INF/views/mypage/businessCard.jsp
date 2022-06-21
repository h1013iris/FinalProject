<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #card_img{
        width: 400px;
        margin-top: 40px;
    }

    #img_insert_btn{
        position: absolute;
        top: 430px;
        right: 400px;
        z-index: 99;
    }

    #businessCard_box{
        position: relative;
        width: 600px;
        height: 300px;
        border: 1px solid black;
    }

    #main_businessCard_section{
        width: 600px;
        margin: 70px auto;
    }


    #information_container{
        width: 270px;
        height: 230px;
        position: absolute;
        right: 0;
        bottom: 10px;
    }

    #info_form{
        margin-left: 60px;
    }

    #info_form p {
        margin-top: 16px;
        margin-bottom: 16px;
    }

    #info_form p:nth-child(2n){
        margin-left: 30px;
    }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div id="main_businessCard_section">
            <button type="button" id="img_insert_btn" class="commonButton1">이미지다운</button>
            <div id="businessCard_box" style="width: 600px; height: 300px; border: 1px solid black">
                <img id="card_img" src="../../../resources/images/facebook_cover_photo_1.png" alt="" style="width: 400px; margin-top: 40px">
                <div id="information_container" style="width: 270px;height: 230px;position: absolute;right: 0;bottom: 10px;">
                    <div id="info_form" style="margin-left: 60px;">
                        <p>Name</p>
                        <p id="emp_name" style="margin-left: 30px;">${ loginUser.empName }</p>
                        <p>Tel</p>
                        <p id="emp_phone"  style="margin-left: 30px;">${ loginUser.phone }</p>
                        <p>Email</p>
                        <p id="emp_email"  style="margin-left: 30px;">${ loginUser.email }</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function(){

        $("#img_insert_btn").click(function() { 

            html2canvas($("#businessCard_box"), {

                onrendered: function(canvas) {

                    canvas.toBlob(function(blob) {

                        saveAs(blob, 'image.png');

                    });

                }

            });

        });

        });



        $(function(){
            $(".page_title .title_name").text("전자명함")
        })

    </script>
</body>
</html>