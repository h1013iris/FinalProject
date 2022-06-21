<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>거래처 등록</title>
  <script
		src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
</head>
<style>
  *{margin: 0;
        padding: 0;}
    #container{
        height: 100vh;
        display: flex;
        align-items: center;
    }

    .main{
      width: 400px;
      height:400px;
        margin:0 auto;
        text-align: center;
        border: solid #85cdff 3px; 
        border-top-left-radius: 150px;
        border-bottom-right-radius: 150px;
        padding-top: 30px;
    }
    
    .main2{
        margin:0 auto;
        text-align: center;
      
    }
    #buttonLine{
        margin-top: 20px;
        margin-bottom: 20px;
    }
  /*  #selboxDirect{
    	display: none;
    }*/
    
    textarea{
    resize: none;
    margin-top: 5px;
   
    }
    .inputBox{
    width: 180px;
    }
    .Title{
    text-align: left;
    }
    .commonButton1_1 {
	padding: 0;
	font-weight: 100px;
	text-align: center;
	line-height: 30px;
	height:30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background: #85cdff;
	border: #85cdff;
	box-shadow: 0px 5px 0px 0px #4c87b099;
	width: 50px;
	position: top:50px;
	
	
}

.commonButton1_1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
	
}
</style>


  <body>

     
     <div id="container">
        <div class="main">
            <form action="insertComAdd" method="post">
                <h3>거래처등록</h3>
        <table class="main2">
            <tr>
                <td>
            <select id="selbox" name="inFolder">
                <option value="">폴더선택(x)</option>
            <c:forEach items="${comFolList}" var="comF">
                <option value="${comF.inFolder}">${comF.inFolder}</option>
            </c:forEach>
                    <option id="direct">직접입력</option>
					</td>
					<td><input type="text" id="selboxDirect" class="inputBox" maxlength="9" value=""/>
            </select>
            </td>
    </tr>
                
                   
            <!--내부폴더는 empNo로 distinct로 중복제거 select해서 목록띄우기-->
                <tr> 
                    <td class="Title">* 회사명</td>
                    <td><input type="text" name="comNm" class="inputBox" required maxlength="19"></td>
                </tr>
                <tr>
                    <td class="Title">* 사업자번호</td>
                    <td><input type="text" name="comNo" class="inputBox" required maxlength="10" placeholder="하이픈빼고 10자리"></td>
                </tr>
                <tr>
                    <td class="Title">* 대표번호</td>
                    <td><input type="text" name="comTel" class="inputBox" required maxlength="13" ></td>
                </tr>
                <tr>
                    <td class="Title">&nbsp;&nbsp;대표명</td>
                    <td><input type="text"  name="comCeo" class="inputBox" maxlength="9"></td>
                </tr>
                <tr>
                    <td class="Title">* 담당자</td>
                    <td><input type="text"  name="comPix" class="inputBox" required maxlength="9"></td>
                </tr>
                <tr>
                    <td class="Title">&nbsp;&nbsp;휴대폰</td>
                    <td><input type="text" name="comPhone" class="inputBox" maxlength="13"></td>
                </tr>
                <tr>
                    <td class="Title">* 이메일</td>
                    <td><input type="email" name="comEmail" class="inputBox" required maxlength="29"></td>
                <tr>
                    <td class="Title">&nbsp;&nbsp;기타</td>
                    <td><textarea name="comMemo" class="inputBox" rows="5"  maxlength="49" ></textarea></td>
                </tr>

            </table>
          <div id="buttonLine">
                <input type="submit" class="commonButton1_1" value="등록" " />
                <button type="button" class="commonButton1_1" value="취소" onclick="location.href='comAdd.do'">취소</button>
        	</div>
           </form>
        </div>
    </div>
           
  <script>

    
  const directBox = document.getElementById('selboxDirect')//selboxDirect id를 가진 태그를 선택한다
  directBox.addEventListener('keyup',function(e){//태그에 keyup이벤트를 추가한다 (keyup: 손가락을 키보드에서 떼면 함수가 실행됨)
	  const directValue=document.getElementById('direct')//direct id를 가진 태그를 선택
	  directValue.value=e.currentTarget.value//input에 입력된 값을 선택직접입력 옵션 태그의 value값으로 넣어준다
  })
    $(function(){
        
        //인풋박스 기존에는 안보이는상태 
   		$("#selboxDirect").hide();
   
    
     $("#selbox").change(function() {
    
    	//직접입력을 누를 때 보임
        if($("#selbox option:selected").attr('id')==='direct'){
        	$("#selboxDirect").show();

        }  else {
       		$("#selboxDirect").hide();
        }
    });
    });
   

    </script>
 </body>
</html>