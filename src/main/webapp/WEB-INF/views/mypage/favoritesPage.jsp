<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #mypage_container{
        display: flex;
        width: 70vw;
        margin: 0 auto;
    }

    .page_insert_btn{
        cursor: pointer;
        display: block !important;
    }

    .page_insert_btn::before{
        content: "";
        width: 2px;
        height: 13px;
        background-color: black;
        position: absolute;
        top: 50%;
        transform: translate(-50%, -50%);
        left: 50%;
    }

    .page_delete_btn{
        display: block !important;
    }
</style>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/BanwordsPage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div id="mypage_container">
            <div id="page_all_list" class="content_container">
                <div class="content_box banW">
                    <div class="banwords_management_article">
                        <c:forEach items="${ insertList }" var="i">
                            <div class="banwords_box">
                                <span class="page_name">${ i.pageName }</span>
                                <div class="delete_btn bm_btn page_insert_btn">
                                    <input type="hidden" id="insert_mypageNo" value=${ i.pageNo }>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div> 
            <div id="mypage_list" class="content_container">
                <div class="content_box banW">
                    <div class="banwords_management_article">
                        <c:forEach items="${ deleteList }" var="d">
                            <div class="banwords_box">
                                <span class="page_name">${ d.pageName }</span>
                                <div class="delete_btn bm_btn page_delete_btn">
                                    <input type="hidden" id="delete_mypageNo" value=${ d.pageNo }>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div> 
        </div>
    </div>
    <script>
        $(document).on("click",".page_insert_btn",function(){
            var pageNo = $(this).children().val();
            
            $.ajax({
                type:"post",
                url:"insertMypage",
                data:{pageNo : pageNo},
                success:function(){
                    location.reload();
                }
            })
        })

        $(document).on("click",".page_delete_btn",function(){
            var pageNo = $(this).children().val();
            
            $.ajax({
                type:"post",
                url:"deleteMypage",
                data:{pageNo : pageNo},
                success:function(){
                    location.reload();
                }
            })
        })
    </script>
</body>
</html>