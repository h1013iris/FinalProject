<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경영지원 메인 페이지</title>
<style type="text/css">
	:root{
		accent-color:lightgray;
	}
	.manageMainDiv{
		margin: 0 auto;
		padding-top: 30px;
		padding-left: 100px;
		padding-right: 100px;
	}
	.manageUpper{
		width: 100%;
		height: 32vh;
		display: flex;
		justify-content: space-between;
	}
	.annoDepartSection{
		width: 35%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	.infoUSerSection{
		width: 27%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	.certifiCSection{
		width: 27%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	.annoDepartUpperS{
		display: flex;
		justify-content: space-between;
		height: 10%;
		padding-bottom:5px;
		margin-bottom: 1%;
		border-bottom: 1px solid;
	}
	.annoDepart_Name{
		font-size: 23px;
	}
	.etcAnnoDepartSe:hover{
		cursor: pointer;
		color:#40A0FF;
	}
	.annoDepartLowers{
		height: 80%;
	}
	.selectDepartContent{
		display: flex;
		justify-content: space-between;
	}
	.selectAnnoDepart a, .etcAnnoDepartSe{
		list-style: none;
		color: black;
		text-decoration: none;
	}
	.selectAnnoDepart:hover{
		background-color: rgb(174, 217, 248);
	}
	.selectAnnoDepart a:hover{
		cursor: pointer;
	}
	.sectiontitlePartAnno{
		width: 70%;
	    -webkit-line-clamp: 1;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	   	height: 40px;
	}
	.selectAnnoDepart{
		line-height: 40px;
	}
	.manageLower{
		margin-top:15px;

		width: 100%;
		display:flex;
		height: 53vh;
		justify-content: space-between;
	}
	.infoUserLowerFirstc{
		height: 100%;
		width: 67%;		
	}
	.attendlogSection{
		height: 44%;
		width:100%;
		background-color:#f3f3f3;
		padding: 10px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	.vacationLogSection{
		margin-top: 1.8%;
		height: 44%;
		width:100%;
		background-color                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	    display: none;`
	}
	.block{
		display: block !important;
	}
	.none{
		display: none;
	}
	.departTitleList::-webkit-scrollbar{
    	display: none;
	}
	.departTitleList div, .departTitleList1 div{
		height: 30px;
		line-height:30px;
		font-size: 18px;
	}
	.departTitleList div:hover, .departTitleList1 div:hover{
		cursor: pointer;
		background-color: rgb(174, 217, 248);
	}
	.searchTitleDivSe{
		display: flex;
		justify-content: flex-end;
	}
	.divPartSerTdiv1{
		margin-left: 80px;
	}
	.divPartserDIv2{
		margin-right: 75px;
	}
	.divPartSerT11{
		display: flex;
		margin-left: 15px;
	}
	.divPartSerT11 img{
		line-height: 20px;
	}
	.divImgWri{ "0"
		transform: translateY(4px);
	}
	.defalutDepart45{
		display: none;
	}
	.block{
		display: block !important;
	}
	.none{
		display: none;
	}
	.defalutDepart1{
		border: 1px solid lightgrey;
		border-radius: 5px;
		height: 27px;
	    width: 270px;
	}
	.caleHeader{
		display: flex;
		flex-wrap: wrap;
		align-content: center;
	    text-align: center;
	    line-height: 3vh;
	}
	.caleHeaderMAIN{
		display: flex;
		flex-wrap: wrap;
		align-content: center;
	    text-align: center;
	    line-height: 3vh;
	}
	
	.caleHeaderMAIN div{
		border: 1px solid darkgray;
	    flex: 1 1 13%;
	    height: 3vh;
	    background-color: white;
	}
	.caleHeader div{
		border: 1px solid darkgray;
	    flex: 1 1 13%;
	    height: 3vh;
	    background-color: lightgray;
	}
	.haphfb{
		display: flex;
	}
	.happyhlist, .listVa{
		height: 14.5vh;
		overflow-y : scroll;
	}
	.happyhlist::-webkit-scrollbar, .listVa::-webkit-scrollbar{
    	display: none;
	}
	.noInfo{
		text-align: center;
		font-size: 20px;
		margin-top: 20px;
	}
	.chooseFormDi{
		font-size: 20px;
		margin-top: 15px;
    	margin-bottom: 15px;
	}
	.radioPartDiv{
		display: flex;
		font-size: 18px;
		margin-bottom: 10px;
	}
	.divraioPart{
		line-height: 25px;
	}
	#input1{
	 	margin-top: 15px;
		width: 250px;
		height: 40px;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 3px solid;
	}
	#input2{
		margin-left:10px;
		margin-top:15px;
		width: 80px;
		height: 45px;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 3px solid;
		background-color: lightgray;
	}
	#input2:hover{
		cursor: pointer;
		background-color: darkgray;
	}
	.inputNUMBER{
		display: flex;
	}
	.vacationdiv, .vacationListDiv{
		display: flex;
	}
	.vacationdiv div{
		border: 1px solid darkgray;
	    flex: 1 1 13%;
	    height: 3vh;
	    background-color: lightgray;
	    text-align: center;
	    line-height: 3vh;
	}
	.vacationListDiv div{
		border: 1px solid darkgray;
		flex: 1 1 13%;
	    height: 3vh;
	    text-align: center;
	    line-height: 3vh;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="InfoForm.jsp"/>
	<div class="main_section ">
		<div class="manageMainDiv">
			<!-- upper -->
			<div class="manageUpper">
				<!-- 공지사항 -->
	        	<div class="annoDepartSection">
	        		<div class="annoDepartUpperS">
	        			<div class="annoDepart_Name"><span>공지사항</span></div>
	        			<div><a class="annoDepart etcAnnoDepartSe">>더보기</a></div>
	        		</div>
	        		<div class="annoDepartLowers">
	        			<c:forEach items="${dlist}" var="dl">
							<div class="selectAnnoDepart"><a href="detailAnnoDepart.do?adno=${dl.annoNo}&userNo=${loginUser.empNo}&writerNo=${dl.annoWR}">
								<div class="selectDepartContent">
									<div class="sectiontitlePartAnno">${dl.annoTitle}</div>
									<div>${dl.annoDate}</div>
								</div>
							</a></div>
	        			</c:forEach>
	        		</div>
	        	</div>
	        	<!-- 인사 정보  -->
	        	<div class="infoUSerSection">
	        		<div class="annoDepartUpperS">
	        			<div class="annoDepart_Name"><span>인사 정보</span></div>
	        		</div>
	        		<div class="infoUSerSectionUnder">
		        		<c:forEach items="${dplist}" var="dp">
	        				<div class="deptTitleNameSection" onclick="selectInfoDepart('${dp.deptNo}','${dp.deptTitle}')"><span>${dp.deptTitle}</span></div>
	        				<c:if test="${dp.deptNo eq loginUser.departmentNo }">
	        					<input type="hidden" class="hiddenDepartTitle" value='${dp.deptTitle }'>
	        				</c:if>
	        			</c:forEach>
        			</div>
	        	</div>
				<!-- 증명서 관리 -->
				<div class="certifiCSection">
					<div class="annoDepartUpperS">
	        			<div class="annoDepart_Name"><span>재직 증명서</span></div>
	        		</div>
	        		<div>
	        			<div class="chooseFormDi"><span>용도 선택</span></div>
	        			<div class="radioBigDiv">
		        			<div class="radioPartDiv"><input type="radio" name ="submitForm" style="width:20px;height:20px;" value="금융기관 제출용"><div class="divraioPart"><span>금융기관 제출용</span></div></div>
		        			<div class="radioPartDiv"><input type="radio" name ="submitForm" style="width:20px;height:20px;" value="관공서 제출용"><div class="divraioPart"><span>관공서 제출용</span></div></div>
		        			<div class="radioPartDiv"><input type="radio" name ="submitForm" style="width:20px;height:20px;" value="회사 제출용"><div class="divraioPart"><span>회사 제출용</span></div></div>
	        			</div>
	        		</div>
	        		<div>
	        			<div class="inputNUMBER"><input type="text" placeholder="사원번호를 입력하세요" id ="input1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><div><input type="button" value="선택" id="input2"></div></div>
	        		</div>
				</div>
			</div>
			<!-- lower -->
			<div class="manageLower">
				<!-- 근태관리 및 휴가 정보 -->
				<div class="infoUserLowerFirstc">
					<!-- 근태관리 -->
					<div class="attendlogSection">
						<div class="annoDepartUpperS1">
		        			<div class="annoDepart_Name1"><span>근태관리</span></div>
		        			<div class="divPartSerT">
							<!-- 디폴트 -->
							<div class="defalutDepart defalutDepart11 divPartSerTdiv1 divPartSerTdiv23">부서 분류</div>
							<input type="hidden" class="deptTitleNo1" >
							<!-- 클릭시 보인는 곳 -->
							<div class="departTitleList departTitleListone">
									<div onclick="titleD('0','전체',1,'0','0')"><span>전체</span></div>
									<c:forEach items="${dplist}" var="dp">
										<div onclick="titleD('${dp.deptNo}','${dp.deptTitle}',1,'0','0')"><span>${dp.deptTitle}</span></div>
									</c:forEach>
								</div>
							</div>	
							<div class="divPartSerT">
								<!-- 디폴트 -->
								<div class="defalutDepart searchFilterL1">검색</div>
								<!-- 클릭시 보인는 곳 -->
								<div class="departTitleList1 departTitleListthree1">
									<div onclick="searchFilter('이름',1)"><span>이름</span></div>
									<div onclick="searchFilter('사원번호',1)"><span>사원번호</span></div>
								</div>
							</div>
							<div class="divPartSerT11 divPartserDIv2">
								<!-- 디폴트 -->
								<div><input type="text" class="inputSearchMane defalutDepart1 defalutDepart42 defualtone"></div>
								<div><input type="text" placeholder="숫자만 입력해주세요" class="inputSearchMane defalutDepart1 defalutDepart45 defualttwo" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></div>
								<div class="divImgWri clickpehv"><img src="https://img.icons8.com/material/24/000000/search--v1.png"></div>
							</div>
		        			<div><a class="AttendInfoEtc">>더보기</a></div>
		        		</div>
		        		<!-- 내용부분 -->
		        		<div>
		        			<div class="caleHeader">
		        				<div> 이름 </div>
		        				<div>${cw.monWeek}</div>
		        				<div>${cw.tueWeek}</div>
		        				<div>${cw.wenWeek}</div>
		        				<div>${cw.thiWeek}</div>
		        				<div>${cw.friWeek}</div>
		        				<div> 주간 합계 </div>
		        			</div>
		        			<div class="happyhlist">
		        			<c:forEach items="${att}" var="all">
			        			<div class="caleHeaderMAIN">
			        				<div>${all.emp}</div>
			        				<div>${all.mon1}</div>
			        				<div>${all.tue2}</div>
			        				<div>${all.wen3}</div>
			        				<div>${all.tur4}</div>
			        				<div>${all.fri5}</div>
			        				<div>${all.tot}</div>
			        			</div>
		        			</c:forEach>
		        			</div>
					</div>
					</div>
					<!-- 휴가 정보 -->
					<div class="vacationLogSection">
						<div class="annoDepartUpperS1">
		        			<div class="annoDepart_Name1"><span>휴가정보</span></div>
		        			<div class="divPartSerT">
							<!-- 디폴트 -->
							<div class="defalutDepart defalutDepart12 divPartSerTdiv1 divPartSerTdiv24">부서 분류</div>
							<input type="hidden" class="deptTitleNo2" >
							<!-- 클릭시 보인는 곳 -->
							<div class="departTitleList departTitleListtwo">
									<div onclick="titleD('0','전체',2,'0','0')"><span>전체</span></div>
									<c:forEach items="${dplist}" var="dp">
										<div onclick="titleD('${dp.deptNo}','${dp.deptTitle}',2,'0','0')"><span>${dp.deptTitle}</span></div>
									</c:forEach>
								</div>
							</div>
							<div class="divPartSerT">
								<!-- 디폴트 -->
								<div class="defalutDepart searchFilterL2">검색</div>
								<!-- 클릭시 보인는 곳 -->
								<div class="departTitleList1 departTitleListthree2">
									<div onclick="searchFilter('이름',2)"><span>이름</span></div>
									<div onclick="searchFilter('사원번호',2)"><span>사원번호</span></div>
								</div>
							</div>
							<div class="divPartSerT11 divPartserDIv2">
								<!-- 디폴트 -->
								<div><input type="text" class="inputSearchMane defalutDepart1 defalutDepart42 defualtthree"></div>
								<div><input type="text" placeholder="숫자만 입력해주세요" class="inputSearchMane defalutDepart1 defalutDepart45 defualtfour" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></div>
								<div class="divImgWri vacationSearchBu"><img src="https://img.icons8.com/material/24/000000/search--v1.png"></div>
							</div>
		        			<div><a class="vacationLIstetc">>더보기</a></div>
		        		</div>
		        		<div class="vacationdiv">
		        			<div>이름</div>
		        			<div>총연차</div>
		        			<div>사용 연차</div>
		        			<div>잔여 연차</div>
		        		</div>
		        		<div class="vacationmainDiv listVa">
		        			<c:forEach items="${vi}" var="vi">
		        				<div class="vacationListDiv">
		        					<div>${vi.empName}</div>
		        					<div>${vi.totTyear}</div>
		        					<div>${vi.useDayoff}</div>
		        					<div>${vi.totDayoff}</div>
		        				</div>
		        			</c:forEach>
		        		</div>
					</div>
				</div>
				<!-- 4대 보험 계산기 -->
				<div class="calCu4Section">
					<div class="headNameCalcu"><span>4대 보험 모의 계산기</span></div>
					<div>
						<div class="monthdya"><span>월 급여</span></div>
						<div>
							<div>
								<input type="text" class="payhowMuch" onkeyup="chkNumber(this)">
								<span>원</span>
							</div>
							<div class="inputMoneyDiv">
								<div class="calculateButton submitNumber"><span>계산</span></div>
								<div class="calculateButton resetALl"><span>초기화</span></div>
							</div>
						</div>
						<!-- 결과 -->
						<div class="totalListChekc">
							<table border="1">
								<thead>
									<tr>
										<th>구분 </th>
										<th>총액 </th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th> 국민연금 </th>
										<td class="kukmin"> 원</td>
									</tr>
									<tr>
										<th> 건강보험 </th>
										<td class="gunkang"> 원</td>
									</tr>
									<tr>
										<th> 건강보험
										<br>(장기요양) </th>
										<td class="gunjang"> 원</td>
									</tr>
									<tr>
										<th> 고용보험 </th>
										<td class="gowong"> 원</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<th> 합 계 </th>
										<td class="totalALl"> 원 </td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		function selectInfoDepart(deptNo, deptTitle){
			location.href="selectDepartInfo.do?deptNo="+deptNo+"&deptTitle="+deptTitle;
		}
	 	// 천단위 콤마 (소수점포함)
	  	function numberWithCommas(num) {
		    var parts = num.toString().split(".");
		    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (parts[1] ? "." + parts[1] : "");
		}
	
		// 숫자 체크(숫자 이외 값 모두 제거)
		function chkNumber(obj){
		  var tmpValue = $(obj).val().replace(/[^0-9,]/g,'');
		  tmpValue = tmpValue.replace(/[,]/g,'');
		  // 천단위 콤마 처리 후 값 강제변경
		  obj.value = numberWithCommas(tmpValue);
	  	}
		$(".submitNumber").click(function(){
			var salary= $(".payhowMuch").val().replace(/[,]/g,'');
			console.log($(".payhowMuch").val().replace(/[,]/g,''))//콤마 사라지고 보임
			if(salary == 0){
				myAlert("값입력", "값을 입력해주시기 바랍니다");
				return false;
			}
			$.ajax({
				url:"calculateSalary.do",
				type:"get", 
				data:{salary:salary}, 
				success:function(cs){
					$(".kukmin").text(cs.gukmin+"원");
					$(".gunkang").text(cs.gungan+"원");
					$(".gunjang").text(cs.gunGangi+"원");
					$(".gowong").text(cs.gyAgyh+"원");
					$(".totalALl").text(cs.totalV+"원");
				}
			})
		})
		$(".resetALl").click(function(){
			$(".payhowMuch").val('');
			$(".kukmin").text('');
			$(".gunkang").text('');
			$(".gunjang").text('');
			$(".gowong").text('');
			$(".totalALl").text('');
		})
		$(".defalutDepart11").click(function(){
			event.stopPropagation();
			$(".departTitleListone").toggle();
			$(".departTitleListtwo").hide();
		})
		$(".defalutDepart12").click(function(){
			event.stopPropagation();
			$(".departTitleListtwo").toggle();
			$(".departTitleListone").hide();	
		})
		/*디폴트로 사라지게*/
	    $(document).click(function(){
			$(".departTitleListone").hide();	
			$(".departTitleListtwo").hide();
		})
		
		$(".searchFilterL1").click(function(){
			$(".departTitleListthree1").toggle();
		})
		$(".searchFilterL2").click(function(){
			$(".departTitleListthree2").toggle();
		})
		function searchFilter(tex, num){
			event.stopPropagation();
			
			if(num ==1){
				$(".searchFilterL1").text(tex);
				
				if(tex=="사원번호"){
					
					$(".defualtone").addClass("none");
					$(".defualttwo").addClass("block");
				}else{
					$(".defualtone").removeClass("none");
					$(".defualttwo").removeClass("block");
				}
				$(".departTitleListthree1").hide();	
			}else if(num ==2){
				$(".searchFilterL2").text(tex);
			
				if(tex=="사원번호"){
					
					$(".defualtthree").addClass("none");
					$(".defualtfour").addClass("block");
				}else{
					$(".defualtthree").removeClass("none");
					$(".defualtfour").removeClass("block");
				}
				$(".departTitleListthree2").hide();	
			}
			
		}
		function titleD(deptNo, deptTitle, num, ord, searchli){
			if(num ==1){
			var ordq = $(".searchFilterL1").text();
			if(ord != 0){
				if(ordq =='검색'){
					myAlert("선택", "검색을 선택해주세요");
					return false;
				}else if(ordq == '이름'){
					searchli = $(".defualtone").val();
					if(searchli == ''){
						myAlert("입력", "이름을 입력해주세요");
						return false;
					}
				}else if(ordq == '사원번호'){
					searchli = $(".defualttwo").val();
					if(searchli == ''){
						myAlert("입력", "사번을 입력해주세요");
						return false;
					}
				}
			}
			if(deptNo == 0){
				if($(".defualtone").val() == null || $(".defualttwo").val() == null){
					ordq=null;
					searchli=null;
				}
			}
			$.ajax({
				url:"filterCheckMianPage.do",
				type:"get",
				data:{dep:deptTitle, depNo:deptNo, ord:ordq, searchli:searchli},
				success:function(list){
					$tableBody = $(' .happyhlist');
					$tableBody.html('');
					if(list.length ==0){
						var $tt=$("<div>").text("사원 없음").addClass("noInfo");
						$tableBody.append($tt);
						$(".defualtone").val('');
						$(".defualttwo").val('');
					}else if(list.length != 0){
						$.each(list, function(i, obj){
							
							var $tr = $('<div>').addClass("caleHeaderMAIN");
							var $dTitle = $('<div>').text(obj.emp);
							var $dWriterName = $('<div>').text(obj.mon1);
							var $dwatcher = $('<div>').text(obj.tue2);
							var $dAnnoDate = $('<div>').text(obj.wen3);
							var $dAnnoNo = $('<div>').text(obj.tur4);
							var $dAnnoW = $('<div>').text(obj.fri5);
							var $dAnnweoW = $('<div>').text(obj.tot);
							$tr.append($dTitle);
							$tr.append($dWriterName);
							$tr.append($dwatcher);
							$tr.append($dAnnoDate);
							$tr.append($dAnnoNo);
							$tr.append($dAnnoW);
							$tr.append($dAnnweoW);
							$tableBody.append($tr);
							$(".defualtone").val('');
							$(".defualttwo").val('');
						})
					}
					$(".divPartSerTdiv23").text('전체');
					$(".deptTitleNo1").val('0');
					$(".departTitleListone").hide();	
					$(".searchFilterL1").text('검색');
				}
			})
			}else if(num ==2){
				//검색 부분
				var ordq = $(".searchFilterL2").text();
				if(ord != 0){
					if(ordq =='검색'){
						myAlert("선택", "검색을 선택해주세요");
						return false;
					}else if(ordq == '이름'){
						searchli = $(".defualtthree").val();
						if(searchli == ''){
							myAlert("입력", "이름을 입력해주세요");
							return false;
						}
					}else if(ordq == '사원번호'){
						searchli = $(".defualttwo").val();
						if(searchli == ''){
							myAlert("입력", "사번을 입력해주세요");
							return false;
						}
					}
				}
				if(deptNo == 0){
					if($(".defualtthree").val() == null || $(".defualtfour").val() == null){
						ordq=null;
						searchli=null;
					}
				}
				console.log(deptNo)
				console.log(deptTitle)
				console.log(ordq)
				console.log(searchli)
				$.ajax({
					url:"filterListVacation.do",
					type:"get",
					data:{dep:deptTitle, depNo:deptNo, ord:ordq, searchli:searchli},
					success:function(list){
						console.log("성공")
						$tableBody = $(' .vacationmainDiv');
						$tableBody.html('');
						if(list.length ==0){
							var $tt=$("<div>").text("사원 없음").addClass("noInfo");
							$tableBody.append($tt);
							$(".defualtthree").val('');
							$(".defualtfour").val('');
						}else if(list.length != 0){
							$.each(list, function(i, obj){
								var $tr = $('<div>').addClass("vacationListDiv");
								var $dTitle = $('<div>').text(obj.empName);
								var $dWriterName = $('<div>').text(obj.totTyear);
								var $dwatcher = $('<div>').text(obj.useDayoff);
								var $dAnnoDate = $('<div>').text(obj.totDayoff);
								$tr.append($dTitle);
								$tr.append($dWriterName);
								$tr.append($dwatcher);
								$tr.append($dAnnoDate);
								$tableBody.append($tr);
								$(".defualtthree").val('');
								$(".defualtfour").val('');
							})	
						}
						$(".divPartSerTdiv24").text('전체');
						$(".deptTitleNo2").val('0');
						$(".departTitleListtwo").hide();
						$(".searchFilterL2").text('검색');
					}
				})
			
				
			}
		}
		$(".clickpehv").click(function(){
			var dep = $(".divPartSerTdiv23").text();//부서명
			var depNo = '';
			if(dep =="부서 분류"){
				dep= $(".hiddenDepartTitle").val();//부서명
				depNo= ${loginUser.departmentNo};//부서번호 
			}else{
				depNo =$(".deptTitleNo1").val();
			}
			var ordq = $(".searchFilterL1").text();
			var searchli ='';
			if(ordq =='검색'){
				myAlert("선택", "검색을 선택해주세요");
			}else if(ordq == '이름'){
				searchli = $(".defualtone").val();
			}else if(ordq == '사원번호'){
				searchli = $(".defualttwo").val();
			}

			titleD(depNo, dep, 1, ordq, searchli);
		})
		$(".vacationSearchBu").click(function(){
			var dep = $(".divPartSerTdiv24").text();//부서명
			var depNo = '';
			if(dep =="부서 분류"){
				dep= $(".hiddenDepartTitle").val();//부서명
				depNo= ${loginUser.departmentNo};//부서번호 
			}else{
				depNo =$(".deptTitleNo2").val();
			}
			var ordq = $(".searchFilterL2").text();
			var searchli ='';
			if(ordq =='검색'){
				myAlert("선택", "검색을 선택해주세요");
			}else if(ordq == '이름'){
				searchli = $(".defualtthree").val();
			}else if(ordq == '사원번호'){
				searchli = $(".defualtfour").val();
			}

			titleD(depNo, dep, 2, ordq, searchli);
		})
		$(".AttendInfoEtc").click(function(){
			location.href="selectListDepartInfo.do?deptNo="+${loginUser.departmentNo};
		})
		$(".vacationLIstetc").click(function(){
			location.href="selectListVacationInfo.do?depNo="+${loginUser.departmentNo};
		})
		$("#input2").click(function(){
			if($("input:radio[name='submitForm']").is(":checked")==false && $("#input1").val() == '' ){
				myAlert("내용 입력 필요", "용도 선택 및 사번을 입력해주세요");
				$("#input1").focus();
			}else if($("input:radio[name='submitForm']").is(":checked")==false && $("#input1").val() != '' ){
				myAlert("용도 체크 필요", "용도 선택해주세요");
				$("#input1").val('');
			}else if($("input:radio[name='submitForm']").is(":checked")==true && $("#input1").val() == ''){
				myAlert("사번 입력 필요", "사번을 입력해주세요");
				$("#input1").focus();
			}else if($("input:radio[name='submitForm']").is(":checked")==true && $("#input1").val() != ''){
				var submit = $("input:radio[name='submitForm']").val();
				inputF(submit);
			}
		})
		function inputF(submit){
			var empNo = $("#input1").val();
			
			//오늘 날짜
			var today = new Date();

			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '년 ' + month  + '월 ' + day +'일';
			$.ajax({
				url:"selectInfo.do", 
				type:"get", 
				data:{empNo:empNo}, 
				success:function(result){
					console.log("성공")
					if(result == null){
						myAlert("사번 오류", "입력하신 사번이 없습니다. 다시 입력해주세요");
						$("#input1").focus();
						$("#input1").val('');
					}else{
						$(".showModalInfoForm").css("display", "flex");
						$("#input1").val('');
						$(".name_part").text(result.empName);//성명
						$(".no_part").text(result.userNo);//주민번호 
						$(".address_part").text(result.address);//주소
						$(".depart_part").text(result.departmentName);//소속
						$(".job_part").text(result.jobName);//지위
						$(".work_part").text(result.changeName+" ~ 현재");//재직기간
						$(".why_part").text(submit);//용도
						$(".cont_part").text(dateString);//현재 날짜
						console.log(submit)
					}
					
				}, error:function(){
					
				}
			})
		}
	</script>
</body>
</html>