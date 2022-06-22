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
        float: right;
        margin-right: 200px;
    }

    #businessCard_box{
        position: relative;
        width: 600px;
        height: 300px;
        border: 1px solid black;
        background-color: #fff;
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
            <div id="businessCard_box">
                <img id="card_img" src="../../../resources/images/facebook_cover_photo_1.png" alt="">
                <div id="information_container">
                    <div id="info_form">
                        <p>Name</p>
                        <p id="emp_name">${ loginUser.empName }</p>
                        <p>Tel</p>
                        <p id="emp_phone">${ loginUser.phone }</p>
                        <p>Email</p>
                        <p id="emp_email">${ loginUser.email }</p>
                    </div>
                </div>
            </div>
        </div>
        <button type="button" id="img_insert_btn" class="commonButton1">이미지다운</button>
    </div>
    <script>
        $(function(){

            $("#img_insert_btn").click(function() { 

                html2canvas($("#main_businessCard_section"), {

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