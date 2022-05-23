<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별 공지사항 작성하기</title>
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
		border: 1px solid black;
	}
	#enrollFormAnnoDepart{
		height: 90vh;
	}
	.buttonSection{
		height: 70px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">	
		<div class="middleEnrollForm">
			
			<form id="enrollFormAnnoDepart" action="insertAnnoDepart.do" method="post" enctype="multipart/form-data">
				<div class="annoDepartEnrollHeader">
					<h2>공지사항 작성하기</h2>
				</div>
				<!-- 제목 부분 -->
				<div class="enrollTitleSection">
					<div class="mainStyleCh"><span class="titleNamePart mainStyleCh">제목</span></div>
					<input type ="text" name="annoTitle" id="title" class="inputTitlePart" palaceholder="제목을 입력해주세요" required>
				</div>
				<!-- 작성자 부분 session에서 값 받아오기 ${loginUser.empName} -->
				<div class="enrollWriterSection">
					<div class="mainStyleCh"><span class="writerPart">작성자</span></div>
					<input type="text" id = "writer" name="writerName" value="1" readonly>
				</div>
				<!-- 내용 부분 -->
				<div class="enrollContentSection">
					<div class="contentPart mainStyleCh"><span class="contentEn">내용</span></div>
					<textarea name="annoContent" rows="15" cols="90" style="resize:none;" id="content" required></textarea>
				</div>
				<!-- 첨부파일 부분 -->
				<div class="enrollUpfileSection">
					<div class="mainStyleCh"><span class="enrollUpfileSection">첨부파일</span></div>
					<input type="file" id ="upfile" name="uploadFile">
				</div>
				<div class="enrollReplyStatusSection">
					<div class="mainStyleCh"><span class="enrollStatusSection">댓글</span></div>
					<div class="radioDiv">
						<input type="radio" id="used" value="사용" name="replyStatus" checked>사용
						<input type="radio" id="notused" value="미사용" name="replyStatus">미사용
					</div>
				</div>
				<div align="right" class="buttonSection">
					<button type="submit" class="commonButton1">등록하기</button>
					<button type="reset" class="commonButton1">취소하기</button>
				</div>
			</form>
		</div>
    </div>
</body>
</html>