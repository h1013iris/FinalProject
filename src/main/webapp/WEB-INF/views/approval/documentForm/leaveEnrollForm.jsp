<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청서</title>
<style type="text/css">
	
	.drafterArea {
		/*border: 1px solid blue;*/
	}
	
	.drafterAreaTable {
		/*float: right;*/
	}
	
	/*#vacUseDays:invalid  {
		background-color: #e79fa5;
	}*/
	
</style>
</head>
<body>
	<!-- 오늘 날짜 설정  -->
	<c:set var="today" value="<%=new java.util.Date()%>"/> 
	<!-- 날짜 구하기 -->
	<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>

	<div class="formMainArea">
		
		<form class="docEnrollForm" action="insertLeaveApp.do" method="post">
			<input type="hidden" name="docTypeNo" value="${ docForm }"/>
			<input type="hidden" name="docType" value="${ docForm }"/>
			<input type="hidden" name="approver" value="${ loginUser.empNo }"/>
			<input type="hidden" name="approverJob" value="${ loginUser.jobNo }"/>
			<input type="hidden" name="aprvPro" value="D"/>
			
			<div class="formArea" style="font-family:돋움; font-size:9pt;">
		
				<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;"><!-- Header --> 
				    <colgroup> 
				     <col width="310"> 
				     <col width="490"> 
				    </colgroup> 
		    
					<tbody>
						<tr>
							<td style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
								휴가 신청서
							</td>
						</tr>
						<tr>
							<td style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
								
								<table style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;"><!-- User --> 
							        <colgroup> 
							        	<col width="90"> 
							         	<col width="220"> 
							        </colgroup> 
			        
									<tbody>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												기안자
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<div contenteditable="false" data-cid="0" data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value="" data-autotype="">
													<input type="hidden" name="drafter" value="${ loginUser.empNo }"/>
													<input class="fix_input" id="drafter" name="drafterName" value="${ loginUser.empName }" readonly/>
												</div> 
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												소속
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<div contenteditable="false" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
													<input type="hidden" name="drafterDept" value="${ loginUser.departmentNo }" />
													<input class="fix_input" id="drafterDept" name="drafterDeptName" value="${ loginUser.departmentNo }" readonly/>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												기안일 
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<div contenteditable="false">
													<input class="fix_input" id="draftDate" name="draftDate" value="${ date }" readonly/>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												문서번호 
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<div contenteditable="false">
													<input class="fix_input" value="문서번호" readonly/>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td style="background: white; padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
								<div class="drafterArea">
									<table class="drafterAreaTable" style="float: right; border: 0px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; border-collapse: collapse;">
										<colgroup> 
								        	<col width="90"> 
								         	<col width="180"> 
							        	</colgroup>
							        	
										<tbody>
											<tr>
												<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
													1차 결재자
												</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
													<input type="hidden" name="firstAprv" value="${ approver[0].empNo }"/>
													<input class="fix_input" name="firstAprvName" value="${ approver[0].empName }" readonly/>
												</td>
											</tr>
											<tr>
												<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
													2차 결재자
												</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
													<input type="hidden" name="secondAprv" value="${ approver[1].empNo }"/>
													<input class="fix_input" name="secondAprvName" value="${ approver[1].empName }" readonly/>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
		 		
		   
				<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 30px; border-collapse: collapse;"><!-- 휴가 신청 --> 
		    		<colgroup> 
				    	<col width="120"> 
				     	<col width="790"> 
				    </colgroup>
		    
					<tbody>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 휴가 종류
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
								<div contenteditable="false" data-cid="4" data-dsl="{{cSel_선택_연차_오전반차_오후반차_결혼(본인)_결혼(본인,배우자의 형제자매)_결혼(자녀)_사망(배우자)_사망(본인, 배우자의 부모)_사망(본인,배우자의 조부모)_사망(자녀)_사망(본인, 배우자의 백숙부모)_사망(본인, 배우자의 형제자매)_회갑(본인,배우자의 부모)_출산(배우자)_출산(본인)_보건휴가_예비군_민방위_병가(무급휴가)_탈상_교육훈련휴가_공민권}}" data-wrapper="" style="" data-value="" data-autotype="">
									<select id="vacType" name="vacType" style="width:40%">
										<option value="none">선택</option>
										<option value="연차">연차</option>
										<option value="오전반차">오전반차</option>
										<option value="오후반차">오후반차</option>
										<option value="보건휴가">보건휴가</option>
										<option value="병가(무급휴가)">병가(무급휴가)</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 휴가 기간
							</td>
							<td style="padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);">
								<span style="font-weight: normal;">
									<span contenteditable="false" data-cid="5" data-dsl="{{period}}" data-wrapper="" style="" data-value="" data-autotype="">
										<input id="startDate" name="startDate" type="date" min=""> ~ 
										<input id="endDate" name="endDate" type="date">
									</span> &nbsp;
								</span> &nbsp;
								<b>사용일수 : </b>
								<span contenteditable="false">
									<input id="vacUseDays" name="vacUseDays" oninput="useDaysCheck()" type="number" min="0.5" step="0.5" style="width: 15%">
								</span>일
								<span id="formErrorMsg" style="color: red; margin-left: 5px;"></span> 
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 250px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 휴가 사유
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: top;">
								<div contenteditable="false" style="width: 100%;">
									<textarea class="txta_editor" id="vacReason" name="vacReason" style="width: 99%; height: 240px; resize: vertical;" maxlength="500"></textarea>
								</div> 
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			<div class="docEnrollBtnsArea">
				<button class="commonButton1 submit_btn docEnrollBtn" type="button">결재요청</button> <br>
				<button class="commonButton1 outbox_btn docEnrollBtn" type="button">임시저장</button> <br> <%-- 임시저장 기능 --%>
				<button class="commonButton1 cancle_btn docEnrollBtn" type="button" style="background-color: #c8c8c8 !important;">취소</button>
			</div>
		</form>
 	</div>
 	
 	<script type="text/javascript">
 		
 		// 휴가 날짜 유효성 검사 위해
		let diffDate = new Date(endDate).getTime() - new Date(startDate).getTime();
		let dateDays = diffDate / (1000 * 3600 * 24);
		
		// 휴가 시작 기간 오늘 날짜로 기본값 설정
 		window.onload = function() {
 			
 			let startDate = $("#startDate");
 			
 			document.getElementById("startDate").value = new Date().toISOString().substring(0, 10);
 		}
 	
		
 		// 사용일수 입력 시 실행되는 함수
 		function useDaysCheck() {

 			// 한글 입력 방지, 한글 입력 시 replace 로 대체
 			this.val() = this.val().replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
 			
 			
			if(dateDays >= 0 && ) {
 				
 				$("#formErrorMsg").text("사용일수를 다시 입력해주세요.");
 				$("#vacU").focus();
 			}

 			
 			
 		}
 	
 		
 		// 임시저장 버튼 클릭 시 
 		$(".outbox_btn").click(function() {

 						
 			
 		})
 		
 	
 	
 		$(".submit_btn").click(function() {
 			
 			let drafter = $("#drafter").val();
 			let drafterDept = $("#drafterDept").val();
 			let draftDate = $("#draftDate").val();
 			let vacType = $("#vacType").val();
 			let startDate = $("#startDate").val();
 			let endDate = $("#endDate").val();
 			let vacUseDays = $("#vacUseDays").val();
 			let vacReason = $("#vacReason").val();
 			
 			
			
			if(drafter == null || drafter == "" || drafterDept == null || drafterDept == "") {
 				
 				let content = "로그인이 필요합니다.";
				let focus="";
 				alertFn(content, focus);
 				
 			} else if(vacType == "none") {
 				 
 				let content = "휴가 종류를 선택해주세요.";
 				let focus = "#vacType";

 				alertFn(content, focus);
 				
 			} else if(startDate == null || startDate == "") {
 				
 				let content = "휴가 시작 날짜를 선택해주세요.";
 				let focus = "#startDate";
 
 				alertFn(content, focus);
 				
 			} else if(endDate == null || endDate == "") {
 				
 				let content = "휴가 마지막 날짜를 선택해주세요.";
 				let focus = "#endDate";
 				
 				alertFn(content, focus);
 				
 			// 휴가 시작 날짜가 끝 날짜보다 큰 경우
 			} else if(dateDays < 0)  {
 				
 				$("#formErrorMsg").text("휴가 기간을 다시 선택해주세요.");
 				$("#endDate").focus();
 			
 			} else if(vacUseDays == null || vacUseDays == "") {
 				
 				let content = "사용일수를 입력해주세요.";
 				let focus = "#vacUseDays";
 				
 				alertFn(content, focus);
 			
 			} else if(dateDays + 1) != vacUseDays) {
 				
 				$("#formErrorMsg").text("휴가 기간을 다시 선택해주세요.");
				$("#endDate").focus();
 				
 				
 			} else if(vacReason == null || vacReason == "") {
 				 				
 				let content = "휴가 사유를 작성해주세요.";
 				let focus = "#vacReason";
 				
 				alertFn(content, focus);
			
 			// 모두 잘 입력되어 있는 경우
 			} else {
 				
 				// 폼의 모든 데이터 저장해서 변수로 선언
 	 			let form = $(".docEnrollForm").serialize();
 	 			// post 방식으로 폼 제출
 	 			$.ajax({
 	 				type: "post",
 	                url: "insertLeaveApp.do",
 	                data: form,
 	                success: function (result) {
 	                	console.log(result)
 	                    if(result == "success"){

 	                    	$("#alert_container .title_name").text("문서 등록 확인");
 	           				$("#alert_body .alert_content").text("결재가 정상적으로 요청되었습니다.");
 	           				$("#alertBackground").css("display","block");
	 	           			// 클릭 버튼 취소 시 모달 사라지고
	 	           			$(document).on("click", ".cancel_btn", function() {
	 	           	 			
	 	           				$("#alertBackground").css("display","none")
	 	           				// 결재 메인으로 이동
	 	           				location.href="approvalMain.do";
	 	           	 		})
 	                    }

 	                }
 	                
 	            })
 			}
		
 		})

	  	
 		// alert 모달 띄우는 함수
 		function alertFn(content, focus) {
 			
 			$("#alert_container .title_name").text("문서 등록 확인");
			$("#alert_body .alert_content").text(content);
			$("#alertBackground").css("display","block");
			// 클릭 버튼 취소 시 모달 사라지고
			$(document).on("click", ".cancel_btn", function() {
	 			
				$("#alertBackground").css("display","none")
	 			$(focus).focus(); // 해당 위치에 포커스
	 		})
 		}
 		
 		
 		
 		
 		


 		
 	</script>
 	<script src="${ pageContext.servletContext.contextPath }/resources/library/jquery-3.6.0.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/header.js"></script>
 	
</body>
</html>