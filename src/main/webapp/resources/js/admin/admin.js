// 사원관리
$(function(){
    $(document).on("click",".emp_insert .insert_btn",function(){
        location.href="insertEmpPage";
    })



        //검색
    $("#searchText").keyup(function(){
        var text = $("#searchText").val();
        $(".emp_search .emp_list_content").hide();
        $('.emp_search .emp_name:contains('+text+')').parent().parent().show();
    })

    $(".emp_list_content").click(function(){
        var empNo = $(this).children().eq(0).val();

        location.href = "empDetailPage?empNo="+empNo;
        
    })
})


// 게시판 관리
$(".boardMAnage .delete_btn").click(function(){
    var boardNo = $(this).children().val();

    $.ajax({
        type:"post",
        url:"BoardDelete",
        data:{boardNo:boardNo},
        success:function(){
            location.reload();
        }
    })
})

$(".boardMAnage .insert_btn").click(function(){
    if(!$(".board_management_article").children().is($("input"))){
        $(".board_management_article").append("<input id=addBoardInput type=text>")
    }

    $("#addBoardInput").focus();
})

$(document).on("focusout","#addBoardInput",function(){
    $(this).remove();
})

$(function(){
    $(document).on("keyup","#addBoardInput",function(e){
        if(e.keyCode == 13){
            var text = $("#addBoardInput").val()

            if(BoardOverlapCheck(text)){
                $.ajax({
                    type:"post",
                    url:"BoardInsert",
                    data:{text:text},
                    success:function(){
                        location.reload();
                    }
                })
            } else {
                myAlert("중복체크","게시판 이름이 중복되었습니다.");
                $("#addBoardInput").val("");
                $("#addBoardInput").focus();
            }
        }
    })

    $(".boardName").click(function(){
        if($(this).text() != "공지" && $(this).text() != "자유" && $(this).text() != "부서" && $(this).text() != "익명"){
            
            $(this).parent().prepend("<input id=BoardUpdateInput type=text>");
            $(this).hide();

            $("#BoardUpdateInput").focus();
            
        }
    })

    $(document).on("focusout","#BoardUpdateInput",function(){
        $(this).next().show();
        $(this).remove();
    })


    
    $(document).on("keyup","#BoardUpdateInput",function(e){
        if(e.keyCode == 13){
            var text = $("#BoardUpdateInput").val()
            var boardNo = $(this).siblings($("#BoardUpdateInput")).children().val();
            if(BoardOverlapCheck(text)){
                $.ajax({
                    type:"post",
                    url:"BoardUpdate",
                    data:{
                        text:text,
                        boardNo:boardNo
                    },
                    success:function(){
                        location.reload();
                    }
                })
            } else {
                myAlert("중복체크","게시판 이름이 중복되었습니다.");
            }
        }
    })



    

    function BoardOverlapCheck(text){
        var arrlength = $(".boardName").length;
        var arr = new Array(arrlength);
        for(let i = 0; i < arrlength; i++){
            arr[i] = $(".boardName").eq(i).text();
        }

        
        for(let i = 0; i < arrlength; i++){
            if(arr[i] === text){
                return false;
            }
        }

        return true;
    }

})



// 금지어 관리

var oldText;

$(".banwords_management_article .delete_btn").click(function(){
    var words = $(this).prev().text();
    alert(words)
    $.ajax({
        type:"post",
        url:"BanWordsDelete",
        data:{words:words},
        success:function(){
            location.reload();
        }
    })
})

$(".banW .insert_btn").click(function(){
    if(!$(".banwords_management_article").children().is($("input"))){
        $(".banwords_management_article").append("<input id=addBanWordsInput type=text>");
    }

    $("#addBanWordsInput").focus();
})

$(document).on("focusout","#addBanWordsInput",function(){
    $(this).remove();
})

$(function(){
    $(document).on("keyup","#addBanWordsInput",function(e){
        if(e.keyCode == 13){
            var text = $("#addBanWordsInput").val()
            if(BanWordsOverlapCheck(text)){
                $.ajax({
                    type:"post",
                    url:"BanWordsInsert",
                    data:{words:text},
                    success:function(){
                        location.reload();
                    }
                })
            } else {
                myAlert("중복체크","금지어가 중복되었습니다.");
                $("#addBanWordsInput").val("");
                $("#addBanWordsInput").focus();
            }
        }
    })

    $(".banwords").click(function(){
        oldText = $(this).text();
        $(this).parent().prepend("<input id=BanWordsUpdateInput type=text>");
        $(this).hide();

        $("#BanWordsUpdateInput").focus();
            
    })

    $(document).on("focusout","#BanWordsUpdateInput",function(){
        $(this).next().show();
        $(this).remove();
    })


    
    $(document).on("keyup","#BanWordsUpdateInput",function(e){
        if(e.keyCode == 13){
            var text = $("#BanWordsUpdateInput").val()
            if(BanWordsOverlapCheck(text)){
                $.ajax({
                    type:"post",
                    url:"BanWordsUpdate",
                    data:{
                        words:oldText,
                        newWords:text
                    },
                    success:function(){
                        location.reload();
                    }
                })
            } else {
                myAlert("중복체크","금지어가 중복되었습니다.");
            }
        }
    })


    

    function BanWordsOverlapCheck(text){
        var arrlength = $(".banwords").length;
        var arr = new Array(arrlength);
        for(let i = 0; i < arrlength; i++){
            arr[i] = $(".banwords").eq(i).text();
        }

        
        for(let i = 0; i < arrlength; i++){
            if(arr[i] === text){
                return false;
            }
        }

        return true;
    }

})



//회의실 관리

// LargeCategory

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


//smallCategory

// select
$(".toggle_btn").click(function(){
    var mythis = $(this);
    smallList(mythis)
})

function smallList(mythis){
    if(!mythis.hasClass("action")){
        mythis.addClass("action");
        console.log("if1")
        if(!mythis.parent().next().children().hasClass("small_meetingroom_content")){
            var roomNo = mythis.next().next().children().val();
            console.log("if2")
            $.ajax({
                type:"post",
                url:"selectSmallMeetingRoom",
                dataType:"JSON",
                data:{
                    roomNoLarge : roomNo
                },
                success:function(list){
                    $.each(list, function(index, item){
                        var selectCode;
                        selectCode="<div class='small_meetingroom_content'>"
                        selectCode+="<span class='small_meetingroom'>"+item.SRoomName+"</span>"
                        selectCode+="<div class='delete_btn bm_btn small_delete_btn'>"
                        selectCode+="<input type='hidden' value="+item.roomNoSmall+">"
                        selectCode+="</div>"
                        selectCode+="<div class='small_setting'>"
                        selectCode+="<i class='fa-solid fa-gear'></i>"
                        selectCode+="</div>"
                        selectCode+="</div>"
                        console.log(selectCode)
                        mythis.parent().next().append(selectCode)
                    })
                }
            })
        }
        mythis.parent().next().show();
        
    } else {
        mythis.removeClass("action");
        mythis.parent().next().hide();
    }
}



// update
$(document).on("click",".small_meetingroom",function(){
    $(this).after("<input id=meetingroomSmallUpdateInput type=text>");
    $(this).hide();
    $("#meetingroomSmallUpdateInput").focus();
})

$(document).on("focusout","#meetingroomSmallUpdateInput",function(){
    $(this).prev().show();
    $(this).remove();
})

$(document).on("keyup","#meetingroomSmallUpdateInput",function(e){
    if(e.keyCode == 13){
        var text = $("#meetingroomSmallUpdateInput").val()
        var cateNo = $(this).next().children().val();
        $.ajax({
            type:"post",
            url:"MRUpdate",
            data:{
                roomNoSmall:cateNo,
                SRoomName:text
            },
            success:function(result){
                if(result == "true") {
                    location.reload();
                } else {
                    myAlert("중복체크","중복되었습니다 다시 입력해 주세요");
                }
            }
        })
    }
})

// insert

$(".small_insert_btn").click(function(){
    var mythis = $(this).prev().prev();
    if(!mythis.hasClass("action")){
        smallList(mythis)
    }
    
    if(!$(".meetingroom_management_article").children().is($("input"))){
        $(this).parent().after("<input id=addMeetingRoomSmallInsert type=text>")
        $("#addMeetingRoomSmallInsert").focus();
    }
})

$(document).on("focusout","#addMeetingRoomSmallInsert",function(){
    $(this).remove();
})

$(document).on("keyup","#addMeetingRoomSmallInsert",function(e){
    if(e.keyCode == 13){
        var text = $("#addMeetingRoomSmallInsert").val()
        var roomNo = $(this).prev().children().eq(2).children().val();
        $.ajax({
            type:"post",
            url:"MRInsert",
            data:{
                SRoomName:text,
                roomNoLarge:roomNo
            },
            success:function(result){
                if(result == "true"){
                    location.reload();
                } else {
                    myAlert("중복체크","중복되었습니다. 다시 입력해 주세요");
                }
            }
        })
    }
})




// delete
$(document).on("click",".small_delete_btn",function(){
    var cateNo = $(this).children().val();

    $.ajax({
        type:"post",
        url:"MRDelete",
        data:{roomNoSmall:cateNo},
        context : this,
        success:function(){
            $(this).parent().hide();
        }
    })
})







// 셋팅 모달

$(document).on("click",".small_setting",function(){
    var roomName = $(this).prev().prev().text();
    $("#modal_body .room_name").text(roomName);
    $("#roomNoSmall").val($(this).prev().children().val());

    $.ajax({
        type:"post",
        url:"meetingRoomStatus",
        dataType:"JSON",
        data:{
            roomNoSmall : $("#roomNoSmall").val()
        },
        success:function(result){
            if(result.maxCount <= 0){
                $(".maxCountInput").show();
            } else {
                $(".maxCount_box").append("<span class='maxCount'>"+result.maxCount+"명</span>")
            }

            if(result.status == 'Y'){
                $('.status_box .meetingRoomStatus').text("사용가능")
            } else {
                $('.status_box .meetingRoomStatus').text("사용불가")
            }
        }
    })

    $(".meetingRoomModal").css("display","flex");

    $(".meetingroom_next_btn").click(function(){
        $(".meetingRoomModal").hide();
        $(".maxCountInput").hide();
        $(".maxCount").remove();
    })

})

//최대인원
$(document).on("keyup",".maxCountInput",function(e){
    if(e.keyCode == 13){
        var text = $(".maxCountInput").val();
        var roomNo = $("#roomNoSmall").val();
        $.ajax({
            type:"post",
            url:"maxCountUpdate",
            data:{
                maxCount:text,
                roomNoSmall:roomNo
            },
            success:function(){
                $(".maxCount").remove();
                $(".maxCountInput").val("").hide();
                $(".maxCount_box").append("<span class='maxCount'>"+text+"명</span>")
            }
        })
    }
})

$(document).on("click",".maxCount",function(){
    $(this).hide();
    $(".maxCountInput").show();
    $(".maxCountInput").focus();
})

$(document).on("focusout",".maxCountInput",function(){
    $(".maxCount").show();
    $(this).hide();
})

$(document).on("click",".meetingRoomStatus",function(){
    $(".status_box").append("<input type='text' class='statusUpdateInput' placeholder='Y / N' maxlength='1'>");
    $(this).hide();
    $(".statusUpdateInput").focus();
})

$(document).on("focusout",".statusUpdateInput",function(){
    $(".meetingRoomStatus").show();
    $(this).remove();
})

$(document).on("keyup",".statusUpdateInput",function(e){
    if(e.keyCode == 13){
        var text = $(".statusUpdateInput").val().toUpperCase();
        var roomNo = $("#roomNoSmall").val();
        if(text == 'Y' || text == 'N'){
            $.ajax({
                type:"post",
                url:"statusUpdate",
                data:{
                    status:text,
                    roomNoSmall:roomNo
                },
                success:function(){
                    if(text == 'Y'){
                        $(".meetingRoomStatus").text("사용가능").show();
                    } else {
                        $(".meetingRoomStatus").text("사용불가").show();
                    }
                    $(".statusUpdateInput").remove();
                }
            })
        } else {
            myAlert("사용상태변경","Y / N 만 입력해 주세요");
        }
    }
})





// 부서관리 페이지

function deptInfo(deptName){
    $.ajax({
        type:"post",
        url:"deptSelect",
        dataType:"JSON",
        data:{deptName : deptName},
        success:function(list){
            $("#dept_controll_box_title").text(list.deptTitle);
            $("#dept_name").text(list.deptTitle);
            $("#dept_code").text(list.deptNo);
            if(typeof list.deptResponsible == "undefined"){
                $("#dept_responsible").text("책임자 미지정")
            } else {
                $("#dept_responsible").text(list.deptResponsible);
            }
            $("#dept_create_date").text(list.deptCreationDate);
            $("#dept_info_box").show();
            $(".deleteClass").remove();



            if(list.deptTitle != '영업팀' && list.deptTitle != "기술 지원팀" && list.deptTitle != "경영 지원팀"){
                $("#deleteDept").show();
            }

        }
    })
}

$(document).on("click",".dept_name",function(){
    var deptName = $(this).text();
    $(this).next().toggle();
    $("#dept_controll_box_title span").text(deptName);

    deptInfo(deptName);
})

$(document).on("click","#dept_member_nav",function(){
    if(!$("#member_list_box").children().hasClass("member_lists")){
        if($("#dept_info_box").css("display") != "none"){
            var deptNo = $("#dept_code").text();
            $.ajax({
                type:"post",
                url:"deptMemberList",
                dataType:"JSON",
                data:{deptNo : deptNo},
                success:function(list){
                    var html = $("#example").html();
                    console.log(html)
                    $.each(list, function(index, item){
                        $("#member_list_box").append(html);
                        //$(".dept_profile_img_box").eq(index).children().attr("src",item.profileImg);
                        $(".dept_member_name").eq(index).text(item.empName+" "+item.jobName);
                        $(".thisEmpNo").eq(index).val(item.empNo);
                        $("#member_list_box").children().eq(index).addClass("deleteClass")
                        $("#dept_info_box").hide();
                        $("#member_list_box").show();
                    })
                }
            })
        }
    } else {
        $("#member_list_box").show();
        $("#dept_info_box").hide();
    }
})

$(document).on("click","#dept_info_nav",function(){
    $("#member_list_box").hide();
    $("#dept_info_box").show();
})

$(document).on("click",".member_lists",function(){
    var empNo = $(this).children().eq(0).val();
    
    location.href = "empDetailPage?empNo="+empNo;
})

$(document).on("keyup","#insert_dept_input",function(e){
    if(e.keyCode == 13){
        var text = $(this).val();
        if(deptNameOverlapCheck(text)){
            $.ajax({
                type:"post",
                url:"insertDept",
                data:{deptName : text},
                success:function(){
                    $("#dept_list_box").load(location.href + " #dept_list_box");
                    deptInfo(text);
                    $("#insert_dept_input").val("");
                }
            })
        } else {
            myAlert("중복체크","부서명이 중복되었습니다. 다시 입력해 주세요")
        }
    }
})

$(document).on("click","#dept_name",function(){
    var text = $(this).text();
    if(text != '영업팀' && text != "기술 지원팀" && text != "경영 지원팀"){
        $(this).hide();
        $(this).after("<input type=text id=dept_name_update>")
        $("#dept_name_update").focus();
    }
})

$(document).on("focusout","#dept_name_update",function(){
    $("#dept_name").show();
    $(this).remove();
})

$(document).on("keyup","#dept_name_update",function(e){
    if(e.keyCode == 13){
        var text = $(this).val();
        var deptCode = $("#dept_code").text();
        if(deptNameOverlapCheck(text)){
            $.ajax({
                type:"post",
                url:"updateDept",
                data:{
                    deptTitle : text,
                    deptNo : deptCode
                },
                success:function(){
                    $("#dept_list_box").load(location.href + " #dept_list_box");
                    $("#dept_list_box").css("margin-left","1px");
                    deptInfo(text);
                    $("#dept_name_update").remove();
                    $("#dept_name").show();
                }
            })
        } else {
            myAlert("중복체크","부서명이 중복되었습니다. 다시 입력해 주세요")
        }
    }
})


$(document).on("click","#dept_responsible",function(){

    var deptNo = $("#dept_code").text();

    $.ajax({
        type:"post",
        url:"deptMemberList",
        dataType:"JSON",
        data:{deptNo : deptNo},
        success:function(list){
            $.each(list, function(index, item){
                $("#responsibleUpdate").append("<option value="+item.empName+">"+item.empName+" "+item.jobName+"</option>");
                $("#dept_responsible").hide();
                $("#responsibleUpdate").show();
            })
        }
    })
})

$(document).on("mouseout","#responsibleUpdate",function(){
    $("#dept_responsible").show();
    $(this).hide();
    $(this).children().remove();
})




$(document).on("change","#responsibleUpdate",function(){
    var empName = $(this).val();
    var deptName = $("#dept_name").text();
    $.ajax({
        type:"post",
        url:"responsibleUpdate",
        data:{
            empName:empName,
            deptName : deptName
        },
        success:function(){
            $("#responsibleUpdate").hide();
            $("#responsibleUpdate").children().remove();
            deptInfo(deptName);
            $("#dept_responsible").show();
        }
    })
})


$(document).on("click","#deleteDept",function(){
    if($("#dept_info_box").css("display") != "none"){
        var deptNo = $("#dept_code").text();

        $.ajax({
            type:"post",
            url:"deleteDept",
            data:{deptNo : deptNo},
            success:function(){
                location.reload();
            }
        })
    }
})

// 중복체크
function deptNameOverlapCheck(text){
    var arrlength = $(".dept_name").length;
    var arr = new Array(arrlength);
    for(let i = 0; i < arrlength; i++){
        arr[i] = $(".dept_name").eq(i).text();
    }

    
    for(let i = 0; i < arrlength; i++){
        if(arr[i] === text){
            return false;
        }
    }

    return true;
}