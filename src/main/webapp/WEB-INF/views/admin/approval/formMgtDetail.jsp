<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 서식 관리 상세 페이지</title>
</head>
<body>

	<jsp:include page="../../common/header.jsp"></jsp:include>
	
	<div class="main_section">
        
        
        
        
        
        
        
    </div>
    
    <script type="text/javascript">
	    $(document).ready(function() {
			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {	
				
				loginFn(); // 로그인 먼저
			}
		});
    </script>
</body>
</html>