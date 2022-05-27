<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무 협조문</title>
<style type="text/css">
	
</style>
</head>
<body>
	<!-- 오늘 날짜 설정  -->
	<c:set var="today" value="<%=new java.util.Date()%>" /> 
	<!-- 날짜 구하기 -->
	<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>
	
	<div class="formMainArea">
		<form class="docEnrollForm" action="insertBusCoop.do" method="post">
			<input type="hidden" name="docTypeNo" value="${ docForm }"/>
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
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; border-image: none;">
											 소속 
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; border-image: none;">
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
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; border-image: none;">
											 기안일 
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; border-image: none;">
											<span contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
												<input class="fix_input" name="draftDate" value="${ date }" readonly/>
												<span contenteditable="false" class="comp_active" style="display:none;">
													<span class="Active_dot1"></span>
													<span class="Active_dot2"></span>
													<span class="Active_dot3"></span>
													<span class="Active_dot4"></span>
												</span>
												<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2">
													<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
												</span>
											</span>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; border-image: none;">
											 문서번호 
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; border-image: none;">
											<span contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
												<input class="fix_input" name="draftDate" value="문서번호" readonly/>
												<span contenteditable="false" class="comp_active" style="display:none;">
													<span class="Active_dot1"></span>
													<span class="Active_dot2"></span>
													<span class="Active_dot3"></span>
													<span class="Active_dot4"></span>
												</span>
												<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3">
													<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
												</span>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
				 
							</td>
							<td style="background: white; padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top; border-image: none;">
								
								<div class="sign_type1 sign_type_new" data-group-type="type1" data-group-max-count="1" data-group-name="신청" data-group-seq="0"> 
								        
									<table class="tb_sign_type1">
										<tbody>
											<tr>
												<th class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
													신청
												</th>
												<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
													<table class="sign_member">
														<tbody>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_rank"></span>
																</td>
															</tr>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_name" id="status_"></span>
																</td>
															</tr>
															<tr>
																<td class="last dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_date" id="date_"></span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
				 
				       			</div>
								<div class="sign_type1 sign_type_new" data-group-type="type1" data-group-max-count="7" data-group-name="승인" data-group-seq="1"> 
				        
									<table class="tb_sign_type1">
										<tbody>
											<tr>
												<th class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
													승인
												</th>
												<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
													
													<table class="sign_member">
														<tbody>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_rank"></span>
																</td>
															</tr>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_name" id="status_"></span>
																</td>
															</tr>
															<tr>
																<td class="last dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_date" id="date_"></span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
								
													<table class="sign_member">
														<tbody>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_rank"></span>
																</td>
															</tr>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_name" id="status_"></span>
																</td>
															</tr>
															<tr>
																<td class="last dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_date" id="date_"></span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
								
													<table class="sign_member">
														<tbody>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_rank"></span>
																</td>
															</tr>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_name" id="status_"></span>
																</td>
															</tr>
															<tr>
																<td class="last dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_date" id="date_"></span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
													<table class="sign_member">
														<tbody>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_rank"></span>
																</td>
															</tr>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_name" id="status_"></span>
																</td>
															</tr>
															<tr>
																<td class="last dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_date" id="date_"></span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
													<table class="sign_member">
														<tbody>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_rank"></span>
																</td>
															</tr>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_name" id="status_"></span>
																</td>
															</tr>
															<tr>
																<td class="last dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_date" id="date_"></span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
													<table class="sign_member">
														<tbody>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_rank"></span>
																</td>
															</tr>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_name" id="status_"></span>
																</td>
															</tr>
															<tr>
																<td class="last dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_date" id="date_"></span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
													<table class="sign_member">
														<tbody>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_rank"></span>
																</td>
															</tr>
															<tr>
																<td class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_name" id="status_"></span>
																</td>
															</tr>
															<tr>
																<td class="last dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
																	<span class="sign_date" id="date_"></span>
																</td>
															</tr>
														</tbody>
													</table>
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
								<span contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{text}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype="">
									<input class="fix_input" name="receiveDeptNo" value="${ loginUser.departmentNo }" readonly/>
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
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle; border-image: none;">
								 제목 
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle; border-image: none;" colspan="3">
								<span contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{text}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype="">
									<input class="ipt_editor" name="coopTitle" value="${ docTitle }" style="width: 99%;" type="text" maxlength="100">
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
							</td>
						</tr>
						<tr>
							<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 300px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: top;" colspan="4" class="dext_table_border_t">
								<span contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{textarea:reason}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype="">
									<textarea class="txta_editor" style="width: 99%; height: 290px; resize: vertical;" maxlength="1000"></textarea>
									<span contenteditable="false" class="comp_active" name="coopContent" style="display:none;">
										<span class="Active_dot1"></span>
										<span class="Active_dot2"></span>
										<span class="Active_dot3"></span>
										<span class="Active_dot4"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6">
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