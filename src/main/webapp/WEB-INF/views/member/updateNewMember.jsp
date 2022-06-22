<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
	<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 주소api -->
	<!-- <script	src="${ pageContext.servletContext.contextPath }/resources/js/member/updateNewMember.js"></script>-->
</head>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">	
<style>
* {
	margin: 0;
	padding: 0;
}

#all{
  display: grid;
  place-items: center;
  height: 100vh;
overflow-y: scroll;
}

#container{
            width: 500px;
            margin:0 auto;
            text-align:center;
    		position: left 50%; top: 50%;
            height: 1100px;

        }
        .title{
            text-align: left;
            margin: 20px;
        }
        .input{
            width: 300px;
            margin:10px;
            height: 25px;
            
        }
        .inputlo{
            width: 450px;
            margin:10px;
            height: 25px;
        }
        .outter{
            background-color: #85cdff;
            height: 10px;  
            width: 500px;  
            margin:40px auto;
            margin-bottom: 20px;       
        }
        #logo{
            background-color: hsl(205, 100%, 91%);
            height: 130px;
            text-align: center; 
            
        }
        #newmember{
            text-align: center;
        }
        #mem{
            width: 560px;
            margin:auto; 
            
        }
        .mem{ 
            text-align: center;
        }
        .m{
            width: 300px;
            height: 30px;
            margin-right: 50px;
            background-color: rgba(233, 233, 233, 0.833);
            text-align: center;
        }
        .m2{
            background-color: rgba(233, 233, 233, 0.833);
            text-align: center;
        }

        #photo{
            margin-left: 15px;
        }
        
        .id_Yse{color:#fff; display: none;}
        .id_No{color:#6A82FB; display: none;}
        .regex {
            font-size: 0.8em;
            text-align: center;
          }
          .checkResult{
            font-size: 0.8em;
            text-align: center;
          }
         #mem td{
          vertical-align: middle;
          }
    
    /*팀 공동 버튼 스타일*/      
     .commonButton1{
     padding: 0;
     font-weight: 600;
     text-align: center;
     line-height: 30px;
     color: #FFF;
     border-radius: 5px;
     transition: all 0.2s ;
     background: #85cdff;
     border: #85cdff;
     box-shadow: 0px 5px 0px 0px #4c87b099;
     width:80px;
 	}
	.commonButton1:hover{
    position: relative;
    top: 5px;
    bottom: 5px;
    box-shadow: 0px 0px 0px 0px #4c87b099;
	}
	

</style>


	<jsp:include page="../common/alert.jsp"/>
<body>
<div id="all">

        <div id="container">
          <div class="outter"></div>
          <div id="logo">
            <img
              src="resources/images/member/nobackLogo.png"
              alt="회사로고"
              style="width: 300px"
            />
          </div>
          <form
            action="updateNewMember2.do"
            method="post"
            enctype="multipart/form-data"
            id="updateMember"
          >
            <div class="title">
              * 프로필
              <table id="mem">
                <tr>
                  <td rowspan="3">
                    <img
                      src="resources/images/member/profile.png"
                      id="preview"
                      alt=""
                      width="105"
                      height="140"
                    />
                  </td>
                  <td class="mem" width="450px">
                    <input
                      type="text"
                      class="m"
                      value="${m.empName}"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <td class="mem">
                    <input
                      type="text"
                      class="m"
                      value="${m.jobName }"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <td class="mem">
                    <input
                      type="text"
                      class="m"
                      value="${m.departmentTitle}"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <!-- <td colspan="2"><input type="file" value="사진등록" id="photo"></td>-->
                  <!-- 파일올리면 미리 보여주기 -->
                  <td colspan="2">
                    <input
                      type="file" accept=".png,.jpg,.jepg"
                      name="photo"
                      value="사진등록"
                      id="photo"
                      required
                      onchange="readURL(this);"
                    />
                  </td>
                </tr>
              </table>
            </div>

            <input type="hidden" value="${m.empNo}" name="empNo" />
            <div class="title">
              * 아이디<br />
              <input
                type="text"
                id="userId"
                name="userId"
                class="inputlo"
                required
                minlength="5"
                maxlength="10"
              />
              <div
                id="checkResult"
                style="display: none; font-size: 0.8em"
              ></div>
            </div>
            <div class="title">
              * 비밀번호<br />
              <input
                type="password"
                name="userPw"
                id="userPw"
                class="inputlo"
                required
                minlength="8"
                maxlength="20"
              />
              <div class="pw regex"></div>
            </div>
            <div class="title">
              * 비밀번호 재확인<br />
              <input
                type="password"
                id="ckPw"
                class="inputlo"
                minlength="8"
                maxlength="20"
                required
              />
              <div class="ckPw regex"></div>
            </div>
            <div class="title">
              * 이메일<br />
              <input
                type="email"
                class="inputlo m2"
                value="${m.email}"
                id="email"
                required
                readonly
              />
            </div>
            <div class="title">
              * 휴대폰번호<br />
              <input
                type="text"
                class="inputlo m2"
                value="${m.phone}"
                readonly
              />
            </div>
            <div class="title">
              * 주소<br />
              <input
                type="text"
                name="oneAddress"
                class="input"
                id="address"
                readonly
                required
              />
              &nbsp;&nbsp;
              <input type="button" value="주소검색" id="address_search"/>
            </div>
            <div class="title">
              * 상세주소<br />
              <input type="text" name="twoAddress" class="inputlo" required id="address_search2"/>
            </div>
            <div class="title">
              * 생년월일<br />
              <input
                type="text"
                class="inputlo m2"
                value="${m.userNo}"
                readonly
              />
              <br />
              <br />
            </div>
            <input type="submit" value="회원가입" id="newMember" class="commonButton1" disabled=""/>
            <button type="button" class="commonButton1" onclick="location.href='login.do'">취소</button>
          </form>
          <div class="outter"></div>
        </div>
      </div>
    </div>
	
	<!-- 선택한 사진 미리 보여주기 -->
<script>
function readURL(input){
	if(input.files && input.files[0]){
		let reader = new FileReader();
		reader.onload=function(e){
			document.getElementById('preview').src=e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	}else{
		document.getElementById('preview').src="";
		
		}
	};
		
</script>
<script type="text/javascript">

window.onload = function(){
    document.getElementById("address_search").addEventListener("click", function(){ //주소입력칸을 클릭하면
       //카카오 지도 발생
   new daum.Postcode({
           oncomplete: function(data) { //선택시 입력값 세팅
               document.getElementById("address").value = data.address; // 주소 넣기
               document.querySelector("input[name=twoAddress]").focus(); //상세입력 포커싱
           }
       }).open();
   });
}

  
function checkId(no){
	if(no == 0){
	$("#checkResult").hide();
	$("#newMember").attr("disabled",true);
	
	}else if(no == 1){
	$("#checkResult").css("color","red").text("중복된 아이디가 존재합니다")
	$("#checkResult").show();
	$("#newMember").attr("disabled",true);
	$('#userId').focus();
	
	}else if(no == 2){
	$("#checkResult").css("color","black").text("사용 가능한 아이디 입니다")
	$("#checkResult").show();
	$("#newMember").attr("disabled",false);
	
	}else if(no == 3){
	$("#checkResult").css("color","red").text("5글자 이상으로 작성해주세요")
	$("#checkResult").show();
	$("#newMember").attr("disabled",true);
	}
}	

$(function(){
	var $checkId= $("#checkId");
   var $userId= $("#userId"); //id가 userId인 입력란의 값을 변수userId에 저장
   //.mouseleave
    $userId.focusout(function(){
     if($userId.val().length<5){
    	checkId(3);
       myAlert("","5글자이상 작성해주세요");
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
               myAlert("아이디 중복체크 통신오류");
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
              });
           
         
         //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
         $("#newMember").on("click",function(){
       	   var pw = $("#userPw").val();
       	   var pwregex =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
       
       	   var pwregex = pwregex.exec(pw);
       	   if(pwregex == null){
       		   alert("비밀번호를 확인해주세요");
       		   $('#userPw').focus();
         			return false;
       		} //비밀번호 일치여부 재확인
		        else if ($("#userPw").val() != $("#ckPw").val()) {
		          alert("비밀번호 일치여부를 다시 확인해주세요");
		          $('#ckPw').focus();
		          return false;
		        }else if($("#photo").val() === null || $("#photo").val()===""){
		        	alert("프로필 사진 등록을 해주세요");
		        	$('#photo').focus()
		        	return false;
		        }else if($("#address").val() === null || $("#address").val()===""){
		        	alert("주소를 검색해주세요");
		        	$('#address_search').focus();
		        	return false;
		        }else if($("#address_search2").val() === null || $("#address_search2").val()===""){
		        	alert("상세주소를 작성 해주세요");
		        	$('#address_search2').focus();
		        	return false;
		        }else {
		          //회원가입 성공
		          alert("회원가입 되었습니다");
		        	   $("#newMember").submit();
		           }
       	   
       });
 })
</script>

	<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>
	
	<script type="text/javascript">
		
		var msg = '${msg}';
		if(msg){
		//alert(msg);
		myAlert("사번확인",msg);
		}
	</script>

</body>
</html>