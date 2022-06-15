<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무 협조문</title>
<style type="text/css">
	
	.formMainArea {
		/*text-align: center;*/
	}
	
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
			
			<div class="formArea" style="font-family:돋움;font-size:9pt;">
		   
				<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic,dotum,arial,tahoma; margin-top: 1px; border-collapse: collapse; border-image: none;"><!-- Header --> 
				    <colgroup> 
				     	<col width="310"> 
				     	<col width="490"> 
				    </colgroup> 
				    
					<tbody>
						<tr>
							<td style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: middle; border-image: none;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
								 업 무 협 조 
							</td>
						</tr>
						<tr>
							<td style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top; border-image: none;">
								
							<table style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic,dotum,arial,tahoma; margin-top: 1px; border-collapse: collapse; border-image: none;"><!-- User --> 
						        <colgroup> 
						         	<col width="90"> 
						         	<col width="220"> 
						        </colgroup> 
				        
								<tbody>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; border-image: none;">
											 기안자 
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; border-image: none;">
											<span contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value="" data-autotype="">
												<input class="fix_input" id="drafter" name="drafterName" value="${ loginUser.empName } (${ loginUser.empNo })" readonly/>
											</span> 
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; border-image: none;">
											 소속 
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; border-image: none;">
											<span contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
												<input class="fix_input" id="drafterDept" name="drafterDept" value="" readonly/>
											</span> 
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; border-image: none;">
											 기안일 
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; border-image: none;">
											<span contenteditable="false">
												<input class="fix_input" id="dftDate" name="dftDate" type="date" readonly/>
											</span>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; border-image: none;">
											 문서번호 
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; border-image: none;">
											<span contenteditable="false">
												<input class="fix_input" value="문서번호" readonly/>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
				 
							</td>
							<td style="background: white; padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top; border-image: none;">
								
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
				 
				   
				<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic,dotum,arial,tahoma; margin-top: 30px; border-collapse: collapse; border-image: none;"><!-- Draft --> 
				    <colgroup> 
				     	<col width="120"> 
				     	<col width="230"> 
				     	<col width="120"> 
				     	<col width="330"> 
				    </colgroup> 
				    
					<tbody>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle; border-image: none;">
								 수신 부서 
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle; border-image: none;" colspan="3">
								<span contenteditable="false" style="width: 100%;">
									<select class="ipt_editor" id="receiveDept" name="receiveDept" style="width: 30%;">
										<option value="">선택</option>
										<!-- 부서 리스트 출력되는 부분 -->
									</select>
								</span> 
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle; border-image: none;">
								 제목 
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle; border-image: none;" colspan="3">
								<span contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{text}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype="">
									<input id="docTitle" name="docTitle" value="${ docTitle }" style="width: 99%;" type="text" maxlength="100">
								</span>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 300px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: top;" colspan="4" class="dext_table_border_t">
								<span contenteditable="false" style="width: 100%;">
									<textarea class="txta_editor" id="coopContent" name="coopContent" style="width: 99%; height: 290px; resize: vertical;" maxlength="1000"></textarea>
								</span>
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
		
	
		// 화면 로드 시 가장 먼저 실행
	 	$(document).ready(function() {
	 		
			// 로그인이 되어있지 않으면
			if("${ loginUser.empNo }" == "") {
				
				loginFn(); // 로그인 먼저
			
			} else {
		 		
				// 기안일 오늘 날짜로 설정				
				let today = new Date(+ new Date() + 3240 * 10000).toISOString().substring(0, 10);
				$("#dftDate").val(today);				
		 		
				selectDeptFn(); // 기안자 부서 가져오는 함수
		 		
 	 			selectApproverFn(); // 결재자 조회하는 함수
 	 			
 	 			selectDeptListFn(); // 부서 리스트 조회하는 함수
 	 			
		 		selectBusCoopOutboxFn(); // 기존 내용 조회
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
	 
		
	 	// 결재자 조회하는 함수
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
 		
	 	
 		// 부서 리스트 조회하는 함수
 		function selectDeptListFn() {
 			
 			// 부서 조회해서 select에 넣기
	 		$.ajax({
	 			
	 			type: "post",
                url: "selectDeptList.do",
                data: { deptNo : "${ loginUser.departmentNo }" },
                success: function (list) {
				console.log(list);
                	if(list != null || list != "") {
                		
                		$.each(list, function(i) {
                			$("#receiveDept").append("<option value='" + list[i].deptNo + "'>" 
                								  + list[i].deptTitle + "</option>");
                		});
                	}
                }
	 		});
 		}
	 	
 		
 		// 기존 내용 조회
 		function selectBusCoopOutboxFn() {
 			
 			// 문서 내용 조회
			$.ajax({
			
				type: "post",
				url: "selectCoopFormOutbox.do",
				data: { outboxNo : ${ outboxNo } },
				success: function(data) {
					
					console.log(data)
					$("#drafter").val(data.drafterName + " (" + data.drafter + ")");
					$("#drafterDept").val(data.drafterDept);
					$("#dftDate").val(data.dftDate);
					$("#docNo").val(data.docNo);
					$("#receiveDept").val(data.receiveDept);
					$("#docTitle").val(data.docTitle);
					$("#coopContent").val(data.coopContent);
					$("#outboxNo").text(data.outboxNo);
					
					// 결재선 조회
			 		/*$.ajax({
			 			
			 			type: "post",
		                url: "selectDeptApprover.do",
		                data: { deptNo : "${ loginUser.departmentNo }",
		                		jobNo : "${ loginUser.jobNo }"},
		                success: function (data) {
							console.log(data);
		                	if(data != null || data != "") {
		                		
		                		$("#firstAprvName").val(data[0].empName);
		                		$("#firstAprv").val(data[0].empNo);
		                		$("#firstAprvJob").val(data[0].jobName);
		                		
		                		if(data.length > 1) {
		                			$("#secondAprvName").val(data[1].empName);
			                		$("#secondAprv").val(data[1].empNo);
			                		$("#secondAprvJob").val(data[1].jobName);
		                		}
		                	}
		                }
			 		});*/
					
				}
			});
 		}
		
 		
		
		// 결재 요청 버튼 클릭 시
		$(".docSubmit_btn").click(function() {
			
			let receiveDept = $("#receiveDept").val();
			let coopContent = $("#coopContent").val();
			
			if(receiveDept == null || receiveDept == "") {
				
				let title = "문서 작성 확인";
				let content = "협조 부서를 선택해주세요.";
				let focus="#receiveDept";
				
				myAlert(title, content);
				focusFn(focus);
 				
			} else if(coopContent == null || coopContent == "") {
				
				let title = "문서 작성 확인";
				let content = "협조문 내용을 작성해주세요.";
				let focus="#coopContent";
				
				myAlert(title, content);
				focusFn(focus);
			
 			// 잘 작성되었으면 폼 제출
			} else {
				
				approveCheckFn(); // 결재 요청 확인 모달 띄우는 함수 실행
				
				// 확인 버튼 클릭 시 confirm 모달 사라지고 결재 승인 진행
	    		$(document).on("click", ".true_btn", function() {
	    			$("#helpmeCOnfirm").hide();
	    			
					busCoopEnrollFn(); // 업무 협조문 결재 요청 함수
	    		});
	    		
	    		// 취소 클릭 시 confirm 모달 닫기만
	    		$(".false_btn").click(function() {
	    		    $("#helpmeCOnfirm").hide();
	    		});
			}
		});
		
		
		// 업무 협조문 결재 요청 함수
		function busCoopEnrollFn() {
			
			// 폼의 모든 데이터 저장해서 변수로 선언
 			let form = $(".docEnrollForm").serialize();
			
			$.ajax({
				
				type: "post",
                url: "insertBusCoop.do",
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
    			url: "oboxAprvReqBusCoop.do",
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