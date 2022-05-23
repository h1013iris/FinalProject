<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
</head>
<body>

	<jsp:include page="../depart/annoDepartList.jsp"></jsp:include>
	<jsp:include page="../approval/docEnrollModal.jsp"></jsp:include>
	<jsp:include page="./alert.jsp"></jsp:include>
	<jsp:include page="./confirm.jsp"></jsp:include>
	
	
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
	        <div class="page_title">
	            <p class="title_name">페이지 이름</p>
	        </div>
	        <div class="right">
	            <div class="alarm">
	                <img class="alarm_img" src="${ pageContext.servletContext.contextPath }/resources/images/alarm.png"/>
	                <div class="count">1</div>
	            </div>
	            <div class="pro_img">
	                <img class="alarm_img" src="${ pageContext.servletContext.contextPath }/resources/images/관리자 프로필.png"/>
	            </div>
	        </div>
	    </div>
	</header>
	<div class="login_status">
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
	        <p>로그아웃</p>
	    </div>
	</div>
	<aside id="main_nav">
	    <ul>
	        <li>
	            <a class="mypage" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/개인페이지.png" alt=""></a>
	            <div class="detail_nav_content">
	                <ul> 
	                    <li class="list_title">업무 관리</li>
	                    <div class="hhh">
		                    <li><a href="#">업무 관리</a></li>
		                    <li><a href="#">업무 요청</a></li>
		                    <li><a href="#">받은 업무</a></li>
		                    <li><a href="#">보낸 업무</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">ToDo</li>
	                    <div class="hhh">
	                    	<li><a href="#">List</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">전자명함</li>
	                    <div class="hhh">
	                    	<li><a href="#">전자명함</a></li>
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
		                    <li><a href="#">내 정보(상세) 변경</a></li>
	                    </div>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="approval" href="apprvalMain.do"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/결재.png" alt=""></a>
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
	                    <li class="list_title"><a href="completeMain.do">완료 문서함</a></li>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="calender" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/캘린더.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">캘린더</p></div>
	                <button type="button" class="commonButton2 etcButton"><span>일정 추가하기</span></button>
	                <ul> 
	                    <li class="list_title">내 캘린더</li>
	                    <div class="hhh">
	                    	<li><input type="checkbox" name="" id="" checked>내 할 일</li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">부서 캘린더</li>
	                    <div class="hhh">
		                    <li><input type="checkbox" name="" id="" checked>예시 팀1</li>
		                    <li><input type="checkbox" name="" id="" checked>예시 팀2</li>
		                    <li><input type="checkbox" name="" id="" checked>예시 팀3</li>
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
	            <a class="reservation" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/회의실 예약.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">회의실 예약</p></div>
	                <button type="button" class="commonButton2 etcButton"><span>예약하기</span></button>
	                <ul> 
	                    <li class="list_title"><a href="#">회의실 예약 현황</a></li>
	                    <div class="hhh">
		                    <li><a href="#">예시 회의실1</a></li>
		                    <li><a href="#">예시 회의실2</a></li>
		                    <li><a href="#">예시 회의실3</a></li>
		                    <li><a href="#">예시 회의실4</a></li>
	                    </div>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="departmentpage" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/부서페이지.png" alt=""></a>
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
		                    <li><a href="#">간편 프로젝트 생성</a></li>
		                    <li><a href="#">프로젝트 관리</a></li>
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
	                <button type="button" class="commonButton2 etcButton"><span>글 작성</span></button>
	                <ul> 
	                    <li class="list_title"><a href="#">공지사항</a></li> 
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="#">자유 게시판</a></li>         
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="#">익명 게시판</a></li>
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="#">부서 게시판</a></li>
	                </ul>
	                <ul>
	                    <li class="list_title"><a href="#">임시보관함</a></li>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="messenger" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/메신저.png" alt=""></a>
	        </li>
	        <li>
	            <a class="address" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/주소록.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">주소록</p></div>
	                <ul> 
	                    <li class="list_title">전체 주소록</li>
	                    <div class="hhh">
	                    	<li><a href="#">부서별 주소록</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">개인 주소록</li>
	                    <div class="hhh">
		                    <li><a href="#">거래처 주소록</a></li>
		                    <li><a href="#">고객 주소록</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">임시보관함</li>
	                </ul>
	            </div>
	        </li>
	        <li>
	            <a class="operationpage" href="#"><img src="${ pageContext.servletContext.contextPath }/resources/images/icons/경영페이지.png" alt=""></a>
	            <div class="detail_nav_content">
	                <div class="nananan"><p class="detail_title">경영지원 페이지</p></div>
	                <button type="button" class="commonButton2 etcButton"><span>공지사항 등록</span></button>
	                <ul> 
	                    <li class="list_title">공지사항</li>
	                    <div class="hhh">
	                    	<li><a href="#">공지사항</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">관리</li>
	                    <div class="hhh">
		                    <li><a href="#">근태 관리</a></li>
		                    <li><a href="#">휴가 관리</a></li>
		                    <li><a href="#">인사 정보</a></li>
		                    <li><a href="#">증명서 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">급여</li>
	                    <div class="hhh">
		                    <li><a href="#">4대 보험 계산기</a></li>
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
		                    <li><a href="#">사원 관리</a></li>
		                    <li><a href="#">부서 관리</a></li>
		                    <li><a href="#">직책 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">게시판 관리</li>
	                    <div class="hhh">
	                    	<li><a href="#">게시판 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">회의실 관리</li>
						<div class="hhh">
	                    	<li><a href="#">회의실 관리</a></li>
	                    </div>
	                </ul>
	                <ul>
	                    <li class="list_title">전재결재 관리</li>
	                    <div class="hhh">
		                    <li><a href="#">문서 보안 관리</a></li>
		                    <li><a href="#">문서 서식 관리</a></li>
	                   	</div>
	                </ul>
	                <ul>
	                    <li class="list_title">기타</li>
	                    <div class="hhh">
		                    <li><a href="#">주소록 관리</a></li>
		                    <li><a href="#">권한 부여</a></li>
		                    <li><a href="#">금지어 설정</a></li>
	                    </div>
	                </ul>
	            </div>
	        </li>
	    </ul>
	</aside>
	
	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>

</body>
</html>