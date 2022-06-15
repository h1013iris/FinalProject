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
		border: 1px solid;
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
			<!-- 아래 부분 -->
			<div>
				<div><span>1주차</span></div>
			</div>
			<div>
				<div><span>1주차</span></div>
			</div>
			<div>
				<div><span>1주차</span></div>
			</div>
			<div>
				<div><span>1주차</span></div>
			</div>
			<div>
				<div><span>1주차</span></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var empName = $(".empNameDSEction").val();
			var info = $(".calandStatus").val();
			$(".page_title>.title_name").text(empName+" 근태 현황 _ "+info);
		})
	</script>
</body>
</html>