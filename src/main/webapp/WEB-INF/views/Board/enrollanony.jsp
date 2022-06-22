<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>

<style type="text/css">
.annoDepartEnrollHeader {
	margin-bottom: 30px;
	font-size: 30px;
	font-weight: 600;
}

.middleEnrollForm {
	display: flex;
	justify-content: center;
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
	 .enrollReplyStatusSection, .anonypasswordSection{
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


</style>

</head>

<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="main_section">
		<div class="middleEnrollForm">

			<form id="enrollFormAnnoDepart" action="insertanony.do" method="post" enctype="multipart/form-data">
				<div class="annoDepartEnrollHeader">
					<h2>글 작성</h2>
				</div>

				
				<!-- 제목 부분 -->
				<div class="enrollTitleSection">
					<div class="mainStyleCh">
				<span style="color:red">*</span><span class="titleNamePart mainStyleCh">제목</span>
					</div>
					<input type="text" name="title" id="title" class="inputTitlePart"
						palaceholder="제목을 입력해주세요" value ="${b.title}" required>
				</div>
				<!-- 작성자 부분 session에서 값 받아오기 ${loginUser.empName} -->
				
				<div class="enrollWriterSection">
					<div class="mainStyleCh">
						<span style="color:red">*</span><span class="writerPart">작성자</span>
					</div>
					
					<input type="text" id="writer" name="nickname"> 
					
							                
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
						<div id="description" class="contentPart mainStyleCh">
							<span style="color:red">*</span><span class="contentEn">내용</span>
						</div>
						<jsp:include page="note.jsp"/>
					</div>
				    <div class="anonypasswordSection">
				    <div class="mainStyleCh">
				    <span style="color:red">*</span><span class="uploadfilePart" >비밀번호</span>
				    </div>
				    <input type="password" name="password" maxlength="4"  required>
				    </div>
					  
				    
					<div align="right" class="buttonSection">
						<button type="submit" class="commonButton1" >등록하기</button>
						<button type="button" class="commonButton1" onclick="history.back()">뒤로가기</button>
					
					
					</div>
			</form>
		</div>
	</div>

	<script>
	   (function() {
           
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
               e.stopPropagation()
               e.preventDefault()

               toggleClass("dragenter")

           })

           // 드래그한 파일이 dropZone 영역을 벗어났을 때
           dropZone.addEventListener("dragleave", function(e) {
               e.stopPropagation()
               e.preventDefault()

               toggleClass("dragleave")
               $(this).css("background-color", "white");

           })

           // 드래그한 파일이 dropZone 영역에 머물러 있을 때
           dropZone.addEventListener("dragover", function(e) {
               e.stopPropagation()
               e.preventDefault()

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
    $(".page_title>.title_name").text("익명 글 작성");
 })
</script>
</body>
</html>