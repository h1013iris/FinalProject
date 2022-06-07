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
        $(".board_management_article").append("<input id=addBoardInput type=text>");
    }
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



