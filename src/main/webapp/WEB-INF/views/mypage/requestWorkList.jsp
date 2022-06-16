<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #workreceived_main_section{
            height: 500px;
            width: 30vw;
            margin: 100px auto;
            position: relative;
            cursor: pointer;
            overflow-y: scroll;
        }

        #workreceived_main_section::-webkit-scrollbar{
            display: none;
        }

        .workreceived_lists {
            border-bottom: 1px solid black;
            height: 40px;
            line-height: 40px;
        }

        .workreceived_count{
            margin-left: 20px;
        }

        .workreceived_title{
            margin-left: 30px;
        }

        .workreceived_toDate{
            position: absolute;
            right: 20px;
        }

        .workreceived_emergency{
            position: absolute;
            right: 50px;
            color: red;
        }

        .workreceived_lists:hover{
            background-color: rgba(250, 250, 250, 1)

        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
	    <div id="workreceived_main_section">
            <c:forEach items="${ list }" var="a" varStatus="status">
                <div class="workreceived_lists">
                    <input type="hidden" class="workreceived_raskNo" value=${ a.raskNo }>
                    <span class="workreceived_count">${ status.count }.</span>
                    <span class="workreceived_title">${ a.title }</span>
                    <c:if test="${ a.status eq 'Y' }">
	                    <span class="workreceived_emergency">완료</span>                    
                    </c:if>
                </div>
            </c:forEach>
	    </div>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/mypage/mypage.js"></script>
</body>
</html>