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
</style>


  <body>

    <!--  원본
     <div id="container">
        <div class="main">
            <form action="insertComAdd" method="post">
                <h3>거래처등록</h3>
        <table class="main2">
            <tr>
                <td>
            <select id="selbox" name="inFolder">
                <option name ="inFolder" value="">폴더선택(x)</option>
            <c:forEach items="${comFolList}" var="comF">
                <option class="cho" name="inFolder" value="${comF.inFolder}">${comF.inFolder}</option>
            </c:forEach>
                   <option value="direct">직접입력</option>
            </select>
            </td>
            <td>
            <input type="text" id="selboxDirect" name="inFolder" value="${comF.inFolder}" />
        </td>
    </tr>
    -->
    
    <!-- 이렇게하면 직접입력한거 값은 넘어가는데 기존폴더 선택하면 null로 날아감.. -->
    <!-- <div id="container">
        <div class="main">
            <form action="insertComAdd" method="post">
                <h3>거래처등록</h3>
        <table class="main2">
            <tr>
                <td>
            <select id="selbox">
                <option name="inFolder" value="">폴더선택(x)</option>
            <c:forEach items="${comFolList}" var="comF">
                <option  name="inFolder" class="cho"value="${comF.inFolder}">${comF.inFolder}</option>
            </c:forEach>
                   <option value="direct">직접입력</option>
                    <input type="text" id="selboxDirect" name="inFolder" value="${comF.inFolder}" />
            </select>
            </td>
            <td>
           
        </td>
    </tr>
     -->
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
                   <td><input type="text" id="selboxDirect" value=""/>
            
            </select>
            <td>
           
       
    </tr>
     
     <!-- <div id="container">
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
                   <option class="cho" value="direct">직접입력</option>
            </select>
            </td>
            <td>
            <input type="text" id="selboxDirect" value="${comF.inFolder}" name="inFolder"/>
        </td>
    </tr> -->
                
                   
            <!--내부폴더는 empNo로 distinct로 중복제거 select해서 목록띄우기-->
                <tr> 
                    <td>회사명</td>
                    <td><input type="text" name="comNm" required></td>
                </tr>
                <tr>
                    <td>사업자번호</td>
                    <td><input type="text" name="comNo"  class="inputlo" required maxlength="12"></td>
                </tr>
                <tr>
                    <td>대표번호</td>
                    <td><input type="text" name="comTel"></td>
                </tr>
                <tr>
                    <td>대표명</td>
                    <td><input type="text"  name="comCeo"></td>
                </tr>
                <tr>
                    <td>담당자</td>
                    <td><input type="text"  name="comPix" required></td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="comPhone"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="comEmail"></td>
                <tr>
                    <td>기타</td>
                    <td><input type="text" name="comMemo" class="inputlo" required></td>
                </tr>
                    
                    
                   
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