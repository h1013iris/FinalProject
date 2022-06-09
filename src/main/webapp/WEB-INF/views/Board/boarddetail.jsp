<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main_section {
	width: 83vw;
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
}

.mainDivEnroll {
	width: 83vw;
}

.commonButton1 {
	padding: 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background: #85cdff;
	border: #85cdff;
	box-shadow: 0px 5px 0px 0px #4c87b099;
}

.commonButton1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}

.replyAREA{
        width: 60%;  
		margin-top: 10px;
		height: 30vh;
		margin-left : 17%;
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
</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="checkman.jsp"></jsp:include>
	<div class="main_section">
		<table id="contentArea" align="center" class="table">
			<tr>
				<th width="100">제목</th>
				<td colspan="3" style="height: 50px;">${ b.title }</td>
			</tr>
			<tr>
				<th style="height: 50px;">작성자</th>
				<td>${ b.writer }</td>
				<th style="height: 50px;">작성일</th>
				<td>${ b.createDate }</td>
			</tr>

			<tr>
				<th style="height: 50px;">내용</th>
				<td colspan="3"></td>
			</tr>

		</table>
		<div id="detailcontent">
			<p style="height: 150px">${ b.content }</p>

		</div>
		<c:if test="${ loginUser.empNo eq b.empno }">
			<div id="cocn">
				<button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
				<button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
				<button type="button" class="checkman" >읽은사람</button>
			</div>
		
			<form id="postForm" action="" method="post">
				<input type="hidden" name="bno" value="${ b.writeno }">
                <input type="hidden" name="boardno" value="${ b.boardno }">
			</form>
			<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateFormBoard.do");
						}else{
							postForm.attr("action", "deleteBoard.do");
						}
						postForm.submit();
					}
					
					
				</script>
			<br>
			<br>
		</c:if>

		<div id=concontents>
			<c:if test="${ !empty loginUser }">

				<textarea class="form-control" id="Content" rows="2"
					style="resize: none; width: 70%; vertical-align: middle"></textarea>

				<button class="commonButton1" id="addcom">등록하기</button>
			</c:if>
			<c:if test="${ empty loginUser }">

				<textarea class="form-control" readonly rows="2"
					style="resize: none; width: 70%"> 로그인 후 이용가능해요.</textarea>

				<button id="addcom" class="commonButton1" disabled>등록하기</button>
			</c:if>
		</div>

		<div class="replyAREA">
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
			var bno = ${b.writeno};
			
			var realbno = ${b.boardno};

			if ($("#Content").val().trim().length != 0) {

				$.ajax({
					url : "insertcontent.do",
					type : "post",
					data : {
						ccontent : $("#Content").val(),
						cwriteno : bno,
						writerno : "${loginUser.empNo}",
						boardno : realbno
					},

					success : function(result) {
						if (result > 0) {
							$("#Content").val("");
							selectcomList();
							

						} else {
							console.log("댓글등록이 왜 안되지 ");
						}
					},
					error : function() {
						console.log("아니 왜 안돼");
					}
				})
			}
		})
	});

	function selectcomList() {
		var bno = ${b.writeno};
				$.ajax({
					url : "listcoment.do",
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

											if ("${loginUser.empName}" == c.cwirter) {
												value += "<tr>";
											} else {
												value += "<tr>";
											}
											value += "<th class='replyWriterName'>"
													+ c.cwirter
													+ " "
													+ "</th>";
											value += "<th class='replydelete'><img src='${ pageContext.servletContext.contextPath }/resources/images/close.png' alt='' onclick='deleteReply("+c.cno+")' width='10'>"+"</th></tr>";
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
						console.log("아 화난다");
					}
				});
	}
	
	function deleteReply(num){
		$("#confirm_title .title_name").text("댓글 삭제");
		$("#confirm_body .confirm_content").text("댓글을 삭제하시겠습니까?");
		$("#helpmeCOnfirm").css("display","block");
   		
		$("button[name='confirmBtn']").click(function(){
    		console.log($(this).val())
    		if($(this).val()=="true"){
    			location.href="deletecoment.do?cno="+num+"&bno="+${b.writeno}
    			$("#helpmeCOnfirm").css("display","none");
    		}else{
    			$("#helpmeCOnfirm").hide();
    		}
    	})
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
				console.log(list)
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



</script>
<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>

</body>
</html>