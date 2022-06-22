<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 근태 현황</title>
<style type="text/css">
	.attendLogBigDiv{
		margin: 0 auto;
		padding: 50px 100px 100px 100px ;
	}
	.underHivHeavedGet{
		display: flex;
		width: 100%;
	}
	.underHivHeavedGet{
		flex-wrap: wrap;
    	align-items: center;
	}
	.underHivHeavedGet>div{
		flex: 1;
	    text-align: center;
	    height: 70%;
	}
	.underGetEmpName{
		text-align: left !important;
		line-height: 30px !important;
	}
	.underHivHeavedGet{
		margin-top: 20px;
		background-color: lightgray;
		height: 13vh;
	}
	.addTotSecion{
		border-right: 1px solid black;
	}
	.namePartDv{
		padding-top: 10px;
		font-size: 20px;
		font-weight: 550;
		margin-bottom: 20px;
	}
	.headerUnderList{
		text-align: center;
		width: 100%;
		flex-wrap: wrap;
    	align-items: center;
    	margin-bottom: 15px;
    	display: flex;
	}
	.headerUnderList>div{
		flex: 1;
	}
	.iuppername{
		font-size: 18px;
	    font-weight: 550;
	}
	.sectionDIV{
		padding-top:10px;
		border-bottom: 1px solid;
	    padding-bottom: 10px;
	    font-weight: 550;
	    margin-bottom: 10px;
	    font-size: 19px;
	}
	.firdivse{
		margin-bottom: 15px;
	}
	.bigDivSection{
		margin-top: 80px;
	}
	.sectionDIV:hover{
		cursor: pointer;
		background-color: rgb(174, 217, 248);
	}
	.moveDiveChange{
		display: none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section ">
		<div class="attendLogBigDiv">
			<!-- 위에 부분 -->
			<div>
				<div class="underGetEmpName">
					<input type="hidden" class="empNameDSEction" value="${att.empName}">
					<input type="hidden" class="calandStatus" value="${att.cal} / ${att.status}">
				</div>
				<div class="underHivHeavedGet">
					<div class="addTotSecion">
						<div class="namePartDv">이번주 누적</div>
						<div>${att2.tot}</div>
					</div>
					<div>
						<div class="namePartDv">1주차</div>
						<div>${att.tot}</div>
					</div>
					<div>
						<div class="namePartDv">2주차</div>
						<div>${att.tot2}</div>
					</div>
					<div>
						<div class="namePartDv">3주차</div>
						<div>${att.tot3}</div>
					</div>
					<div>
						<div class="namePartDv">4주차</div>
						<div>${att.tot4}</div>
					</div>
					<div>
						<div class="namePartDv">5주차</div>
						<div>${att.tot5}</div>
					</div>
				</div>
			</div>
			<!-- 이번주 수정 요청 부분 -->
			
			<!-- 아래 부분 -->
			<div class="bigDivSection">
				<div class="firdivse">
					<div class="sectionDIV"><span>1주차</span></div>
					<div class="moveDiveChange">
						<div class="headerUnderList iuppername">
							<div><span>일자</span></div>
							<div><span>업무 시작</span></div>
							<div><span>업무 종료</span></div>
							<div><span>총 근무 시간</span></div>
						</div>
						<c:forEach items="${listDiv}" var="ld">
							<c:if test="${ld.mon eq 1}">
								<div class="headerUnderList">
									<input type="hidden" value="${ld.attendNo}">
									<div><span>${ld.emp} ${ld.status}</span></div>
									<div><span>${ld.attendTime2}</span></div>
									<div><span>${ld.leaveTime2}</span></div>
									<div><span>${ld.cal}</span></div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="firdivse">
					<div class="sectionDIV"><span>2주차</span></div>
					<div class="moveDiveChange">
						<div class="headerUnderList iuppername">
							<div><span>일자</span></div>
							<div><span>업무 시작</span></div>
							<div><span>업무 종료</span></div>
							<div><span>총 근무 시간</span></div>
						</div>
						<c:forEach items="${listDiv}" var="ld">
							<c:if test="${ld.mon eq 2}">
								<div class="headerUnderList">
									<input type="hidden" value="${ld.attendNo}">
									<div><span>${ld.emp}  ${ld.status}</span></div>
									<div><span>${ld.attendTime2}</span></div>
									<div><span>${ld.leaveTime2}</span></div>
									<div><span>${ld.cal}</span></div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="firdivse">
					<div class="sectionDIV"><span>3주차</span></div>
					<div class="moveDiveChange">
						<div class="headerUnderList iuppername">
							<div><span>일자</span></div>
							<div><span>업무 시작</span></div>
							<div><span>업무 종료</span></div>
							<div><span>총 근무 시간</span></div>
						</div>
						<c:forEach items="${listDiv}" var="ld">
							<c:if test="${ld.mon eq 3}">
								<div class="headerUnderList">
									<input type="hidden" value="${ld.attendNo}">
									<div><span>${ld.emp}  ${ld.status}</span></div>
									<div><span>${ld.attendTime2}</span></div>
									<div><span>${ld.leaveTime2}</span></div>
									<div><span>${ld.cal}</span></div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="firdivse">
					<div class="sectionDIV"><span>4주차</span></div>
					<div class="moveDiveChange">
						<div class="headerUnderList iuppername">
							<div><span>일자</span></div>
							<div><span>업무 시작</span></div>
							<div><span>업무 종료</span></div>
							<div><span>총 근무 시간</span></div>
						</div>
						<c:forEach items="${listDiv}" var="ld">
							<c:if test="${ld.mon eq 4}">
								<div class="headerUnderList">
									<input type="hidden" value="${ld.attendNo}">
									<div><span>${ld.emp}  ${ld.status}</span></div>
									<div><span>${ld.attendTime2}</span></div>
									<div><span>${ld.leaveTime2}</span></div>
									<div><span>${ld.cal}</span></div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="firdivse">
					<div class="sectionDIV"><span>5주차</span></div>
					<div class="moveDiveChange">
						<div class="headerUnderList iuppername">
							<div><span>일자</span></div>
							<div><span>업무 시작</span></div>
							<div><span>업무 종료</span></div>
							<div><span>총 근무 시간</span></div>
						</div>
						<c:forEach items="${listDiv}" var="ld">
							<c:if test="${ld.mon eq 5}">
								<div class="headerUnderList">
									<input type="hidden" value="${ld.attendNo}">
									<div><span>${ld.emp}  ${ld.status}</span></div>
									<div><span>${ld.attendTime2}</span></div>
									<div><span>${ld.leaveTime2}</span></div>
									<div><span>${ld.cal}</span></div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var empName = $(".empNameDSEction").val();
			var info = $(".calandStatus").val();
			$(".page_title>.title_name").text(empName+" 근태 현황 _ "+info);
		})
		$(".sectionDIV").click(function(){
			$(".moveDiveChange").hide();
			event.stopPropagation();
			$(this).next().toggle();
		})
		$(document).click(function(){
			$(".moveDiveChange").hide();
		})
	</script>
</body>
</html>