<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 관리</title>
<style type="text/css">
	.attendLogBigDiv{
		margin: 0 auto;
		padding: 50px 100px 100px 100px ;
		border: 1px solid;
	}
	.upperDeptinfo{
		margin-bottom: 30px;
	}
	.searchTitleDivSe{
		display: flex;
		justify-content: flex-end;
	}
	.divPartSerT{
		margin-left: 15px;
	}
	.divPartSerT11{
		display: flex;
		margin-left: 15px;
	}
	.divPartSerT11 img{
		line-height: 20px;
	}
	.defalutDepart{
		line-height:30px;
		font-size: 18px;
		background-color: white;
		border: 1px solid lightgrey;
		border-radius: 5px;
		height: 30px;
	    width: 150px;
	    text-align: center;
	}
	.departTitleList{
		margin-top: 5px;
	    position: absolute;
	    height: 90px;
	    width: 150px;
	    text-align: center;
	    overflow-y: scroll;
	    background-color: #f3f3f3;
	    border-radius: 5px;
	    box-shadow: 1px 2px 5px 0px lightgrey;
	    display: none;
	}
	.departTitleList1{
		margin-top: 5px;
	    position: absolute;
	    height: 60px;
	    width: 150px;
	    text-align: center;
	    background-color: #f3f3f3;
	    border-radius: 5px;
	    box-shadow: 1px 2px 5px 0px lightgrey;
	    display: none;`
	}
	.headerNameSw{
		font-size: 25px;
	}
	.defalutDepart1{
		border: 1px solid lightgrey;
		border-radius: 5px;
		height: 27px;
	    width: 270px;
	}
	.block{
		display: block !important;
	}
	.none{
		display: none;
	}
	.defalutDepart45{
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
	.underHivHeaved, .underHivHeavedGet{
		display: flex;
		width: 100%;
	}
	.underHivHeaved{
		margin-top: 30px;
		background-color: lightgray;
	}
	.underHivHeavedGet{
		flex-wrap: wrap;
    	align-items: center;
	}
	.underHivHeaved div{
		flex: 1;
	    text-align: center;
	    height: 30px;
	    line-height: 30px;
	}
	.underHivHeavedGet>div{
		flex: 1;
	    text-align: center;
	    line-height: 60px;
	    border-bottom: 1px solid;
	    height: 60px;
	}
	.underHivHeavedGet:hover{
		cursor: pointer;
		background-color: rgb(174, 217, 248);
	}
	.underGetEmpName{
		text-align: left !important;
		line-height: 30px !important;
	}
	.scrolldivse{
	 	overflow-y:scroll;
	 	height: 450px;
	}
	.scrolldivse::-webkit-scrollbar{
    	display: none;
	}
	.thisWEdit{	
		font-size: 18px;
	    font-weight: 550;
	    margin-bottom: 15px;
	}
	.editInfomationpart{
		display: flex;
		height: 40px;
		line-height: 40px;
		border-bottom: 1px solid lightgray;
	}
	.editInfomationpart div{
		flex: 1;
		text-align: center;
	}
	.editAPert{
		background-color: lightgray;
	}
	.manangePartButton{
		height: 30px;
	}
	.editInfoScrollpart{
		overflow-y:scroll;
		height: 85px;
	}
	.editInfoScrollpart::-webkit-scrollbar{
    	display: none;
	}
	.editInfomationpart:hover{
		cursor: pointer;
		background-color: rgb(174, 217, 248);
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section ">
		<div class="attendLogBigDiv">
			<!-- upper -->
			<div class="upperDeptinfo">
				<div class="searchTitleDivSe">
					<div class="divPartSerT">
						<!-- 디폴트 -->
						<div class="defalutDepart defalutDepart11">부서 분류</div>
						<input type="hidden" class="deptTitleNo"  >
						<!-- 클릭시 보인는 곳 -->
						<div class="departTitleList departTitleListone">
							<div onclick="titleD('0','전체','필터','0','0')"><span>전체</span></div>
							<c:forEach items="${dplist}" var="dp">
								<div onclick="titleD('${dp.deptNo}','${dp.deptTitle}','0','0','0')"><span>${dp.deptTitle}</span></div>
							</c:forEach>
						</div>
					</div>
					<div class="divPartSerT">
						<!-- 디폴트 -->
						<div class="defalutDepart filterCHange">필터</div>
						<!-- 클릭시 보인는 곳 -->
						<div class="departTitleList departTitleListtwo">
							<div onclick="filterDepartCh('직급순')"><span>직급순</span></div>
							<div onclick="filterDepartCh('이름순')"><span>이름순</span></div>
							<div onclick="filterDepartCh('입사순')"><span>입사순</span></div>
						</div>
					</div>
					<div class="divPartSerT">
						<!-- 디폴트 -->
						<div class="defalutDepart searchFilterL">검색</div>
						<!-- 클릭시 보인는 곳 -->
						<div class="departTitleList1 departTitleListthree">
							<div onclick="searchFilter('이름')"><span>이름</span></div>
							<div onclick="searchFilter('사원번호')"><span>사원번호</span></div>
						</div>
					</div>
					<div class="divPartSerT11">
						<!-- 디폴트 -->
						<div><input type="text" class="inputSearchMane defalutDepart1 defalutDepart42"></div>
						<div><input type="text" placeholder="숫자만 입력해주세요" class="inputSearchMane defalutDepart1 defalutDepart45" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></div>
						<div class="divImgWri"><img src="https://img.icons8.com/material/24/000000/search--v1.png"></div>
					</div>
				</div>
				<div class="headerNameSw"><span>2022년 06월</span></div>
			</div>
			<!-- 근태 수정 요청 부분 -->
			<div>
				<div class="thisWEdit"><span>금주 근태 수정 요청</span></div>
				
				<div class="underHivHeaved editAPert">
					<div>기안자</div>
					<div>기안일</div>
					<div>수정일</div>
					<div>기존 출근 시간</div>
					<div>기존 퇴근 시간</div>
					<div>수정 출근 시간</div>
					<div>수정 퇴근 시간</div>
					
				</div>

				<div class="editInfoScrollpart">
					<c:forEach items="${clist}" var="cl">
						<div class="editInfomationpart" >
							<input type="hidden" value="${cl.drafter}">
							<input type="hidden" value="${cl.docNo}">
							<div><span>${cl.drafterName}</span></div>
							<div><span>${cl.dftDate}</span></div>
							<div><span>${cl.updateDate}</span></div>
							<div><span>${cl.beAttendTime}</span></div>
							<div><span>${cl.beLeaveTime}</span></div>
							<div><span>${cl.attendTime}</span></div>
							<div><span>${cl.leaveTime}</span></div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 아래 부분  -->
			<div class="underHivHeaved">
				<div>이름</div>
				<div>이번주 누적 근무시간</div>
				<div>1주</div>
				<div>2주</div>
				<div>3주</div>
				<div>4주</div>
				<div>5주</div>
			</div>
			<div class="scrolldivse">
				<c:forEach items="${att}" var="a" varStatus="status" >
					<div class="underHivHeavedGet" onclick="selectDetailInfo('${a.empNo}')">
						<div class="underGetEmpName">
							<div>${a.empName}</div>
							<div>${a.cal} / ${a.status}</div>
						</div>
						<c:forEach items="${att2}"  var = "a2">
							<c:if test="${a.empNo eq a2.empNo }">
								<div>${a2.tot}</div>
							</c:if>
						</c:forEach>
						<div>${a.tot}</div>
						<div>${a.tot2}</div>
						<div>${a.tot3}</div>
						<div>${a.tot4}</div>
						<div>${a.tot5}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$(".page_title>.title_name").text("근태 관리 페이지");
		})
		
		$(".defalutDepart11").click(function(){
			event.stopPropagation();
			$(".departTitleListone").toggle();
			$(".departTitleListtwo").hide();
		})
		$(".filterCHange").click(function(){
			event.stopPropagation();
			$(".departTitleListtwo").toggle();
			$(".departTitleListone").hide();
		})
		/*디폴트로 사라지게*/
	    $(document).click(function(){
			$(".departTitleList").hide();
			$(".departTitleList1").hide();
		})
		
		$(".searchFilterL").click(function(){
			event.stopPropagation();
			$(".departTitleListthree").toggle();
			$(".departTitleList").hide();
			$(".departTitleListtwo").hide();
			$(".departTitleListone").hide();
		})
		function searchFilter(tex){
			event.stopPropagation();
	
			$(".searchFilterL").text(tex);
			
			if(tex=="사원번호"){
				
				$(".defalutDepart42").addClass("none");
				$(".defalutDepart45").addClass("block");
			}else{
				$(".defalutDepart42").removeClass("none");
				$(".defalutDepart45").removeClass("block");
			}
			$(".departTitleListthree").hide();	
			
			
		}
		function selectDetailInfo(empNo){
			location.href="selectDetailAttendLog.do?empNo="+empNo;
		}
		//수정 확인 버튼
		$(".editInfomationpart").click(function(){
			var name = $(this).children().eq(2).text();
			myConfirm("근태 수정", name+"님의 근태를 수정하시겠습니까?");
			//취소할 시 
			$(".false_btn").click(function() {
	    	    $("#helpmeCOnfirm").hide();
	    	});
		
			var drafter = $(this).children().eq(0).val();//기안자 
			var docNo = $(this).children().eq(1).val();//문서 번호
			var updateDate = $(this).children().eq(4).text();//수정일
			var attendTime = $(this).children().eq(7).text();//수정 출근
			var leaveTime = $(this).children().eq(8).text();//수정 퇴근 
	    	// 확인 클릭 시
	    	$(".true_btn").click(function() {
	    		$("#helpmeCOnfirm").hide();
	    		editFunction(drafter, docNo, updateDate, attendTime, leaveTime );//수정하는 함수 실행 
	    	});
		})
		
		function editFunction (drafter,docNo, updateDate, attendTime, leaveTime ){
			
			$.ajax({
				url:"updateAttendLogEdit.do",
				type:"post", 
				data:{drafter:drafter, docNo:docNo, updateDate:updateDate, attendTime:attendTime,leaveTime:leaveTime }, 
				success:function(result){
					location.reload();
				}
			})
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
		function titleD(deptNo, deptTitle, fil, ord, searchli){
			
			var ordq = $(".searchFilterL").text();//검색 div내용
			var fil2 = $(".filterCHange").text();//분류
			if(fil != '필터'){
				fil = fil2;
			}
			console.log(fil2)
			if(ord != 0){
				if(ordq =='검색'){
					myAlert("선택", "검색을 선택해주세요");
					return false;
				}else if(ordq == '이름'){
					searchli = $(".defalutDepart42").val();
				}else if(ordq == '사원번호'){
					searchli = $(".defalutDepart45").val();
				}
			}
			if(deptNo == 0){
				if($(".defalutDepart42").val() == null || $(".defalutDepart45").val() == null){
					ordq=null;
					searchli=null;
				}
			}
			$.ajax({
				url:"filterCheckAttendView.do", 
				type:"get", 
				data:{dep:deptTitle, depNo:deptNo, fil:fil2, ord:ordq, searchli:searchli},
				success:function(list){
					console.log(list)//들어옴
					if(list.lenght == 0){
						$(".scrolldivse").html('');
					}else if(list.length != 0){
					var value ="";
				
					$.each(list.att, function(i, obj){
						
						
						value += '<div class="underHivHeavedGet" onclick="selectDetailInfo('+obj.empNo+')">';
						value += '<div class="underGetEmpName">';
						value += '<div>'+obj.empName+'</div>';
						value += '<div>'+obj.cal+" / "+obj.status+'</div></div>';

						$.each(list.att2, function(k, ob){
						
						if(obj.empNo == ob.empNo){
							value += '<div>'+ob.tot+'</div>';
							
						}
						})
						value += '<div>'+obj.tot+'</div>';
						value += '<div>'+obj.tot2+'</div>';
						value += '<div>'+obj.tot3+'</div>';
						value += '<div>'+obj.tot4+'</div>';
						value += '<div>'+obj.tot5+'</div></div>';
						
						
					})	
					$(".scrolldivse").html(value);
					console.log("성공")
					$(".defalutDepart11").text(deptTitle);//박스 명 변경
					$(".filterCHange").text(fil2);
					$(".deptTitleNo").val(deptNo);//부서 번호 변경
					$(".departTitleListone").hide();//박스 사라지게 하기 
					$(".defalutDepart42").val('');//검색박스 사라지게 하기
					$(".defalutDepart45").val('');//사번박스 empty
					$(".searchFilterL").text('검색');
				}
					
				}
			})
			
		}
		//분류 클릭했을 시 
		function filterDepartCh(fil){
			console.log(fil)
			var dep = $(".defalutDepart11").text();
			var depNo = $(".deptTitleNo").val();
			
			var ordq = $(".searchFilterL").text();//검색 div내용
			var searchli ='';
			if(ordq =='검색'){
				searchli ='0';
				ordq = '0';
			}else if(ordq == '이름'){
				searchli = $(".defalutDepart42").val();
			}else if(ordq == '사원번호'){
				searchli = $(".defalutDepart45").val();
			}
			$(".filterCHange").text(fil);
			titleD(depNo, dep, fil,ordq , searchli);
		}
		
		$(".divImgWri").click(function(){
			var dep = $(".defalutDepart11").text();
			var depNo = $(".deptTitleNo").val();
			var fil = $(".filterCHange").text();//분류
			var ordq = $(".searchFilterL").text();//검색 div내용
			var searchli ='';
			if(ordq =='검색'){
				myAlert("선택", "검색을 선택해주세요");
			}else if(ordq == '이름'){
				searchli = $(".defalutDepart42").val();
				if(searchli == null ||searchli == ''){
					myAlert("선택", "검색 입력해주세요");
				}
			}else if(ordq == '사원번호'){
				searchli = $(".defalutDepart45").val();
				if(searchli == null ||searchli == ''){
					myAlert("선택", "검색 입력해주세요");
				}
			}
			$(".filterCHange").text(fil);
			titleD(depNo, dep, fil,ordq , searchli);
		})
	</script>
</body>
</html>