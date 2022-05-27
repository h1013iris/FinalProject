<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청서</title>
<style type="text/css">
	
	
</style>
</head>
<body>
	<!-- 오늘 날짜 설정  -->
	<c:set var="today" value="<%=new java.util.Date()%>"/> 
	<!-- 날짜 구하기 -->
	<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>

	<div class="formMainArea">
		
		<form class="docEnrollForm" action="insertLeaveApp.do" method="post">
			<!-- <input type="hidden" name="docTypeNo" value="${ docForm }"/>  -->
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
												<span contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value="" data-autotype="">
													<input class="fix_input" id="drafter" name="drafter" value="${ loginUser.empNo }" readonly/>
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
												<div contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
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
												</div>
											</td>
										</tr>
										<tr>
											<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
												기안일 
											</td>
											<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<div contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
													<input class="fix_input" id="draftDate" name="draftDate" value="${ date }" readonly/>
													<span contenteditable="false" class="comp_active" style="display:none;">
														<span class="Active_dot1"></span>
														<span class="Active_dot2"></span>
														<span class="Active_dot3"></span>
														<span class="Active_dot4"></span>
													</span>
													<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1">
														<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
													</span>
												</div>
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
								<b style="color: rgb(255, 0, 0);">*</b> 휴가 종류
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
								<span contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{cSel_선택_연차_오전반차_오후반차_결혼(본인)_결혼(본인,배우자의 형제자매)_결혼(자녀)_사망(배우자)_사망(본인, 배우자의 부모)_사망(본인,배우자의 조부모)_사망(자녀)_사망(본인, 배우자의 백숙부모)_사망(본인, 배우자의 형제자매)_회갑(본인,배우자의 부모)_출산(배우자)_출산(본인)_보건휴가_예비군_민방위_병가(무급휴가)_탈상_교육훈련휴가_공민권}}" data-wrapper="" style="" data-value="" data-autotype="">
									<select class="editor_slt" id="vacType" name="vacType" style="width:40%">
										<option selected="selected">선택</option>
										<option value="연차">연차</option>
										<option value="오전반차">오전반차</option>
										<option value="오후반차">오후반차</option>
										<option value="보건휴가">보건휴가</option>
										<option value="병가(무급휴가)">병가(무급휴가)</option>
									</select>
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
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 휴가 기간
							</td>
							<td style="padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);">
								<span style="font-weight: normal;">
									<span contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{period}}" data-wrapper="" style="" data-value="" data-autotype="">
										<input class="ipt_editor ipt_editor_date" id="startDate" name="startDate" type="date"> ~ <input class="ipt_editor ipt_editor_date" id="endDate" name="endDate" type="date">
											<span contenteditable="false" class="comp_active" style="display:none;">
											<span class="Active_dot1"></span>
											<span class="Active_dot2"></span>
											<span class="Active_dot3"></span>
											<span class="Active_dot4"></span>
										</span>
										<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5">
											<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
										</span>
									</span> &nbsp;
								</span> &nbsp;
								<b>사용일수</b>&nbsp;:&nbsp;
								<span contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{number}}" data-wrapper="" style="" data-value="" data-autotype="">
									<input class="ipt_editor ipt_editor_num" id="vacUseDays" name="vacUseDays" type="text" style="width: 20%">
									<span contenteditable="false" class="comp_active" style="display:none;">
										<span class="Active_dot1"></span>
										<span class="Active_dot2"></span>
										<span class="Active_dot3"></span>
										<span class="Active_dot4"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6">
										<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
									</span>
								</span>일
								<span id="formErrorMsg" style="color: red;"></span> 
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 250px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b> 휴가 사유
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: top;">
								<span contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{textarea:reason}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype="">
									<textarea class="txta_editor" id="vacReason" name="vacReason" style="width: 99%; height: 240px; resize: vertical;" maxlength="500"></textarea>
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
 	
 	<script type="text/javascript">
 		
 		$("form").submit(function() {
 			
 			let drafter = $("#drafter").val();
 			let drafterDept = $("#drafterDept").val();
 			let draftDate = $("#draftDate").val();
 			let vacType = $("#vacType").val();
 			let startDate = $("#startDate").val();
 			let endDate = $("#endDate").val();
 			let vacReason = $("#vacReason").val();
			
 			if(drafter == null || drafter == "" || drafterDept == null || drafterDept == "") {
 				
 				$(this).removeAttr("action"); // submit 안 되게 속성 제거
 				
 				$("#alert_title .title_name").text("문서 등록 확인");
 				$("#alert_body .alert_content").text("로그인이 필요합니다.");
 				$("#alert_container").css("display","block");
 				
 				$(".cancel_btn").click(function() {
 					
 					$("#alert_container").hide();
 					location.href="departmentPage.do";
 				})
 			
 			} else {
 				$(this).attr("action", "insertLeaveApp.do");
 			}
 		})
 		
 		/*$("form").submit(function () {
            
 			// 폼의 모든 데이터 저장해서 변수로 선언
 			let form = $(".docEnrollForm").serialize();
 			
 			// 쿼리스트링으로 데이터 추가
 			form += "&docTypeNo=" + $("#docTypeNo").val();
 			
 			
 			$.ajax({
                type: "post",
                url: "insertLeaveApp.do",
                data: {form:$("form").serialize(), docForm: ${ docType }},
                success: function (data) {
                    console.log(data);
                    alert('성공');
                }
            }).done(function (data) {
                //alert(data);
            });
        });*/
 		

 		
 	</script>
 	
</body>
</html>