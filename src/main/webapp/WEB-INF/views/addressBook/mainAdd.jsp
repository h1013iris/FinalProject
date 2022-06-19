<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록메인</title>
<script
	src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
<style>

#container {
	text-align: center;
}

#contain {
	margin: 0;
	width: 1000px;
}

#deptTitle {
	margin: 50px;
}

td, th {
	border: 1px solid black;
	width: 200px;
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
	margin: 2px;
	height: 30px;
	text-align: center;
}

#a {
	border-style: solid 1px;
}

/*팀에서 공동 선택한 버튼디자인*/
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
	width: 200px;
	margin: 30px;
}

.commonButton1:hover {
	position: relative;
	top: 5px;
	bottom: 5px;
	box-shadow: 0px 0px 0px 0px #4c87b099;
}

#imgBox {
	width: 20px;
}
#searchDiv{
margin: 50px;
}

.searchText{
width:300px;
height: 30px;
text-align: center;
border: solid #85cdff 2px; 
border-radius: 5px;
}
input:focus {
outline:none;
}

.trSt:hover{
background-color: #d3edff;
}


</style>
<body>


	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
		<div id="container">
			<div id="container">
				
			</div>
			<div id="deptTitle">
				<!-- 클릭하면 부서별 페이지로 이동 각 부서만 뜨게 -->
				<!-- 관리자가 입력한 부서명대로 생성됨 부서번호순서로  -->
				<form action="addressMain.do" method="get" class="a">
					<div>
						<input type="submit" value="전체주소록" name="departmentTitle"
							class="commonButton1">
					</div>
				</form>
				<c:forEach items="${deptTitleList}" var="dept">
					<form action="deptAddList" method="get" class="a">
						<div>
							<input type="submit" value="${dept.departmentTitle}"
								name="departmentTitle" class="commonButton1">
						</div>
					</form>
				</c:forEach>

			</div>
			<form action="allAddSearch.do" method="post">
				<div id="searchDiv">
					<input type="text" name="search" class="searchText"> <input type="submit"
					value="검색" />
				</div>
			</form>

			<!--전체 주소록 내용이 표시될곳-->

			<div id="addcon">
			
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
					<c:forEach items="${allAddList}" var="allAdd" varStatus="status">
						<tr class="trSt">


							<td class="add_input one" style="width: 50px"><input type="checkbox" name="empNo"
								value="${allAdd.empNo}" class="ckBox" /> <c:forEach
									items="${emoNoCkList}" var="ckEmp" varStatus="st">
									<c:choose>
										<c:when test="${allAdd.empNo eq ckEmp.empNo }">
											<input type="checkbox" checked="checked" name="empNo"
												value="${allAdd.empNo}" class="empNoAdd ckBox one" id="checkedEmpNo" />

										</c:when>
									</c:choose>
								</c:forEach></td>
							<!-- <input type="checkbox" name="empNo" value="${allAdd.empNo}" id="ckBox"/>-->

							<td>${allAdd.empName}</td>
							<td>${allAdd.departmentTitle}</td>
							<td>${allAdd.jobName}</td>
							<td>${allAdd.email}</td>
							<td>${allAdd.phone}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
        $(".page_title>.title_name").text("전체 주소록");
        
        var td = $('.add_input').length
        //$('.ckBox').parent().children().length
        
        for(var i = 0 ; i < td ; i++){
        	if($('.add_input').eq(i).children().length == 2){
        		$('.add_input').eq(i).children().eq(0).hide()
        	}
        }
     });
		

	/*즐겨찾기 추가를 위한 Ajax 원본 체크하면 추가됨*/
	//체크박스 체크하자마자 즐겨찾기에 insert
	
	/*
	$('input:checkbox[name=empNo]').click(function(){//체크박스를 클릭했을때
		let	ckEmpNo =$(this).val();//체크한 사번을 chEmpNo에 담아줌
		let checked =$('#ckBox').is(':checked');//체크여부확인
		if(checked=true){//true 체크되어있는것
			$.ajax({
				type:"POST",
				url:"insertPavoAdd.do",
				data:{ckEmpNo:ckEmpNo},
				success:function(data){
					no=data;
					console.log("즐겨찾기에 추가 결과: "+no);
				if(no<1){
					alert("즐겨찾기 추가에 실패했습니다");
				}
				}
				
			})
		}
	});
	*/
	/* 체크해제하면 즐겨찾기에서 삭제되도록 */
	$('input:checkbox[name=empNo]').click(function(){//체크박스를 클릭했을때 실행되는 functuion
		let	ckEmpNo =$(this).val();//체크한 사번을 chEmpNo에 담아줌
		let checked =$('.ckBox').is(':checked');//체크여부확인
		let no=0;
		let num=0;
		
		if(checked=true){//true 체크됐을때
			console.log("ajax 즐겨찾기 추가준비"+ckEmpNo);
		
			$.ajax({
				type:"POST",
				url:"insertPavoAdd.do",
				data:{ckEmpNo:ckEmpNo},
				success:function(data){
					no=data;
					console.log("즐겨찾기에 추가 결과: "+no);
					if(no<1){
						$.ajax({
							type:"POST",
							url:"deletePavoAdd.do",
							data:{ckEmpNo:ckEmpNo},
							success:function(data){
								no=data;
								console.log("즐겨찾기에 삭제 결과: "+no);
								if(no<1){
									alert("즐겨찾기 삭제에 실패했습니다");
										}
									}
								})
							}
						}
						
					})
				}
			});

	var msg = '${msg}';
	var msgTitle = '${msgTitle}';
	if(msg && msgTitle){
	myAlert(msgTitle,msg); 
	}
	
	
	$(function(){
        $(".page_title>.title_name").text("전체 부서 주소록");
     });
</script>

</body>
</html>
