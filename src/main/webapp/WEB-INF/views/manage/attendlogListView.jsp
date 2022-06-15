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
		padding: 100px;
		border: 1px solid;
	}
	.upperDeptinfo{
		margin-bottom: 50px;
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
	.underHivHeaved{
		display: flex;
		width: 100%;
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
				<div class="headerNameSw"><span>2022-06</span></div>
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
		
	</script>
</body>
</html>