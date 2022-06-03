<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 기록 수정 신청서</title>
<style type="text/css">
	
</style>
</head>
<body>

	
	<div class="formMainArea">
		<form class="docEnrollForm" action="insertCmtUpdateApp.do" method="post">
			<input type="hidden" name="docTypeNo" value="${ docForm }"/>
			<input type="hidden" name="docType" value="${ docForm }"/>
			<input type="hidden" name="drafter" value="${ loginUser.empNo }"/>
			<input type="hidden" name="drafterDept" value="${ loginUser.departmentNo }"/>
			<input type="hidden" name="approver" value="${ loginUser.empNo }"/>
			<input type="hidden" name="approverJob" value="${ loginUser.jobNo }"/>
			<!-- <input type="hidden" id="docTitle" name="docTitle" value="${ docTitle }"/> -->
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
								근태 기록 수정 신청서
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
												<span contenteditable="false">
													<input class="fix_input" id="drafter" name="drafterName" value="${ loginUser.empName } (${ loginUser.empNo })" readonly/>
												</span> 
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												소속
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span contenteditable="false">
													<input class="fix_input" id="drafterDept" name="drafterDept" value="" readonly/>
												</span>
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												기안일 
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span contenteditable="false">
													<input class="fix_input" id="draftDate" name="draftDate" type="date" readonly/>
												</span>
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												문서번호 
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span contenteditable="false">
													<input class="fix_input" value="문서번호" readonly/>
												</span>
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
													<input type="hidden" id="firstAprv" name="firstAprv" value=""/>
													<input class="fix_input approverName" id="firstAprvName" name="firstAprvName" value="" readonly/>
													<input class="fix_input approverJop" id="firstAprvJob" value="" readonly/>
												</td>
											</tr>
											<tr>
												<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
													2차 결재자
												</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
													<input type="hidden" id="secondAprv" name="secondAprv" value=""/>
													<input class="fix_input approverName" id="secondAprvName" name="secondAprvName" value="" readonly/>
													<input class="fix_input approverJop" id="secondAprvJob" value="" readonly/>
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
								<b style="color: rgb(255, 0, 0);">*</b> 수정일
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
								<span style="font-weight: normal;">
									<span contenteditable="false">
										<input id="updateDate" name="updateDate" type="date">
									</span>
									<span id="formErrorMsg" style="color: red; margin-left: 5px;"></span>
								</span>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 수정 전 시간
							</td>
							<td style="padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);">
								<span style="font-weight: normal;">
									<span contenteditable="false">
										출근 :
										<input id="beAttendTime" type="time" value ="" readonly> &nbsp; &nbsp;
										<input type="hidden" id="beAttendTime2" name="beAttendTime"/>
										퇴근 :
										<input id="beLeaveTime" type="time" value ="" readonly>
										<input type="hidden" id="beLeaveTime2" name="beLeaveTime"/>
									</span>
								</span>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 수정 후 시간
							</td>
							<td style="padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);">
								<span style="font-weight: normal;">
									<span contenteditable="false">
										출근 :
										<input id="attendTime" type="time"> &nbsp; &nbsp;
										<input type="hidden" id="attendTime2" name="attendTime"/>
										퇴근 :
										<input id="leaveTime" type="time">
										<input type="hidden" id="leaveTime2" name="leaveTime"/>
									</span>
								</span>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 250px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 수정 사유
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: top;">
								<span contenteditable="false" style="width: 100%;">
									<textarea class="txta_editor" id="updateReason" name="updateReason" style="width: 99%; height: 240px; resize: vertical;" maxlength="500"></textarea>
								</span> 
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			<div class="docEnrollBtnsArea">
				<button class="commonButton1 submit_btn docEnrollBtn" type="button">결재요청</button> <br>
				<button class="commonButton1 outbox_btn docEnrollBtn donEnrollOutboxBtn" type="button">임시저장</button> <br> <%-- 임시저장 기능 --%>
				<button class="commonButton1 cancle_btn docEnrollBtn donEnrollCancleBtn" type="button" style="background-color: #c8c8c8 !important;">취소</button>
			</div>
		</form>
 	</div>
 	
 	
 	<script type="text/javascript">
 		
 		// 화면 로드 시 가장 먼저 실행
	 	$(document).ready(function() {
	 		
 			// 로그인이 되어있지 않으면
 			if("${ loginUser.empNo }" == "") {
 				
 				loginFn(); // 로그인 먼저
 			
 			} else {
 		 		// 기안일 오늘 날짜로 설정
				$("#draftDate").val(new Date(+ new Date() + 3240 * 10000).toISOString().substring(0, 10));
 			
				// 소속 (로그인 유저의 부서 가져오기)
		 		$.ajax({
		 			
		 			type: "post",
 	                url: "selectDeptName.do",
 	                data: { deptNo : "${ loginUser.departmentNo }" },
 	                success: function (data) {
						
 	                	if(data != null || data != "") {
 	                		
 	                		$("#drafterDept").val(data);
 	                	}
 	                }
		 		})
		 		
		 		// 결재선 조회
		 		$.ajax({
		 			
		 			type: "post",
 	                url: "selectDeptApprover.do",
 	                data: { deptNo : "${ loginUser.departmentNo }" },
 	                success: function (data) {
						console.log(data);
 	                	if(data != null || data != "") {
 	                		
 	                		$("#firstAprvName").val(data[0].empName);
 	                		$("#firstAprv").val(data[0].empNo);
 	                		$("#firstAprvJob").val(data[0].jobName);
 	                		$("#secondAprvName").val(data[1].empName);
 	                		$("#secondAprv").val(data[1].empNo);
 	                		$("#secondAprvJob").val(data[1].jobName);
 	                	}
 	                }
		 		})
 			}
 			
	 	})
 		
 		
	 	// 수정일 변경 시
 		$("#updateDate").change(function() {
 			
 			$("#formErrorMsg").empty();
 			
 			let today = new Date(+ new Date() + 3240 * 10000).toISOString().substring(0, 10); // 오늘 날짜
 			let updateDate = new Date($(this).val());
 			
 			
 			if(updateDate > today) {
 				$("#formErrorMsg").text("내일 이후는 선택할 수 없습니다.");
				$("#updateDate").val(''); // 날짜 비워주고
 				$("#updateDate").focus(); // 포커싱
 			
 			
 			} else if(updateDate == today) {
 				$("#formErrorMsg").text("오늘 근태 기록은 수정할 수 없습니다.");
				$("#updateDate").val(''); // 날짜 비워주고
 				$("#updateDate").focus(); // 포커싱
 			
 			// 해당 날짜 출퇴근 기록 가져와서 수정 전 시간에 출력하기
 			} else {
				
 				$.ajax({
 					
 	 				type: "post",
 	                url: "selectCmt.do",
 	                data: { userNo : "${ loginUser.empNo }",
 	                		date : $("#updateDate").val()
 	                	  },
 	                success: function (attendLog) {
 	                	
 	                	if(attendLog != null) {
 	                		
 	                		$("#beAttendTime").val(attendLog.attendTime2);
 	 	                	$("#beLeaveTime").val(attendLog.leaveTime2);
 	 	                	
 	 	                	beforeTimeFn(); // 수정 전 시간 날짜와 합치는 함수 호출
 	 	                	// 꼭 ajax 안에서 해야 함 !!!!!!!!!!!!!!!!!!!
 	 	                	// 아니면 value 값 못 가져오 ㅁ...................
 	                	
 	                	} else {

 	                		$("#formErrorMsg").text("해당 날짜는 근태 기록이 없습니다.");
 	                		$("#updateDate").val(''); // 날짜 비워주고
 	                		$("#updateDate").focus(); // 포커싱
 	                	}
 	             		
 	                }	
 	                	
 				});
 			}
		
 		});
 		
 		
 		// ----------- 시간 데이터 넘기기 위해 날짜 합쳐서 hidden 으로 넘겨줌
 		// 객체에서 해당 타입 Stringd으로 바꾸고 insert 시 to_date 로 형변환
 		
 		// 수정 전 시간 날짜와 합치는 함수
 		function beforeTimeFn() {
 			
 			let updateDate = $("#updateDate").val();
 	 			
			let beAttendTime = $("#beAttendTime").val();
			let beLeaveTime = $("#beLeaveTime").val();
			
			$("#beAttendTime2").val(updateDate + " " + beAttendTime);
			$("#beLeaveTime2").val(updateDate + " " + beLeaveTime);
			
			console.log($("#beAttendTime2").val());
			console.log($("#beLeaveTime2").val());
 		}
 		
 		// 수정 후 출근 시간 변경 시
 		$("#attendTime").change(function() {
 			
 			let updateDate = $("#updateDate").val();
 				
			$("#attendTime2").val(updateDate + " " + $("#attendTime").val());
 		})
 		
 		// 수정 후 퇴근 시간 변경 시
 		$("#leaveTime").change(function() {
 			
 			let updateDate = $("#updateDate").val();
 			
 			$("#leaveTime2").val(updateDate + " " + $("#leaveTime").val());
 		})
 		
 		
 		
 		
 		//
 		$(".outbox_btn").click(function() {
 			
 			let attendTime = $("#attendTime").val();
 			let leaveTime = $("#leaveTime").val();
 			let today = new Date(+ new Date() + 3240 * 10000).toISOString();
 			
 			console.log(attendTime);
 			console.log(taday);
 			console.log(typeof(today));
 		})
 		
 		
 		
 		// 결재 요청 버튼 클릭 시
 		$(".submit_btn").click(function() {
 			
 			let updateDate = $("#updateDate").val();
 			let beAttendTime = $("#beAttendTime").val();
 			let beLeaveTime = $("#beLeaveTime").val();
 			let attendTime = $("#attendTime").val();
 			let leaveTime = $("#leaveTime").val();
 			let updateReason = $("#updateReason").val();
 			
			if(updateDate == null || updateDate == "") {
 				
 				let content = "수정일을 선택해주세요.";
				let focus="#updateDate";
				
 				alertFn(content, focus);
 				
 			} else if((beAttendTime == null || beAttendTime == "" )
 						&& (beLeaveTime == null || beLeaveTime == "")) {
 				
 				let content = "수정할 근태 기록이 없습니다.";
				let focus="#beAttendTime";
				
				alertFn(content, focus);
 				
 			} else if(attendTime == null || attendTime == "") {
 				
 				let content = "수정 후 출근 시간을 기입해주세요.";
				let focus="#attendTime";
				
 				alertFn(content, focus);
 				
 			} else if(leaveTime == null || leaveTime == "") {
 				
 				let content = "수정 후 출근 시간을 기입해주세요.";
				let focus="#leaveTime";
				
 				alertFn(content, focus);
 			
 			} else if(updateReason == null || updateReason == "") {
 				
 				let content = "수정 사유를 작성해주세요.";
				let focus="#updateReason";
				
 				alertFn(content, focus);
 			
 			// 모두 잘 입력되어 있는 경우
 			} else {
 				
 				// 폼의 모든 데이터 저장해서 변수로 선언
 	 			let form = $(".docEnrollForm").serialize();
 	 			
 				// post 방식으로 폼 제출
 	 			$.ajax({
 	 				
 	 				type: "post",
 	                url: "insertCmtUpdateApp.do",
 	                data: form,
 	                success: function (result) {
 	                	console.log(result)
 	                	
 	                    if(result == "success") {
							
 	                    	let content = "결재가 성공적으로 요청되었습니다.";
 	                    	resultFn(content);
	 	           	 		
 	                    } else {
 	                    	
 	                    	let content = "결재 요청에 실패하였습니다.";
 	                    	resultFn(content);
 	               		}
 	                }
 	        	});
 			}	
 		});
 		
		
 	</script>
 	
	<script src="${ pageContext.servletContext.contextPath }/resources/js/approval/docEnrollForm.js"></script>
 	
 	
 	
</body>
</html>