<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<div id="helpmeCOnfirm">
    <div id="confirm_container">
        <div id="confirm_title">
            <span class="title_name">${msgTitle}</span>
        </div>
        <div id="confirm_body">
            <span class="confirm_content">${msg}</span>
        </div>
        <div id="confirm_footer">
        	<button type="button" class="false_btn" value="false" name="confirmBtn" onclick="confrimCancle()">취소</button>
      		<button type="button" class="true_btn" value="true" name="confirmBtn">확인</button>
        </div>
    </div>
    </div>
    <script type="text/javascript">
	  	//확인창 취소버튼 - 공통
		function confrimCancle(){
			$("#helpmeCOnfirm").hide();
			$("#confirm_title .title_name").text("");
			$("#confirm_body .confirm_content").text("");
		}
		//확인창 나오게 
		function confrimOpen(){
			
			$("#helpmeCOnfirm").css("display","block");
			$("#confirm_title .title_name").text("");
			inputConfrimContent();
		}

    </script>
</body>
</html>