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
    <div id="confirm_container">
        <div id="confirm_title">
            <span class="title_name">${msgTitle}</span>
        </div>
        <div id="confirm_body">
            <span class="confirm_content">${msg}</span>
        </div>
        <div id="confirm_footer">
      		<button type="button" class="true_btn">확인</button>
            <button type="button" class="false_btn">취소</button>
        </div>
    </div>
</body>
</html>