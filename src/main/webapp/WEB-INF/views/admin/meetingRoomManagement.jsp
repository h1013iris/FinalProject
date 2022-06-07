<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/meetingRoomManagement.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="content_container">
            <div class="content_box banW">
                <div class="meetingroom_management_article">
                    <c:forEach items="${ list }" var="a">
                    	<div class="meetingroom_box">
                            <div class="toggle_btn"></div>
                            <span class="large_meetingroom">${ a.LRoomName }</span>
                            <div class=" bm_btn small_insert_btn">
                                <input type="hidden" value= ${ a.roomNoLarge } >
                            </div>
                            <div class="delete_btn bm_btn large_delete_btn">
                                <input type="hidden" value= ${ a.roomNoLarge } >
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="insert_btn bm_btn large_insert_btn"></div>
            </div>
        </div>  
    </div>
    <script>
        // update
        $(".large_meetingroom").click(function(){
            $(this).after("<input id=meetingroomLargeUpdateInput type=text>");
            $(this).hide();
            $("#meetingroomLargeUpdateInput").focus();
        })
        
        $(document).on("focusout","#meetingroomLargeUpdateInput",function(){
            $(this).prev().show();
            $(this).remove();
        })

        $(document).on("keyup","#meetingroomLargeUpdateInput",function(e){
            if(e.keyCode == 13){
                var text = $("#meetingroomLargeUpdateInput").val()
                var cateNo = $(this).siblings($("#meetingroomLargeUpdateInput")).children().val();
                if(meetingRoomLargeCategoryOverlapCheck(text)){
                    $.ajax({
                        type:"post",
                        url:"MRLCUpdate",
                        data:{
                            roomNoLarge:cateNo,
                            LRoomName:text
                        },
                        success:function(){
                            location.reload();
                        }
                    })
                } else {
                    myAlert("중복체크","중복되었습니다 다시 입력해 주세요");
                }
            }
        })

        // insert
        $(".large_insert_btn").click(function(){
            if(!$(".meetingroom_management_article").children().is($("input"))){
                $(".meetingroom_management_article").append("<input id=addMeetingRoomLargeCategory type=text>");
            }

            $("#addMeetingRoomLargeCategory").focus();
        })

        $(document).on("focusout","#addMeetingRoomLargeCategory",function(){
            $(this).remove();
        })

        $(document).on("keyup","#addMeetingRoomLargeCategory",function(e){
            if(e.keyCode == 13){
                var text = $("#addMeetingRoomLargeCategory").val()
                if(meetingRoomLargeCategoryOverlapCheck(text)){
                    $.ajax({
                        type:"post",
                        url:"MRLCInsert",
                        data:{
                            LRoomName:text
                        },
                        success:function(){
                            location.reload();
                        }
                    })
                } else {
                    myAlert("중복체크","중복되었습니다 다시 입력해 주세요");
                }
            }
        })


        // delete
        $(".large_delete_btn").click(function(){
            var cateNo = $(this).children().val();

            $.ajax({
                type:"post",
                url:"MRLCDelete",
                data:{roomNoLarge:cateNo},
                success:function(){
                    location.reload();
                }
            })
        })



        // 회의실 대분류 이름 중복체크
        function meetingRoomLargeCategoryOverlapCheck(text){
        var arrlength = $(".large_meetingroom").length;
        var arr = new Array(arrlength);
        for(let i = 0; i < arrlength; i++){
            arr[i] = $(".large_meetingroom").eq(i).text();
        }

        
        for(let i = 0; i < arrlength; i++){
            if(arr[i] === text){
                return false;
            }
        }

        return true;
    }
    </script>
</body>
</html>