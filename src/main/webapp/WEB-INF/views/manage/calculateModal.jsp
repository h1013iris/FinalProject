<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4대보험 계산기</title>
<style type="text/css">
	.totalListChekcone table{
		width: 100%;
	}
	.totalListChekcone table thead{
		height: 50px;
		font-size: 20px;
	}
	.totalListChekcone table td{
		text-align: right;
		height: 50px;
		width: 10vw;
	}
	.totalListChekcone table tfoot th{
		font-size: 19px;
	}
	.calculateButtonone:hover{
		cursor: pointer;
		background-color: rgb(174, 217, 248);
	}
	.kueminv{
		width: 7vw;
	}
	.calculateButtonone{
	    background-color: lightgray;
	    width: 40%;
	    line-height: 3.5vh;
	    height: 3.5vh;
	    border-radius: 5px;
	}
	.inputMoneyDivhe{
		margin-top: 20px;
	    justify-content: space-around;
	    display: flex;
	    margin-bottom: 20px;
	    text-align: center;
	}
	.payhowMuchone{
		height: 2.5vh;
	    width: 20vw;
	    text-align: right;
	}
	.areatextinput{
		text-align: center;
	}
	.monthdyaone{
		font-size: 18px;
	    margin-bottom: 20px;	
	}
	.clseButtCal{
		float: right;
	    margin-right: 10px;
	}
</style>
</head>
<body>
	<div id="modal_background" class="calculatemodal">
        <div id="modal_container" class="size700">
            <div class="modal_header">
                <div class="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/facebook_cover_photo_1.png" alt="">
                </div>
                <span class="modal_title">4대 보험 모의 계산기</span>
                <div class="clseButtCal">
                	<img src="${ pageContext.servletContext.contextPath }/resources/images/close.png" width="20px"/>
                </div>
            </div >
            <div class="modal_body">
				<div>
					<div class="monthdyaone"><span>월 급여</span></div>
					<div>
						<div class="areatextinput">
							<input type="text" class="payhowMuchone" onkeyup="chkNumber(this)" placeholder="값을 입력해주시기바랍니다.">
							<span>원</span>
						</div>
						<div class="inputMoneyDivhe">
							<div class="calculateButtonone submitNumberone"><span>계산</span></div>
							<div class="calculateButtonone resetALlone"><span>초기화</span></div>
						</div>
					</div>
					<!-- 결과 -->
					<div class="totalListChekcone">
						<table border="1">
							<thead>
								<tr>
									<th>구분 </th>
									<th>총액 </th>
									<th>근로자</th>
									<th>사업주</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th class="kueminv"> 국민연금 </th>
									<td class="kukminone"> 원</td>
									<td class="kukmintwo"> 원</td>
									<td class="kukminthree"> 원</td>
								</tr>
								<tr>
									<th> 건강보험 </th>
									<td class="gunkangone"> 원</td>
									<td class="gunkangtwo"> 원</td>
									<td class="gunkangthree"> 원</td>
								</tr>
								<tr>
									<th> 건강보험
									<br>(장기요양) </th>
									<td class="gunjangone"> 원</td>
									<td class="gunjangtwo"> 원</td>
									<td class="gunjangthree"> 원</td>
								</tr>
								<tr>
									<th> 고용보험 </th>
									<td class="gowongone"> 원</td>
									<td class="gowongtwo"> 원</td>
									<td class="gowongthree"> 원</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th> 합 계 </th>
									<td class="totalALlone"> 원 </td>
									<td class="totalALltwo"> 원 </td>
									<td class="totalALlthree"> 원 </td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
            </div>
            
        </div>
    </div>
 	<script type="text/javascript">
	 	// 천단위 콤마 (소수점포함)
	  	function numberWithCommas(num) {
		    var parts = num.toString().split(".");
		    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (parts[1] ? "." + parts[1] : "");
		}
	
		// 숫자 체크(숫자 이외 값 모두 제거)
		function chkNumber(obj){
		  var tmpValue = $(obj).val().replace(/[^0-9,]/g,'');
		  tmpValue = tmpValue.replace(/[,]/g,'');
		  // 천단위 콤마 처리 후 값 강제변경
		  obj.value = numberWithCommas(tmpValue);
	  	}
		$(".submitNumberone").click(function(){
			var salary= $(".payhowMuchone").val().replace(/[,]/g,'');
			if(salary == 0){
				return false;
			}
			$.ajax({
				url:"calculateSalary.do",
				type:"get", 
				data:{salary:salary}, 
				success:function(cs){
					$(".kukminone").text(cs.gukmin+"원");
					$(".kukmintwo").text(cs.gukHalf+"원");
					$(".kukminthree").text(cs.gukHalf+"원");
					$(".gunkangone").text(cs.gungan+"원");
					$(".gunkangtwo").text(cs.gunHalf+"원");
					$(".gunkangthree").text(cs.gunHalf+"원");
					$(".gunjangone").text(cs.gunGangi+"원");
					$(".gunjangtwo").text(cs.gunGHalf+"원");
					$(".gunjangthree").text(cs.gunGHalf+"원");
					$(".gowongone").text(cs.gyAgyh+"원");
					$(".gowongtwo").text(cs.goyoung+"원");
					$(".gowongthree").text(cs.goyoungH+"원");
					$(".totalALlone").text(cs.totalV+"원");
					$(".totalALltwo").text(cs.emptot+"원");
					$(".totalALlthree").text(cs.imtot+"원");
					
				}
			})
		})
		$(".resetALlone").click(function(){
			clearAll();
		})
		
		function clearAll(){
			$(".payhowMuchone").val('');
			$(".kukminone").text('원');
			$(".kukmintwo").text('원');
			$(".kukminthree").text('원');
			$(".gunkangone").text('원');
			$(".gunkangtwo").text('원');
			$(".gunkangthree").text('원');
			$(".gunjangone").text('원');
			$(".gunjangtwo").text('원');
			$(".gunjangthree").text('원');
			$(".gowongone").text('원');
			$(".gowongtwo").text('원');
			$(".gowongthree").text('원');
			$(".totalALlone").text('원');
			$(".totalALltwo").text('원');
			$(".totalALlthree").text('원');
		}
		$(".clseButtCal").click(function(){
			clearAll();
			$(".calculatemodal").css("display","none");
		})
	</script>
</body>
</html>