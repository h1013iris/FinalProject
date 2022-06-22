<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무 기안서 상세 조회</title>
<style type="text/css">
	
</style>
</head>
<body>
	
	<div class="docDetailMainArea">
		<div class="outboxNo_div">
			임시 보관 번호 : 
			<span id="outboxNo"></span>			
		</div>
		
		<form class="detailViewForm">
			<input type="hidden" name="approver" value="${ loginUser.empNo }"/>
			<input type="hidden" name="approverJob" value="${ loginUser.jobNo }"/>
			
			<div class="docDetailArea" style="font-family:돋움;font-size:9pt;">
				
				<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic,dotum,arial,tahoma; margin-top: 1px; border-collapse: collapse; border-image: none;"><!-- Header --> 
				    <colgroup> 
				     	<col width="310"> 
				     	<col width="490"> 
				    </colgroup> 
				    
					<tbody>
						<tr>
							<td style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: middle; border-image: none;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
								 업 무 기 안 
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
											<span contenteditable="false">
												<input class="fix_input" id="drafter" name="drafterName" readonly/>
											</span> 
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; border-image: none;">
											 소속 
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; border-image: none;">
											<span contenteditable="false">
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
												<input class="fix_input" id="docNo" name="docNo" readonly/>
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
													<input type="hidden" id="aprv1" name="firstAprv" value="" readonly/>
													<input class="fix_input approverName" id="aprvName1" name="firstAprvName" value="" readonly/>
													<input class="fix_input approverJop" id="aprvJobName1" value="" readonly/>
												</td>
											</tr>
											<tr>
												<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
													2차 결재자
												</td>
												<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
													<input type="hidden" id="aprv2" name="secondAprv" value="" readonly/>
													<input class="fix_input approverName" id="aprvName2" name="secondAprvName" value="" readonly/>
													<input class="fix_input approverJop" id="aprvJobName2" value="" readonly/>
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
				     	<col width="380"> 
				     	<col width="120"> 
				     	<col width="170"> 
				    </colgroup> 
				    
					<tbody>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle; border-image: none;">
								 시행일자 
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle; border-image: none;">
								<span contenteditable="false">
									<input class="fix_input" id="enfDate" name="enfDate" readonly>
								</span>
								<span id="formErrorMsg" style="color: red; margin-left: 5px;"></span>
							</td>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle; border-image: none;">
								 협조 부서 
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle; border-image: none;">
								<span contenteditable="false" style="width: 100%;">
									<input class="fix_input" id="coopDept" name="coopDept" style="width: 90%;" readonly/>
								</span> 
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle; border-image: none;">
								제목
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle; border-image: none;" colspan="3">
								<span contenteditable="false"style="width: 100%;">
									<input class="fix_input" id="docTitle" name="docTitle" style="width: 99%;" type="text" readonly>
								</span>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 300px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: top;" colspan="4" class="dext_table_border_t">
								<span contenteditable="false" style="width: 100%;">
									<textarea class="docDetail_textarea" id="dftContent" name="dftContent" style="width: 99%; height: 290px;" readonly></textarea>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	
	
	<script type="text/javascript">
		
		// 화면 로드 시 가장 먼저 실행
		$(document).ready(function() {
	 		
			console.log(${outboxNo})
			
			// 문서 내용 조회
			$.ajax({
			
				type: "post",
				url: "selectDraftFormOutbox.do",
				data: { outboxNo : ${ outboxNo } },
				success: function(data) {
					
					console.log(data)
					$("#drafter").val(data.drafterName + " (" + data.drafter + ")");
					$("#drafterDept").val(data.drafterDept);
					$("#dftDate").val(data.dftDate);
					$("#enfDate").val(data.enfDate);
					$("#coopDept").val(data.coopDeptName);
					$("#docTitle").val(data.docTitle);
					$("#dftContent").val(data.dftContent);
					$("#outboxNo").text(data.outboxNo);
					
					// 문서 번호가 없으면 (등록 시 임시 저장한 문서이면)
					if(data.docNo == null) {
						$("#docNo").val("");
					
					// 결재 취소한 문서인 경우
					} else {
						$("#docNo").val(data.docNo);
						
						// 결재자 조회
				 		$.ajax({
				 			
				 			type: "post",
		 	                url: "selectDocApprover.do",
		 	                data: { docNo : data.docNo },
		 	                success: function (list) {
								console.log(list);
								if(list != null) {
									for(var i in list) {
										if(list[i] != null) {
											$("#aprv" + (parseInt(i) + 1)).val(list[i].empNo);
											$("#aprvName" + (parseInt(i) + 1)).val(list[i].empName);
											$("#aprvJobName" + (parseInt(i) + 1)).val(list[i].jobName);
											console.log(list[i].empNo);
										}
									}
		 	                	}
		 	                }
				 		});
					}
					
				}
			});
			
		});
	
	</script>
	
	<script src="${ pageContext.servletContext.contextPath }/resources/js/approval/docEnrollForm.js"></script>
	
	
</body>
</html>