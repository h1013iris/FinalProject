<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별 공지사항 작성하기</title>
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
	.annoDepartButton{
		width: 85px;
		height: 50px;
	}
	.buttonSection{
		height: 70px;
	}
	.mainDivEnroll{
		margin: 0 auto;
		padding: 150px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">	
		<div class="mainDivEnroll">
			<div class="middleEnrollForm">
				<form id="enrollFormAnnoDepart" action="insertAnnoDepart.do" method="post" enctype="multipart/form-data">
					<!-- 제목 부분 -->
					<div class="enrollTitleSection">
						<div class="mainStyleCh"><b style="color: rgb(255, 0, 0);">*</b><span class="titleNamePart mainStyleCh" >제목</span></div>
						<input type ="text" name="annoTitle" id="title" class="inputTitlePart" placeholder="제목을 입력해주세요" required maxlength="60">
					</div>
					<!-- 작성자 부분 session에서 값 받아오기 ${loginUser.empName} -->
					<div class="enrollWriterSection">
						<div class="mainStyleCh"><b style="color: rgb(255, 0, 0);">*</b><span class="writerPart">작성자</span></div>
						<input type="text" id = "writer" name="writerName" value="${loginUser.empName}" readonly>
						<input type="hidden" name="annoWR" value="${loginUser.empNo}"> 
						<input type="hidden" name="refDepart" value="${loginUser.departmentNo}">
					</div>
					<!-- 내용 부분 -->
					<div class="enrollContentSection">
						<div class="contentPart mainStyleCh"><b style="color: rgb(255, 0, 0);">*</b><span class="contentEn">내용</span></div>
						<textarea name="annoContent" rows="15" cols="90" style="resize:none;" id="content" required></textarea>
					</div>
					<!-- 첨부파일 부분 -->
					<div class="enrollUpfileSection">
						<div class="mainStyleCh"><span class="enrollUpfileSection">첨부파일</span></div>
						<input type="file" id ="upfile" name="uploadFile">
					</div>
					<div class="enrollReplyStatusSection">
						<div class="mainStyleCh"><b style="color: rgb(255, 0, 0);">*</b><span class="enrollStatusSection">댓글</span></div>
						<div class="radioDiv">
							<input type="radio" id="used" value="Y" name="accessReply" checked>사용
							<input type="radio" id="notused" value="N" name="accessReply">미사용
						</div>
					</div>
					<div align="right" class="buttonSection">
						<button type="submit" class="commonButton1 annoDepartButton">등록하기</button>
						<button type="button" class="commonButton1 cancelEnrollAnnoDepart annoDepartButton">취소하기</button>
					</div>
				</form>
			</div>
		</div>
    </div>
    <script type="text/javascript">
    	//페이지 이름 
    	$(function(){
        	 $(".page_title>.title_name").text("공지사항 작성 페이지");
     	})
    	//
    	$(".cancelEnrollAnnoDepart").click(function(){
    		$("#confirm_title .title_name").text("공지사항 확인");
    		$("#confirm_body .confirm_content").text("등록을 취소하시겠습니까?");
    		$("#helpmeCOnfirm").css("display","block");
    		// 확인 버튼 클릭 시 모달 사라지고
    		$(document).on("click", ".true_btn", function() {
     			
    			$("#helpmeCOnfirm").css("display","none");
    			
    			location.href="departmentPage.do?userNo="+${loginUser.empNo}+"&departmentNo="+${loginUser.departmentNo}; //이전 페이지로 이동
    			// document.referrer : 마지막 페이지의 url을 가져오면 이전 정보는 가져올 수 없음
     		})
			
    	})
    	
    	$("button[name='confirmBtn']").click(function(){
    		console.log($(this).val())
    		if($(this).val()=="true"){
    			location.href="departmentPage.do";
    			$("#helpmeCOnfirm").css("display","none");
    		}else{
    			$("#helpmeCOnfirm").hide();
    		}
    	})
    </script>
</body>
</html>