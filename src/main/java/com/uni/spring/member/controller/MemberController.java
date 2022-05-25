package com.uni.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.member.model.dto.Member;
import com.uni.spring.member.model.service.MemberService;

@SessionAttributes("loginUser")//SessionAttribute는 세션에 있는 데이터도 바인딩하며 여러화면에서 사용하는 객체를 공유할때 사용(여러화면에 나눠진 회원가입,장바구니등)
@Controller
public class MemberController {
	
	@Autowired //@Service 빈 주입
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;//스프링 시큐리티(Spring Seurity) 프레임워크에서 제공하는 클래스 중 하나로
														//비밀번호를 암호화하는 데 사용할 수 있는 메서드를 가진 클래스
	
	/*@PostMapping(value="loginMember.do")
	public String selectLoginMember(Member m, Model model){
		//매치로 암호환된비번이랑 입력한 비번 확인!
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPw());
		
		Member loginUser;
		
		loginUser = memberService.selectLoginMember(bCryptPasswordEncoder, m);
		
		model.addAttribute("loginUser", loginUser);
		
		return "메인화면으로이동";
		
	}
	*/
	//암호화 하기전 로그인
	@PostMapping(value="loginMember.do")
	public String loginMember(Member m, Model model) {
		Member loginUser;
		try {
			loginUser = memberService.loginMember(m);
			model.addAttribute("loginUser",loginUser);
			return "redirect:apprvalMain.do";//로그인이 성공하면 testLogin으로 이동 나중에 경로 바꿔주기!!
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg","로그인실패");//로그인이 실패하면 다시 로그인 화면으로!
			
			return "redirect:/";
		}
	}

	
	//회원가입 이전에 사번 입력하는 화면으로 이동
	@GetMapping(value="empNo.do")
	public String empNo() {
		return "member/empNo";
	}

	//사원번호를 입력받았으니까 회원정보를 긁어와 회원가입창에 보이게하기!(업데이트 방식으로 할거니까)
	@PostMapping(value="updateNewMember.do")
	public ModelAndView updateNewMember(int empNo, ModelAndView mv) {
		
		Member m = memberService.selectNewMember(empNo);
	
		mv.addObject("m", m).setViewName("member/updateNewMember");

		return mv;
	}
	
	
	//아이디 중복검사
	@PostMapping("loginCheck.do")
	@ResponseBody//AJAX로 비동기적으로(페이지를 새로 고치지 않고) 데이터를 가져올때 사용한다. 리턴값을 view를 통해 전달하지 않고 Http Response Body에 직접쓰여진다 
	public int loginCheck(@RequestParam("userId") String userId) {
	
		int	idno = memberService.logincheck(userId);
		
		return idno;
		
	}
	
	
	
	
	/*@PostMapping(value="updateNewMember2.do")
	public String updateNewMember2() {//여기서는 불러온 정보 + 업테이트식으로 회원가입
										
		
		
	
		return "main";//회원가입이 성공하면 로그인화면으로 이동
	}
	*/
	
}
