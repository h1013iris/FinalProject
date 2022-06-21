<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
.annoDepartEnrollHeader {
	margin-bottom: 30px;
	font-size: 30px;
	font-weight: 600;
}

.middleEnrollForm {
	display: flex;
	justify-content: center;
	padding : 10px;
}

.enrollReplyStatusSection {
	display: flex;
}

.mainStyleCh {
	font-size: 20px;
	font-weight: 550;
	width: 100px;
}

.enrollContentSection, .enrollTitleSection, .enrollWriterSection,
	 .enrollReplyStatusSection{
	display: flex;
	margin-bottom: 20px;
}

#title, #writer {
	height: 25px;
	width: 618px;
}

.radioDiv {
	text-align: center;
	justify-content: center;
	align-items: center;
	font-size: 20px;
}

.enrollsubmitboard {
	width: 85px;
	height: 50px;
}

.main_section {
	text-align: center;
	justify-content: center;
	align-items: center;
	width: 83vw;
}

#enrollFormAnnoDepart {
	height: 90vh;
}

.buttonSection {
	height: 70px;
}

#bo {
	margin-left: 80%;
}
#input_fileupload{
     
    line-height: 22px;    
    text-align: center;
    width:623px;
    height: 25px;   
    
}
#lets_go_files{
 width:100px;
 display: flex;

}
#drop-zone{
  border: 1px solid black;  
    text-align: center;
    width:623px;
    height: 60px;
    margin-left:100px;
    overflow: auto;
    margin-bottom :20px;
}
  #main_nav img{
       width: 3vw !important;
       padding-left: 21% !important;
       padding-top: 20% !important;
   }


</style>

</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="main_section">
		<div class="middleEnrollForm">

			<form id="enrollFormAnnoDepart" action="insertenroll.do" method="post" enctype="multipart/form-data">
				

				<select name="bo" id="bo">
				<c:forEach items="${ bonum }" var="b">
					<option value="${b.boardno}">${b.boardname}</option>	
				</c:forEach>							
				</select>

				<!-- 제목 부분 -->
				<div class="enrollTitleSection">
					<div class="mainStyleCh" style="text-align:left;">
						<span style="color:red">*</span><span class="titleNamePart mainStyleCh">제목</span>
					</div>
					<input type="text" name="title" id="title" class="inputTitlePart"
						palaceholder="제목을 입력해주세요" value ="${b.title}" required>
				</div>
				<!-- 작성자 부분 session에서 값 받아오기 ${loginUser.empName} -->
				
				<div class="enrollWriterSection">
					<div class="mainStyleCh" style="text-align:left;">
						<span class="writerPart">작성자</span>
					</div>
					
					<input type="text" id="writer" name="writerName" value="${loginUser.empName}" readonly> 
					<input type="hidden" name="empno" value="${loginUser.empNo}"> 
					<input type="hidden" name="deno" value="${loginUser.departmentNo}">
					<input type="hidden" name="pno" value="${b.pno}">
                   
				</div>
					<!-- 파일 부분 -->
					
					<div class="enrollUpfileSection  filestorege" >
				  <div id="lets_go_files" class="go_files mainStyleCh" style="float:left;">
				        
				     	<span class="uploadfilePart" >첨부파일</span>
				     	
				    </div>
				  	<input  id="input_fileupload" name="file" type="file"  multiple  >	
				     
				    </div>
				    
				    <div id="drop-zone" class="drop-zone">   	
				    			    <h4>파일을 올려주세요</h4>
				    </div>	
				    
				  	
					<!-- 내용 부분 -->
					<div class="enrollContentSection">
						<div id="description" class="contentPart mainStyleCh" style="text-align:left;">
					<span style="color:red">*</span><span class="contentEn">내용</span>
						</div>
						<jsp:include page="note.jsp"/>
					</div>
				
					  
				    
					<div align="right" class="buttonSection">
						<button type="submit" class="commonButton1 enrollsubmitboard" >등록하기</button>
						<button type="button" class="commonButton1 enrollsubmitboard" onclick="history.back()">뒤로가기</button>
						<button type="button" class="commonButton1 enrollsubmitboard" id="saveboard"
							onclick="gopbox(${loginUser.empNo});">임시보관함</button>
						<button type="button" class="commonButton1 enrollsubmitboard" id="save"
							onclick="savebtn();" value="2">보관함에저장</button>
						<input type="hidden" name="save" id="saveval">
					</div>
			</form>
		</div>
	</div>

	<script>

	
	
	  ( function() {
           
           var thisfile = document.getElementById("input_fileupload")
           var dropZone = document.querySelector(".drop-zone")

           var toggleClass = function(className) {
               
               console.log("current event: " + className)

               var list = ["dragenter", "dragleave", "dragover", "drop"]

               for (var i = 0; i < list.length; i++) {
                   if (className === list[i]) {
                       dropZone.classList.add("drop-zone-" + list[i])
                   } else {
                       dropZone.classList.remove("drop-zone-" + list[i])
                   }
               }
           }
           
           var showFiles = function(files) {
               dropZone.innerHTML = ""
               for(var i = 0, len = files.length; i < len; i++) {
                   dropZone.innerHTML += "<p>" + files[i].name + "</p>"
               }
           }

           var selectFile = function(files) {
               // input file 영역에 드랍된 파일들로 대체
               thisfile.files = files
               showFiles(thisfile.files)
               
           }
           
           thisfile.addEventListener("change", function(e) {
               showFiles(e.target.files)
           })

           // 드래그한 파일이 최초로 진입했을 때
           dropZone.addEventListener("dragenter", function(e) {
               e.stopPropagation()//이벤트가 상위 엘리먼트에 전달되지 않게 막아 준다
               e.preventDefault()// 고유 동작을 중단시킴

               toggleClass("dragenter")

           })

           // 드래그한 파일이 dropZone 영역을 벗어났을 때
           dropZone.addEventListener("dragleave", function(e) {
               e.stopPropagation()//이벤트가 상위 엘리먼트에 전달되지 않게 막아 준다
               e.preventDefault()// 고유 동작을 중단시킴

               toggleClass("dragleave")
               $(this).css("background-color", "white");

           })

           // 드래그한 파일이 dropZone 영역에 머물러 있을 때
           dropZone.addEventListener("dragover", function(e) {
               e.stopPropagation() //이벤트가 상위 엘리먼트에 전달되지 않게 막아 준다
               e.preventDefault()// 고유 동작을 중단시킴

               toggleClass("dragover")
               $(this).css("background-color", "#85cdff");

           })

           // 드래그한 파일이 드랍되었을 때
           dropZone.addEventListener("drop", function(e) {
               e.preventDefault()
           
               toggleClass("drop")
               $(this).css("background-color", "white");
               $(this).css("border","1px solid black");
               $(this).width("623px");
               
               
               
               var files = e.dataTransfer && e.dataTransfer.files
               console.log(files)

               if (files != null) {
                   if (files.length < 1) {
                       alert("폴더 업로드 불가")
                       return
                   }
                   selectFile(files)
               } else {
                   alert("ERROR")
               }

           })

       })();
	   
	   
	  

	
	
	
	function gopbox(user){
		location.href="pbox.do?userno="+user
	}
	


function savebtn(){

    var btnValue =  document.getElementById("save")
    document.getElementById("saveval").value = btnValue.value
    document.getElementById('enrollFormAnnoDepart').submit();
}

$(function(){
    $(".page_title>.title_name").text("글 작성");
 })
</script>

</body>
</html>