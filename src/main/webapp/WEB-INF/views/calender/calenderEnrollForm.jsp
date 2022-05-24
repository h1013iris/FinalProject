<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Latte-일정 추가하기</title>
</head>
	<style>
		.iput{
			display: flex;
		}
		.cal-Enrollform{
			justify-content: center;
		}
		.inputTitle{
			
		}
	</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
        <div class="cal-Enrollform">
        	<form id="enrollForm-Schedule" action="insertCalender.do" method="post" enctype="multipart/form-data">
       		<div><h2>일정 추가하기</h2></div>
	       	<div>
	          <div class="iput">
	          	<h4>일정 제목</h4>
	          </div>
	        </div>
	       	<div>
	          <div class="iput">
	          	<h4>일시</h4>
	          </div>
	        </div>
	       	<div>
	          <div class="iput">
	          	<h4 class="inputTitle">구분</h4>
	          </div>
	        </div>
	       	<div>
	          <div class="iput">
	          	<h4 class="inputTitle">공개 여부</h4>
	          </div>
	        </div>
	       	<div>
	          <div class="iput">
	          	<h4 class="inputTitle">메모</h4>
	          </div>
	        </div>
	       	<div>
	          <div class="iput">
	          	<h4 class="inputTitle">알림</h4>
	          </div>
	        </div>
	       	<div>
	          <div class="iput">
	          	<h4 class="inputTitle">장소</h4>
	          </div>
	        </div>
	       	<div>
	          <div class="iput">
	          	<h4 class="inputTitle">범주</h4>
	          </div>
	        </div>
        </form>
        </div>
    </div> 
</body>
</html>