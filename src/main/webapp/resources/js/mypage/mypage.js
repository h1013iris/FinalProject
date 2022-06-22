$(function(){
    var date = new Date();
    $("#date").val(date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate());
})


$(document).on("click",".journal_list_box",function(){
    var journalNo = $(this).children().eq(0).val();

    location.href = "detailJournal?journalNo="+journalNo;
})

$("#journal_update_btn").click(function(){
    var journalNo = $("#journalNO").val();

    location.href = "selectJournal?journalNo="+journalNo;
})

$("#journal_delete_btn").click(function(){
    var journalNo = $("#journalNO").val();

    location.href = "deleteJournal?journalNo="+journalNo;
})

$(document).on("change",".search_input",function(){
    var fromDate = $("#search_input_from").val();
    var toDate = $("#search_input_to").val();
    var html = $("#htmldrow").html();

    $.ajax({
        type:"post",
        url:"searchDateFrom",
        dataType:"JSON",
        data:{fromDate : fromDate, toDate : toDate},
        success:function(list){
            $("#list_container").children().remove();
            

            $.each(list, function(index, item){
                $("#list_container").append(html);
                $(".journalNoInput").eq(index).val(item.journalNo);
                $(".create_date").eq(index).text(item.createDate);
            })
        }
    })
})


// ToDoList

$("#searchDate").change(function(){
    
    var todoDate = $(this).val();
    var html = $("#htmlBox").html();
    $.ajax({
        type:"post",
        url:"todoDateSelectList",
        dataType:"JSON",
        data:{todoDate : todoDate},
        context: this,
        success:function(list){
            $(".removeClass").children().remove();
            $("#selectDayList_box").append(html);
            $("#selectDayList_box > p").text($(this).val());
            
            $.each(list,function(index,item){
                $(".daythisListNo").eq(index).val(item.listNo);
                $(".day_todoTitle").eq(index).text(item.content);
                $(".day_work_time").eq(index).html(item.time);
            })
        }
    })
})

$(document).on("change",".checkboxInput",function(){
    if($(this).is(":checked")){
        $(this).next().css("text-decoration","line-through")
        $(this).next().next().next().val("100");
    } else {
        $(this).next().css("text-decoration","none")
        $(this).next().next().next().val("");
    }

    percentCheck()
})

$(document).on("focusout",".percent_text",function(){
    if($(this).val() > 100){
        $(this).val("");
    }
    if($(this).val() == 100){
        $(this).prev().prev().prev().prop("checked",true);
        $(this).prev().prev().css("text-decoration","line-through");
    } else {
        $(this).prev().prev().prev().prop("checked",false);
        $(this).prev().prev().css("text-decoration","none");
    }
    percentCheck()
})

$(document).on("keyup",".percent_text",function(e){
    if(e.keyCode == 13){
        $(this).blur();

        if($(this).val() == 100){
            var status = 'Y';
        } else {
            var status = 'N';
        }
    
        var listNo = $(this).parent().children().eq(0).val();
        var percent = $(this).val();
        $.ajax({
            type:"post",
            url:"updateToDoList",
            data:{
                status : status,
                listNo : listNo,
                percent : percent
            },
            success:function(){
                location.reload();
            }
        })
    }
})
$(function(){
    var AllLength = $(".percent_text").length;
    console.log("length"+AllLength)

    var avg = 0;
    for(let i = 0; i < AllLength; i++){

        avg += Number($(".percent_text").eq(i).val());
        
        console.log("담기냐"+avg)
    }

    console.log("최종계산전"+avg)
    var avg = avg / AllLength;

    $("#gauge_bar").css("width",avg+"%");
    $("#percentaige").text(avg+"%");
})

function percentCheck(){
    var AllLength = $(".percent_text").length;
    console.log("length"+AllLength)

    var avg = 0;
    for(let i = 0; i < AllLength; i++){

        avg += Number($(".percent_text").eq(i).val());
        
        console.log("담기냐"+avg)
    }

    console.log("최종계산전"+avg)
    var avg = avg / AllLength;

    $("#gauge_bar").css("width",avg+"%");
    $("#percentaige").text(avg+"%");
}

$("#todoInsert").click(function(){
    $(".insertToDoListModal").css("display","flex");
})

$("#todolist_insert_btn").click(function(){
    var todoDate = $("#date").val();
    var time = $("#time").val();
    var content = $("#content").val();

    $.ajax({
        type:"post",
        url:"todolistInsert",
        data:{
            todoDate : todoDate,
            time : time,
            content : content
        },
        success:function(){
            // $(".insertToDoListModal").hide();
            // $("#date").val("");
            // $("#time").val("");
            // $("#content").val("");
            location.reload();

        }
    })
})

$(document).on("click",".checkboxInput",function(){
    if($(this).prop("checked")){
        var status = 'Y';
    } else {
        var status = 'N';
    }

    var listNo = $(this).prev().val();
    $.ajax({
        type:"post",
        url:"updateToDoList",
        data:{
            status : status,
            listNo : listNo
        },
        success:function(){
            location.reload();
        }
    })
})


$(document).on("click",".todoTitle, .work_time",function(){
    
    var listNo = $(this).parent().children().eq(0).val();
    
    $.ajax({
        type:"post",
        url:"selectToDoList",
        dataType:"JSON",
        data : {listNo : listNo},
        success:function(list){
            $(".detailToDoListModal #date").val(list.todoDate);
            $(".detailToDoListModal #time").val(list.time);
            $(".detailToDoListModal #content").val(list.content);
            $(".detailToDoListModal #listNoInput").val(list.listNo);
            $(".detailToDoListModal").css("display","flex");
        }
    })
})

$(".detailToDoListModal .cancel_btn").click(function(){
    $(".detailToDoListModal").hide();
})


$("#addclass").click(function(){
    if($("#addclass").text() == '저장'){
        var todoDate = $(".detailToDoListModal #date").val();
        var time = $(".detailToDoListModal #time").val();
        var content = $(".detailToDoListModal #content").val();
        var listNo = $("#listNoInput").val();
        $.ajax({
            type:"post",
            url:"todolistUpdate",
            data:{
                todoDate : todoDate,
                time : time,
                content : content,
                listNo : listNo
            },
            success:function(msg){
                $(".detailToDoListModal").hide();
                location.reload();
            }
        })
    }
})

$(".detailToDoListModal .update_btn").click(function(){
    $(".detailToDoListModal #date, .detailToDoListModal #time, .detailToDoListModal #content").attr("readonly",false);
    $(".update_btn").text("저장");
})

$(".empSearch_next_btn").click(function(){
    var a = $(".emp_checkbox_input:checked").val()
    alert(a)
})

$(document).on("click",".workreceived_lists",function(){
    var raskNo = $(this).children().eq(0).val();

    location.href = "workDetailPage?raskNo="+raskNo;
})

$("#success_status_update").click(function(){
    var raskNo = $(this).val();

    $.ajax({
        type:"get",
        url:"updateRequestStatus",
        data:{raskNo : raskNo},
        success:function(){
            history.back();
        }
    })
})
