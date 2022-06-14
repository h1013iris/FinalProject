<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 임시보관함</title>

</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<style>
    
    #container{
        text-align: center;
    }
    #contain{
      margin:0;
        width: 1000px;
    }
    td, th{
        border : 1px solid black;
        width: 300px;
    }
    table{
        margin: 0;
        text-align: center;

    }
    .a{
        width: 200px;
        display: inline-block;
       	background-color: aqua;
        margin: 2px;
        height: 30px;
        text-align: center;
    }
 
    

</style>
<div class="main_section">
<div id="container">
<!--거래처 주소록 폴더들 표시될곳-->
<div id="left">
<!--고객 주소록 내용이 표시될곳-->
<div id="addcon">
<form>
<h1>거래처 주소록 임시보관함 입니다</h1>

<table>
	<tr>
		<th></th>
		<th>회사명</th>
		<th>휴대폰</th>
		<th>이메일</th>
		<th>기타</th>
	</tr>
	<c:forEach items="${comBoxList}" var="com">
	<tr>
		<td><input type="checkbox" name="compNo" value="${com.compNo}" id="compNo"></td>
		<td>${com.comNm}</td>
		<td>${com.comPhone}</td>
		<td>${com.comEmail}</td>
		<td>${com.comMemo}</td>
	</tr>
	</c:forEach>
</table>
</form>


<form>
<h1>고객 주소록 임시보관함 입니다</h1>

<table>
	<tr>
		<th></th>
		<th>회사명</th>
		<th>휴대폰</th>
		<th>이메일</th>
		<th>기타</th>
	</tr>
	<c:forEach items="${custoBoxList}" var="custo">
	<tr>
		<td><input type="checkbox" name="cusNo" value="${custo.cusNo}" id="cusNo"></td>
		<td>${custo.comNm}</td>
		<td>${custo.comPhone}</td>
		<td>${custo.comEmail}</td>
		<td>${custo.comMemo}</td>
	</tr>
	</c:forEach>
</table>
<button type="button" class="deleteCustoBox" onclick="deleteCustoBox(1)">삭제</button>
<input type="button" value="복원" id="custoBack"/>
</form>

    </div>
    </div>
    </div>
</div>
<script>
//삭제 ajax
	function deleteCustoBox(num){
	var no = 0;
	var cusNoArr=[];
	if(num==1){
	$("input:checkbox[name=cusNo]:checked").each(function(){
		var cus = $(this).val();
		cusNoArr.push(cus);
		//cusNoArr+=$(this).val();//체크된 값의 value가져오기
		
		}); 
	console.log("고객 주소록 임시보관함 삭제 체크목록 : "+cusNoArr);
		
	/*$.ajax({
		type:"GET",
		url:"deleteCustoBox.do",
		data:{cusNoArr:cusNoArr},
		success:function(data){
			console.log("삭제결과" + data);
			no=data;
			if(no>0){
				alert("삭제 되었습니다.");
				location.href="boxAdd.do";
			}else if(no<1){
				alert("삭제 실패 했습니다.");
				location.href="boxAdd.do";
			}
		}
	})*/
	
	}
}
</script>
</body>
</html>