<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 페이지</title>
<style type="text/css">
	.projectBigDiv{
		border: 1px solid;
		width: 83vw;
	}
	.favProjectSection, .allProjectSection{
		border: 2px solid blue;
		display: flex;
		width: 100%;
	}
	.projectNameSection{
		font-size: 28px;
		width: 12%;
		margin-right:5%;
	}
	.flex-container{
		display: flex;
    	flex-wrap: wrap;
    	width: 90%;
	}
	.flex-item{
    	background-color: #e4e4e4;
    	height: 15vh;
    	width: 22%;
		margin: 15px;
		text-align: center;
	}
	.allProjectSection{
		margin-top: 10px;
	}
	.MakeNewProject{
		display: none;
		height: 100%;
		line-height: normal;
	}
	.projectInputSection{
		height: 36px;
   	 	width: 80%;
    	margin-top: 5px;
	}
	.MakeNewProject .makeNemProjectLa{
		font-size: 20px;
		float:left;
		margin-left: 10px;
		margin-top: 10px;
	}
	.buttonSectionSimple{
		margin-top:5px;
		height: 50px;
	}
	.buttonSectionSimpleBu1, .buttonSectionSimpleBu2{
		height: 35px;
		width: 70px;
	}
	.cNPchangeButton{
		line-height: 19vh;
	}
	.emptyButtonStar, .fullButtonStar{
		float: right;
		margin-top:5px;
		margin-right:5px;
	}
	.emptyButtonStar:hover, .cNPchangeButton:hover, .fullButtonStar:hover{
		cursor: pointer;
	}
	.maProject{
		font-size: 20px;
		float: left;
		margin-top:15px;
		margin-left:10px;
		-webkit-line-clamp: 1 ;
		white-space : nowrap;
		width: 70%;
		word-wrap: break-word;
		text-overflow: ellipsis;
	}
	.fullButtonStar{
		display: none;
	}
	.attendProjectSum{
		float: left;
    	margin-top: 18%;
   	 	margin-left: 5%;
   	 	font-size: 17px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="projectBigDiv">
        	<!-- 즐겨찾기 부분 -->
        	<div class="favProjectSection">
        		<!-- 이름 부분 -->
        		<div class="projectNameSection">
        			<span> 즐겨 찾기 </span>
        		</div>
        		<!-- 프로젝트 부분 -->
        		<div class="flex-container">
        			<div class="flex-item">
        				<div>
        				<span class="maProject"> 프로젝트 이름이름을미우ㅐㅜ </span>
        				<a class="emptyButtonStar"><img src="${ pageContext.servletContext.contextPath }/resources/images/emptyStar.png"  width="40"></a>
        				<a class="fullButtonStar"><img src="${ pageContext.servletContext.contextPath }/resources/images/fullStar.png"  width="40"></a>
        				</div>
        				<div class="attendProjectSum">참석 인원 : 명</div>
        			</div>
        		</div>
        	</div>
        	<!-- 일반 프로젝트 부분 -->
        	<div class="allProjectSection">
        		<!-- 이름 부분 -->
        		<div class="projectNameSection">
        			<span> 내 프로젝트 </span>
        		</div>
        		<!-- 프로젝트 부분 -->
        		<div class="flex-container">
        			<div class="flex-item createNewProject">
        				<a class="cNPchangeButton"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png"></a>
        				<div class="MakeNewProject">
        					<div>
        						<label class="makeNemProjectLa"> 프로젝트 이름 </label>
        					</div>
        					<div>
	        					<form action="insertDepartProject.do" id ="inputProject" method="post">
		        					<input placeholder="프로젝트 이름을 입력해주세요" type="text" id="title" name="proTitle" class="projectInputSection">
		        					<input type="hidden" id="writer" name="proWriter" value ="${loginUser.empNo}">
			              			<input type="hidden" id="depart" name="proDepart" value="${loginUser.departmentNo}">
	        					</form>
        					</div>
        					<div align="center" class="buttonSectionSimple">
								<button type="submit" class="commonButton1 buttonSectionSimpleBu1 projectinPro" style="line-height:20px;">등록하기</button>
								<button type="button" class="commonButton1 buttonSectionSimpleBu2 can_project" style="line-height:20px;">취소하기</button>
							</div>
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
    </div> 
    <script type="text/javascript">
    	$(".cNPchangeButton").click(function(){
    		$(".cNPchangeButton").css("display","none");
    		$(".MakeNewProject").css("display","block");
    	})
    	$(function(){
    		selectProjectList();
    		$(".projectinPro").click(function(){
    			   $("#inputProject").submit();
    		})
    		
    	})
    	/*function selectProjectList(){
    		var emno = ${loginUser.empNo};//회원번호
    		$.ajax({
    			url:"selectProjectList.do", 
    			data:{emno:emno}, 
    			type:"get", 
    			success:function(list){
    				var value="";

    				$.each(list, function(i, obj){
    					value += "<div>"
    				})
    			}, error:function(){
    				console.log("프로젝트 가져오는 것 실패")
    			}
    		})
    	}*/
	   $(".can_project").click(function(){
		   $(".projectInputSection").val("");
		   $(".cNPchangeButton").css("display","block");
   			$(".MakeNewProject").css("display","none");
	   })
	   
	   $(".emptyButtonStar").click(function(){
    		$(".emptyButtonStar").css("display","none");
    		$(".fullButtonStar").css("display","block");
    	})
    	
	   $(".fullButtonStar").click(function(){
	   		$(".fullButtonStar").css("display","none");
	   		$(".emptyButtonStar").css("display","block");
	   })
	   
    </script>
</body>
</html>