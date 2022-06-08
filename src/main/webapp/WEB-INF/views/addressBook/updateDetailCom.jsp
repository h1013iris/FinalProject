<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>거래처 수정</title>
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
      width: 500px;
        margin:0 auto;
        text-align: center;
        border: solid 1px; 
        
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
    }
    
</style>


  <body>

    <div id="container">
        <div class="main">
            <form action="updateComList.do" method="post">
                <h3>거래처 수정</h3>
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
                   <td><input type="text" id="selboxDirect"/>  
            </select>
            	<td>
           
       
    </tr>
                   
            <!--내부폴더는 empNo로 distinct로 중복제거 select해서 목록띄우기-->
                 <c:forEach items="${comDetail}" var="com">
                <tr> 
                    <td>회사명</td>
                    <td><input type="text" name="comNm" value="${com.comNm}" required maxlength="20"></td>
                </tr>
                <tr>
                    <td>사업자번호</td>
                    <td><input type="text" name="comNo" value="${com.comNo}" class="inputlo" required maxlength="10" placeholder="하이픈빼고 10자리"></td>
                </tr>
                <tr>
                    <td>대표번호</td>
                    <td><input type="text" name="comTel" value="${com.comTel}"></td>
                </tr>
                <tr>
                    <td>대표명</td>
                    <td><input type="text"  name="comCeo" value="${com.comCeo}"></td>
                </tr>
                <tr>
                    <td>담당자</td>
                    <td><input type="text"  name="comPix" value="${com.comPix}" required></td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="comPhone" value="${com.comPhone}"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" name="comEmail" value="${com.comEmail}"></td>
                <tr>
                    <td>기타</td>
                    <td><textarea name="comMemo" class="inputlo" rows="5"  maxlength="50"  >${com.comMemo}</textarea></td>
                </tr>
                <input type="hidden" name="compNo" value="${com.compNo }">  
                <input type="hidden" name="empNo" value="${com.empNo }"> 
                  </c:forEach>  
                    
                   
            <!--나중에 모달창에서 바꾸기-->
                
            </table>
            
                <div id="buttonLine">
                <input type="submit" value="등록"/>
                <input type="button" value="취소"/>
                </div>
           </form>
        </div>
    </div>
  <script>
  /*원본
  $(function(){
    
        //직접입력시 인풋박스 기존에는 안보이는상태 
   		$("#selboxDirect").hide();
   
    
     $("#selbox").change(function() {
    
    	//직접입력을 누를 때 보임
        if($("#selbox").val() == "direct") {
        	$("#selboxDirect").show();

        }  else {
       		$("#selboxDirect").hide();
        }

    });
    });*/
    
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