<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별 페이지</title>
<style type="text/css">
	.departMainDivBi{
		margin: 0 auto;
		padding-top: 40px;
		padding-left: 100px;
		padding-right: 100px;
	}
	.upperDivDepart{
		width: 100%;
		height: 37vh;
		display: flex;
		justify-content: space-between;
	}
	.lowerDivDepart{
		margin-top:15px;
		width: 100%;
		display:flex;
		height: 45vh;
		justify-content: space-between;
	}
	.annoDepartSection{
		width: 30%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	.boardDepartSection{
		width: 30%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	.memberDepartSection{
		width: 30%;
		border: 1px solid;
   	 	border-radius: 5px;
   	 	background-color:#f3f3f3;
   	 	padding: 15px;
	}
	.projectDepartSection{
		width: 64%;
		background-color:#f3f3f3;
		padding: 15px;
		border: 1px solid;
   	 	border-radius: 5px;
	}
	.certifiCSection{
		width: 30%;
		border: 1px solid;
   	 	border-radius: 5px;
   	 	background-color:#f3f3f3;
   	 	padding: 15px;
	}
	.projectSDi{
		overflow-y: scroll;
	}
	.projectSDi::-webkit-scrollbar{
    	display: none;
	}
	.chatDepartSection{
		width: 32%;
	}
	.annoDepartUpperS{
		display: flex;
		justify-content: space-between;
		height: 10%;
		margin-bottom: 5%;
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
	.imgSHowMOdalInfo::-webkit-scrollbar{
    	display: none;
	}
	.imgSHowMOdalInfo>div{
		flex: 1 1 30%;
	}
	
	.imgSHowMOdalInfo{
		height: 80%;
		display: flex;
		flex-wrap: wrap;
		overflow-y:scroll;
		text-align: center;
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
	.sectionChangeDi img{
		height: 10vh;
		width: 10vw;
		margin-bottom: 10px;
	}
	.style_depart_info {
		font-size: 18px;
	    box-shadow: 0 5px;
    	color: darkgray;
	}
	.radioBigDiv{
		margin-top: 30px;
   		line-height: 40px;
	}
	#input1{
	 	margin-top: 15px;
		width: 250px;
		height: 40px;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 3px solid;
	}
	#input2{
		margin-left:10px;
		margin-top:15px;
		width: 80px;
		height: 45px;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 3px solid;
		background-color: lightgray;
	}
	#input2:hover{
		cursor: pointer;
		background-color: darkgray;
	}
	.inputNUMBER{
		display: flex;
	}
	.certi_info_Depart{
		margin-top: 50px;
	}
</style>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../depart/InfoDepN.jsp"/>
	<jsp:include page="../manage/InfoForm.jsp"/>
	<div class="main_section ">
		<div class="departMainDivBi">
	        <div class="upperDivDepart">
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
	        	<!-- 부서게시판 -->
	        	<div class="boardDepartSection">
	        		<div class="annoDepartUpperS">
	        			<div class="annoDepart_Name"><span>부서 게시판</span></div>
	        			<div><a class="etcAnnoDepartSe" href="depart.do">>더보기</a></div>
	        		</div>
	        		<div class="annoDepartLowers">
	        			<c:forEach items="${blist}" var="bl">
							<div class="selectAnnoDepart"><a href="detailBoard.do?bno=${bl.writeno}&uno=${loginUser.empNo}">
								<div class="selectDepartContent">
									<div class="sectiontitlePartAnno">${bl.title}</div>
									<div>${bl.createDate}</div>
								</div>
							</a></div>
	        			</c:forEach>
	        		</div>
	        	</div>
	        	<!-- 팀원 전자모음 -->
	        	<div class="memberDepartSection">
	        		<div class="annoDepartUpperS">
	        			<div class="annoDepart_Name"><span>팀원 전자 명함</span></div>
	        		</div>
	        		<div class="annoDepartLowers imgSHowMOdalInfo">
	        			<c:forEach items="${mlist}" var="ml">
	        				<div class="sectionChangeDi" onclick ="showModalInfoIMG('${ml.empName}','${ml.phone}','${ml.email}')">
		        				<img src="${pageContext.servletContext.contextPath}/resources/upload_files/${ml.changeName}" width="20px">
	        					<div>${ml.empName}</div>
	        				</div>
	        			</c:forEach>
	        		</div>
	        	</div>
	        </div>
	        <div class="lowerDivDepart">
      			<!-- 프로젝트 -->
	        	<div class="projectDepartSection">
	        		<div class="annoDepartUpperS">
	        			<div class="annoDepart_Name"><span>프로젝트</span></div>
	        			<div><a class="etcAnnoDepartSe" href="gotoProjectPage.do">>더보기</a></div>
	        		</div>
	        		<div class="annoDepartLowers projectSDi">
	        			<c:forEach items="${plist}" var="pl">
							<div class="selectAnnoDepart"><a href="detailProject.do?pjno=${pl.proNo}">
								<div class="selectDepartContent">
									<div class="sectiontitlePartAnno">${pl.proTitle}</div>
									<div>${pl.proDate}</div>
								</div>
							</a></div>
	        			</c:forEach>
	        		</div>
	        	</div>
	        	<!-- 증명서 부분 -->
	        	<div class="certifiCSection">
					<div class="annoDepartUpperS ">
	        			<div class="annoDepart_Name"><span >재직 증명서</span></div>
	        		</div>
	        		<div class="certi_info_Depart">
	        			<div class="chooseFormDi"><span class="style_depart_info">용도를 선택해주세요</span></div>
	        			<div class="radioBigDiv">
		        			<div class="divraioPart"><span>금융기관 제출용</span></div>
		        			<div class="divraioPart"><span>관공서 제출용</span></div>
		        			<div class="divraioPart"><span>회사 제출용</span></div>
	        			</div>
	        			<div>
		        			<div class="inputNUMBER">
		        				<input type="text" placeholder="선택하신 용도가 나오는 창입니다." id ="input1" readonly="readonly">
		        				<div>
		        					<input type="button" value="선택" id="input2">
		        				</div>
	        				</div>
		        		</div>
	        		</div>
				</div>
	        </div>
        </div>
    </div> 
    <script>
    	function showModalInfoIMG(empName, phone, email){
    		console.log(empName)
    		console.log(phone)
    		console.log(email)
    		console.log($("#emp_name_modal"))
    		$(".emp_name_modal").text(empName);
    		$(".emp_phone_modal").text(phone);
    		$(".emp_email_modal").text(email);
    		$(".showModalInfoDepart").css("display","flex");
    		$(".showListDeptP").css("display","none");
    	}
    	$(".divraioPart").click(function(){
    		var text = $(this).text();	
    		$("#input1").val(text);
   		})
    	$("#input2").click(function(){
    		inputF();
    	})
    	
    	function inputF(){
			var empNo = ${loginUser.empNo};
			var val = $("#input1").val();
			//오늘 날짜
			var today = new Date();

			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '년 ' + month  + '월 ' + day +'일';
			console.log(empNo)
			$.ajax({
				url:"selectInfo.do", 
				type:"get", 
				data:{empNo:empNo}, 
				success:function(result){
					console.log("성공")
					if(result == null){
						myAlert("사번 오류", "입력하신 사번이 없습니다. 다시 입력해주세요");
						$("#input1").focus();
						$("#input1").val('');
					}else{
						$(".showModalInfoForm").css("display", "flex");
						$("#input1").val('');
						$(".name_part").text(result.empName);//성명
						$(".no_part").text(result.userNo);//주민번호 
						$(".address_part").text(result.address);//주소
						$(".depart_part").text(result.departmentName);//소속
						$(".job_part").text(result.jobName);//지위
						$(".work_part").text(result.changeName+" ~ 현재");//재직기간
						$(".why_part").text(val);//용도
						$(".cont_part").text(dateString);//현재 날짜
						
					}
					
				}, error:function(){
					
				}
			})
		}
    </script>
    	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
</body>
</html>