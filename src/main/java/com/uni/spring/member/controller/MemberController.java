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

import com.uni.spring.common.exception.CommException;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.member.model.dto.WideMember;
import com.uni.spring.member.model.service.MemberService;

//로그인용
@SessionAttributes("loginUser")//SessionAttribute는 세션에 있는 데이터도 바인딩하며 여러화면에서 사용하는 객체를 공유할때 사용(여러화면에 나눠진 회원가입,장바구니등)
@Controller
public class MemberController {
	
	@Autowired //@Service 빈 주입
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	//회원가입 이전에 사번 입력하는 화면으로 이동
	@GetMapping(value="empNo.do")
	public String empNo() {
		return "member/empNo";
	}

	//사원번호를 입력받았으니까 회원정보를 긁어와 회원가입창에 보이게하기!(업데이트 방식으로 할거니까)
	//id가 이미 등록된 사번은 회원가입 할수없다.
	@PostMapping(value="updateNewMember.do")
	public String updateNewMember(int empNo, Model model) {
		
		WideMember m = memberService.selectNewMember(empNo);
		
		model.addAttribute("m", m);

		return "member/updateNewMember";
	}
	
	
	//아이디 중복검사
	@PostMapping("loginCheck.do")
	@ResponseBody//AJAX로 비동기적으로(페이지를 새로 고치지 않고) 데이터를 가져올때 사용한다. 리턴값을 view를 통해 전달하지 않고 Http Response Body에 직접쓰여진다 
	public int loginCheck(@RequestParam("userId") String userId) {
	
		int	idno = memberService.logincheck(userId);
		
		return idno;
		
	}
	
	//회원가입
	@PostMapping(value="updateNewMember2.do")//oneAddress twoAddress는 검색주소와 상세주소임
	public String updateNewMember2(Member m, @RequestParam("oneAddress") String oneAddress, @RequestParam("twoAddress") String twoAddress) {//여기서는 불러온 정보 + 업테이트식으로 회원가입
		
		m.setAddress(oneAddress+"/"+twoAddress);//주소 합쳐서Address에 넣어주기
		
		//암호화 하기전 회원가입시 입력한 비밀번호
		System.out.println("회원가입시 입력한 비밀번호: "+m.getUserPw());
		
		//비밀번호 암호화
		String encPwd =bCryptPasswordEncoder.encode(m.getUserPw());
		
		System.out.println("암호화한 비밀번호: "+encPwd);
		
		m.setUserPw(encPwd);//암호화한 비밀번호를 다시 넣어준다.
		
		
		memberService.updateNewMember(m);
		
		return "main";//회원가입 성공하면 로그인화면으로

	}
	//암호화 이후 로그인
	@PostMapping("loginMember.do")
	public String loginMember(Member m, Model model) {
		String encPw = bCryptPasswordEncoder.encode(m.getUserPw());//입력한userPw를 암호화
		Member loginUser;
		
		loginUser=memberService.loginMember(bCryptPasswordEncoder, m);
		
		model.addAttribute("loginUser",loginUser);
		
		return "redirect:approvalMain.do";
	}
	
	//아이디 비밀번호 찾기
	@GetMapping("findIdPw.do")
	public String findIdPw() {
		
		return "member/findIdPw";
	}
	
	
}
