<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세 페이지</title>
<style type="text/css">
	.projectDetailBid{
		margin: 0 auto;
		padding: 100px;
	}
	.project_detailContain{
		width: 100%;
		flex-wrap: wrap;
		display: flex;
    	align-items: flex-start;
	}
	.divonewP, .divtwowP, .divthreewP, .divfourwP{
		background-color: #e4e4e4;
    	width: 23%;
		margin: 13px;
		text-align: center;
	}
	.detailNameHea{
		margin-top:15px;
		text-align:left;
		font-size: 23px;
		padding-left: 15px;
	}
	.plusNewSemiBu{
		border:1px solid blue;
		text-align: -webkit-center;
		margin-top:20px;
		margin-bottom: 20px;
	}
	.innerNewSeim{
		background-color: #40A0FF;
		width: 90%;
	}
	.nameandControl{
		display: flex;
		width: 100%;
	}
	.tollgeimg{
		float: right;
		width: 13%;
		margin-top:15px;
	}
	.detailNameHea{
		width: 87%;
	}
	.mainshowSection{
		margin-top: 10px;
		text-align: -webkit-center;
	}
	.semiProjectInput{
		height: 40px;
	    width: 87%;
	    text-align: -webkit-auto;
	    border: 1px solid white;
	}
	.insertSemiProjectSection{
		text-align: center;
		display: none;
	}
	.buttonSectionsemiBu1, .buttonSectionsemiBu2{
		margin-top:10px;
		height: 30px;
		width: 80px;
	}
	.controlAnnoDetail>li{
		background-color:white;
		width:90px;
		height:25px;
		text-align:center;
		transform:translateX(-60px);
		z-index:99;
		padding-top:6px;
	}
	.controlAnnoDetail li:hover{
		background-color: #85cdff;
		color: white;
		cursor: pointer;
	}
	.controlAnnoDetail{
		display: none;
		position: absolute;
	}
	.semiProjectDIv{
		background-color: white;
		height: 40px;
	    width: 89%;
	    text-align: -webkit-auto;
	    margin-bottom:10px;
	    line-height: 20px;
	    overflow-y: scroll;
		text-overflow: ellipsis;
	}
	.semiProjectDIv::-webkit-scrollbar{
    	display: none;
	}
	.semiProjectDIv:hover{
		cursor: pointer;
		background-color: lightgray;
		color: white;
	}
	.selectAddPer{
		height: 50vh;
	    border: 1px solid;
	    position: absolute;
	    width: 15vw;
	    background-color: white;
	}
	.alreadyAttend, .addAttendPre{
		height: 50%;
		margin-left:5px;
		margin-right:5px;
	}
	.selectAttenderP{
		font-size: 20px;
		padding-bottom: 10px;
		margin-bottom:5px;
		border-bottom: 1px solid;
	}
	.attendDiVn{
		margin-top: 10px;
	}
	.attendPersonemp{
		padding-bottom: 5px;
		display: flex;
	}
	.deleteWatcherDIv, .deleteWatcherDIvw{
		margin-left: 10px;
		padding-top: 2px;
	}
	.deleteWatcherDIv:hover, .deleteWatcherDIvw:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../depart/projectTargetEditModal.jsp"></jsp:include>
	<jsp:include page="../depart/detailSemiProject.jsp"></jsp:include>
	<div class="main_section">
        <div class="projectDetailBid">
        	<div class="addProjectP">
				<div class="imgClickBu"><img src="${ pageContext.servletContext.contextPath }/resources/images/addP.png" alt=""></div>
				<div class="selectAddPer" id = "selectAddPer" style="display:none;">
					<div class="alreadyAttend">
						<div class="selectAttenderP attendDiVn"><span>참여자</span></div>
						<c:forEach items="${list}" var="li">
							<div class="list${li.empNo} attendPersonemp">
								<div><span>${li.empName} ${li.jobName} _${li.address}</span></div>
								<c:if test = "${p.proWriter ne li.empNo  && loginUser.empNo ne li.empNo}">
								<div class="deleteWatcherDIv" onclick="deleteAttendP('${li.empNo}')"><img src="${ pageContext.servletContext.contextPath }/resources/images/close.png" alt="" width="15"></div>
								</c:if>
							</div>
						</c:forEach>
					</div>
					<div class="addAttendPre">
						<div class="selectAttenderP"><span>멤버 추가</span></div>
						<c:forEach var="tl" items="${tlist}" >
								<div class="list${tl.empNo} attendPersonemp">
									<div><span>${tl.empName} ${tl.email} _${tl.status}</span></div>
									<div class="deleteWatcherDIvw" onclick="addwatcherP('${tl.empNo}')"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" alt="" width="15"></div>
								</div>
						</c:forEach>
					</div>
				</div>
        	</div>
        	<input type="hidden" id= "proTitleName" value="${p.proTitle}"> 
        	<div class="project_detailContain">
	        	<div class="divonewP">
	        		<div class="nameandControl">
	        			<div class="detailNameHea">${pc.pcOne}</div>
	        			<div class="tollgeimg">
		        			<ul>
		        				<li><a href="#" class="imagehamburger" onclick="openBurger('openBurger1')"><img src="${ pageContext.servletContext.contextPath }/resources/images/menupro.png" width="30"/></a>
		        					<ul class="controlAnnoDetail " id="openBurger1">
				        				<li><a onclick="postFormSubmit111(1,1,'${pc.pcOne}');">수정</a></li>
				        				<li><a onclick="postFormSubmit111(2,1,'${pc.pcOne}');">삭제</a></li>
				        			</ul>
		        				</li>
		        			</ul>
	        			</div>
	        		</div>
	        		<div class="mainshowSection">
	        			<!-- 세부 프로젝트 -->
	        			<c:forEach items="${slist}" var="sl">
	        				<c:if test="${sl.refPc eq pc.pcOne}">
	        					<div class="slist${sl.semiNo} semiProjectDIv" onclick="selectSemiDetailPro('${sl.semiNo}')">
	        						<p title="스크롤 내려보세요">${sl.semiTitle}</p>
	        					</div>
	        				</c:if>
	        			</c:forEach>
	        			<!-- 세부 프로젝트 작성 폼 -->
	        			<div class="insertSemiProjectSection inputSemisePro1" id = "inputSemisePro1">
	        				<form action="insertSemiPro.do" id ="inputSemiPro1" method="post">
	        					<input placeholder="세부 프로젝트명 작성" type="text" id="title" name="semiTitle" class="semiProjectInput">
	        					<input type="hidden" id="writer" name="semiWriter" value ="${loginUser.empNo}">
		              			<input type="hidden" id="refpc" name="refPc" value="${pc.pcOne}">
		              			<input type="hidden" id="refpro" name="refPro" value ="${p.proNo}">
        					</form>
        					<div align="center" class="buttonSectionSimple">
								<button type="submit" class="commonButton1 buttonSectionsemiBu1 projectinPro" style="line-height:20px;" onclick="submitForm('inputSemiPro1')">등록하기</button>
								<button type="button" class="commonButton1 buttonSectionsemiBu2 can_project" style="line-height:20px;" onclick="closeSemiInsert('inputSemisePro1','innerNewSeim1')">취소하기</button>
							</div>
	        			</div>
	        		</div>
	        		<div class="plusNewSemiBu">
	        			<div class="innerNewSeim" id="innerNewSeim1" onclick="openSemiInsert('inputSemisePro1','innerNewSeim1')"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="35"></div>
	        		</div>
	        	</div>
	        	<div class="divtwowP">
	        		<div class="nameandControl">
	        			<div class="detailNameHea"><p>${pc.pcTwo}</p></div>
	        			<div class="tollgeimg">
		        			<ul>
		        				<li><a href="#" class="imagehamburger" onclick="openBurger('openBurger2')"><img src="${ pageContext.servletContext.contextPath }/resources/images/menupro.png" width="30"/></a>
		        					<ul class="controlAnnoDetail " id="openBurger2">
				        				<li><a onclick="postFormSubmit111(1,2,'${pc.pcTwo}');">수정</a></li>
				        				<li><a onclick="postFormSubmit111(2,2,'${pc.pcTwo}');">삭제</a></li>
				        			</ul>
		        				</li>
		        			</ul>
	        			</div>
	        			</div>
	        		<div class="mainshowSection">
	        			<!-- 세부 프로젝트 -->
	        			<c:forEach items="${slist}" var="sl">
	        				<c:if test="${sl.refPc eq pc.pcTwo}">
	        					<div class="slist${sl.semiNo} semiProjectDIv" onclick="selectSemiDetailPro('${sl.semiNo}')">
	        						<p title="스크롤 내려보세요">${sl.semiTitle}</p>
	        					</div>
	        				</c:if>
	        			</c:forEach>
	        			<!-- 세부 프로젝트 작성 폼 -->
	        			<div class="insertSemiProjectSection inputSemisePro2" id = "inputSemisePro2">
	        				<form action="insertSemiPro.do" id ="inputSemiPro2" method="post">
	        					<input placeholder="세부 프로젝트명 작성" type="text" id="title" name="semiTitle" class="semiProjectInput">
	        					<input type="hidden" id="writer" name="semiWriter" value ="${loginUser.empNo}">
		              			<input type="hidden" id="refpc" name="refPc" value="${pc.pcTwo}">
		              			<input type="hidden" id="refpro" name="refPro" value ="${p.proNo}">
        					</form>
        					<div align="center" class="buttonSectionSimple">
								<button type="submit" class="commonButton1 buttonSectionsemiBu1 projectinPro" style="line-height:20px;" onclick="submitForm('inputSemiPro2')">등록하기</button>
								<button type="button" class="commonButton1 buttonSectionsemiBu2 can_project" style="line-height:20px;" onclick="closeSemiInsert('inputSemisePro2','innerNewSeim2')">취소하기</button>
							</div>
	        			</div>
	        		</div>
	        		<div class="plusNewSemiBu">
	        			<div class="innerNewSeim" id="innerNewSeim2" onclick="openSemiInsert('inputSemisePro2','innerNewSeim2')"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="35"></div>
	        		</div>
	        	</div>
	        	<div class="divthreewP">
	        		<div class="nameandControl">
	        			<div class="detailNameHea"><p>${pc.pcThree}</p></div>
	        			<div class="tollgeimg">
		        			<ul>
		        				<li><a href="#" class="imagehamburger" onclick="openBurger('openBurger3')"><img src="${ pageContext.servletContext.contextPath }/resources/images/menupro.png" width="30"/></a>
		        					<ul class="controlAnnoDetail" id ="openBurger3" >
				        				<li><a onclick="postFormSubmit111(1,3,'${pc.pcThree}');">수정</a></li>
				        				<li><a onclick="postFormSubmit111(2,3,'${pc.pcThree}');">삭제</a></li>
				        			</ul>
		        				</li>
		        			</ul>
	        			</div>
	        		</div>
	        		<div class="mainshowSection">
	        			<!-- 세부 프로젝트 -->
	        			<c:forEach items="${slist}" var="sl">
	        				<c:if test="${sl.refPc eq pc.pcThree}">
	        					<div class="slist${sl.semiNo} semiProjectDIv" onclick="selectSemiDetailPro('${sl.semiNo}')" >
	        						<p title="스크롤 내려보세요">${sl.semiTitle}</p>
	        					</div>
	        				</c:if>
	        			</c:forEach>
	        			<!-- 세부 프로젝트 작성 폼 -->
	        			<div class="insertSemiProjectSection inputSemisePro3" id = "inputSemisePro3">
	        				<form action="insertSemiPro.do" id ="inputSemiPro3" method="post">
	        					<input placeholder="세부 프로젝트명 작성" type="text" id="title" name="semiTitle" class="semiProjectInput">
	        					<input type="hidden" id="writer" name="semiWriter" value ="${loginUser.empNo}">
		              			<input type="hidden" id="refpc" name="refPc" value="${pc.pcThree}">
		              			<input type="hidden" id="refpro" name="refPro" value ="${p.proNo}">
        					</form>
        					<div align="center" class="buttonSectionSimple">
								<button type="submit" class="commonButton1 buttonSectionsemiBu1 projectinPro" style="line-height:20px;" onclick="submitForm('inputSemiPro3')">등록하기</button>
								<button type="button" class="commonButton1 buttonSectionsemiBu2 can_project" style="line-height:20px;" onclick="closeSemiInsert('inputSemisePro3','innerNewSeim3')">취소하기</button>
							</div>
	        			</div>
	        		</div>
	        		<div class="plusNewSemiBu">
	        			<div class="innerNewSeim" id="innerNewSeim3" onclick="openSemiInsert('inputSemisePro3','innerNewSeim3')"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="35"></div>
	        		</div>
	        	</div>
	        	<div class="divfourwP">
	        		<div class="nameandControl">
	        			<div class="detailNameHea"><p>${pc.pcFour}</p></div>
	        			<div class="tollgeimg">
	        				<ul>
		        				<li><a href="#" class="imagehamburger" onclick="openBurger('openBurger4')"><img src="${ pageContext.servletContext.contextPath }/resources/images/menupro.png" width="30"/></a>
		        					<ul class="controlAnnoDetail"  id ="openBurger4">
				        				<li><a onclick="postFormSubmit111(1,4,'${pc.pcFour}');">수정</a></li>
				        				<li><a onclick="postFormSubmit111(2,4,'${pc.pcFour}');">삭제</a></li>
				        			</ul>
		        				</li>
		        			</ul>
	        			</div>
	        		</div>
	        		<div class="mainshowSection">
	        			<!-- 세부 프로젝트 -->
	        			<c:forEach items="${slist}" var="sl">
	        				<c:if test="${sl.refPc eq pc.pcFour}">
	        					<div class="slist${sl.semiNo} semiProjectDIv" onclick="selectSemiDetailPro('${sl.semiNo}')">
	        						<p title="스크롤 내려보세요">${sl.semiTitle}</p>
	        					</div>
	        				</c:if>
	        			</c:forEach>
	        			<!-- 세부 프로젝트 작성 폼 -->
	        			<div class="insertSemiProjectSection inputSemisePro4" id = "inputSemisePro4">
	        				<form action="insertSemiPro.do" id ="inputSemiPro4" method="post">
	        					<input placeholder="세부 프로젝트명 작성" type="text" id="title" name="semiTitle" class="semiProjectInput">
	        					<input type="hidden" id="writer" name="semiWriter" value ="${loginUser.empNo}">
		              			<input type="hidden" id="refpc" name="refPc" value="${pc.pcFour}">
		              			<input type="hidden" id="refpro" name="refPro" value ="${p.proNo}">
        					</form>
        					<div align="center" class="buttonSectionSimple">
								<button type="submit" class="commonButton1 buttonSectionsemiBu1 projectinPro" style="line-height:20px;" onclick="submitForm('inputSemiPro4')">등록하기</button>
								<button type="button" class="commonButton1 buttonSectionsemiBu2 can_project" style="line-height:20px;" onclick="closeSemiInsert('inputSemisePro4','innerNewSeim4')">취소하기</button>
							</div>
	        			</div>
	        		</div>
	        		<div class="plusNewSemiBu">
	        			<div class="innerNewSeim" id="innerNewSeim4" onclick="openSemiInsert('inputSemisePro4','innerNewSeim4')"><img src="${ pageContext.servletContext.contextPath }/resources/images/plus.png" width="35"></div>
	        		</div>
	        	</div>
        	</div>
        </div>
    </div>
    <script type="text/javascript">
		/*클릭했을시 나오게*/
		function openBurger(name){
			event.stopPropagation();
			$(".controlAnnoDetail").hide();	
			$("#"+name).toggle();
		}
		/*바깥부분 클릭했을시 사라지게*/
		$(document).click(function(){
			$(".controlAnnoDetail").hide();	
		})
		//참여자 바깥부분 클릭했을시 사라지게
		$(document).click(function(){
    		$(".selectAddPer").hide();
		})
    	$(function(){
    		$(".page_title > .title_name").text($("#proTitleName").val());
    	})
    	function openSemiInsert(name, div){
    		$("#"+name).css("display","block");
    		$("#"+div).css("display", "none");
    	}
    	function closeSemiInsert(name, div){
    		$("#"+name).css("display","none");
    		$("#"+div).css("display", "block");
    	}
    	/*등록버튼 클릭시*/
    	function submitForm(name){
    		$("#"+name).submit()
    	}
   		function postFormSubmit111(num, sec, target){
       		//num =1 -> 수정, num =2 -> 삭제	
       		if(num == 1 && sec != 0){
       			$(".detaileditTarget111").css("display", "flex");
       			$("#pcNohidden").val(${pc.pcNo});
       			$("#SceeditModalSe").val(sec);
       			$("#refProNum").val(${pc.refPro});
       			$("#pcName").val(target);
       		}else if(num ==2 && sec != 0){
       			location.href="deleteTargetName.do?pcno="+${pc.pcNo}+"&sec="+sec+"&pjno="+${pc.refPro}+"&target="+target;
       		}
       	}
    	function selectSemiDetailPro(sino){
    		var loginUser = ${loginUser.empNo};
    		$.ajax({
    			url:"selectSemiDetailPro.do", 
    			type:"post", 
    			data:{sino:sino},
    			success:function(sp){
    				$(".semiProModal").css("display", "flex");
    				$(".modal_title").text(sp.semiTitle);
    				$(".semiProTar").text(" -"+sp.refPc);
    				$(".detailSemiTitleCh").val(sp.semiTitle);
    				$("#semiNoDETAIL").val(sp.semiNo);
    				$(".dueDateShow").text(sp.semiDue);
    				$("#WriterNoSemiProject").val(sp.semiDue);
    				$("#refProNum").val(${p.proNo});
    				$("#semiWriter").val(sp.semiWriter);
    				if(sp.semiDue == null){
    					$(".dueDateShow").empty();
    					//오늘 날짜 넣기
        				document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
    				}else if(sp.semiDue != null){
    					document.getElementById('currentDate').value = sp.semiDue;
    				}
    				if(sp.semiContent == null){
    					$(".innerPartimgConn").css("display", "flex");
    					$(".updateInnerPartCommne").css("display", "none");
    					$(".commentDvi").css("display","none");
   					}else{
   						$(".commentText").html(sp.semiContent);
   						$(".commentDvi").css("display","flex");
   						$(".updateInnerPartCommne").css("display", "none");
   					}
    				if(sp.semiWriter == loginUser){
    					$(".outseeDelete").css("display","block");
    					$(".editdetailSemi").css("display","block");
    					$(".checkListTotalDel").css("display","block");
    				}
    				if(sp.refPc=='${pc.pcOne}'){
    					$(".controllPF span").text('${pc.pcTwo}');
    					$(".controllPS span").text('${pc.pcThree}');
    					$(".controllPT span").text('${pc.pcFour}');
    				}else if(sp.refPc=='${pc.pcTwo}'){
    					$(".controllPF span").text('${pc.pcOne}');
    					$(".controllPS span").text('${pc.pcThree}');
    					$(".controllPT span").text('${pc.pcFour}');
    				}else if(sp.refPc=='${pc.pcThree}'){
    					$(".controllPF span").text('${pc.pcOne}');
    					$(".controllPS span").text('${pc.pcTwo}');
    					$(".controllPT span").text('${pc.pcFour}');
    				}else if(sp.refPc=='${pc.pcFour}'){
    					$(".controllPF span").text('${pc.pcOne}');
    					$(".controllPS span").text('${pc.pcTwo}');
    					$(".controllPT span").text('${pc.pcThree}');
    				}
    				selectCheckList(sp.semiNo);
    				selectAnnoReplyList();
    				selectAttachFile(sp.semiNo);
    			}
    		})	
    	}
    	//프로젝트 참여자 삭제 
    	function deleteAttendP(num){
    		location.href="deleteWatcher.do?proNo="+${p.proNo}+"&proWriter="+num;
    	}
    	//프로젝트 참여자 추가 
    	function addwatcherP(num){
    		location.href="insertWatcherP.do?proNo="+${p.proNo}+"&proWriter="+num;
    	}
    	//추가 이미지 클릭하였을 시 
    	$(function(){
    		$(".imgClickBu img").click(function(){
    			event.stopPropagation();
        		var con = document.getElementById("selectAddPer");
        		if(con.style.display =='none'){
        			con.style.display="block";
        		}else{
        			con.style.display = 'none';
        		}
        	})
    	})
    	

    </script>
</body>
</html>