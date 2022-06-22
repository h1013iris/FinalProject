<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 등록 폼</title>
<style type="text/css">
	
	.main_section { background-color: #f3f3f3; }
	
	.docEnrollFormDiv {
		margin: 30px auto;
		width: 1150px;
	}

	.formMainArea {
		padding: 70px 0 0 100px;
	}
	
	.formArea {
		border: 1px solid darkgray;
		background-color: white;
		float: left;
		padding: 15px 25px 25px 25px;
	}
	
	.docEnrollBtnsArea {
		padding-top: 0;
		padding-left: 82.5%;
	}
	
	.docEnrollBtn {
		margin: 0 5px 10px 5px;
		width: 80px;
		height: 50px;
	}
	
	.fix_input {
		border:0 solid black;
	}
	
	.approverName {
		width: 1150px;
	}
	
	.approverJop {
		width: 40px;
	}
	
	.approverList {
		width: 100%;
	}
	
	.docEnroll_textarea {
		border: none;
		resize: vertical;
	}
	
	.donEnrollOutboxBtn {
		background-color: #6a6a6a !important;
		box-shadow: 0px 5px 0px 0px #545454 !important;
	}
	
	.donEnrollOutboxBtn:hover {
		box-shadow: 0px 0px 0px 0px #545454 !important;
	}
	
	.donEnrollCancleBtn {
		background-color: darkgray !important;
		box-shadow: 0px 5px 0px 0px #949494 !important;
	}
	
	.donEnrollCancleBtn:hover {
		box-shadow: 0px 0px 0px 0px #949494 !important;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

	<div class="main_section">
        <div class="docEnrollFormDiv">
	        <div class="docEnrollBackground">
		        <%-- 문서 서식에 맞게 폼 뜨도록 --%>
		        <c:choose>
		        	<c:when test="${ docForm == 10 }">
		        		<jsp:include page="documentForm/leaveEnrollForm.jsp"/>
		        	</c:when>
		        	<c:when test="${ docForm == 11 }">
		        		<jsp:include page="documentForm/cmtUpdateEnrollForm.jsp"/>
		        	</c:when>
		        	<c:when test="${ docForm == 20 }">
		        		<jsp:include page="documentForm/busDraftEnrollForm.jsp"/>
		        	</c:when>
		        	<c:when test="${ docForm == 30 }">
		        		<jsp:include page="documentForm/busCoopEnrollForm.jsp"/>
		        	</c:when>
	        	</c:choose>
        	</div>
		</div>
    </div>
    
    <script type="text/javascript">
    	
	 	// 화면 로드 시 가장 먼저 실행
	 	$(document).ready(function() {
	 		
			$(".page_title>.title_name").text("문서 등록");

			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {
				
				loginFn(); // 로그인 먼저
			
			} else {
		 		
				// 기안일 오늘 날짜로 설정				
				let today = new Date(+ new Date() + 3240 * 10000).toISOString().substring(0, 10);
				$("#dftDate").val(today);
				$("#draftDate").val(today);
		 		
				selectUserDeptName();
		 		
				selectApproverFn();
				
			}	
		});
	 	
	 	
	 	// 로그인 유저 소속(부서명) 조회
	 	function selectUserDeptName() {
	 	
	 		$.ajax({
	 			
	 			type: "post",
	            url: "selectDeptName.do",
	            data: { deptNo : "${ loginUser.departmentNo }" },
	            success: function (data) {
					
	            	if(data != null || data != "") {
	            		$("#drafterDeptName").val(data);
	            		$("#drafterDept").val(data);
	            	}
	            }
	 		});
	 	}
	 	
	 	// 결재자 조회하는 함수
 		function selectApproverFn() {
 			
 			// 결재자 조회
 			$.ajax({
 				
 				type: "post",
 				url: "selectDocEnrollApprover.do",
 				data: { empNo :  "${ loginUser.empNo }",
 						departmentNo : "${ loginUser.departmentNo }",
 						jobNo : "${ loginUser.jobNo }" },
 				success: function(list) {
 					console.log(list);
                	if(list != null || list != "") {
                		
                		$.each(list, function(i) {
                			$(".approverList").append("<option value='" + list[i].empNo + "'>" 
           								  		+ list[i].empName + " / " + list[i].jobName + "</option>");
                		});
                	}
 				}
 				
 			});
 		}
	 	
	 	
 		// 부서 조회해서 select에 넣기
	 	function selectDeptListFn(appendId) {
	 		
			$.ajax({
	 					 			
	 			type: "post",
                url: "selectDeptList.do",
               	data: { deptNo : "${ loginUser.departmentNo }" },
                success: function (list) {
				
                	console.log(list);
                	
                	if(list != null || list != "") {
                		
                		$.each(list, function(i) {
                			$(appendId).append("<option value='" + list[i].deptNo + "'>" 
                									 + list[i].deptTitle + "</option>");
                		});
                	}
                }
	 		});
	 	}
 		
 		
 		// 1차 결재자 선택 시 같은 결재자를 2차 결재자로 선택하지 못 하도록
 		$(document).on("change", "#firstAprv", function() {
 			
 			let firstAprv = $(this).val();
 			let secondAprv = $("#secondAprv").val();
 			
 			// 모든 option에 disabled 속성 제거 후 선택한 값만 disabled
 			$("#secondAprv option").prop("disabled", false);
 			$("#secondAprv option[value*='"+ firstAprv +"']").prop("disabled", true);
 			
 			if(secondAprv != null && secondAprv != ""
 					&& firstAprv != null && firstAprv != "") {

 				aprvJobCompareFn(firstAprv, secondAprv);
 				$(".approverList option").prop("disabled", false);
 			}
 		});
 		
 		
 		// 1차 결재자 선택 시 같은 결재자를 2차 결재자로 선택하지 못 하도록
 		$(document).on("change", "#secondAprv", function() {
 			
 			let secondAprv = $(this).val();
 			let firstAprv = $("#firstAprv").val();
 			
 			$("#firstAprv option").prop("disabled", false);
 			$("#firstAprv option[value*='"+ secondAprv +"']").prop("disabled", true);
 			
 			if(secondAprv != null && secondAprv != ""
 					&& firstAprv != null && firstAprv != "") {

 				aprvJobCompareFn(firstAprv, secondAprv);
 				$(".approverList option").prop("disabled", false);
 			}
 		}); 		
 		
	 	
 		// 결재자들의 직급 비교
 		function aprvJobCompareFn(firstAprv, secondAprv) {
			
 			$.ajax({
 				type: "get",
 				url: "selectApproverJob.do",
 				data: { empNo : firstAprv },
 				success: function(firstAprv) {
 					
 					$.ajax({
 						type: "get",
 		 				url: "selectApproverJob.do",
 		 				data: { empNo : secondAprv },
 		 				success: function(secondAprv) {
 		 					
 		 					// 1차 결재자의 직급이 더 높은 경우 알림 후 결재자 비워주기
 		 					if(firstAprv == secondAprv) {
 		 						myAlert("결재자 확인", "두 결재자의 직급이 같을 수 없습니다.");
 		 						$("#firstAprv").val("");
 		 						$("#secondAprv").val("");
 		 					
 		 					} else if(firstAprv > secondAprv) {
 		 						myAlert("결재자 확인", "1차 결재자의 직급이 더 높을 수 없습니다.");
 		 						$("#firstAprv").val("");
 		 						$("#secondAprv").val("");
 		 					
 		 					} 
 		 				}
 					});
 				}
 			});
 		}
 		
 		
    	// 문서 등록 페이지에서 취소 버튼 클릭 시
    	$(".cancle_btn").click(function() {
			
    		$("#confirm_container .title_name").text("문서 등록 취소 확인");
    		$("#confirm_body .confirm_content").text("문서 작성을 취소하시겠습니까?");
    		$("#helpmeCOnfirm").css("display","block");
    		
    		// 확인 버튼 클릭 시 모달 사라지고
    		$(document).on("click", ".true_btn", function() {
     			
    			$("#helpmeCOnfirm").css("display","none");
    			
    			location.href=document.referrer; //이전 페이지로 이동
    			// document.referrer : 마지막 페이지의 url을 가져오면 이전 정보는 가져올 수 없음
     		})
			
		});
		
    </script>
    
</body>
</html>