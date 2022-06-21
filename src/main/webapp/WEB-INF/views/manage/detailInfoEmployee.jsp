<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사정보 디테일</title>
<style type="text/css">
	.InfoEmMainDiv{
		margin: 0 auto;
		padding: 100px;
		border: 1px solid;
	}
	.informaitonUpsper{
		display: flex;
		border-bottom: 1px solid;
	}
	.upperInformationEMp>div {
		margin-bottom: 15px;
		font-size: 18px;
	}
	.secondEmp{
		margin-left: 20px;
	}
	.upperImangePar img{
		width: 10vw;
		height:20vh;
		margin-right:40px;
		border: 1px solid;
	}
	.InforDepartBuDiv{
		margin-top: 30px;
		text-align: right;
	}
	.InforDepartBu{
		width: 7vw;
	}
	.underinfoDiv1, .underinfoDiv2{
		background-color: #f3f3f3;
	    height: 4vh;
	    font-size: 20px;
	    width: 7vw;
	    border: 1px solid lightgray;
	    text-align: center;
	    line-height: 4vh;
	    border-radius: 5px;
	    margin-bottom: 15px;
	    box-shadow: 1px 1px 0px 0px lightgrey;
	}
	.underinfoDiv1:hover, .underinfoDiv2:hover{
		cursor: pointer;
	}
	.underDivMain{
		margin-top: 40px;
    	display: flex;
	}
	.infomationShow{
		margin-left: 14px;
   	 	padding-top: 5px;
   	 	font-size: 17px;
   	 	height: 36vh;
	}
	.employyDEtail{
		display: flex;
	}
	.includeProjectLi{
		overflow-y: scroll;
	    height: 36vh;
	    display:none;
	    padding-top: 0px !important;
	}
	.includeProjectLi::-webkit-scrollbar{
    	display: none;
	}
	.infomationListName{
		font-size: 19px;
		margin-right: 30px;
	}
	.infomationListName div{
		margin-bottom: 20px; 
	}
	.pointerMian{
		background-color: #85cdff;
		box-shadow: 1px 1px 0px 0px rgb(174, 217, 248);
	}
	.projectBigDiv{
		background-color: #f3f3f3;
    	border-radius: 5px;
    	margin-bottom:15px;
	}
	.upperPRojecthEad{
		display: flex;
	    justify-content: space-between;
	    width: 40vw;
	    margin-left: 15px;
	    margin-right: 15px;
	    padding-top: 10px;
	    margin-bottom: 10px;
	}
	.projectTitleFont{
		font-size: 20px;
	}
	.attendCOuntCSS{
		margin-left: 15px;
	    margin-top: 15px;
	    padding-bottom: 10px;
	}
	.block{
		display: block !important;
	}
	.none{
		display: none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
		<div class="InfoEmMainDiv">
			<!-- 위에 정보 -->
			<div class="informaitonUpsper">
				<div class="upperImangePar"><img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${a.changeName}" > </div>
				<div class="upperInformationEMp">
					<div>부서</div>
					<div>사원명</div>
					<div>입사일자</div>
					<div>사원번호</div>
					<div>이메일</div>
					<div>ID</div>
					<div>휴대전화</div>
					<div>직위</div>
				</div>
				<div class="upperInformationEMp secondEmp">
					<div>${emp.deptName}</div>
					<div>${emp.empName}</div>
					<div>${emp.hireDate}</div>
					<div>${emp.empNo}</div>
					<div>${emp.email}</div>
					<div>${emp.userId}</div>
					<div>${emp.phone}</div>
					<div>${emp.jobName}</div>
				</div>
			</div>
			<!-- 아래 정보 -->
			<div class="underDivMain">
				<div>
					<div class="underinfoDiv1"><span> 세부 정보 </span></div>
					<div class="underinfoDiv2 "><span> 프로젝트 </span></div>
				</div>
				<div class="infomationShow employyDEtail">
					<div class="infomationListName">
						<div> 주소 </div>
						<div> 경력사항 </div>
						<div> 수상경력 </div>
						<div> 거래 은행명 </div>
						<div> 계좌번호 </div>
						<div> 최종학력</div>
						<c:if test="${loginUser.empNo eq emp.empNo}">
							<div> 자택유무 </div>
							<div> 차량 유무 </div>
							<c:if test = "${emp.marriage eq 'Y' }">
								<div> 결혼유무 </div>
								<div> 자녀수 </div>
							</c:if>
						</c:if>
					</div>
					<div class="infomationListName">
						<div>${emp.address}</div>
						<c:if test="${emp.career == 'Y'}">
							<div><span>있음</span></div>
						</c:if>
						<c:if test="${emp.career != 'Y'}">
							<div><span>없음</span></div>
						</c:if>
						<c:if test="${emp.awards == 'Y'}">
							<div><span>있음</span></div>
						</c:if>
						<c:if test="${emp.awards != 'Y'}">
							<div><span>없음</span></div>
						</c:if>
						<div>${emp.bankName}</div>
						<div>${emp.bankNo}</div>
						<div>${emp.lastEducational}</div>
						<c:if test="${loginUser.empNo eq emp.empNo}">
							<c:if test="${emp.homeStatus == 'Y'}">
								<div><span>있음</span></div>
							</c:if>
							<c:if test="${emp.homeStatus != 'Y'}">
								<div><span>없음</span></div>
							</c:if>
							<c:if test="${emp.carStatus == 'Y'}">
								<div><span>있음</span></div>
							</c:if>
							<c:if test="${emp.carStatus != 'Y'}">
								<div><span>없음</span></div>
							</c:if>
							<c:if test = "${emp.marriage eq 'Y' }">
								<c:if test="${emp.marriage == 'Y'}">
									<div><span>있음</span></div>
								</c:if>
								<c:if test="${emp.marriage != 'Y'}">
									<div><span>없음</span></div>
								</c:if>
								<div>${emp.childrenCount}</div>
							</c:if>
						</c:if>
					</div>
				</div>
				<div class="infomationShow includeProjectLi">
					<c:forEach items="${p}" var="pro">
						<div class="projectBigDiv">
							<div class="upperPRojecthEad">
								<div class="projectTitleFont"><span>${pro.proTitle}</span></div>
								<div><span>${pro.proDate}</span></div>
							</div>
							<div class="attendCOuntCSS">
								<div><span>참여자 : ${pro.count} 명</span></div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 버튼부분 -->
			<div class="InforDepartBuDiv">
				<button type="button" class="commonButton1 InforDepartBu"> 메인페이지로</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$(".page_title>.title_name").text("${emp.empName} 인사 정보");
		})
		$(document).ready(function(){
			$(".underinfoDiv1").addClass("pointerMian");
		})
		$(".underinfoDiv2").click(function(){
			$(".underinfoDiv1").removeClass("pointerMian");
			$(".underinfoDiv2").addClass("pointerMian");
			$(".includeProjectLi").addClass("block");
			$(".employyDEtail").addClass("none");
		})
		$(".underinfoDiv1").click(function(){
			$(".underinfoDiv2").removeClass("pointerMian");
			$(".underinfoDiv1").addClass("pointerMian");
			$(".includeProjectLi").removeClass("block");
			$(".includeProjectLi").addClass("none");
		})
		$(".InforDepartBu").click(function(){
			location.href="selectDepartInfo.do?deptNo=${emp.deptNo}&deptTitle=${emp.deptName}";
		})
		$(".underinfoDiv1").click(function(){
			$(".employyDEtail").removeClass("none");
			$(".includeProjectLi").addClass("none");
		})
	</script>
</body>
</html>