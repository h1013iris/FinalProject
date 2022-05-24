window.onload = function(){
    document.getElementById("address_search").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
                document.querySelector("input[name=nextAddress]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}


function checkId(no){
	if(no == 0){
	$("#checkResult").hide();
	$("#submit").attr("disabled",true);
	
	}else if(no == 1){
	$("#checkResult").css("color","red").text("중복된 아이디가 존재합니다")
	$("#checkResult").show();
	$("#submit").attr("disabled",true);
	
	}else if(no == 2){
	$("#checkResult").css("color","black").text("사용 가능한 아이디 입니다")
	$("#checkResult").show();
	$("#submit").removeAttr("disabled");
	}
}	
	
$(function(){
	var $checkId= $("#checkId");
    var $userId= $("#userId"); //id가 userId인 입력란의 값을 변수userId에 저장
    
     $checkId.click(function(){
      if($userId.val().length<5){
        alert("5글자이상 작성해주세요")
     }else if($userId.val().length>=5){
     
     $.ajax({
        url:"loginCheck.do", //컨트롤러 연결해줄 경로
        data:{userId:$userId.val()}, //전달할 데이터
        type:"post", //post방식으로 전달
        success:function(idno){ //매퍼까지갔다가 리턴된idno
        	
         if(idno > 0){//중복아이디 존재
          	checkId(1);
          }else{//중복 아니라면
        	checkId(2);
        	}
        },error:function(){
                alert("아이디 중복체크 통신오류");
            }
        });
    }else{ 
    	checkId(0);
    }
   });
  });
 
 

  $(function(){

    	//비밀번호 유효성검사
            $("#userPw").on("input",function(){
                var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

                var result = regex.exec($("#userPw").val())
                
                if(result != null){
                    $(".pw.regex").html("");
                }else{
                    $(".pw.regex").html("영어대소문자,숫자,특수문자포함 8-20자리");
                    $(".pw.regex").css("color","red")
                }
            });
            
           //비밀번호 확인    
               $("#ckPw").on("keyup",function(){
                    if($("#userPw").val()==$("#ckPw").val()){
                       $(".ckPw.regex").html("비밀번호가 일치합니다"); 
                    }else{
                     $(".ckPw.regex").html("비밀번호가 일치하지않습니다"); 
                    }
               })
            
          
          //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
           $("#submit").on("click",function(){
        	   var pw = $("#userPw").val();
        
        	   var pwregex =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
        
        	   var pwregex = pwregex.exec(pw);
        	   if(pwregex == null){
        		   alert("비밀번호양식을 다시 확인해주세요");
        		   retrun;
        	   }
        
        	   
             //빈칸 없을 때 제출.
        	   $("#newMember").submit();
           
           })
        })
 
 

