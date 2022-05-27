<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>

<style type="text/css">
	.annoDepartEnrollHeader{
		margin-bottom:30px;
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
		width: 100px;
	}
	.enrollContentSection, .enrollTitleSection, .enrollWriterSection, .enrollUpfileSection, .enrollReplyStatusSection{
		display: flex;
		margin-bottom: 20px;
	}
	#title, #writer{
		height: 25px;
		width: 618px;
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
	.main_section{
		text-align:center;
		justify-content: center;
	    align-items: center;
	    width : 83vw;

	   
	}
	#enrollFormAnnoDepart{
		height: 90vh;
	}
	.buttonSection{
		height: 70px;
	}
	#bo{
	margin-left : 85%;
	}
</style>

</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="main_section">	
		<div class="middleEnrollForm">
			
			<form id="enrollFormAnnoDepart" action="insertenroll.do" method="post" enctype="multipart/form-data">
				<div class="annoDepartEnrollHeader">
					<h2>글 작성</h2>
				</div>
						
				<select name="bo" id="bo">
					<option value="noti"<c:if test="${bo==noti}"> </c:if>>공지사항</option>
					<option value="free"<c:if test="${bo==free}"> </c:if>>자유게시판</option>				
				</select>
								
				<!-- 제목 부분 -->
				<div class="enrollTitleSection">
					<div class="mainStyleCh"><span class="titleNamePart mainStyleCh">제목</span></div>
					<input type ="text" name="annoTitle" id="title" class="inputTitlePart" palaceholder="제목을 입력해주세요" required>
				</div>
				<!-- 작성자 부분 session에서 값 받아오기 ${loginUser.empName} -->
				<div class="enrollWriterSection">
					<div class="mainStyleCh"><span class="writerPart">작성자</span></div>
					<input type="text" id = "writer" name="writerName"  readonly>
				</div>
				<!-- 내용 부분 -->
				<div class="enrollContentSection">
					<div id = "description" class="contentPart mainStyleCh"><span class="contentEn">내용</span></div>
					<textarea name="content"  id="content" required></textarea>
				</div>			
				<div align="right" class="buttonSection">
					<button type="submit" class="commonButton1">등록하기</button>
					<button type="reset" class="commonButton1">취소하기</button>
					<button type="submit" class="commonButton1">임시보관함</button>
					<button type="submit" class="commonButton1">보관함에저장</button>
				</div>
			</form>
		</div>
    </div>
    
<script>
CKEDITOR.replace('content');
</script>
</body>
</html>