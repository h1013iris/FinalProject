<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 세부 페이지</title>
<style type="text/css">
	.annoDetailVeiw{
		margin: 0 auto;
		padding: 50px 100px 100px 100px ;
	}
	.annoDetailTitle{
		margin-left : 20px;
		font-size: 30px;
		font-weight: 550;
		padding-top: 3vh;
		width: 80%;
	}
	.annoDetailPhoto{
		width: 7vw;
		height: 13vh;
		border:1px solid;
	}
	/*머리부분 div*/
	.annoDetailHead{
		display: flex;
		width: 100%;
	}
	.annoDetailWHo{
		margin-top:15px;
		font-size: 17px;
	}
	.annoDetailWHo span{
		padding-right: 20px;
	}
	.lineAnnoDetail{
		margin-top: 20px;
		border-bottom: 1px solid;
		margin-bottom: 20px;
	}
	.attachmentDetail{
		margin-bottom: 30px;
		font-size: 17px;
		height: 3vh;
	}
	.attachmentDetail span{
		margin-right: 10px;
	}
	.annoDetailContent{
		margin-bottom: 40px;
		font-size: 19px;
		height: 300px;
    	overflow-y: scroll;
	}
	.annoDetailEdit img:hover{
		cursor: pointer;
	}
	.attachmentDetail a{
		list-style: none;
		text-decoration: none;
		color: black;
	}
	.attachmentDetail a:hover{
		color: #85cdff;
	}
	.annoDetailEdit{
		width: 10%;
		height:100%;
		text-align: right;
	}
	.controlAnnoDetail>li{
		background-color:white;
		width:90px;
		height:25px;
		text-align:center;
		transform:translateX(57px);
		padding-top:6px;
	}
	.controlAnnoDetail li:hover{
		background-color: #85cdff;
		color: white;
		cursor: pointer;
	}
	.annoDetailReplyUp{
		display: flex;
	}
	.logo_Reply{
		margin-right: 20px;
	}
	.countReply{
		line-height: 40px;
	}
	.replyAREA{
		margin-top: 10px;
		overflow-y: scroll;
		height: 30vh;
	}
	.replySendArea{
		height: 5vh;
		margin-top: 10px;
	}
	.replyButton{
		height: 32px;
		width: 70px;
		transform:translate(10px, -17px);
	}
	#reply{
		height: 27px;
	    margin-top: 10px;
	    width: 76vw;
	    transform: translateY(-16px);
	}
	.replyWriterName{
		font-size: 18px;
	    height: 18px;
	    font-weight: 550;
	    float: left;
	}
	.replyTitleSe{
		padding-top:4px;
    	height: 27px;
    	width: 92%;
    	padding-bottom: 7px;
	}
	.replywrDateSe{
		font-size: 13px;
		width: 15%;
	}
	.replydelete img:hover{
		cursor: pointer;
		width: 10px;
	}
	.replydelete img{
		width: 10px;
	}
	.deleteorsubmit{
		display: flex;
		height: 20%;
		justify-content:space-between;
		margin-top: 20px;
	}
	.annoDetailButton {
	    position: relative;
	    width: 8%;
	    height:5%;
	    font-size: 14px;
	    text-align: center;
	}
	.alarm_img_depart{
		width: 7vw;
    	height: 13vh;
	}
	.alarm_img_no_img{
		transform: translate(10px, 10px);
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="annoDetailVeiw">
        	<!-- 위에 제목과 사진 나오는 부분 -->
        	<div class="annoDetailHead">
	        	<div class="annoDetailPhoto">
	        		<c:if test="${at.changeName ne null}">
	                <img class="alarm_img_depart" src="${ pageContext.servletContext.contextPath }/resources/upload_files/${at.changeName}"/>
	                </c:if>
	                <c:if test="${at.changeName == null}">
	                <img class="alarm_img_no_img" src="${ pageContext.servletContext.contextPath }/resources/images/관리자 프로필.png" width="100"/>
	                </c:if>
	        	</div>
	        	<div class="annoDetailTitle">
	        		<span>${d.annoTitle}</span>
	        	</div>
	        	<c:if test="${loginUser.empNo eq d.annoWR}">
	        	<div class="annoDetailEdit">
	        	<ul>
	        		<li><a href="#" class="imagehamburger"><img src="${ pageContext.servletContext.contextPath }/resources/images/햄버거.png" width="50"/></a>
	        			<ul class="controlAnnoDetail" >
	        				<li><a onclick="postFormSubmit(1);">수정</a></li>
	        				<li><a onclick="postFormSubmit(2);">삭제</a></li>
	        			</ul>
	        		</li>
        		</ul>
        		<form action="" id="postForm" method="post">
        			<input type="hidden" name ="adno" value="${d.annoNo}">
        			<input type="hidden" name ="rlcn" value="${a.fileNo}">
        			<input type="hidden" name ="fileName" value="${a.changeName}">
        		</form>
	        	</div>
	        	</c:if>
        	</div>
        	<!-- 입력한 사람의 정보 -->
        	<div class="annoDetailWHo">
        		<span>${d.writerName} ${d.writerJo}</span>
        		<span>조회수 ${d.count}</span>
        		<span>${d.annoChangeDate}</span>
        	</div>
        	<!-- 선 -->
        	<div class="lineAnnoDetail"></div>
        	<!-- 첨부파일 부분 -->
        	<div class="attachmentDetail">
        		<span>첨부파일 </span><span>|</span>
        		<c:if test="${!empty a.originName }">
        			<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${a.changeName}" download="${ a.originName }" title="클릭하시면 첨부파일 다운이 됩니다">${ a.originName }</a>
        		</c:if>
        		<c:if test="${empty a.originName }">
        			<span>첨부파일이 없습니다.</span>	
        		</c:if>
        	</div>
        	<!-- 내용 -->
        	<div class="annoDetailContent">
        		<span>${d.annoContent}</span>
       		</div>
        	<!-- 댓글 부분 -->
        	<c:if test="${d.accessReply eq 'Y'}">
        	<div class="annoDetailReplySection">
        		<div class="annoDetailReplyUp">
        			<div class="logo_Reply">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/reply.png" alt="" width="40">
                	</div>
                	<div class="countReply">
                		<span>댓글 <span id="rcount"></span> 개</span>
                	</div>
        		</div>
        		<div class="replyAREA">
        			<table id="replyList" >
			
					</table>
        		</div>
        		<c:if test="${loginUser.empNo != d.annoWR}">
        		<div class="replySendArea">
        			<input type="text" name="replyTitle"  id="reply">
        			<button type="button" class="commonButton1 replyButton" style="line-height:normal;">댓글 작성</button>
        		</div>
        		</c:if>
        	</div>
        	</c:if>
        	<!-- 이전 공지, 이후 공지, 목록으로 -->
        	<div class="deleteorsubmit" >
				<button class="commonButton2 annoDetailButton" onclick="prevButton()" ><span> < Prev </span></button>
				<button class="commonButton2 annoDetailButton" onclick="mainButton()"><span> 메인으로 </span></button>
				<button class="commonButton2 annoDetailButton" onclick="nextButton()" ><span> Next > </span></button>
			</div>
        </div>
    </div>
    <script type="text/javascript">
	  	function mainButton(){
	  		location.href="departmentPage.do?userNo="+${loginUser.empNo}+"&departmentNo="+${loginUser.departmentNo};
	  	}
    	/*디폴트로 사라지게*/
	    $(document).ready(function(){
			$(".controlAnnoDetail").hide();		
		})
		/*클릭했을시 나오게*/
		$(".imagehamburger").click(function (){
			event.stopPropagation();
			$(".controlAnnoDetail").toggle();
		})
		/*바깥부분 클릭했을시 사라지게*/
		$(document).click(function(){
			$(".controlAnnoDetail").hide();	
		})
		
		function postFormSubmit(num){
    		 var postForm = $("#postForm");
    		 
    		 if(num ==1){
    			 postForm.attr("action", "updateAnnoDepartForm.do")
    		 }else{
    			 postForm.attr("action", "deleteAnnoDepart.do?userNo="+${loginUser.empNo}+"&departmentNo="+${loginUser.departmentNo})
    		 }
    		 postForm.submit();
    	}
    	
    	$(function(){
    		selectAnnoReplyList();
    		$(".replyButton").click(function(){
        		console.log($("#reply").val())//값이 잘 나오는 것을 확인 완료
        		console.log(${loginUser.empNo})
        		var adno = ${d.annoNo};//게시글 번호
        		var replyWriter = ${loginUser.empNo};
        		if($("#reply").val().trim().length != 0){
        			$.ajax({
        				url:"annoReplyInsert.do", 
        				type:"post", 
        				data:{
        					replyTitle:$("#reply").val(), 
        					refDepartNo:adno, 
        					replyWriter:replyWriter}, 
       					success:function(result){
       						if(result>0){
       							$("#reply").val("");
       							console.log("댓글 달기 성공")//댓글 다는거는 성공
       							selectAnnoReplyList();
       						}else{
       							myAlert("댓글 등록 실패","댓글을 등록을 실패하였습니다");
       		        			$(".cancel_btn").click(function(){
       		        				$("#alert_container .title_name").text("");
       		            			$("#alert_body .alert_content").text("");
       		        				$("#alertBackground").hide();
       		        			})
       						}
       					}, error:function(){
       						console.log("댓글 작성 ajax 실패")
       					}
        				
        			});
        			
        		}else{//댓글 등록 안하고 클릭시
        			myAlert("댓글 등록","댓글을 등록해주세요");
        			$(".cancel_btn").click(function(){
        				$("#alert_container .title_name").text("");
            			$("#alert_body .alert_content").text("");
        				$("#alertBackground").hide();
        				$("#reply").focus();
        			})
        		}
        	});
    	});
    	
    	function selectAnnoReplyList(){//댓글 리스트 가져오는 것
    		var adno = ${d.annoNo};//게시글 번호
    		$.ajax({
    			url:"annoRList.do",
    			data:{adno:adno}, 
    			type:"get", 
    			success:function(list){
    				$("#rcount").text(list.length);
    				
    				var value ="";
    				$.each(list, function(i, obj){
    					if("${loginUser.empNo}"==obj.replyWriter){
    						value += "<tr class='replyListTr'>";
    					}else{
    						value += "<tr class='replyListTr'>";
    					}
    					
    					value += "<th class='replyWriterName'>" + obj.writerName +" "+ obj.writerJo + "</th>" ;
    					if("${loginUser.empNo}"==obj.replyWriter){
    					value += "<th class='replydelete'><img src='${ pageContext.servletContext.contextPath }/resources/images/close.png' alt='' onclick='deleteReply("+obj.replyNo+")' width='10'>"+"</th></tr>";
    					} 
    					value += "</tr><tr class='contenttot'><td class='replyTitleSe'>" + obj.replyTitle + "</td>" + 
						 "<td class='replywrDateSe'>" + obj.wrDate + "</td>" +
					 	"</tr>";
    				})
    				$("#replyList").html(value);
    			},error:function(){
    				console.log("댓글 리스트조회용 ajax 통신 실패");
    			}
    		})
    	}
    	
    	function deleteReply(num){
    		$("#confirm_title .title_name").text("댓글 삭제");
    		$("#confirm_body .confirm_content").text("댓글을 삭제하시겠습니까?");
    		$("#helpmeCOnfirm").css("display","block");
       		
    		$("button[name='confirmBtn']").click(function(){
        		console.log($(this).val())
        		if($(this).val()=="true"){
        			location.href="deleteAnnoDepartReply.do?adro="+num+"&adno="+${d.annoNo};
        			$("#helpmeCOnfirm").css("display","none");
        		}
        	})
    	}
    	
    	//이전 게시물 버튼
		function prevButton(){
			var adno = ${d.prevNo};
			console.log(adno+"이전")
			if(adno == null || adno ==""){
				$("#alert_container .title_name").text("공지사항");
    			$("#alert_body .alert_content").text("이전 공지사항이 없습니다.");
    			$("#alertBackground").css("display","block");
    			
    			$(".cancel_btn").click(function(){
    				$("#alert_container .title_name").text("");
        			$("#alert_body .alert_content").text("");
    				$("#alertBackground").hide();
    				$("#reply").focus();
    			})
				return;
			}else if(adno != null){
				location.href="detailAnnoDepart.do?adno="+adno;
			}
		}
		//이후 게시물 버튼
		function nextButton(){
			
			var adno = ${d.nextNo};
			console.log(adno+"이후")
			 if (adno == null || adno ==""){
				$("#alert_container .title_name").text("공지사항");
    			$("#alert_body .alert_content").text("이후 공지사항이 없습니다.");
    			$("#alertBackground").css("display","block");
    			
    			$(".cancel_btn").click(function(){
    				$("#alert_container .title_name").text("");
        			$("#alert_body .alert_content").text("");
    				$("#alertBackground").hide();
    				$("#reply").focus();
    			})
				return;
			}else if(adno != null){
				location.href="detailAnnoDepart.do?adno="+adno;
			}
		}
    </script>
</body>
</html>