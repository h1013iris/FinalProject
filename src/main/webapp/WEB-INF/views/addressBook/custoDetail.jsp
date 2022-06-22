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
      #buttonLine{
        margin-top: 20px;
        margin-bottom: 20px;
    }
  
     textarea{
    resize: none;
    margin-top: 5px;
   
    }
    .inputBox{
    width: 180px;
    }
        .Title{
    text-align: left;
    vertical-align: top;
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
.Tfont{
font-size: 20px;
font-weight: bold;
margin-bottom: 20px;

}
</style>
<body>
     	<jsp:include page="../common/header.jsp"></jsp:include>
     <div class="main_section">
 <div id="container">
        <div class="main">
         <form id="custoDetail" action="" method="post">
          
                <p class="Tfont">고객 상세조회</h3>
        <table class="main2">
       <c:forEach items="${custoDetail}" var="cusD">
            <tr>
                <td class="Title">폴더명</td>
             	<td><input type="text" name="inFolder" value="${cusD.inFolder}" class="inputBox" readonly></td>
    	        
	    		</tr>
               	<tr> 
                    <td class="Title">회사명</td>
                    <td><input type="text"  name="comNm" value="${cusD.comNm }" class="inputBox" readonly></td>
                </tr>
                <tr>
                    <td class="Title">사업자번호</td>
                    <td><input type="text" name="comNo" value="${cusD.comNo }" class="inputBox" readonly></td>
                </tr>
                <tr>
                    <td class="Title">대표번호</td>
                    <td><input type="text" name="comTel" value="${cusD.comTel }" class="inputBox" readonly></td>
                </tr>
                <tr>
                    <td class="Title">대표명</td>
                    <td><input type="text" name="comCeo" value="${cusD.comCeo }" class="inputBox" readonly></td>
                </tr>
                <tr>
                    <td class="Title">담당자</td>
                    <td><input type="text" name="comPix" value="${cusD.comPix }" class="inputBox" readonly></td>
                </tr>
                <tr>
                    <td class="Title">휴대폰</td>
                    <td><input type="text" name="comPhone" value="${cusD.comPhone }" class="inputBox" readonly></td>
                </tr>
                <tr>
                    <td class="Title">이메일</td>
                    <td><input type="email" name="comEmail" value="${cusD.comEmail }" class="inputBox" readonly></td>
                <tr>
                    <td class="Title">기타</td>
                    <td><textarea name="comMemo" rows="5"  class="inputBox" readonly>${cusD.comMemo }</textarea></td>
                </tr>
                <input type="hidden" id="cusNo" name="cusNo" value="${cusD.cusNo}">  
                <input type="hidden" name="empNo" value="${cusD.empNo}"> 
         </c:forEach>  
                    
                   
            <!--나중에 모달창에서 바꾸기-->
                
         </table>
            
                <div id="buttonLine">
					<button type="button" onclick="choice(1)" class="commonButton1_1">수정</button>
					<button type="button" onclick="location.href='custoAdd.do'" class="commonButton1_1">취소</button>
					<button type="button" onclick="choice(2)" class="commonButton1_1">삭제</button>
				</div>
             </form>
        </div>
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
						
						no = data;
						if (no ==='1') {
						
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
		
		 $(function() {
				$(".page_title>.title_name").text("고객 주소록");
			})
	</script>
</body>
</html>