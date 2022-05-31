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
		width: 83vw;
	}
	.favProjectSection, .allProjectSection{
		display: flex;
		width: 100%;
	}
	.projectNameSection{
		font-size: 28px;
		width: 12%;
		margin-right:5%;
	}
	.flex-container, .flex-container1{
		display: flex;
    	flex-wrap: wrap;
    	width: 90%;
	}
	.flex-item, .createNewProject{
    	background-color: #e4e4e4;
    	height: 15vh;
    	width: 22%;
		margin: 15px;
		text-align: center;
		border-radius: 10px;
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
		width: 70%;
	}
	.titleDivpl{
		height: 25px;	
		-webkit-line-clamp: 1 ;
		white-space : nowrap;
		text-overflow: ellipsis;
		text-align: left;
	}
	.fullButtonStar{
		display: none;
		z-index: 99;
		width: 40px;
		height: 40px;
	}
	.emptyButtonStar{
		z-index: 99;
		width: 45px;
		height: 45px;
	}
	.attendProjectSum{
		float: left;
    	margin-top: 18%;
   	 	margin-left: 5%;
   	 	font-size: 17px;
	}
	#emptyP{
		display: none;
	}
	#favP{
		display: block;
	}
	.flex-item:hover{
		border: 2px solid gray;
		cursor: pointer;
		transition: border 0.3s;
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
        		<div class="flex-container1">
        			<div class="flex-item">
        				<div class='projectNameandbutton'>
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
        			<div class="createNewProject">
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
		$(function(){
    		selectProjectList();
    		selectFavList();
		})
    	$(".cNPchangeButton").click(function(){
    		$(".cNPchangeButton").css("display","none");
    		$(".MakeNewProject").css("display","block");
    	})
    	$(function(){
    		
    		$(".projectinPro").click(function(){
    			   $("#inputProject").submit();
    		})
    		
    	})
    	//내모든 프로젝트 보이기
    	function selectProjectList(){
    		$(".flex-container1").empty();
    		var emno = ${loginUser.empNo};//회원번호
    		$.ajax({
    			url:"selectProjectList.do", 
    			data:{emno:emno}, 
    			type:"get", 
    			success:function(list){
    				var value="";
    			
    				$.each(list, function(i, obj){
    					value += "<div class='flex-item'><div class='projectNameandbutton'>"+
    							"<span class='maProject'><div class='titleDivpl'>" + obj.proTitle + "</div></span>"+
    							"<div class='emptyButtonStar' id="+obj.proNo+'emp'+"><img src='${ pageContext.servletContext.contextPath }/resources/images/emptyStar.png'  width='40' onclick='addFav("+obj.proNo+"); notuse(event);'></div>"+
    							"<div class='fullButtonStar' id="+obj.proNo+'full'+"><img src='${ pageContext.servletContext.contextPath }/resources/images/fullStar.png'  width='40' onclick='deletFav("+obj.proNo+")'></div>"+
    							"<input type='hidden' class='projectProNo' value="+obj.proNo+">"+
    							"</div>"+
    							"<div class='attendProjectSum'>참석 인원: "+obj.count + " 명</div></div>";
    				})
    				$(".flex-container").prepend(value);
    				selectFavList();
    			}, error:function(){
    				console.log("프로젝트 가져오는 것 실패")
    			}
    		})
    	}
	   $(".can_project").click(function(){
		   $(".projectInputSection").val("");
		   $(".cNPchangeButton").css("display","block");
   			$(".MakeNewProject").css("display","none");
	   })
	   
	   //빈 별을 클릭하였을 시에
	   function addFav(num){
		   
		   $(".flex-container1").empty();
		   var emno = ${loginUser.empNo};//로그인 유저 번호
		   $.ajax({
			   url:"insertProjectFav.do", 
			   type:"post", 
			   data:{prno:num, emno:emno}, 
			   success:function(result){
				   if(result>0){
					   selectFavList(); 
				   }
			   },error:function(){
				   console.log("실패")
			   }
		   })
		   
	   }
	//즐겨찾기 가져오기
	 function selectFavList(){
		 $(".flex-container1").empty();
		
		   var emno = ${loginUser.empNo};//로그인 유저 번호
		   $.ajax({
			   url:"selectFavProjectList.do",
			   type:"get", 
			   data:{emno:emno}, 
			   success:function(list){
				   var value="";
    				$.each(list, function(i, obj){
    					value += "<div class='flex-item'><div class='projectNameandbutton'>"+
    							"<span class='maProject'><div class='titleDivpl'>" + obj.proTitle + "</div></span>"+
    							"<div class='emptyButtonStar' id='emptyP'><img src='${ pageContext.servletContext.contextPath }/resources/images/emptyStar.png'  width='40' onclick='addFav("+obj.proNo+")'></div>"+
    							"<div class='fullButtonStar' id='favP'><img src='${ pageContext.servletContext.contextPath }/resources/images/fullStar.png'  width='40' onclick='deletFav("+obj.proNo+")'></div>"+
    							"<input type='hidden' class='projectProNo' value="+obj.proNo+">"+
    							"</div>"+
    							"<div class='attendProjectSum'>참석 인원: "+obj.count + " 명</div></div>";
    							$("#"+obj.proNo+"full").css("display","block");
		    					 $("#"+obj.proNo+"emp").css("display","none");
    				})
    				$(".flex-container1").empty();
    				$(".flex-container1").prepend(value);
    				}, error:function(){
				   console.log("실패")
			   }
		   })
		   
	   }
		 
	   //즐겨찾기 취소
	  function deletFav(num){
		   var emno =${loginUser.empNo};//로그인 유저번호
		   $.ajax({
			   url:"deleteProjectFav.do", 
			   type:"post", 
			   data:{emno:emno, prno:num},
			   success: function(result){
				   if(result>0){
					   $("#"+num+"emp").css("display","block");
					 	$("#"+num+"full").css("display","none");
					  location.reload();
				   }				 
				
			   },error:function(){
				   console.log("실패")
			   }
		   })
	  }
  	
	$(document).on("click",".flex-item",function(){
		
		var pjno= $(this).children().children().eq(3).val();
		console.log(pjno)
		location.href = "detailProject.do?pjno="+pjno;
	});
	function notuse(event){
		event.stopPropagation()
	}
			
 
    </script>
</body>
</html>