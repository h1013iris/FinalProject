<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-일정 추가하기</title>
</head>
	<style>
		/*임의*/
		.main_section>div, form>div{
			border: 1px solid black;
		}

		/*radio 마진*/
		.margin-right2{
			margin-right: 2%;
		}
		.margin-right3{
			margin-right: 3%;
		}
		/*form 속 textarea*/
		#memo{
			resize: none;
		}
		/*미리보기 큰 div*/
		.preview{
			border: 1px solid black;
			margin-bottom: 1%;
			margin-top: 0.5%;
		}
		/*form 속 소제목 한 줄*/
		.iput{
			display: flex;
			margin-top: 2%;
			width: 100%;
		}
		/*input 태그 섹션*/
		.inputSection{
			display: flex;

		}
		/*form 속 모두 감싼 div*/
		.enrollform-in-Section{
			width: 100%;
		    display: flex;
		}
		/*메인섹션 안에 폼을 감싼 섹션*/
		.cal-Enrollform{
			justify-content: center;
			width: 83vw;
			height: 100%;
		}
		/*추가하는 부분*/
		.cal-left{
		    width: 70%;
		}
		/*일정 추가하기 글자*/
		.calender-sectionTitle{
			font-weight: bold;
			font-size: 26px;
			margin-bottom: 2%;
		}
		/*form 속 소제목*/
		.inputTitle1, .inputTitle2{
			font-weight: bold;
			font-size: 20px;
			margin-right: 3%;
		}
		.inputTitle2{
			margin-right: 6%;
		}
	</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="cal-Enrollform">
			<form id="enrollForm-Schedule" action="insertCalender.do" method="post" enctype="multipart/form-data">
				<div class="enrollform-in-Section">
					<div class="cal-left">
						<div class="calender-sectionTitle">일정 추가하기</div>
						<div>
							<div class="iput">
								<div class="inputTitle1">일정 제목</div>
								<div class="inputSection">
									<input type="text" class="textline" name="title" placeholder="일정 제목을 입력해주세요.">
								</div>
							</div>
						</div>
						<div>
							<div class="iput">
								<div class="inputTitle2">일시</div>
								<div class="inputSection">
									<input type="date" class="margin-right2" name="startdate">
									<select class="margin-right2">
										<option value="time">시간</option>
									</select> 
									<div style="margin-right: 2%;">~</div>
									<input type="date" class="margin-right2" name="enddate">
									<select class="margin-right2">
										<option value="time">시간</option>
									</select> 
								</div>
							</div>
						</div>
						<div>
							<div class="iput">
								<div class="inputTitle2">구분</div>
								<div class="inputSection">
									<label class="margin-right3" for="work"><input type="radio" value="work" name="section-option" id="work">근무</label>
									<label class="margin-right3" for="working-outside"><input type="radio" value="working-outside" name="section-option" id="working-outside">외근</label>
									<label class="margin-right3" for="meeting"><input type="radio" value="meeting" name="section-option" id="meeting">회의</label>
									<label class="margin-right3" for="leave"><input type="radio" value="leave" name="section-option" id="leave">휴가</label>
									<label class="margin-right3" for="etc"><input type="radio" value="etc" name="section-option" id="etc">기타</label>
								</div>
							</div>
						</div>
						<div>
							<div class="iput">
								<div class="inputTitle1">공개 여부</div>
								<div class="inputSection">
									<label class="margin-right3" for="team"><input type="radio" value="team" name="open-option" id="team">팀 공개</label>
									<label class="margin-right3" for="personal"><input type="radio" value="personal" name="open-option" id="personal">개인 공개</label>
									<label class="margin-right3" for="whole"><input type="radio" value="whole" name="open-option" id="whole">전체 공개</label>
								</div>
							</div>
						</div>
						<div>
							<div class="iput">
								<div class="inputTitle2">메모</div>
								<div class="inputSection">
									<textarea name="memo" id="memo" cols="30" rows="10" placeholder="내용을 입력해 주세요."></textarea>
								</div>
							</div>
						</div>
						<div>
							<div class="iput">
								<div class="inputTitle2">알림</div>
								<div class="inputSection">
									
								</div>
							</div>
						</div>
						<div>
							<div class="iput">
								<div class="inputTitle2">장소</div>
								<div class="inputSection">
									<input type="text" class="textline" name="place" placeholder="장소를 입력해 주세요.">
								</div>
							</div>
						</div>
						<div>
							<div class="iput">
								<div class="inputTitle2">범주</div>
								<div class="inputSection">

								</div>
							</div>
						</div>
					</div>
					<div class="preview_And_Button">
						<div id="previewTitle">미리보기</div>
						<div class="preview">
							<div class="colorPreview">
								미리보기
							</div>
						</div>
						<div class="buttonLine">
							<button type="button" class="submitButton">일정추가하기</button>
							<button type="button" onclick="history.back()">취소하기</button>
						</div>
					</div>
				</div>
			</form>
        </div>
    </div> 
</body>
</html>