<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객주소록상세조회</title>
<script
	src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
</head>
<style>
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
      textarea{
    resize: none;
    }
</style>
<body>

    <div id="container">
        <div class="main">
         <form id="custoDetail" action="" method="post">
          
                <h3>고객 상세조회</h3>
        <table class="main2">
       <c:forEach items="${custoDetail}" var="cusD">
            <tr>
                <td>폴더명</td>
             <td><input type="text" value="${cusD.inFolder}" readonly></td>
    	        
	    	</tr>
               <tr> 
                    <td>회사명</td>
                    <td><input type="text" value="${cusD.comNm }" readonly></td>
                </tr>
                <tr>
                    <td>사업자번호</td>
                    <td><input type="text" value="${cusD.comNo }" readonly></td>
                </tr>
                <tr>
                    <td>대표번호</td>
                    <td><input type="text" value="${cusD.comTel }" readonly></td>
                </tr>
                <tr>
                    <td>대표명</td>
                    <td><input type="text" value="${cusD.comCeo }" readonly></td>
                </tr>
                <tr>
                    <td>담당자</td>
                    <td><input type="text" value="${cusD.comPix }" readonly></td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" value="${cusD.comPhone }" readonly></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" value="${cusD.comEmail }" readonly></td>
                <tr>
                    <td>기타</td>
                    <td><textarea name="comMemo" class="inputlo" rows="5"  maxlength="50" readonly>"${cusD.comMemo }"</textarea></td>
                </tr>
                <input type="hidden" id="cusNo" name="cusNo" value="${cusD.cusNo }">  
                <input type="hidden" name="empNo" value="${cusD.empNo }"> 
                  </c:forEach>  
                    
                   
            <!--나중에 모달창에서 바꾸기-->
                
            </table>
            
                <div id="buttonLine">
					<button type="button" onclick="choice(1)">수정</button>
					<button type="button" onclick="location.href='custoAdd.do'">취소</button>
					<button type="button" onclick="choice(2)">삭제</button>
				</div>
                </form>
          
        </div>
    </div>
	<script>
		function choice(num) {
			var custoDetail = $("#custoDetail");
			if (num === 1) {
				custoDetail.prop("action", "selectupDetailCusto.do");
				custoDetail.submit();
			} 
			if (num === 2) {
				var cusNo = $("#cusNo").val();
				$.ajax({
					type : "POST",
					url : "deleteCusAdd.do",
					data : {cusNo:cusNo},
					success : function(data) {
						console.log("삭제 결과는?: " + data);
						no = data;
						if (no === '1') {
							/*
							모달창으로 바꾸고 나서 적용해보기
							let title = '고객 주소록 삭제';
							let content='고객 주소록 삭제에 성공했습니다';
							myAlert(title,content);
							*/
							alert("삭제가 성공했습니다");
							location.href="custoAdd.do";
							
						} else {
							alert("삭제를 실패했습니다");
							location.href="custoAdd.do";
						}
					}
				})
			}
		};
	</script>
</body>
</html>