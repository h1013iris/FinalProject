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
	<!-- 오늘 날짜 설정  -->
	<c:set var="today" value="<%=new java.util.Date()%>" /> 
	<!-- 날짜 구하기 -->
	<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>
	
	<div class="formMainArea">
		<form class="docEnrollForm" action="insertCmtUpdateApp.do" method="post">
			<input type="hidden" name="docTypeNo" value="${ docForm }"/>
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
												<span contenteditable="false" class="comp_wrap" data-cid="0">
													<input class="fix_input" name="drafter" value="${ loginUser.empNo }" readonly/>
													<span contenteditable="false" class="comp_active" style="display:none;">
														<span class="Active_dot1"></span>
														<span class="Active_dot2"></span>
														<span class="Active_dot3"></span>
														<span class="Active_dot4"></span>
													</span>
													<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0">
														<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
													</span>
												</span> 
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												소속
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
													<input class="fix_input" name="drafterDept" value="${ loginUser.departmentNo }" readonly/>
													<span contenteditable="false" class="comp_active" style="display:none;">
														<span class="Active_dot1"></span>
														<span class="Active_dot2"></span>
														<span class="Active_dot3"></span>
														<span class="Active_dot4"></span>
													</span>
													<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1">
														<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												기안일 
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
													<input class="fix_input" name="draftDate" value="${ date }" readonly/>
													<span contenteditable="false" class="comp_active" style="display:none;">
														<span class="Active_dot1"></span>
														<span class="Active_dot2"></span>
														<span class="Active_dot3"></span>
														<span class="Active_dot4"></span>
													</span>
													<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1">
														<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
													</span>
												</span>
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												문서번호 
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
													<input class="fix_input" name="draftDate" value="문서번호" readonly/>
													<span contenteditable="false" class="comp_active" style="display:none;">
														<span class="Active_dot1"></span>
														<span class="Active_dot2"></span>
														<span class="Active_dot3"></span>
														<span class="Active_dot4"></span>
													</span>
													<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1">
														<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
													</span>
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td style="background: white; padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
								<span contenteditable="false" class="comp_wrap" data-wrapper="">
									<span class="sign_type1_inline" data-group-seq="0" data-group-name="신청" data-group-max-count="1" data-group-type="type1" data-is-reception="">
										<span class="sign_tit_wrap">
											<span class="sign_tit"><strong>신청</strong></span>
										</span>
										<span class="sign_member_wrap">
											<span class="sign_member">
												<span class="sign_rank_wrap">
													<span class="sign_rank">&nbsp;</span>
												</span>
												<span class="sign_wrap">&nbsp;</span>
												<span class="sign_date_wrap">
													<span class="sign_date">&nbsp;</span>
												</span>
											</span>
										</span>
									</span>
									<span contenteditable="false" class="comp_active" style="">
										<span class="Active_dot1"></span>
										<span class="Active_dot2"></span>
										<span class="Active_dot3"></span>
										<span class="Active_dot4"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true">
										<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
									</span>
								</span>
		 
		       					<span contenteditable="false" class="comp_wrap" data-wrapper="">
		       						<span class="sign_type1_inline" data-group-seq="1" data-group-name="승인" data-group-max-count="7" data-group-type="type1" data-is-reception="">
		       							<span class="sign_tit_wrap">
		       								<span class="sign_tit"><strong>승인</strong></span>
		   								</span>
		   								<span class="sign_member_wrap">
		   									<span class="sign_member">
		   										<span class="sign_rank_wrap">
		   											<span class="sign_rank">&nbsp;</span>
												</span>
												<span class="sign_wrap">&nbsp;</span>
												<span class="sign_date_wrap">
													<span class="sign_date">&nbsp;</span>
												</span>
											</span>
										</span>
										<span class="sign_member_wrap">
											<span class="sign_member">
												<span class="sign_rank_wrap">
													<span class="sign_rank">&nbsp;</span>
												</span>
												<span class="sign_wrap">&nbsp;</span>
												<span class="sign_date_wrap">
													<span class="sign_date">&nbsp;</span>
												</span>
											</span>
										</span>
										<span class="sign_member_wrap">
											<span class="sign_member">
												<span class="sign_rank_wrap">
													<span class="sign_rank">&nbsp;</span>
												</span>
												<span class="sign_wrap">&nbsp;</span>
												<span class="sign_date_wrap">
													<span class="sign_date">&nbsp;</span>
												</span>
											</span>
										</span>
										<span class="sign_member_wrap">
											<span class="sign_member">
												<span class="sign_rank_wrap">
													<span class="sign_rank">&nbsp;</span>
												</span>
												<span class="sign_wrap">&nbsp;</span>
												<span class="sign_date_wrap">
													<span class="sign_date">&nbsp;</span>
												</span>
											</span>
										</span>
										<span class="sign_member_wrap">
											<span class="sign_member">
												<span class="sign_rank_wrap">
													<span class="sign_rank">&nbsp;</span>
												</span>
												<span class="sign_wrap">&nbsp;</span>
												<span class="sign_date_wrap">
													<span class="sign_date">&nbsp;</span>
												</span>
											</span>
										</span>
										<span class="sign_member_wrap">
											<span class="sign_member">
												<span class="sign_rank_wrap">
													<span class="sign_rank">&nbsp;</span>
												</span>
												<span class="sign_wrap">&nbsp;</span>
												<span class="sign_date_wrap">
													<span class="sign_date">&nbsp;</span>
												</span>
											</span>
										</span>
										<span class="sign_member_wrap">
											<span class="sign_member">
												<span class="sign_rank_wrap">
													<span class="sign_rank">&nbsp;</span>
												</span>
												<span class="sign_wrap">&nbsp;</span>
												<span class="sign_date_wrap">
													<span class="sign_date">&nbsp;</span>
												</span>
											</span>
										</span>
									</span>
									<span contenteditable="false" class="comp_active" style="display:none;">
										<span class="Active_dot1"></span>
										<span class="Active_dot2"></span>
										<span class="Active_dot3"></span>
										<span class="Active_dot4"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true">
										<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
									</span>
								</span>
								<br> 
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
									<span contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{period}}" data-wrapper="" style="" data-value="" data-autotype="">
										<input class="ipt_editor ipt_editor_date" name="updateDate" type="date">
										<span contenteditable="false" class="comp_active" style="display:none;">
											<span class="Active_dot1"></span>
											<span class="Active_dot2"></span>
											<span class="Active_dot3"></span>
											<span class="Active_dot4"></span>
										</span>
										<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4">
											<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
										</span>
									</span>
								</span>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 수정 전 시간
							</td>
							<td style="padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);">
								<span style="font-weight: normal;">
									<span contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{period}}" data-wrapper="" style="" data-value="" data-autotype="">
										출근 :
										<input class="ipt_editor ipt_editor_date" type="time"> &nbsp; &nbsp;
										퇴근 :
										<input class="ipt_editor ipt_editor_date" type="time">
										<span contenteditable="false" class="comp_active" style="display:none;">
											<span class="Active_dot1"></span>
											<span class="Active_dot2"></span>
											<span class="Active_dot3"></span>
											<span class="Active_dot4"></span>
										</span>
										<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5">
											<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
										</span>
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
									<span contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{period}}" data-wrapper="" style="" data-value="" data-autotype="">
										출근 :
										<input class="ipt_editor ipt_editor_date" name="goTime" type="time"> &nbsp; &nbsp;
										퇴근 :
										<input class="ipt_editor ipt_editor_date" name="leaveTime" type="time">
											<span contenteditable="false" class="comp_active" style="display:none;">
											<span class="Active_dot1"></span>
											<span class="Active_dot2"></span>
											<span class="Active_dot3"></span>
											<span class="Active_dot4"></span>
										</span>
										<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6">
											<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
										</span>
									</span>
								</span>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 250px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 수정 사유
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: top;">
								<span contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{textarea:reason}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype="">
									<textarea class="txta_editor" name="updateReason" style="width: 99%; height: 240px; resize: vertical;" maxlength="500"></textarea>
									<span contenteditable="false" class="comp_active" style="display:none;">
										<span class="Active_dot1"></span>
										<span class="Active_dot2"></span>
										<span class="Active_dot3"></span>
										<span class="Active_dot4"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7">
										<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
									</span>
								</span> 
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			<div class="docEnrollBtnsArea">
				<button class="submit_btn docEnrollBtn" type="submit">결재요청</button> <br>
				<button class="outbox_btn docEnrollBtn" type="button">임시저장</button> <br> <%-- 임시저장 기능 --%>
				<button class="cancle_btn docEnrollBtn" type="button">취소</button>
			</div>
		</form>
 	</div>
 	
</body>
</html>