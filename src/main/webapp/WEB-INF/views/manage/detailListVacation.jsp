<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 상세페이지</title>
<style type="text/css">
	.vacationSection{
		margin: 0 auto;
		padding: 50px 100px 50px 100px ;
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
	.departTitleList::-webkit-scrollbar{
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
	.defalutDepart1{
		border: 1px solid lightgrey;
		border-radius: 5px;
		height: 27px;
	    width: 270px;
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
		.defalutDepart45{
		display: none;
	}
	.block{
		display: block !important;
	}
	.none{
		display: none;
	}
	.divPartSerT11{
		display: flex;
		margin-left: 15px;
	}
	.divPartSerT11 img{
		transform:translateY(5px);
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
	.underHivHeaved div{
		flex: 1;
	    text-align: center;
	    height: 30px;
	    line-height: 30px;
	}
	.scrolldivse{
	 	overflow-y:scroll;
	 	height: 350px;
	}
	.scrolldivse::-webkit-scrollbar{
    	display: none;
	}
	.editInfoScrollpart{
		overflow-y:scroll;
		height: 250px;
	}
	.editInfoScrollpart::-webkit-scrollbar{
    	display: none;
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
	.thisWEdit{	
		font-size: 18px;
	    font-weight: 550;
	    margin-bottom: 15px;
	}
	.noInfo{
		text-align: center;
		font-size: 20px;
		margin-top: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section ">
		<div class= "vacationSection">
		<!-- upper -->
			<div class="upperDeptinfo">
				<div class="searchTitleDivSe">
					<div class="divPartSerT">
						<!-- 디폴트 -->
						<div class="defalutDepart defalutDepart11">부서 분류</div>
						<input type="hidden" class="deptTitleNo" value="3" >
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
			</div>
			<!-- main -->
			<!-- 이번주 사용 내역 -->
			<div>
				<div class="thisWEdit"><span>이번주 사용 내역</span></div>
				
				<div class="underHivHeaved editAPert">
					<div>이름</div>
					<div>휴가 종류</div>
					<div>연차 사용기간</div>
					<div>사용 연차</div>
				</div>
				<div class="editInfoScrollpart">
					<c:forEach items="${lf}" var="cl">
						<div class="editInfomationpart" >
							<div><span>${cl.drafterName}</span></div>
							<div><span>${cl.vacType}</span></div>
							<c:if test="${cl.vacType eq '오전반차' or cl.vacType eq '오후반차' }">
								<div><span>${cl.startDate}</span></div>
							</c:if>
							<c:if test="${cl.vacType ne '오전반차' and cl.vacType ne '오후반차' }">
								<div><span>${cl.startDate} ~ ${fn:substring(cl.endDate, 0, 11)}</span></div>
							</c:if>
							<c:if test="${cl.vacType eq '오전반차' or cl.vacType eq '오후반차' }">
								<div><span>0${cl.vacUseDays}</span></div>
							</c:if>
							<c:if test="${cl.vacType ne '오전반차' and cl.vacType ne '오후반차' }">
								<div><span>${cl.vacUseDays}</span></div>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="vacationdiv underHivHeaved">
       			<div>이름</div>
       			<div>총연차</div>
       			<div>사용 연차</div>
       			<div>잔여 연차</div>
       		</div>
       		<div class="vacationmainDiv listVa scrolldivse">
       			<c:forEach items="${vi}" var="vi">
       				<div class="vacationListDiv underHivHeavedGet">
       					<div>${vi.empName}</div>
       					<div>${vi.totTyear}</div>
       					<div>${vi.useDayoff}</div>
       					<div>${vi.totDayoff}</div>
       				</div>
       			</c:forEach>
       		</div>
		</div>
	</div>
	<script type="text/javascript">
	
		$(function(){
			$(".page_title>.title_name").text("휴가 관리 페이지");
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
		function titleD(deptNo, deptTitle, fil, ord, searchli){
			var ordq = $(".searchFilterL").text();//검색 div내용
			var fil2 = $(".filterCHange").text();//분류
			if(fil != '필터'){
				fil = fil2;
			}
			if(ord != 0){
				if(ordq =='검색'){
					//myAlert("선택", "검색을 선택해주세요");
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
			var depNo = deptNo;
			$.ajax({
				url:"filterListVacation.do", 
				type:"get", 
				data:{dep:deptTitle, depNo:depNo, fil:fil2, ord:ordq, searchli:searchli},
				success:function(list){
					$tableBody = $(' .vacationmainDiv');
					$tableBody.html('');
					if(list.lenght == 0){
						var $tt=$("<div>").text("사원 없음").addClass("noInfo");
						$tableBody.append($tt);
						$(".defalutDepart42").val('');
						$(".defalutDepart45").val('');
					}else if(list.length != 0){
					
					$.each(list, function(i, obj){
					
						var $tr = $('<div>').addClass("underHivHeavedGet").addClass("vacationListDiv");
						var $dTitle = $('<div>').text(obj.empName);
						var $dWriterName = $('<div>').text(obj.totTyear);
						var $dwatcher = $('<div>').text(obj.useDayoff);
						var $dAnnoDate = $('<div>').text(obj.totDayoff);
						$tr.append($dTitle);
						$tr.append($dWriterName);
						$tr.append($dwatcher);
						$tr.append($dAnnoDate);
						$tableBody.append($tr);
						$(".defalutDepart42").val('');
						$(".defalutDepart45").val('');
						
					})	
					$(".defalutDepart11").text(deptTitle);
					$(".deptTitleNo").val(deptNo);
					$(".departTitleListone").hide();
				
				}
					
				}
			})
		}
		//분류 클릭했을 시 
		function filterDepartCh(fil){
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