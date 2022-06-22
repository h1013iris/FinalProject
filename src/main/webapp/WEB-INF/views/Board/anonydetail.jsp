<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.anonydtailmainse{
    height:93vh !important;
}
#contentArea {
	margin-left: 15%;
}

#contentArea * {
	margin: 5px
}

#contentArea {
	width: 80%;
}

#detailcontent {
	border: 1px solid #85cdff;
	margin-left: 17%;
	width: 60%;
	height: 60%;
	overflow: auto;
	padding:10px;
	margin-top:10px;
}

.mainDivEnroll {
	width: 83vw;
	
}



.replyAREAboard{
         width: 60%;  
		margin-top: 10px;
		overflow: auto;
		height: 30vh;
		margin-left : 17%;
	}
.replyAREAboard::-webkit-scrollbar{
  display:none;
}

#concontents {
	margin-left: 17%;
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
	.userlistdetailtable{
	height: 50px;
	
	}
	.userlistdetailtabletd{
	font-weight: 900; 
	font-size:16px;
	height: 50px;	
	}
	#anonychangedbytton{
	margin-left:68%;
	}
	#anonyboardpasnic{
	margin-left:68%;
	}
	.anonyupandsel{
     padding: 0;
     font-weight: 600;
     text-align: center;
     line-height: 50px;
     color: #FFF;
     border-radius: 5px;
     transition: all 0.2s ;
     background: #85cdff;
     border: #85cdff;
     box-shadow: 1px 5px 1px 1px #4c87b099;
     width:70px;
     }
    .anonyupandsel:hover{
     position: relative;
     top: 5px;
     bottom: 5px;
     ox-shadow: 0px 0px 0px 0px #4c87b099;
     }
     .delanony{
      background: #949494;
     }
</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="checkman.jsp"></jsp:include>
	<div class="main_section anonydtailmainse">
		<table id="contentArea" align="center" class="table">
			<tr>
				<th width="100">제목</th>
				<td colspan="3" style="height: 50px;">${ b.title }</td>
			</tr>
			<tr>
				<th style="height: 50px;">작성자</th>				
				<td>${ b.nickname }</td>										
				<th style="height: 50px;">작성일</th>
				<td>${ b.createDate }</td>
			</tr>
			
			
			
              <div>
             
             
            
             <tr>
               <th style="height: 50px;" rowspan="${fn:length(list)}">첨부파일</th>
             <c:forEach items="${ list }" var="f">
             <td>
                    	<c:if test="${ !empty f.originName }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${f.changeName}" download="${ f.originName }">${ f.originName }</a>
                        </c:if>
                        <c:if test="${ empty f.originName }">
                        	첨부파일이 없습니다.
                        </c:if>
                        </td>
                    </tr>
                     </c:forEach>
                                      
		</table>
		
		
		
		<div id="detailcontent">
			<p style="height: 150px">${ b.content }</p>

		</div>
		
		
		
			<div id="anonychangedbytton" >
				<button class="btn btn-primary anonyupandsel" onclick="postFormSubmit(1);">수정하기</button>
				<button class="btn btn-danger anonyupandsel delanony" onclick="postFormSubmit(2);">삭제하기</button>
				
			</div>
		    <br>
			<form id="postForm" action="" method="post">
			 <div id="anonyboardpasnic">	
			   <span style="color:red">*</span><input id="anonyboarddetailpassword" type="password" name="anop" maxlength="4" style="width:137px" placeholder="비밀번호를 입력하세요">			
                <input type="hidden" name="bno" value="${ b.writeno }">
                <input type="hidden" name="boardno" value="${ b.boardno }">
                <input class="realanopass" type="hidden" value="${ b.password }">
                </div>
			</form>
			<script>
			
					function postFormSubmit(num){
						var anop = $("#anonyboarddetailpassword").val();
					    var realp = ${ b.password }					   
					   
					    if(realp == anop){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateanony.do");
						}else{
							postForm.attr("action", "deleteBoard.do");
						}
						postForm.submit();
					    }else{
					    	$("#alert_container .title_name").text("비밀번호오류");
							$("#alert_body .alert_content").text("비밀번호가 틀려요");
							$("#alertBackground").css("display","block");
							
							$(document).on("click", ".cancel_btn", function() {
					 			
								$("#alertBackground").css("display","none");
								
								
							})
					    }
                        	}
					
				</script>
			<br>
			<br>
		

		<div id=concontents>
			<c:if test="${ !empty loginUser }">

				<textarea class="form-control" id="Content" rows="2"
					style="resize: none; width: 70%; vertical-align: middle" placeholder="내용을 입력해주세요" required></textarea>

				<button class="commonButton1" id="addcom">등록하기</button>
			</c:if>
		   <br>		
		   <span style="color:red">*</span><span>닉네임</span>
		   <input type="text" name=conmentnickname id="conmentnickname">
		   <span style="color:red">*</span><span>비밀번호</span>
		   <input type="password" name=anonypassword id="anonypassword" maxlength="4" placeholder="비밀번호를 입력하세요">
		</div>
         
		<div class="replyAREAboard">
			<table id="replyList">
				<thead>
					<tr>
						<td colspan="3">댓글 (<span id="rcount">0</span>)
						</td>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>


	</div>
	<br>
	<br>
	</div>
	</div>

	<script>
	$(function() {
		selectcomList();
		$("#addcom").click(function() {			 
		         var compass = $("#anonypassword").val();
		         var conickname = $("#conmentnickname").val();
		       
		         if(compass === ""  && conickname === ""){
		        	 $("#alert_container .title_name").text("종합오류");
						$("#alert_body .alert_content").text("닉네임과비밀번호를입력해주세요");
						$("#alertBackground").css("display","block");
						
						$(document).on("click", ".cancel_btn", function() {
				 			
							$("#alertBackground").css("display","none");
						})
		         }else if(compass === ""){
		        	 $("#alert_container .title_name").text("비밀번호오류");
						$("#alert_body .alert_content").text("비밀번호를을입력해주세요");
						$("#alertBackground").css("display","block");
						
						$(document).on("click", ".cancel_btn", function() {
				 			
							$("#alertBackground").css("display","none");
						})
		        	 }else if(conickname === ""){
		        		 $("#alert_container .title_name").text("닉네임오류");
		 				$("#alert_body .alert_content").text("닉네임을입력해주세요");
		 				$("#alertBackground").css("display","block");
		 				
		 				$(document).on("click", ".cancel_btn", function() {
		 		 			
		 					$("#alertBackground").css("display","none");
		        	 })
		        	 }else{     
		         
			var bno = ${b.writeno};
			
			var realbno = ${b.boardno};

			if ($("#Content").val().trim().length != 0) {

				$.ajax({
					url : "insertcontentanony.do",
					type : "post",
					data : {
						ccontent : $("#Content").val(),
						cwriteno : bno,						
						conmentnickname : $("#conmentnickname").val(),
						anonypassword : $("#anonypassword").val(),
						boardno : realbno
					},

					success : function(result) {
						if (result > 0) {
							$("#Content").val("");
							selectcomList();
							

						} else {
							
						}
					},
					error : function() {
						
					}
				})
			}
		}
		})
	});

	function selectcomList() {
		var bno = ${b.writeno};
				$.ajax({
					url : "listcomentanony.do",
					data : {
						bno : bno
					},
					type : "get",
					success : function(list) {
						$("#rcount").text(list.length);

						var value = "";
						$
								.each(
										list,
										function(i, c) {

										
											value += "<tr>";											
											value += "<th class='replyWriterName'>"
													+ c.conmentnickname
													+ " "
													+ "</th>";
											value += "<th class='replydelete'><img src='${ pageContext.servletContext.contextPath }/resources/images/close.png' alt='' onclick='deleteReply("+c.cno+','+c.anonypassword+")' width='10'>"+"</th></tr>";
											
											      
											value += "</tr><tr class='contenttot'><td class='replyTitleSe'>"
													+ c.ccontent
													+ "</td>"
													+ "<td class='replywrDateSe'>"
													+ c.ccreateDate
													+ "</td>"
													+ "</tr>";

										});
						$("#replyList").html(value);
						
					},
					error : function() {
						
					}
				});
	}
	
	function deleteReply(num , pass){		
		var anopass = $("#anonypassword").val();		
		
		if(anopass == pass){
		$("#confirm_title .title_name").text("댓글 삭제");
		$("#confirm_body .confirm_content").text("댓글을 삭제하시겠습니까?");		
		$("#helpmeCOnfirm").css("display","block");		
		$("button[name='confirmBtn']").click(function(){
    		  			
    		if($(this).val()=="true"){    			
    			location.href="deletecoment.do?cno="+num+"&bno="+${b.writeno}+"&realbno="+4
    			$("#helpmeCOnfirm").css("display","none");       		
    		}else{
    			$("#helpmeCOnfirm").hide();
    		}
    	})
		}
	}
	//글확인자 버튼 클릭시 모달창
	$(document).on("click",".checkman", function(){
		var wno = ${ b.writeno }
		$.ajax({
			url:"readuser.do", 
			data:{wno:wno}, 
			type:"get", 
			success:function(list){
				$("#userList").html('');
				
				var ulist = list
				var str = "";			
				$.each(ulist, function(i){
					
					 str += "<tr class='userlistdetailtable'>"
	                 str += "<th class='userlistdetailtabletd'>" +ulist[i].deptname +"&nbsp;"+'</th>'	                 
	                 str += '<th>' +ulist[i].writer + '</th>'
	                 str += '</tr>'
				});		
				$("#userList").append(str);
	$(".checkmans").css("display","flex");
	
}
			

})
		})


$(function(){
         $(".page_title>.title_name").text("익명 글 상세");
      })
</script>
<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>

</body>
</html>