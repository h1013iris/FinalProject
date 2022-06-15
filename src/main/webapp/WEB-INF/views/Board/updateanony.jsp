<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>

<style type="text/css">
.annoDepartEnrollHeader {
	margin-bottom: 30px;
	font-size: 30px;
	font-weight: 600;
}

.middleEnrollForm {
	display: flex;
	justify-content: center;
}

.enrollReplyStatusSection {
	display: flex;
}

.mainStyleCh {
	font-size: 20px;
	font-weight: 550;
	width: 100px;
}

.enrollContentSection, .enrollTitleSection, .enrollWriterSection,
	.enrollUpfileSection, .enrollReplyStatusSection {
	display: flex;
	margin-bottom: 20px;
}

#title, #writer {
	height: 25px;
	width: 618px;
}

.commonButton1 {
	width: 85px;
	height: 50px;
}

.main_section {	
	justify-content: center;
	align-items: center;
	width: 83vw;
}

#enrollFormAnnoDepart {
	height: 90vh;
}

.buttonSection {
	height: 70px;
}

#bo {
	margin-left: 85%;
}
</style>

</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="main_section">
		<div class="middleEnrollForm">

			<form id="enrollFormAnnoDepart" action="updateboard.do" method="post" enctype="multipart/form-data">
				<div class="annoDepartEnrollHeader">
				 <input type="hidden" name="writeno" value="${ b.writeno }">
				 <input type="hidden" name="boardno" value="${ b.boardno }">
				 <input type="hidden" name="cf" value="4">
				 
					<h2>글 수정</h2>
				</div>

				

				<!-- 제목 부분 -->
				<div class="enrollTitleSection">
					<div class="mainStyleCh">
						<span class="titleNamePart mainStyleCh">제목</span>
					</div>
					<input type="text" name="title" id="title" class="inputTitlePart"
						value = "${ b.title}" required>
				</div>
				<!-- 작성자 부분 session에서 값 받아오기 ${loginUser.empName} -->
				<div class="enrollWriterSection">
					<div class="mainStyleCh">
						<span class="writerPart">작성자</span>
					</div>
					<input type="text" id="writer" name="writerName" value="${b.nickname}" > 					

				</div>
				<!-- 내용 부분 -->
				<div class="enrollContentSection">
					<div id="description" class="contentPart mainStyleCh">
						<span class="contentEn">내용</span>
					</div>
					<textarea name="content" id="content" required>${b.content}</textarea>
				</div>
				<div align="right" class="buttonSection">
					<button type="submit" class="commonButton1">등록하기</button>
					<button type="reset" class="commonButton1">취소하기</button>
				</div>
			</form>
		</div>
	</div>

	<script>
CKEDITOR.replace('content');


</script>
</body>
</html>