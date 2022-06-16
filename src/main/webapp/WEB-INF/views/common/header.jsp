<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
<script src="https://kit.fontawesome.com/e25af1a6a2.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../depart/annoDepartList.jsp"/>
	<jsp:include page="../approval/docEnrollModal.jsp"/>
	<jsp:include page="./alert.jsp"/>
	<jsp:include page="./confirm.jsp"/>
	<jsp:include page="../depart/simpleProjectCreate.jsp"/>
	<jsp:include page="../reservation/resAlert.jsp"/>
	<jsp:include page="../manage/calculateModal.jsp"/>
	<jsp:include page="../reservation/reservationEorollformModal.jsp"/>
	<jsp:include page="../mypage/workRequestModal.jsp"/>
	<jsp:include page="../mypage/empSearchModal.jsp"/>
	
	<header id="main_header">
	    <div class="logo_header">
	        <div class="left">
	            <div id="logo">
	                <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="로고이미지">
	            </div>
	            <div class="favorites">
	                <select name="favorite" id="favorites_select"></select>
	                <button type="submit">이동</button>
	            </div>
	        </div>
	        
	        <span style="border: 1px solid black">${ loginUser.userId } ${ loginUser.empName }</span>
	        
	        <div class="page_title">
	            <p class="title_name">페이지 이름</p>
	        </div>
	        <div class="right">
	            <div class="alarm">
	                <img class="alarm_img" src="${ pageContext.servletContext.contextPath }/resources/images/alarm.png"/>
	                <div class="count">1</div>
	            </div>
	            <div class="pro_img">
	            	<c:if test="${loginUser.changeName ne null}">
	                <img class="alarm_img" src="${ pageContext.servletContext.contextPath }/resources/upload_files/${loginUser.changeName}"/>
	                </c:if>
	                <c:if test="${loginUser.changeName == null}">
	                <img class="alarm_img" src="${ pageContext.servletContext.contextPath }/resources/images/관리자 프로필.png"/>
	                </c:if>
	            </div>
	        </div>
	    </div>
	</header>
	<div id="login_status" class="login_status">
	    <div class="status_swap">
	        <p>상태변경</p>
	        <div class="status_list">
	            <ul>
	                <li><p class="status">근무중</p></li>
	                <li><p class="status">외근중</p></li>
	                <li><p class="status">회의중</p></li>
	                <li><p class="status">자리 비움</p></li>
	            </ul>
	        </div>
	    </div>
	    <div>
	        <p><a href="logout.do">로그아웃</p>
	    </div>
	</div>
	<aside id="main_nav">
	    <ul>
	        <li>
	            <a class="mypage" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/개인페이지.png" alt=""></a>
	            <div class="detail_nav_content">
					<div class="nananan"><p class="detail_title">마이페이지</p></div>
					<button id="journal_btn" class="commonButton2 etcButton" type="button">업무일지작성</button>
					<button id="work_request_btn" class="commonButton2 etcButton" type="button">업무요청</button>
	                <ul> 
	                    <li class="list_title">업무 관리</li>
	                    <div class="hhh">
		                    <li><a href="journalList">업무일지 관리</a></li>
		                    <li><a href="workreceivedPage">받은 업무</a></li>
		                    <li><a href="requestWorkList">보낸 업무</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">ToDo</li>
	                    <div class="hhh">
	                    	<li><a href="ToDoListPage">List</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">전자명함</li>
	                    <div class="hhh">
	                    	<li><a href="myBusinessCard">전자명함</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">즐겨찾기</li>
	                    <div class="hhh">
	                    	<li><a href="#">즐겨찾기 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">일반</li>
	                    <div class="hhh">
		                    <li><a href="#">내 근태 보기</a></li>
		                    <li><a href="#">내 정보 변경</a></li>
	                    </div>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="approval" href="approvalMain.do"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/결재.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">전자결재</p></div>
	                <button type="button" class="commonButton2 etcButton docEnrollButton"><span>문서 작성</span></button>
	                <ul> 
	                    <li class="list_title"><a href="waitingMain.do">결재 대기함</a></li>
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="requestMain.do">결재 요청함</a></li>
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="outboxMain.do">임시 보관함</a></li>
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="returnMain.do">반려 문서함</a></li>
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="statusMain.do">진행 상태 확인함</a></li>
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="completeMain.do">결재 완료 문서함</a></li>
	                </ul>
	            </div>
	        </li>
	        <li>
            <a class="calender" href="calendar.do?empNo=${ loginUser.empNo }&departmentNo=${ loginUser.departmentNo }"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/캘린더.png" alt=""></a>
            <div class="detail_nav_content">
                <div class="nananan"><p class="detail_title">캘린더</p></div>
                <button type="button" class="commonButton2 etcButton calenderButton"><span>일정 추가하기</span></button>
	                <ul> 
	                    <li class="list_title">내 캘린더</li>
	                    <div class="hhh">
	                    	<li><label for="my"><input type="checkbox" name="my" id="my" checked>내 할 일</label></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">부서 캘린더</li>
	                    <div class="hhh">
		                    <li><label for="team"><input type="checkbox" name="team" id="team" checked>${ loginUser.departmentName }</label></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">공유 캘린더</li>
	                    <div class="hhh">
		                    <li><input type="checkbox" name="" id="" checked>000팀장</li>
		                    <li><input type="checkbox" name="" id="" checked>ㅁㅁㅁ사원</li>
		                    <li><input type="checkbox" name="" id="" checked>ㅇㅇㅇ주임</li>
	                    </div>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="reservation" href="roomReservation.do"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/회의실 예약.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">회의실 예약</p></div>
	                <button type="button" class="commonButton2 etcButton ReservationRoombtn"><span>예약하기</span></button>
	                <ul> 
	                    <li class="list_title"><a href="#">회의실 예약 현황</a></li>
	                    <div class="hhh reservationRoom-biglist">
	                    </div>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="departmentpage" href="departmentPage.do?departmentNo=${loginUser.departmentNo}&userNo=${loginUser.empNo}"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/부서페이지.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">부서별 페이지</p></div>
	                <button type="button" class="commonButton2 etcButton annoDepartEnrollButton"><span>공지사항 등록</span></button>
	                <ul> 
	                    <li class="list_title">공지사항</li>
	                    <div class="hhh">
	                      <li><a href="#" class="annoDepart">공지사항</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">프로젝트</li>
	                    <div class="hhh">
		                    <li ><a href="#" class="simplepjMo">간편 프로젝트 생성</a></li>
		                    <li><a href="gotoProjectPage.do">프로젝트 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">전자명함</li>
	                    <div class="hhh">
	                    	<li><a href="#">전자명함 모음</a></li>
	                    </div>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="board" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/게시판.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">게시판</p></div>
	                <a href="enroll.do"><button type="button" class="commonButton2 etcButton" ><span>글 작성</span></button></a>
                <ul> 
                    <li class="list_title"><a href="notice.do">공지사항 게시판</a></li> 
                </ul>
                <ul>
                    <li class="list_title"><a href="free.do">자유 게시판</a></li>         
                </ul>
                <ul>
                    <li class="list_title"><a href="anonymous.do">익명 게시판</a></li>
                </ul>
                <ul>
                    <li class="list_title"><a href="depart.do">부서 게시판</a></li>
                </ul>
                <ul>
                                     
                    <li class="list_title"><a href="pbox.do?userno=${loginUser.empNo}">임시 보관함</a></li>
                   
                </ul>
            </div>
        </li>
        <li>
	            <a class="messenger" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/메신저.png" alt=""></a>
	        </li>
	        <li>
	            <a class="address" href="addressMain.do"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/주소록.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">주소록</p></div>
	                <ul> 
	                    <li class="list_title">전체 주소록</li>
	                    <div class="hhh">
	                    	<li><a href="addressMain.do">부서별 주소록</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">개인 주소록</li>
	                    <div class="hhh">
		                    <li><a href="comAdd.do">거래처 주소록</a></li>
		                    <li><a href="custoAdd.do">고객 주소록</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="boxAdd.do">임시보관함</a></li>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="operationpage" href="manangeMain.do?departmentNo=${loginUser.departmentNo}&userNo=${loginUser.empNo}"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/경영페이지.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">경영지원 페이지</p></div>
	                <button type="button" class="commonButton2 etcButton annoDepartEnrollButton"><span>공지사항 등록</span></button>
	                <ul> 
	                    <li class="list_title">공지사항</li>
	                    <div class="hhh">
	                    	<li><a href="#" class="annoDepart">공지사항</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">관리</li>
	                    <div class="hhh">
		                    <li><a href="#">근태 관리</a></li>
		                    <li><a href="#">휴가 관리</a></li>
		                    <li><a href="selectDepartInfo.do?deptNo=${loginUser.departmentNo}&deptTitle=">인사 정보</a></li>
		                    <li><a href="#">증명서 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">급여</li>
	                    <div class="hhh">
		                    <li><a href="#" class="calculate4ALl">4대 보험 계산기</a></li>
		                    <li><a href="#">급여 명세서 관리</a></li>
		                    <li><a href="#">지출 관리</a></li>
		                    <li><a href="#">외부 계약 관리</a></li>
	                    </div>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="adminpage" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/관리자페이지.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">관리자 페이지</p></div>
	                <ul> 
	                    <li class="list_title">조직 관리</li>
	                    <div class="hhh">
		                    <li><a href="empManagement">사원 관리</a></li>
		                    <li><a href="deptManagement">부서 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">게시판 관리</li>
	                    <div class="hhh">
	                    	<li><a href="boardManagement">게시판 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">회의실 관리</li>
						<div class="hhh">
	                    	<li><a href="meetingRoom">회의실 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">전재결재 관리</li>
	                    <div class="hhh">
		                    <li><a href="securityMain.do">문서 보안 관리</a></li>
		                    <li><a href="formMgtMain.do">문서 서식 관리</a></li>
	                   	</div>
	                </ul>
	                <ul>
	                    <li class="list_title">기타</li>
	                    <div class="hhh">
		                    <li><a href="banWordsPage">금지어 설정</a></li>
	                    </div>
	                </ul>
	            </div>
	        </li>
	    </ul>
	</aside>
	<script type="text/javascript">
	
	$(function(){
		$(document).on('click','reservationRoom-smallList',function(){
			cosole.log("이동")
		})		
		
		$.ajax({
			url:"selectReservationRoomList.do",  
			type:"get", 
			success:function(list){
				if(list.length != 0){

					let reservationRoomBiglist = $(".reservationRoom-biglist")
					let bul = $("<ul>").addClass("reservation-Bigul")
					reservationRoomBiglist.append(bul);
					
					console.log("값 뽑아유")
					$.each(list, function(index, val){
						
						let largeNo = val.roomLargeNo;
						let lRoom = val.lRoomName;
						let sRoom = val.sRoomName;
						let max = val.maxCount;
						

						let mli = $("<li>").addClass("reservationRoom-bigMiddel-List")
						let p = $("<p>").addClass("reservation-middle")
						let sli = $("<a>").addClass("reservationRoom-smallList")
						
						
						// 큰 ul에 대분류 넣기
						bul.append(mli)
						if(bul.find("#"+lRoom).attr('id') != lRoom){
							// id를 담고
							mli.attr("id", lRoom);
							// 대분류 룸명을 담음
							p.append(lRoom)
							mli.append(p).append(sli)
							sli.append(sRoom).append(" - ").append(max)
							
						}else{
							$("#"+lRoom).append(p).append(sli)
							sli.append(sRoom).append(" - ").append(max)
							bul.append(mli)
						}
					});
				}
			}, 
			err:function(){
				console.log("회의실 예약 리스트값 받기 실패")
			}
		})
	})

	$(function(){
	//부서별 페이지 공지사항 클릭했을 시에 
	$(document).on("click",".annoDepart",function(){
		var adno =${loginUser.departmentNo}//부서코드
		$.ajax({
			url:"annoDepartListView.do", 
			data:{adno:adno}, 
			type:"get", 
			success:function(list){
				$tableBody = $('#annoDepartArea .annoDepartListPart');
				$tableBody.html('');
				if(list.length ==0){
					var th1 = $("<th colspan='4'>").text("존재하는 공지사항이 없습니다").addClass("noannoDepart");
					var tt = $("<tr>").append(th1);
					$tableBody.append(tt);
				}else if(list.length != 0){
					$.each(list, function(i, obj){
						var $tr = $('<tr>').addClass("annoDepart_detail");
						var $dTitle = $('<td>').text(obj.annoTitle).addClass("annoDepart_Tilte");
						var $dWriterName = $('<td>').text(obj.writerName);
						var $dwatcher = $('<td>').text(obj.count);
						var $dAnnoDate = $('<td>').text(obj.annoDate);
						var $dAnnoNo = $('<td><input type="hidden" name="annoNo" value='+obj.annoNo+'>');
						var $dAnnoW = $('<td><input type="hidden" name="annoWR" value='+obj.annoWR+'>');
						
						$tr.append($dTitle);
						$tr.append($dWriterName);
						$tr.append($dwatcher);
						$tr.append($dAnnoDate);
						$tr.append($dAnnoNo);
						$tr.append($dAnnoW);
						$tableBody.append($tr);
						
					});
				}
				$(".annoDepartModal").css("display","flex");
			}, 
			err:function(){
				console.log("부서별 공지사항 모음 값 받기 실패")
			}
		})
		
	})
		
	$(document).on("click",".annoDepart_detail",function(){
		console.log($(this).children().eq(4).children().val())//번호 체크
		console.log($(this).children().eq(5).children().val())//글작성한 사람
		location.href="detailAnnoDepart.do?adno="+$(this).children().eq(4).children().val()+"&userNo="+${loginUser.empNo}+"&writerNo="+$(this).children().eq(5).children().val();
	})
	})
	
	</script>
	<!-- 이메일 API -->
	<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
	<script>
	(function(){
		emailjs.init("Mafb0wCflnksYAr8I");
	})();
	</script>

	<!-- 문자전송 API -->
	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>

	<script src="https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.js"></script>
</body>
</html>