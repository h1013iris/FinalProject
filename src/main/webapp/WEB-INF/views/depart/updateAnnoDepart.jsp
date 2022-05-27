<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별 페이지 공지사항 수정하기</title>
<style type="text/css">
	.annoDepartEnrollHeader{
		margin-bottom:50px;
		font-size: 30px;
		font-weight: 600;
	}
	.middleEnrollForm{
		display: flex;
		justify-content: center;
	}
	.enrollReplyStatusSection{
		display: flex;
	}
	.mainStyleCh{
		font-size: 20px;
		font-weight: 550;
		width: 15%;
	}
	.enrollContentSection, .enrollTitleSection, .enrollWriterSection, .enrollUpfileSection, .enrollReplyStatusSection{
		display: flex;
		margin-bottom: 20px;
	}
	#title, #writer{
		height: 25px;
		width: 90%;
	}
	.radioDiv{
		text-align:center;
		justify-content: center;
	    align-items: center;
	    font-size:20px;
	}
	.commonButton1{
		width: 85px;
		height: 50px;
	}
	.buttonSection{
		height: 70px;
	}
	.mainDivEnroll{
		width: 83vw;
	}
	.alreayAttachment{
		width: 55%;
		margin-top: 5px;
		margin-left: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">	
		<div class="mainDivEnroll">
			<div class="middleEnrollForm">
				
				<form id="enrollFormAnnoDepart" action="updateAnnoDepart.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="annoNo" value="${d.annoNo}">
					<c:if test="${!empty a.fileNo }">
					<input type="hidden" name="fileNo" value="${a.fileNo}">
					</c:if>
					<div class="annoDepartEnrollHeader">
						<h2>공지사항 수정</h2>
					</div>
					<!-- 제목 부분 -->
					<div class="enrollTitleSection">
						<div class="mainStyleCh"><span class="titleNamePart mainStyleCh">제목</span></div>
						<input type ="text" name="annoTitle" id="title" class="inputTitlePart" value="${d.annoTitle}" required>
					</div>
					<!-- 작성자 부분 session에서 값 받아오기 ${loginUser.empName} -->
					<div class="enrollWriterSection">
						<div class="mainStyleCh"><span class="writerPart">작성자</span></div>
						<input type="text" id = "writer" name="writerName" value="${loginUser.empName}" readonly>
					</div>
					<!-- 내용 부분 -->
					<div class="enrollContentSection">
						<div class="contentPart mainStyleCh"><span class="contentEn">내용</span></div>
						<textarea name="annoContent" rows="15" cols="90" style="resize:none;" id="content" required>${d.annoContent}</textarea>
					</div>
					<!-- 첨부파일 부분 -->
					<div class="enrollUpfileSection">
						<div class="mainStyleCh"><span class="enrollUpfileSection">첨부파일</span></div>
						<input type="file" id ="upfile" name="reUploadFile">
						<c:if test="${ !empty a.originName }">
							<span class="alreayAttachment"> 현재 업로드된 파일 : ${ a.originName }</span>
							<input type="hidden" name="changeName" value="${a.changeName}"> 
							<input type="hidden" name="originName" value="${a.originName}">
						</c:if>
					</div>
					<div class="enrollReplyStatusSection">
						<div class="mainStyleCh"><span class="enrollStatusSection">댓글</span></div>
						<div class="radioDiv">
							<input type="radio" id="used" value="Y" name="accessReply" <c:if test="${d.accessReply eq 'Y'}">checked</c:if>>사용
							<input type="radio" id="notused" value="N" name="accessReply" <c:if test="${d.accessReply eq 'N'}">checked</c:if>>미사용
						</div>
					</div>
					<div align="right" class="buttonSection">
						<button type="submit" class="commonButton1">수정하기</button>
						<button type="button" class="commonButton1 cancelEnrollAnnoDepart">이전으로</button>
					</div>
				</form>
			</div>
		</div>
    </div>
    <script type="text/javascript">
    	$(".cancelEnrollAnnoDepart").click(function(){
    		$("#confirm_title .title_name").text("공지사항 수정 취소");
    		$("#confirm_body .confirm_content").text("수정을 취소하시겠습니까?");
    		$("#helpmeCOnfirm").css("display","block");
    	})
    	
    	$("button[name='confirmBtn']").click(function(){
    		console.log($(this).val())
    		if($(this).val()=="true"){
    			history.go(-1);
    			$("#helpmeCOnfirm").css("display","none");
    		}else{
    			$("#helpmeCOnfirm").hide();
    		}
    	})
    </script>
</body>
</html>