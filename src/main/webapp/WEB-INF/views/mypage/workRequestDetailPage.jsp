<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .container{
            height: 50px;
            line-height: 50px;
            margin-top: 30px;
        }

        .content_deadline{
            display: inline-block;
        }

        #request_content_container{
            height: 150px;
            position: relative;
            line-height: 150px;
        }

        #work_request_detail_section>div>span:nth-child(1){
            width: 200px;
            display: inline-block;
        }

        .content_content{
            position: absolute;
            top: 10px;
            height: 150px;
            width: 250px;
        }

        #work_request_detail_section{
            padding: 20px;
        }
        
        .content_content{
            resize: none;
        }

        #detail_page_main_section{
            width: 40vw;
            margin: 0 auto;
        }

        #btn_box{
            width: 250px;
            margin: 30px auto;

        }

        #detail_page_main_section .commonButton1{
            width: 100px;
            height: 40px;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div id="detail_page_main_section">
            <div id="work_request_detail_section">
                <div class="container">
                    <span class="request_title title_title">제목</span>
                    <span class="request_title content_title">${ work.title }</span>
                </div>
                <div class="container">
                    <span class="request_emp_list title_emp_list">업무요청사원</span>
                    <span class="request_emp_list content_emp_list">${ work.empNo }</span>
                </div>
                <div id="request_content_container">
                    <span class="request_content title_content">요청내용</span>
                    <textarea class="request_content content_content" readonly>${ work.content }</textarea>
                </div>
                <div class="container">
                    <span class="request_deadline title_deadline">요청기한</span>
                    <div class="request_deadline content_deadline">
                        <span id="formDate">${ work.fromDate } 부터</span>
                        ~
                        <span id="toDate">${ work.toDate } 까지</span>
                    </div>
                </div>
                <div class="container">
                    <span class="attachments title_attachment">첨부파일</span>
                    <span class="attachments content_attachment">첨부파일명</span>
                </div>
            </div>
            <div id="btn_box">
                <button type="button" onclick="history.back()" class="commonButton1">되돌아기</button>
                <c:if test="${ loginUser.empName ne '관리자' }">
                    <button type="button" id="success_status_update" value=${ work.raskNo } class="commonButton1">업무완료</button>
                </c:if>
            </div>
        </div>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/mypage/mypage.js"></script>
    <script>
        $(function(){
            $(".page_title .title_name").text("업무요청상세")
        })
    </script>
</body>
</html>