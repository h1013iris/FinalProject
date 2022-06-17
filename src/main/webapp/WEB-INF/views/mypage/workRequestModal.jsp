<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #work_request_title{
        border: none;
        border-bottom: 1px solid black;
        margin-left: 30px;
        width: 400px;
        margin-top:30px;
    }

    #work_request_title:focus{
        outline: none;
    }

    #work_request_content_box{
        height: 250px;
    }

    #work_request_content_box #content{
        resize: none;
        margin-top: 30px;
        margin-left: 30px;
        width: 400px;
        height: 150px;
    }


    #work_request_title_box{
        height: 100px;
    }


    #search_emp{
        margin-top: 20px;
        margin-left: 50px;
    }

    #work_request_emp_box #emp_list{
        margin-top: 30px;
        margin-left: 30px;
        max-height: 400px;
        height: 100px;
        overflow-y: scroll;
    }

    #work_request_emp_box #emp_list::-webkit-scrollbar{
        display: none;
    }

    .delete_emp{
        position: relative;
        display: none;
        width: 20px;
        height: 20px;
        border: 1px solid black;
        border-radius: 5px;
        top: 5px;
        left: 20px;
        
    }

    .request.delete_emp::after{
        content: "";
        width: 13px;
        height: 2px;
        background-color: black;
        position: absolute;
        top: 50%;
        transform: translate(-50%, -50%);
        left: 50%;
    }

    #emp_list li {
        height: 40px;
        line-height: 40px;
    }

    #work_request_deadline{
        margin-top: 30px;
        height: 100px;
    }

    #date_input_box{
        margin-top: 30px;

        margin-left: 50px;
    }

    #attc_box{
        height: 100px;
    }

    #work_request_check_box{
        height: 50px;
        line-height: 50px;
    }

    #EStatus_check_box{
        width: 20px;
        height: 20px;

    }

    #work_request_file_input{
        margin-top: 40px;
        margin-left: 30px;
    }
	
</style>
</head>
<body>
    <div id="modal_background" class="work_request_modal">
        <div id="modal_container" class="size600">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title"></span>
            </div >
            <div class="modal_body">
                <form action="">
                    <div id="work_request_title_box">
                        <p class="small_title">제목</p>
                        <input name="title" type="text" id="work_request_title">
                    </div>
                    <div id="work_request_content_box">
                        <p class="small_title">요청내용</p>
                        <textarea id="content" cols="30" rows="10"></textarea>
                    </div>
                    <div id="work_request_emp_box">
                        <p class="small_title">요청할 사원 선택</p>
                        <button type="button" id="search_emp">찾기</button>
                        <div id="emp_list">
                            <ul></ul>
                        </div>
                    </div>
                    <div id="work_request_deadline">
                        <p class="small_title">요청기한</p>
                        <div id="date_input_box">
                            <input type="date" id="from_date_input" class="date_input" name="fromDate">
                            ~
                            <input type="date" id="to_date_input" class="date_input" name="toDate">
                        </div>
                    </div>
                    <div id="attc_box">
                        <p class="small_title">첨부파일</p>
                        <input type="file" id="work_request_file_input">
                        <!-- 첨부파일 버튼 -->
                    </div>
                    <div id="work_request_check_box">
                        <input type="checkbox" name="EStatus" id="EStatus_check_box">
                        <label for="EStatus_check_box">긴급</label>
                    </div>
                </form>
            </div>
            <div class="modal_footer">
                <button class="next_btn work_request_insert_btn" type="button">다음</button>
                <button class="cancel_btn" type="button">취소</button>
            </div>
        </div>
    </div>
    <div id="requestModalHtml" style="display: none;">
        <li>
            <span class="emp_name"></span>
            <input type="hidden" class="empNoInput" name="empNo">
            <span class="request delete_emp"></span>
        </li>
    </div>
</body>
</html>