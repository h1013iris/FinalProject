<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-일정 추가하기</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/calender/calenderEnroll.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="cal-Enrollform">
			<form  name="enrollFormSchedule" id="enrollForm-Schedule" action="insertCalender.do" method="post" enctype="multipart/form-data">
				<div class="enrollform-in-Section">
					<div class="cal-left">
						<div class="calender-sectionTitle">일정 추가하기</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle1">일정 제목</div>
								<div class="inputSection">
									<input type="text" class="textline" name="title" placeholder="일정 제목을 입력해주세요.">
								</div>
							</div>
						</div>
						<div class="datesection">
							<div class="iput">
								<div class="inputTitle2">일시</div>
								<div class="inputSection">
									<input type="date" class="margin-right2 startday" id="startdate" name="startDate">
									<input type="time" class="margin-right2 startTime" id="startTime" name="startTime">
									<div class="gg">~</div>
									<input type="date" class="margin-right2 endday" id="enddate" name="endDate">
									<input type="time" class="margin-right2 endTime" id="endTime" name="endTime">
								</div>
							</div>
						</div>
						<div class="big-section allday">
							<label for="oneday" id="onday"><input type="checkbox" name="oneday" value="24" onclick="allday()"> 하루종일</label>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2">구분</div>
								<div class="inputSection">
									<label class="margin-right3" for="work"><input type="radio" value="1" name="sectionOption" id="work" checked> 근무</label>
									<label class="margin-right3" for="working-outside"><input type="radio" value="2" name="sectionOption" id="working-outside"> 외근</label>
									<label class="margin-right3" for="meeting"><input type="radio" value="3" name="sectionOption" id="meeting"> 회의</label>
									<label class="margin-right3" for="leave"><input type="radio" value="4" name="sectionOption" id="leave"> 휴가</label>
									<label class="margin-right3" for="etc"><input type="radio" value="5" name="sectionOption" id="etc"> 기타</label>
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle1">공개 여부</div>
								<div class="inputSection">
									<label class="margin-right3" for="personal"><input type="radio" value="개인공개" name="openOption" id="personal" checked> 개인 공개</label>
									<label class="margin-right3" for="team"><input type="radio" value="팀공개" name="openOption" id="team"> 팀 공개</label>
										<label class="margin-right3" for="whole">
										<c:if test="${loginUser.jobNo eq '7' or loginUser.jobNo eq '8'}">
											<input type="radio" value="전체공개" name="openOption" id="whole"> 전체 공개
										</c:if>
										</label>
								</div>
							</div>
						</div>
						<div class="memo-section">
							<div class="iput">
								<div class="inputTitle2">메모</div>
								<div class="memoSection">
									<textarea name="memo" id="memo" placeholder="내용을 입력해 주세요."></textarea>
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2">알림</div>
								<div class="inputSection">
									<select name="alarm">
										<option value="0">안함</option>
										<option value="10">10분전</option>
										<option value="15">15분전</option>
										<option value="30">30분전</option>
									</select>
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2">장소</div>
								<div class="inputSection">
									<input type="text" class="textline" name="place" placeholder="장소를 입력해 주세요.">
								</div>
							</div>
						</div>
						<div class="big-section">
							<div class="iput">
								<div class="inputTitle2 colorinfo">범주</div>
								<div class="colorsection">
									<div class="selectcolor-div">
										<input type="hidden" name="selectColor" value="1">
										<div class="selectColor ffb5c1"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="colorlist">
							<div class="colorlist-one">
								<div class="ffb5c1"></div>
								<div class="dfccff"></div>
								<div class="ffb9a4"></div>
								<div class="ffb9"></div>
								<div class="FFFEC4"></div>
								<div class="FF8D82"></div>
								<div class="a0d8ff"></div>
							</div>
							<div class="colorlist-two">
								<div class="ff8781"></div>
								<div class="c7c4ff"></div>
								<div class="f18372"></div>
								<div class="a6ff4d"></div>
								<div class="fff462"></div>
								<div class="fd731c"></div>
								<div class="ffff"></div>
							</div>
						</div>
					</div>
					<div class="preview_And_Button">
						<div style="height: 100%;">
							<div id="previewTitle">미리보기</div>
							<div class="preview">
								<div class="colorPreview ffb5c1">
									미리보기
								</div>
							</div>
							<div class="buttonLine">
								<button type="button" class="commonButton1 insert-calender" style="width: 90px;">일정추가하기</button>
								<button type="button" class="commonButton1 back-calender" style="width: 90px;" onclick="location.href='calendar.do'">취소하기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
        </div>
    </div> 
    <script src="${ pageContext.servletContext.contextPath }/resources/js/calender/calenderEnroll.js"></script>
</body>
</html>