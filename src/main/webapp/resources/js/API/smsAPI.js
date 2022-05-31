$("#phone_send, #all_send").click(function(){
    $.ajax({
        url:'smsSendRequest',
        type:'post',
        data : {
            phone : $("#phone").val(),
            name: $("#empName").val(),
            empNo: $("#empNo").val(),
        },

        success:function(msg){
            if(msg == "success"){
                alert("문자전송 성공")
            } else {
                alert("문자전송 실패")
            }
        }
    })
})