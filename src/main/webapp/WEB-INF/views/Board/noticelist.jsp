<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#boardList{text-align: center;}

#notice{

}

#sort{
float : right;

}
#bu{
width : 250px;
height : 80px;

}

img{
width : 50px;
height : 50px;
}

#ham{

}

.dropdown{
  position : relative;
  display : inline-block;
}

.dropdown-content{
  display : none;
}

.dropdown-content a{
  display : block;
}

.dropdown:hover .dropdown-content {
  display: block;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="main_section">
 
     
 <div class="ham"> 

<button id="bu"></button>
<button id="bu"></button>
<button id="bu"></button>
<button id="bu"></button>

<!--  -->
 <div class="dropdown">
      <img class="ham_img" src="${ pageContext.servletContext.contextPath }/resources/images/햄버거.png"/>
      <div class="dropdown-content">
        <a href="#">link 1</a>
        <a href="#">link 2</a>
        <a href="#">link 3</a>
      </div>
    </div> 

</div>

 <table id="boardList" class="table table-hover" align="center">
 

                <thead>
                  <tr>                  
                    <th>제목</th>
                    <th>작성자</th>                   
                    <th>작성일</th>                    
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="n">
                	<hr>
	                    <tr>	                        
	                        <td>${ n.boardTitle }</td>
	                        <td>${ n.boardWriter }</td>	                        
	                        <td>${ n.createDate }</td>
	                                               
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
         </div>     
         
         
  
</body>

</html>