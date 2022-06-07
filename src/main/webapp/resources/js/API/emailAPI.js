// code fragment
function emailAPI(empName, email, empNo){

    var data = {
        service_id: 'service_4pwoxqm',
        template_id: 'template_c9sses7',
        user_id: 'Mafb0wCflnksYAr8I',
        template_params: {
            to_name : empName,
            email : email,
            message : empNo
        }
    };
     
    $.ajax('https://api.emailjs.com/api/v1.0/email/send', {
        type: 'POST',
        data: JSON.stringify(data),
        contentType: 'application/json'
    }).done(function() {
        return "이메일 전송에 성공 하셨습니다.";
    }).fail(function(error) {
        return "이메일 전송에 실패 하셨습니다."
    });
    // code fragment
}