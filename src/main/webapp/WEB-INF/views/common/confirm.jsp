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
        	<button type="button" class="false_btn" value="false" name="confirmBtn">취소</button>
      		<button type="button" class="true_btn" value="true" name="confirmBtn">확인</button>
        </div>
    </div>
    </div>
</body>
</html>