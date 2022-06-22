<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.emp_detail_container{
        width: 400px;
        margin: 80px auto;
	}
	
    .emp_detail_label{
        position: absolute;
		left: 50%;
		transform: translateX(-50%);
        padding-bottom: 100px;
    }
    .emp_content_box {
        height: 50px;
    }
    .emp_content_box .emp_title{
        display: inline-block;
        width: 200px;
    }
    
    .page_back {
    	text-align: center;
    }
    
    .detail_back_btn{
        width: 100px;
    }

    .emp_detail_container select {
        width: 171px;
        height: 25px;
    }

    .emp_detail_label .commonButton1{
        width: 100px;
        
    }

    #checkPwd:disabled{
        background-color: grey;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="emp_detail_container">
            <form class="emp_detail_label" method="post" action="updateEmployeemypage">
                <div class="emp_content_box">
                    <span class="emp_no emp_title">사원번호</span>
                    <span class="emp_no"><input type="text" name="empNo" value=${ emp.empNo } readonly></span>
                </div>
                <div class="emp_content_box">
                    <span class="emp_password emp_title">* 비밀번호</span>
                    <span class="emp_password"><input id="password" type="password" name="userPwd"></span>
                </div>
                <div class="emp_content_box">
                    <span class="emp_password_check emp_title">* 비밀번호확인</span>
                    <span class="emp_password_check"><input id="password_check" type="password"></span>
                </div>
                <div class="emp_content_box">
                    <span class="emp_name emp_title">이름</span>
                    <span class="emp_name"><input type="text" name="empName" value=${ emp.empName } maxlength="20"></span>
                </div>
                <div class="emp_content_box">
                    <span class="emp_city_no emp_title">주민등록번호</span>
                    <span class="emp_city_no"><input type="text" name="cityNo" value=${ emp.cityNo } maxlength="13"></span>
                </div>
                <div class="emp_content_box">
                    <span class="emp_email emp_title">이메일</span>
                    <span class="emp_email"><input type="text" name="email" value=${ emp.email } maxlength="30"></span>
                </div>
                <div class="emp_content_box">
                    <span class="emp_phone emp_title">전화번호</span>
                    <span class="emp_phone"><input type="text" name="phone" value=${ emp.phone } maxlength="11"></span>
                </div>
                <div class="emp_content_box">
                    <span class="emp_address emp_title">주소</span>
                    <span class="emp_address"><input type="text" name="address" value=${ emp.address }></span>
                </div>
                <div class="page_back">
                    <button type="button" onclick="history.back()" class="commonButton1 detail_back_btn">되돌아 가기</button>
                    <button type="submit" id="checkPwd" class="commonButton1" disabled>저장</button>
                </div>
            </form>
        </div>
    </div> 
    <script src="${ pageContext.servletContext.contextPath }/resources/js/mypage/mypage.js"></script>
    <script>
        $(function(){
            $(".page_title .title_name").text("개인정보수정")

            $("#password").focusout(function(){
                var pw = $("#password").val();
                var num = pw.search(/[0-9]/g);
                var eng = pw.search(/[a-z]/ig);
                var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

                if(pw.length < 8 || pw.length > 20){

                    alert("8자리 ~ 20자리 이내로 입력해주세요.");
                    $("#checkPwd").attr("disabled");
                }else if(pw.search(/\s/) != -1){
                    alert("비밀번호는 공백 없이 입력해주세요.");
                    $("#checkPwd").attr("disabled");
                }else if(num < 0 || eng < 0 || spe < 0 ){
                    alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
                    $("#checkPwd").attr("disabled");
                }
            })

            $("#password_check").focusout(function(){
                var pw = $("#password").val();
                var pwcheck = $("#password_check").val();

                if(pw != pwcheck){
                    alert("비밀번호 불일치")
                } else {
                    $("#checkPwd").removeAttr("disabled");
                }
            })

            $("#checkPwd").click(function(){
                var arr = new Array();

                for(var i = 0; i < $(".emp_detail_label input").length; i++){
                    arr[i] = $(".emp_detail_label input").eq(i).val();
                }

                for(var i = 0; i < arr.length; i++){
                    if(arr[i] == ""){
                        myAlert("내정보수정","모두 입력해주세요");
                        return false;
                    }
                }
            })
        })
    </script>
</body>
</html>
