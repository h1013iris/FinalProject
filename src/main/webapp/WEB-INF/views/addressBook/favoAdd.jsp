<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 즐겨찾기</title>
<script
	src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
<style>

* {
	margin: 0;
	padding: 0;
}
#container {
	height: 100vh;
	display: flex;
	align-items: center;
	text-align: center;
}

#addcon {
	margin: 0 auto;
	text-align: center;
}

#listMain{
	height:400px;
	overflow-y: scroll;
}

.sc::-webkit-scrollbar{
display: none;
}

.listAdd {
	margin: 0;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid;
	
}

.listAdd td {
	border: 1px solid;
	padding: 5px 10px;
	width: 200px;
}

.listAdd th {
	border: 1px solid;
	padding: 5px 10px;
	width: 200px;

}

.a {
	width: 200px;
	display: inline-block;
	background-color: aqua;
	margin: 2px;
	height: 30px;
	text-align: center;
}
.boxAddList{
	height:300px;
	margin-bottom:30px;
	margin-left: auto;
	margin-right: auto;
	
}

.boxTitle{
	width:400px;
	font-size: 20px;
	margin: auto;
}
.trSt:hover{
background-color: #d3edff;
}


</style>

	<div class="main_section">
		<div id="container">
			<div id="addcon">
					<div class="boxAddList">
					<table class="listAdd">
							<tr>
								<th style="width: 50px"></th>
								<th>이름</th>
								<th>부서명</th>
								<th>직급</th>
								<th>이메일</th>
								<th>휴대폰</th>
							</tr>
							</table>
							<div id="listMain" class="sc">
							<table class="listAdd">
							<c:forEach items="${favoAddList}" var="favo">
								<tr class="trSt">
									<td style="width: 50px"><input type="checkBox" checked="checked" name="empNo"
										value="${favo.empNo}" id="empNo" class="ckBox"></td><!-- empNo로 해서 즐겨찾기에서 해당 사번 체크해제하면 지워지게끔? -->
									<td>${favo.empName}</td>
									<td>${favo.departmentTitle}</td>
									<td>${favo.jobName}</td>
									<td>${favo.email}</td>
									<td>${favo.phone}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		
		$(function(){
	        $(".page_title>.title_name").text("즐겨찾기 주소록");
	     })
	     
	     $('input:checkBox[name=empNo]').click(function(){//체크박스를 클릭했을때 실행되는 functuion
			let	ckEmpNo =$(this).val();//체크한 사번을 chEmpNo에 담아줌
			let no=0;
			let num=0;
		
			console.log("ajax 즐겨찾기 삭제준비"+ckEmpNo);
		
				$.ajax({
					type:"POST",
					url:"deletePavoAdd.do",
							data:{ckEmpNo:ckEmpNo},
							success:function(data){
							no=data;
							console.log("즐겨찾기에 삭제 결과: "+no);
							alert("즐겨찾기 목록에서 삭제 되었습니다");
							location.href="favoAdd.do";
							if(no<1){
								alert("즐겨찾기 삭제에 실패했습니다");
								
									}
								}
							})
	     				});
		</script>
</body>

</html>