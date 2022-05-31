<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
]<style>
.main_section{
    width: 83vw;
}
#contentArea {
  margin-left :15%;
}
#contentArea *{
margin:5px


}
#contentArea{
width:80%;

}
#detailcontent{
    border: 1px solid #85cdff;
    margin-left :17%;
    width:60%;
    height:60%;
}
.mainDivEnroll{
		width: 83vw;
	}
	.commonButton1{
     padding: 0;
     font-weight: 600;
     text-align: center;
     line-height: 50px;
     color: #FFF;
     border-radius: 5px;
     transition: all 0.2s ;
     background: #85cdff;
     border: #85cdff;
     box-shadow: 0px 5px 0px 0px #4c87b099;
 }
.commonButton1:hover{
    position: relative;
    top: 5px;
    bottom: 5px;
    box-shadow: 0px 0px 0px 0px #4c87b099;
}
#replyArea{
width : 100%;
 border-spacing: 2px;
 border-collapse: separate;
 margin-left : 17%;
}

#concontents{
 margin-left : 17%;
}
</style>

<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
    <table id="contentArea" align="center" class="table">
        <tr>
            <th width="100">제목</th>
            <td colspan="3" style="height: 50px;">${ b.title }</td>
        </tr>
        <tr>
            <th style="height: 50px;">작성자</th>
            <td>${ b.writer }</td>
            <th style="height: 50px;">작성일</th>
            <td>${ b.createDate }</td>
        </tr>
       
        <tr>
            <th style="height: 50px;">내용</th>
            <td colspan="3" ></td>
        </tr>
     
    </table>
    <div id="detailcontent">
        <p style="height:150px">${ b.content }</p>

    </div>
    <c:if test="${ loginUser.empNo eq b.empno }">
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	            
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="bno" value="${ b.writeno }">
					 
				</form>
				<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateFormBoard.do");
						}else{
							postForm.attr("action", "deleteBoard.do");
						}
						postForm.submit();
					}
				</script>
				<br><br>
            </c:if>
             
                <div id = concontents>
                    	<c:if test="${ !empty loginUser }">
	                        
	                         <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:70%; vertical-align: middle"></textarea>
	                        
	                        <button class="commonButton1">등록하기</button>
                        </c:if>
                        <c:if test="${ empty loginUser }">
                        	
	                            <textarea class="form-control" readonly rows="2" style="resize:none; width:70%">로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
	                      
	                       <button class="commonButton1" disabled>등록하기</button>
                        </c:if>
                    </div>    
                    
                    <table id="replyArea" class="table" align="center" >
                <thead>
                    <tr>
                       <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                    </tr>
                </thead>
                <tbody>
                
                </tbody>
            </table>
        </div>
        <br><br>
    </div>
</div>
</body>
</html>