<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사정보 페이지</title>
<style type="text/css">
	.DeptInfoMainDIve{
		margin: 0 auto;
		padding: 50px 100px 40px 100px;
	}
	.upperDeptinfo{
		margin-bottom: 50px;
	}
	.findInfo{
		text-align: right;
	}
	.headerNameSw{
		font-size: 25px;
	}
	.mainDeptHeader{
		font-size: 21px;
		width: 100%;
		height: 5vh;
		border-top: 1px solid;
		border-bottom: 1px solid;
		display: flex;
		flex-wrap: wrap;
		align-content: center;
		text-align: center;
	}
	.fir{
		width: 16%;
	}
	.seed{
		width: 17%;
	}
	.mainDeptHeader2{
		width: 100%;
		height: 5vh;
		display: flex;
		flex-wrap: wrap;
		align-content: center;
		text-align: center;
	}
	.mainDeptHeader2:hover{
		cursor: pointer;
		background-color: rgb(174, 217, 248);
	}
	.mainSecScroll{
		height: 60vh;
		overflow-y: scroll;
		border: 1px solid;
	}
	.mainSecScroll::-webkit-scrollbar{
    	display: none;
	}
	.InforDepartBuDiv{
		margin-top: 30px;
		text-align: right;
	}
	.InforDepartBu{
		width: 10%;
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
	.defalutDepart1{
		border: 1px solid lightgrey;
		border-radius: 5px;
		height: 27px;
	    width: 270px;
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
	.divImgWri{
		transform: translateY(4px);
	}
	.noInfo{
		text-align: center;
		font-size: 20px;
		margin-top: 20px;
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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section ">
		<div class="DeptInfoMainDIve">
			<!-- upper -->
			<div class="upperDeptinfo">
				<div class="searchTitleDivSe">
					<div class="divPartSerT">
						<!-- 디폴트 -->
						<div class="defalutDepart defalutDepart11">부서 분류</div>
						<input type="hidden" class="deptTitleNo" >
						<!-- 클릭시 보인는 곳 -->
						<div class="departTitleList departTitleListone">
							<div onclick="titleD('0','전체')"><span>전체</span></div>
							<c:forEach items="${dplist}" var="dp">
								<div onclick="titleD('${dp.deptNo}','${dp.deptTitle}')"><span>${dp.deptTitle}</span></div>
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
				<div class="headerNameSw"><span>${d.deptTitle}</span></div>
			</div>
			<!-- mainPart -->
			<div class="mainProdiv">
				<div>
					<div class="mainDeptHeader">
						<div class="fir">이름</div>
						<div class="seed">사원 번호</div>
						<div class="seed">전화 번호</div>
						<div class="seed">부서명</div>
						<div class="fir">직급</div>
						<div class="seed">입사 날짜</div>
					</div>
					<div class="mainSecScroll">
					<c:forEach items="${mlist}" var="ml">
						<div class="mainDeptHeader2" onclick = "detailInfoMember('${ml.empNo}')">
							<div class="fir firstOne"> ${ml.empName}</div>
							<div class="seed SecondOne"> ${ml.empNo}</div>
							<div class="seed ThirdOne"> ${ml.phone}</div>
							<div class="seed FourOne"> ${ml.departmentName}</div>
							<div class="fir FiftHone"> ${ml.jobName}</div>
							<div class="seed Sixone"> ${ml.hireDate}</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
			<!-- 버튼 부분 -->
			<div class="InforDepartBuDiv">
				<button type="button" class="commonButton1 InforDepartBu"> 메인페이지로</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$(".page_title>.title_name").text("인사 정보 페이지");
		})
		$(".defalutDepart11").click(function(){
				$(".departTitleListone").addClass("block");
		})
		$(".filterCHange").click(function(){
				$(".departTitleListtwo").addClass("block");
		})
		$(".searchFilterL").click(function(){
				$(".departTitleListthree").addClass("block");
		})
		$(".InforDepartBu").click(function(){
			location.href="manangeMain.do?departmentNo=${loginUser.departmentNo}&userNo=${loginUser.empNo}";
		})
		
		function titleD(deptNo, deptTitle){
			$(' .mainSecScroll').removeClass("noInfo");
			$.ajax({
				url:"filterCheck.do",
				type:"get",
				data:{dep:deptTitle, depNo:deptNo},
				success:function(list){
					$tableBody = $(' .mainSecScroll');
					$tableBody.html('');
					if(list.length ==0){
						var $tt=$("<div>").text("사원 없음").addClass("noInfo");
						$tableBody.append($tt);
					}else if(list.length != 0){
						$.each(list, function(i, obj){
							var $tr = $('<div  onclick = "detailInfoMember('+obj.empNo+')">').addClass("mainDeptHeader2");
							var $dTitle = $('<div>').text(obj.empName).addClass("fir");
							var $dWriterName = $('<div>').text(obj.empNo).addClass("seed");
							var $dwatcher = $('<div>').text(obj.phone).addClass("seed");
							var $dAnnoDate = $('<div>').text(obj.departmentName).addClass("seed");
							var $dAnnoNo = $('<div>').text(obj.jobName).addClass("fir");
							var $dAnnoW = $('<div>').text(obj.hireDate).addClass("seed");
							$tr.append($dTitle);
							$tr.append($dWriterName);
							$tr.append($dwatcher);
							$tr.append($dAnnoDate);
							$tr.append($dAnnoNo);
							$tr.append($dAnnoW);
							$tableBody.append($tr);
							
						})
					}
					$(".defalutDepart11").text(deptTitle);
					$(".deptTitleNo").val(deptNo);
					$(".departTitleListone").removeClass("block");
					$(".headerNameSw").text(deptTitle);
				}
			})
		}
		function filterDepartCh(con){
			var dep = $(".defalutDepart11").text();
			var depNo = $(".deptTitleNo").val();
			if(dep=="부서 분류"){
				dep = '${d.deptTitle}';
				depNo = ${d.deptNo};
			}
			
			$(' .mainSecScroll').removeClass("noInfo");
			$.ajax({
				url:"filterCheck.do",
				type:"get",
				data:{dep:dep, depNo:depNo, fil:con},
				success:function(list){
					$tableBody = $(' .mainSecScroll');
					$tableBody.html('');
					if(list.length ==0){
						var $tt=$("<div>").text("사원 없음").addClass("noInfo");
						$tableBody.append($tt);
					}else if(list.length != 0){
						$.each(list, function(i, obj){
							var $tr = $('<div onclick = "detailInfoMember('+obj.empNo+')">').addClass("mainDeptHeader2");
							var $dTitle = $('<div>').text(obj.empName).addClass("fir");
							var $dWriterName = $('<div>').text(obj.empNo).addClass("seed");
							var $dwatcher = $('<div>').text(obj.phone).addClass("seed");
							var $dAnnoDate = $('<div>').text(obj.departmentName).addClass("seed");
							var $dAnnoNo = $('<div>').text(obj.jobName).addClass("fir");
							var $dAnnoW = $('<div>').text(obj.hireDate).addClass("seed");
							$tr.append($dTitle);
							$tr.append($dWriterName);
							$tr.append($dwatcher);
							$tr.append($dAnnoDate);
							$tr.append($dAnnoNo);
							$tr.append($dAnnoW);
							$tableBody.append($tr);
							
						})
					}
					$(".filterCHange").text(con);
					$(".departTitleListtwo").removeClass("block");
				}
			})

		}
		function searchFilter(tex){
			$(".searchFilterL").text(tex);
			$(".departTitleListthree").removeClass("block");
			if(tex=="사원번호"){
				$(".defalutDepart42").addClass("none");
				$(".defalutDepart45").addClass("block");
			}else{
				$(".defalutDepart42").removeClass("none");
				$(".defalutDepart45").removeClass("block");
			}
		}
		$(".divImgWri").click(function(){
			var dep = $(".defalutDepart11").text();
			var depNo = $(".deptTitleNo").val();
			if(dep=="부서 분류"){
				dep = '${d.deptTitle}';
				depNo = ${d.deptNo};
			}
			var fil = $(".filterCHange").text();
			var ord = $(".searchFilterL").text();
			var con ='';
			if(ord =='검색'){
				myAlert("선택", "검색을 선택해주세요");
			}else if(ord == '이름'){
				con = $(".defalutDepart42").val();
			}else if(ord == '사원번호'){
				con = $(".defalutDepart45").val();
			}
			
			$(' .mainSecScroll').removeClass("noInfo");
			$.ajax({
				url:"filterCheck.do",
				type:"get",
				data:{dep:dep, depNo:depNo, fil:fil, ord:ord, searchli:con},
				success:function(list){
					$tableBody = $(' .mainSecScroll');
					$tableBody.html('');
					if(list.length ==0){
						var $tt=$("<div>").text("사원 없음").addClass("noInfo");
						$tableBody.append($tt);
					}else if(list.length != 0){
						$.each(list, function(i, obj){
							var $tr = $('<div onclick = "detailInfoMember('+obj.empNo+')">').addClass("mainDeptHeader2");
							var $dTitle = $('<div>').text(obj.empName).addClass("fir");
							var $dWriterName = $('<div>').text(obj.empNo).addClass("seed");
							var $dwatcher = $('<div>').text(obj.phone).addClass("seed");
							var $dAnnoDate = $('<div>').text(obj.departmentName).addClass("seed");
							var $dAnnoNo = $('<div>').text(obj.jobName).addClass("fir");
							var $dAnnoW = $('<div>').text(obj.hireDate).addClass("seed");
							$tr.append($dTitle);
							$tr.append($dWriterName);
							$tr.append($dwatcher);
							$tr.append($dAnnoDate);
							$tr.append($dAnnoNo);
							$tr.append($dAnnoW);
							$tableBody.append($tr);
							
						})
					}
					$(".inputSearchMane").val('');
				}
			})
		})
		//상세페이지 이동
		function detailInfoMember(empNo){
			location.href="detailInfoMem.do?empNo="+empNo;
		}
	</script>
</body>
</html>