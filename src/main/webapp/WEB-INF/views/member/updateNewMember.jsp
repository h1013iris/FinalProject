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
	<script	src="${ pageContext.servletContext.contextPath }/resources/js/member/updateNewMember.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

#all{
  display: grid;
  place-items: center;
  height: 100vh;
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
                      src=""
                      id="preview"
                      alt="프로필사진"
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
                      value="${m.departmentTitle }"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <!-- <td colspan="2"><input type="file" value="사진등록" id="photo"></td>-->
                  <!-- 프로필필수값은 일단 지움 -->
                  <!-- 파일올리면 미리 보여주기 -->
                  <td colspan="2">
                    <input
                      type="file"
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
              * id<br />
              <input
                type="text"
                id="userId"
                name="userId"
                class="input"
                required
                minlength="5"
                maxlength="10"
              />
              &nbsp;&nbsp;
              <button id="checkId">중복확인</button>
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
                required
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
              <input type="text" name="twoAddress" class="inputlo" required />
            </div>
            <div class="title">
              * 주민번호<br />
              <input
                type="text"
                class="inputlo m2"
                value="${m.userNo}"
                readonly
              />
              <br />
              <br />
            </div>
            <input type="submit" value="회원가입" id="submit" class="commonButton1"/>
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
	}
		
</script>

<script type="text/javascript"> 
var msg = '${msg}';
	if(msg)
	{
	alert(msg);
	}
</script>

</body>
</html>