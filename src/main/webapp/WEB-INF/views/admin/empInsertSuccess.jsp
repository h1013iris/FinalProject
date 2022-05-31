<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div>
            <input type="hidden" value="${ empInfo.empNo }" id="empNo">
            <input type="hidden" value="${ empInfo.phone }" id="phone">
            <input type="hidden" value="${ empInfo.email }" id="email">
            <input type="hidden" value="${ empInfo.empName }" id="empName">
            <button type="button">휴대폰 전송</button>
            <button type="button" id="email_send">이메일 전송</button>
            <button type="button" id="all_send">전체 전송</button>
        </div>
    </div>

    <script src="${ pageContext.servletContext.contextPath }/resources/js/API/emailAPI.js"></script>
</body>
</html>