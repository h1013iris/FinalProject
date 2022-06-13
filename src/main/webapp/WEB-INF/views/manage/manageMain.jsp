<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경영지원 메인 페이지</title>
<style type="text/css">
	.manageMainDiv{
		margin: 0 auto;
		padding-top: 30px;
		padding-left: 100px;
		padding-right: 100px;
		border: 1px solid;
	}
	.manageUpper{
		border: 1px solid red;
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
		border: 1px solid blue;
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
		background-color:#f3f3f3;
		padding: 10px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	.annoDepartUpperS1{
		display: flex;
		justify-content: space-between;
		height: 10%;
		margin-bottom: 3%;
	}
	.annoDepart_Name1{
		font-size: 21px;	
	}
	.infoUSerSectionUnder{
		overflow-y: scroll;
		height: 90%;
	}
	.deptTitleNameSection{
		font-size: 18px;
		line-height:40px;
		height: 40px;
	}
	.deptTitleNameSection:hover{
		cursor: pointer;
		background-color: rgb(174, 217, 248);
	}
	.infoUSerSectionUnder::-webkit-scrollbar{
    	display: none;
	}
	.calCu4Section{
		width: 27%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	.headNameCalcu{
		text-align: center;
	    font-size: 22px;
	}
	.payhowMuch{
		height: 2.5vh;
	    width: 20vw;
	    text-align: right;
	}
	.monthdya{
	    font-size: 18px;
	    margin-top: 20px;
	    margin-bottom: 20px;
	}
	.inputMoneyDiv{
		margin-top: 20px;
	    justify-content: space-around;
	    display: flex;
	    margin-bottom: 20px;
	    text-align: center;
	}
	.calculateButton{
	    background-color: lightgray;
	    width: 40%;
	    line-height: 3.5vh;
	    height: 3.5vh;
	    border-radius: 5px;
	}
	.finalCheckCal{
		font-size: 18px;
	    margin-bottom: 15px;
	}
	.totalListChekc table{
		width: 100%;
	}
	.totalListChekc table thead{
		height: 50px;
		font-size: 20px;
	}
	.totalListChekc table td{
		text-align: right;
		width: 70%;
		height: 50px;
	}
	.totalListChekc table tfoot th{
		font-size: 19px;
	}
	.calculateButton:hover{
		cursor: pointer;
		background-color: rgb(174, 217, 248);
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
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
	        			</c:forEach>
        			</div>
	        	</div>
				<!-- 증명서 관리 -->
				<div class="certifiCSection">
				
				</div>
			</div>
			<!-- lower -->
			<div class="manageLower">
				<div class="infoUserLowerFirstc">
					<div class="attendlogSection">
						<div class="annoDepartUpperS1">
		        			<div class="annoDepart_Name1"><span>근태관리</span></div>
		        			<div><a class="annoDepart etcAnnoDepartSe">>더보기</a></div>
		        		</div>
					</div>
					<div class="vacationLogSection">
						<div class="annoDepartUpperS1">
		        			<div class="annoDepart_Name1"><span>휴가정보</span></div>
		        			<div><a class="annoDepart etcAnnoDepartSe">>더보기</a></div>
		        		</div>
					</div>
				</div>
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
	</script>
</body>
</html>