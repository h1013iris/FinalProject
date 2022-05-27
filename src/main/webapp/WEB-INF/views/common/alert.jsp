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
	<div id="alertBackground">
    <div id="alert_container">
        <div id="alert_title">
            <span class="title_name">${msgTitle}</span>
        </div>
        <div id="alert_body">
            <span class="alert_content">${msg}</span>
        </div>
        <div id="alert_footer">
            <button type="button" class="cancel_btn">확인</button>
        </div>
    </div>
    </div>
</body>
</html>