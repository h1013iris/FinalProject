package com.uni.spring.member.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.service.BoardService;
import com.uni.spring.common.Attachment;
import com.uni.spring.manageMent.model.service.ManageService;
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
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	public ManageService manageService;
	
	@Autowired
	public BoardService BoardService;

	//로그인 페이지로 이동
	@GetMapping("login.do")
	public String main(){
		return"main";
	}

	
	
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
		
		System.out.println("m은?:"+m);
		
		if(m!=null){
		
			model.addAttribute("m", m);
			model.addAttribute("msg","사번이 확인 되었습니다.");
		
		}else if(m==null) {
			model.addAttribute("msg","사번을 다시 확인해주세요");
			return "member/empNo";
			}
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
	public String updateNewMember2(Member m, @RequestParam("oneAddress") String oneAddress
			, @RequestParam("twoAddress") String twoAddress
			, @RequestParam(name="photo") MultipartFile file
			, HttpServletRequest request
			) {//여기서는 불러온 정보 + 업테이트식으로 회원가입
		
		m.setAddress(oneAddress+"/"+twoAddress);//주소 합쳐서Address에 넣어주기
		System.out.println(m);
		//암호화 하기전 회원가입시 입력한 비밀번호
		System.out.println("회원가입시 입력한 비밀번호: "+m.getUserPw());
		
		//비밀번호 암호화
		String encPwd =bCryptPasswordEncoder.encode(m.getUserPw());
		
		System.out.println("암호화한 비밀번호: "+encPwd);
		
		m.setUserPw(encPwd);//암호화한 비밀번호를 다시 넣어준다.
		int empNo = m.getEmpNo();
		
		int result = memberService.insertMemberAttachFile(file, request, empNo);
		if(result > 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		memberService.updateNewMember(m);
		
		return "main";//회원가입 성공하면 로그인화면으로

	}
	//암호화 이후 로그인
	/*@PostMapping("loginMember.do")
	public String loginMember(Member m, Model model) {
		String encPw = bCryptPasswordEncoder.encode(m.getUserPw());//입력한userPw를 암호화
		Member loginUser;
		
		loginUser=memberService.loginMember(bCryptPasswordEncoder, m);
		
		model.addAttribute("loginUser",loginUser);
		
		return "redirect:approvalMain.do";
		
	}*/
	//암호화 이후 로그인 +
	//로그인 실패시 alert뜨게
	@PostMapping("loginMember.do")
	public String loginMember(Member m, Model model) {
		String encPw = bCryptPasswordEncoder.encode(m.getUserPw());//입력한userPw를 암호화
		
		Member loginUser;
		
		try {
			loginUser=memberService.loginMember(bCryptPasswordEncoder, m);
			if(loginUser != null) {//로그인 유저가 널이 아니면
				manageService.insertAttendlog(loginUser.getEmpNo());
			}
			Attachment a = manageService.selectInfoEmployeeAtt(String.valueOf(loginUser.getEmpNo()));
	         if(a != null) {
	             loginUser.setChangeName(a.getChangeName());
	          }

	        
	        String statuslogin = manageService.selectSatatusLog(loginUser.getEmpNo());
			    loginUser.setStatuslogin(statuslogin);
	        model.addAttribute("loginUser",loginUser);

		
			return "redirect:approvalMain.do";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
			return "main";
		}
		
		
	}
	
	//아이디 비밀번호 찾기 화면으로 이동 갈때 부서정보를 가지고 가게
	@GetMapping("findIdPw.do")
	public String findIdPw(Dept dp, Model model) {
		
		ArrayList<Dept> dtlist = memberService.findDept();
		
		model.addAttribute("dtlist",dtlist);
		
		return "member/findIdPw";
	}
	
	//아이디 찾기
	@PostMapping("selectFindId.do")
	public String selectFindId(WideMember wm, Model model) {
		
		System.out.println("jsp에서 값이 넘어왔나용?"+wm);
		String msg = memberService.selectFindId(wm);
		//model.addAttribute("msg",msg);
		//return "member/findId";
		if(msg!=null){
			model.addAttribute("msg","아이디는 "+msg+" 입니다");
		}
		else if(msg==null || msg.equals("")){
			model.addAttribute("msg","아이디 찾기 정보를 다시 확인해주세요");
		}
		return "main";
	}
	
	/*비밀번호 찾기*/
	
	//이메일 인증전에 사원정보 확인하기
	@PostMapping("selectFindUser")
	@ResponseBody//ajax
	public String selectFindUser(Member m) {
		System.out.println("인증하기 버튼 누르면 값이 전달되는지");
		
		System.out.println("비밀번호 찾기시 입력한 정보: "+m);
		//입력받은 정보로 사원정보가 있는지 확인해야함
		
		int userCount=0;
		userCount = memberService.selectFindUser(m);
		
		String count = Integer.toString(userCount);
		return count; 
	}
	
	
	
	
	//이메일 인증
	@GetMapping("mailCheck")
	@ResponseBody//ajax쓸때 잊지말기
	public String mailCheckGET(String email) throws Exception{
		
		//view에서 데이터 넘어오는지 확인
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호 전달할 이메일 : "+ email);
		
		/*인증번호 랜덤값 생성*/
		//Random클래스 객체변수 random선언
		Random random = new Random();
		//111111부터 999999사이의 랜덤숫자를 얻기
		int checkNum = random.nextInt(888888)+111111;
		System.out.println("랜덤인증번호: "+checkNum);
		
		/*이메일 보내기*/
		//메일 전송시 넣을 내용
		String setFrom ="latte_co@naver.com";//root-context.xml에 넣은 이메일주소
		String toMail = email;//메일 보낼 이메일 주소
		String title = "<LATTE>비밀번호 찾기 인증번호 입니다";//메일 제목
		String content =	//메일 내용
				"안녕하세요 LATEE 비밀번호 찾기 서비스입니다~ " +
				"<br><br>"+
				"비밀번호 찾기 인증번호는 "+checkNum+"입니다. "+
				"<br><br>"+
				"전송된 인증번호를 인증번호 확인란에 정확히 입력 해주세요."+
				"<br><br>"+
				"감사합니다.";
	
		//실제 메일전송을 위함 MimeMessage : 멀티파트메일을 보낼때 사용
		try {
			
			MimeMessage message = mailSender.createMimeMessage();			
		
			//여기서 true는 멀티파트메시지를 사용하겠다는 의미
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			
			helper.setFrom(setFrom);//보내는이
			helper.setTo(toMail);//받는이
			
			//여기서의 true는 html을 사용하겠다는 의미
			helper.setSubject(title);//메일제목
			helper.setText(content,true);//메일내용
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//만든건 int인데 ajax는 String 타입만 가능하기 때문에 변환해서 뷰로 넘겨야함
		String num = Integer.toString(checkNum);
		
		return num;
	}
	
	@PostMapping("findPwForm.do")
	public String findPwForm(@RequestParam("userId") String userId, Model model){
		model.addAttribute("userId",userId);
		return "member/newPwForm";
	}
	
	//비밀번호 변경
	@PostMapping("updatePw")
	public String updatePw(Member m ,Model model) {
		
		//제대로 정보가 넘어왔는지 확인
		System.out.println("비밀번호 변경창으로 넘어온 정보"+m);
		//비밀번호 암호화
		String newPw = m.getUserPw();
		String id = m.getUserId();
		String encPw = bCryptPasswordEncoder.encode(newPw);

		System.out.println("암호화된 비밀번호 :" +encPw);
		m.setUserPw(encPw);
		m.setUserId(id);
		
		int result = memberService.updatePw(m);
		
		//System.out.println("result:" + result);
		if(result > 0) {
			model.addAttribute("msg","비밀번호가 변경되었습니다");
		}else {
			model.addAttribute("msg","문제가 생겼습니다 다시 시도해주시길 바랍니다");
			return "findIdPw";
		}
		return "main";
	}
	
	//로그아웃
	@GetMapping("logout.do")
	public String logout(SessionStatus status, Model model){
		status.setComplete();
		//session.invalidate();	
		model.addAttribute("msg","로그아웃 했습니다!");
		return "main"; //로그아웃후 메인으로 이동
	}
}
