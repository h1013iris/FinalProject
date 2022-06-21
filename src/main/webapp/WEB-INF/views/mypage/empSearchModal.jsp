<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .emp_list_content{
        height: 40px;
        line-height: 40px;
        position: relative;
    }

    .emp_profile_img{
        display: inline-block;
    }

    .emp_checkbox_input{
        position: absolute;
        right: 20px;
        top: 50%;
        transform: translateY(-60%);
        width: 20px;
        height: 20px;
    }

    .emp_name_box{
        display: inline-block;
        margin-left: 30px;
    }

    .work_request_emp_search_modal .commonButton1{
        width: 80px;
        height: 40px;
    }
</style>
</head>
<body>
<div id="modal_background" class="work_request_emp_search_modal">
        <div id="modal_container" class="size400">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">사원찾기</span>
            </div >
            <div class="modal_body">

            </div>
            <div class="modal_footer">
                <button class="next_btn empSearch_next_btn commonButton1" type="button">다음</button>
                <button class="cancel_btn commonButton1" type="button">취소</button>
            </div>
        </div>
    </div>
    <div id="empsearchhtmlbox" style="display: none;">
        <div class="emp_list_content">
            <div class="emp_profile_img"><img src="" alt="">이미지</div>
            <div class="emp_name_box"><span class="emp_name"></span></div>
            <input type="checkbox" class="emp_checkbox_input">
        </div>
    </div>

    <script>
        $(".work_request_emp_search_modal .cancel_btn").click(function(){
            $(".work_request_emp_search_modal").hide();
            $(".work_request_modal").css("display","flex");
        })
    </script>
</body>
</html>