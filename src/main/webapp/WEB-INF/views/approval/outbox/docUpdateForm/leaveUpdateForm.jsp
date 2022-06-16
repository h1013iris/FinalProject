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

	<div class="formMainArea">
		<div class="outboxNo_div">
			임시 보관 번호 : 
			<span id="outboxNo"></span>			
		</div>
		
		<form class="docUpdateForm">
			<input type="hidden" name="docTypeNo" value="${ docForm }"/>
			<input type="hidden" name="docType" value="${ docForm }"/>
			<input type="hidden" name="drafter" value="${ loginUser.empNo }"/>
			<input type="hidden" name="drafterDept" value="${ loginUser.departmentNo }"/>
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
													<input class="fix_input" id="drafterDept" name="drafterDeptName" value="" readonly/>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												기안일 
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<div contenteditable="false">
													<input class="fix_input" id="dftDate" name="dftDate" value="" readonly/>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												문서번호 
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<div contenteditable="false">
													<input class="fix_input" id="docNo" name="docNo" value="" readonly/>
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
													<input type="hidden" id="firstAprv" name="firstAprv" value="" required/>
													<input class="fix_input approverName" id="firstAprvName" name="firstAprvName" value="" readonly required/>
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
								<b style="color: rgb(255, 0, 0);">*</b> 휴가 종류
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
								<div contenteditable="false">
									<select id="vacType" name="vacType" style="width:40%">
										<option value="">선택</option>
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
										<input id="startDate" name="startDate" type="date" readonly> ~ 
										<input id="endDate" name="endDate" type="date">
									</span> &nbsp;
								</span> &nbsp;
								<b>사용일수 : </b>
								<span contenteditable="false">
									<input id="vacUseDays" name="vacUseDays" type="number" min="0.5" step="0.5" style="width: 15%" readonly>
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
									<textarea class="" id="vacReason" name="vacReason" style="width: 99%; height: 240px; resize: vertical;" maxlength="500">
									</textarea>
								</div> 
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			<div class="docUpdateBtnsArea">
				<button class="commonButton1 docUpdateFormBtn docSubmit_btn" type="button">결재요청</button> <br>
				<button class="commonButton1 docUpdateFormBtn docUpdate_btn" type="button">수정</button> <br> <%-- 임시저장 기능 --%>
				<button class="commonButton1 docUpdateFormBtn cancle_btn" type="button">취소</button>
			</div>
		</form>
 	</div>
 	
 	<script type="text/javascript">
 		
 		// 임시저장 버튼 클릭 시 카운팅될 변수 선언
 		let count = 0;
 		
 		// 화면 로드 시 가장 먼저 실행
 		$(document).ready(function() {
 			
			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {
 				
				loginFn(); // 로그인 먼저
 			
			} else {
								
 				let today = new Date(+ new Date() + 3240 * 10000).toISOString().substring(0, 10);
 				// 휴가 시작 날짜, 기안일 오늘 날짜로 기본값 설정
 	 			$("#dftDate").val(today);
 	 			$("#startDate").val(today);
 	 			
 	 			selectDeptFn(); // 기안자 부서 가져오는 함수
 	 			
		 		selectLeaveFormOutboxFn(); // 기존 내용 조회
		 		
 			}
 			
 		});
		
 		
 		// 기안자 부서 가져오는 함수
 		function selectDeptFn() {
 			
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
	 		});
 		}
 		
 		
 		// 기존 내용 조회
 		function selectLeaveFormOutboxFn() {
 			
 			// 문서 내용 조회
			$.ajax({
			
				type: "post",
				url: "selectLeaveFormOutbox.do",
				data: { outboxNo : "${ outboxNo }" },
				success: function(data) {
					
					console.log(data)
					$("#drafter").val(data.drafterName + " (" + data.drafter + ")");
					$("#drafterDept").val(data.drafterDept);
					$("#dftDate").val(data.dftDate);
					//$("#docNo").val(data.docNo);
					$("#vacType").val(data.vacType);
					$("#startDate").val(data.startDate);
					$("#endDate").val(data.endDate);
					$("#vacUseDays").val(data.vacUseDays);
					$("#vacReason").val(data.vacReason);
					$("#outboxNo").text(data.outboxNo);
					
					// 문서 번호가 없으면
					if(data.docNo == 0) {
						$("#docNo").val("");
					} else {
						$("#docNo").val(data.docNo);
					}
					
					// 문서 번호가 존재하지 않으면 -> 처음 등록 시 임시 저장한 경우
			 		if($("#docNo").val() == null || $("#docNo").val() == "") {
			 			selectApproverFn(); // 문서 등록 시 결재자 조회하는 함수
			 			
			 		} else {
			 			aprvCancleDocApproverFn();	// 결재 취소한 문서의 결재자 조회하는 함수
			 		}
				}
			});
 		}
 		
 		
 		// 결재 취소한 문서의 결재자 조회하는 함수
 		function aprvCancleDocApproverFn() {
 			
 			$.ajax({
	 			
	 			type: "post",
                url: "selectDocApprover.do",
                data: { docNo : $("#docNo").val() },
                success: function (data) {
				console.log(data);
                	if(data != null) {
                		
                		$("#firstAprvName").val(data.firstAprv);
                		$("#firstAprvJob").val(data.firstJob);
                		$("#secondAprvName").val(data.secondAprv);
                		$("#secondAprvJob").val(data.secondJob);
                	}
                }
	 		});
 		}
 		
 		
 		// 등록 시 임시저장한 문서 결재자 조회하는 함수
 		function selectApproverFn() {
 			
 			// 결재선 조회
	 		$.ajax({
	 			
	 			type: "post",
                url: "selectDeptApprover.do",
                data: { deptNo : "${ loginUser.departmentNo }",
                		jobNo : "${ loginUser.jobNo }"},
                success: function (list) {
				console.log(list);
                	if(list != null || list != "") {
                		
                		$("#firstAprvName").val(list[0].empName);
                		$("#firstAprv").val(list[0].empNo);
                		$("#firstAprvJob").val(list[0].jobName);
                	}
                	
                	if(list.length == 2) {
                		$("#secondAprvName").val(list[1].empName);
                		$("#secondAprv").val(list[1].empNo);
                		$("#secondAprvJob").val(list[1].jobName);
                	}
                }
	 		});
 		}
 		
		
		// 휴가 종류에 따른 기간 유효성 검사
		$("#vacType").change(function() {
			
			reset();
			
			let thisVal = $(this).val();
			
			// 반차 선택 시 시작 날짜와 끝 날짜 일치, 사용일수 0.5로 고정
			if(thisVal.indexOf("반차") > 0) {
				
				document.getElementById("endDate").value = $("#startDate").val();
				$("#endDate").attr('readonly', true);
				
				document.getElementById("vacUseDays").value = 0.5;
				$("#vacUseDays").attr('readonly', true);
			}
		})
		
		
		
		// 끝 날짜 수정 시
 		$("#endDate").change(function() {
 			
 			$("#formErrorMsg").empty(); // 날짜 바뀌면 text 비워주기
			
			let startDate = new Date($("#startDate").val());
 			let endDate = new Date($("#endDate").val());
 			
 			console.log(startDate)
 			console.log(endDate)
 			
			// 휴가 날짜 유효성 검사 위해
			let diffDate = endDate.getTime() - startDate.getTime();
			let dateDays = diffDate / (1000 * 3600 * 24);
			
			//console.log(dateDays);
			
			// 휴가 시작 날짜가 끝 날짜보다 큰 경우
			if(dateDays < 0) {
				
				$("#formErrorMsg").text("시작일보다 빠를 수 없습니다.");
				$("#endDate").val(''); // 끝 날짜 비워주고
 				$("#endDate").focus(); // 포커싱
 				$("#vacUseDays").val(''); // 사용일수도 비우기
 				
				
 			// 휴가 기간 잘 입력한 경우
			} else {
				
				var count = 0; // 주말 제외 평일 카운트할 변수 선언
				
				while(true) {  
				    
					var temp_date = startDate;
					
				    if(temp_date.getTime() > endDate.getTime()) {
				        //console.log("count : " + count);
				        break;
				    
				 	} else {
				        
				    	var tmp = temp_date.getDay();
				        
						if(tmp == 0 || tmp == 6) { // 주말
				            //console.log("주말");

				        } else { // 평일
				            //console.log("평일");
				            count++;
				        }
						
				        temp_date.setDate(startDate.getDate() + 1); 
				    }						
			
				}
				
				// 휴가 11일 이상 사용 시
				if(count > 10) {
					$("#formErrorMsg").text("11일 이상 사용할 수 없습니다.");
					$("#endDate").val(''); // 끝 날짜 비워주고
	 				$("#endDate").focus(); // 포커싱
	 				$("#vacUseDays").val(''); // 사용일수도 비우기
				
				} else {
					$("#vacUseDays").val(count);
					$("#vacUseDays").attr('readonly', true);
				}
			}
 		})
		
 		
		
		// 날짜, 사용일수 리셋하는 함수
		function reset() {
			
			document.getElementById("endDate").value = "";
			document.getElementById("vacUseDays").value = "";
			$("#endDate").removeAttr('readonly');
			$("#vacUseDays").removeAttr('readonly');
			$("#formErrorMsg").empty();
		}

		
		
		// 결재 요청 버튼 클릭 시
 		$(".docSubmit_btn").click(function() {
 			
 			let drafter = $("#drafter").val();
 			let drafterDept = $("#drafterDept").val();
 			//let draftDate = $("#draftDate").val();
 			let vacType = $("#vacType").val();
 			let startDate = $("#startDate").val();
 			let endDate = $("#endDate").val();
 			let vacUseDays = $("#vacUseDays").val();
 			let vacReason = $("#vacReason").val();
 			
 			
			if(drafter == null || drafter == "" || drafterDept == null || drafterDept == "") {
 				
				let title = "문서 작성 확인";
 				let content = "로그인이 필요합니다.";
				let focus="";
				
				myAlert(title, content);
				focusFn(focus);
 				
 			} else if(vacType == "none") {
 				 
 				let title = "문서 작성 확인";
 				let content = "휴가 종류를 선택해주세요.";
 				let focus = "#vacType";

 				myAlert(title, content);
				focusFn(focus);
 				
 			} else if(startDate == null || startDate == "") {
 				
 				let title = "문서 작성 확인";
 				let content = "휴가 시작 날짜를 선택해주세요.";
 				let focus = "#startDate";
 
 				myAlert(title, content);
				focusFn(focus);
 				
 			} else if(endDate == null || endDate == "") {
 				
 				let title = "문서 작성 확인";
 				let content = "휴가 마지막 날짜를 선택해주세요.";
 				let focus = "#endDate";
 				
 				myAlert(title, content);
				focusFn(focus);
 				
 			} else if(vacUseDays == null || vacUseDays == "") {
 				
 				let title = "문서 작성 확인";
 				let content = "사용일수를 입력해주세요.";
 				let focus = "#vacUseDays";
 				
 				myAlert(title, content);
				focusFn(focus);
 			
 			} else if(vacReason == null || vacReason == "") {
 				
 				let title = "문서 작성 확인";
 				let content = "휴가 사유를 작성해주세요.";
 				let focus = "#vacReason";
 				
 				myAlert(title, content);
				focusFn(focus);
			
 			// 모두 잘 입력되어 있는 경우
 			} else {
 				
 				let docNo = $("#docNo").val();
 	 			console.log(docNo);
 	 			
				approveCheckFn(); // 결재 요청 확인 모달 띄우는 함수 실행
				
				// 확인 버튼 클릭 시 confirm 모달 사라지고 결재 승인 진행
	    		$(document).on("click", ".true_btn", function() {
	    			$("#helpmeCOnfirm").hide();
	    			
	    			leaveEnrollFn();
	    		});
	    		
	    		// 취소 클릭 시 confirm 모달 닫기만
	    		$(".false_btn").click(function() {
	    		    $("#helpmeCOnfirm").hide();
	    		});

 			}
		
 		});
 		
 		
 		// 휴가 신청서 결재 요청 함수
 		function leaveEnrollFn() {
			
 			// 폼의 모든 데이터 저장해서 변수로 선언
 			let form = $(".docUpdateForm").serialize();
 			form += "&outboxNo=" + ${ outboxNo } + "&docType=" + ${ docForm };
 			
 			let url = "";
 			
 			// 문서 등록 시 임시 저장한 문서이면 새로 결재 요청
 			if($("#docNo").val() == null || $("#docNo").val() == "") {
 				url = "oboxAprvReqLeaveApp.do";
 			
 			// 문서 번호 있으면 재결재 요청
 			} else {
 				url = "aprvReRequest.do";
 			}
 			
			
 			$.ajax({
 				
 				type: "post",
                url: url,
                data: form,
                success: function (result) {
                	console.log(result)
                	
                    if(result == "success") {
					
                    	let title = "결재 요청 확인";
                    	let content = "결재가 성공적으로 요청되었습니다.";
                    	
                    	myAlert(title, content);
                    	resultFn();
                    	
                    } else {
                    	
                    	let title = "결재 요청 확인";
                    	let content = "결재 요청에 실패하였습니다.";

                    	myAlert(title, content);
                    	resultFn();
               		}
                } 	                
            });
		}
 		
 		
 		// 수정 버튼 클릭 시 
 		$(document).on("click", ".docUpdate_btn", function() {
 			
 			// 폼의 모든 데이터 저장해서 변수로 선언
 			let form = $(".docUpdateForm").serialize();
 			let outboxNo = ${ outboxNo };
 			// 쿼리스트링으로 임시 보관 번호 추가
 			form += "&outboxNo=" + outboxNo;

 			// 해당 문서 내용 업데이트 진행하는 ajax
    		$.ajax({
    			
    			type: "post",
    			url: "updateLeaveApp.do",
    			data: form,
    			success: function(result) {
    				console.log(result);
    				
    				// 저장 여부만 알려주고 페이지 이동은 없음 -> 계속 작성할 수 있도록
    				if(result == "success") {
    					let title = "임시 보관함 저장"
    					let content = "저장이 완료되었습니다."
    					
    					myAlert(title, content);
    					
    				} else {
    					let title = "임시 보관함 저장"
	   					let content = "저장에 실패하었습니다."
	   					
	   					myAlert(title, content);
    				}
    			}
    		});
			
 		});
 		
 	</script>
 	
	<script src="${ pageContext.servletContext.contextPath }/resources/js/approval/docEnrollForm.js"></script>
 	
</body>
</html>