// code fragment
$("#email_send, #all_send").click(function(){

    var data = {
        service_id: 'service_4pwoxqm',
        template_id: 'template_c9sses7',
        user_id: 'Mafb0wCflnksYAr8I',
        template_params: {
            to_name : $("#empName").val(),
            email : $("#email").val(),
            message : $("#empNo").val()
        }
    };
     
    $.ajax('https://api.emailjs.com/api/v1.0/email/send', {
        type: 'POST',
        data: JSON.stringify(data),
        contentType: 'application/json'
    }).done(function() {
        alert('Your mail is sent!');
    }).fail(function(error) {
        alert('Oops... ' + JSON.stringify(error));
    });
    // code fragment
})