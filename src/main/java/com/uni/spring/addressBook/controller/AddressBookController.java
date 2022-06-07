package com.uni.spring.addressBook.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.uni.spring.addressBook.model.dto.Company;
import com.uni.spring.addressBook.model.dto.Customer;
import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.addressBook.model.service.AddressBookService;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.member.model.dto.WideMember;

@SessionAttributes("loginUser")
@Controller
public class AddressBookController {

	@Autowired
	public AddressBookService addressBookService;

	/* 전체주소록 */
	// 전체주소록 조회

	/*
	 * @GetMapping("addressMain.do") public String mainAddress(WideMember wm, Model
	 * model) {
	 * 
	 * ArrayList<WideMember> allAddList = addressBookService.selectAllAddList(wm);
	 * System.out.println("조회결과:"+allAddList);
	 * 
	 * model.addAttribute("allAddList",allAddList);
	 * 
	 * return "addressBook/mainAdd";
	 * 
	 * 
	 * } //전체 부서명 조회 버튼
	 * 
	 * @GetMapping("deptTitle.do") public String selsectDeptTitle(Dept dp, Model
	 * model) {
	 * 
	 * ArrayList<Dept> deptTitleList = addressBookService.selectDeptTitleList(dp);
	 * 
	 * System.out.println("조회결과:"+deptTitleList);
	 * 
	 * model.addAttribute("deptTitlList",deptTitleList);
	 * 
	 * return "addressBook/mainAdd";
	 * 
	 * 
	 * }
	 */
	/// 부서별 버튼 + 전체주소록 내용조회 두개 합쳐보기
	@GetMapping("addressMain.do")
	public String mainAddress(WideMember wm, Dept dp, Model model) {

		ArrayList<WideMember> allAddList = addressBookService.selectAllAddList(wm);

		System.out.println("주소록 전체내용 조회결과:" + allAddList);

		ArrayList<Dept> deptTitleList = addressBookService.selectDeptTitleList(dp);

		System.out.println("부서명 조회결과:" + deptTitleList);

		model.addAttribute("allAddList", allAddList);
		model.addAttribute("deptTitlList", deptTitleList);

		return "addressBook/mainAdd";
	}

	// 부서명 버튼눌러서 각 부서별 주소록 조회
	@GetMapping("deptAddList")
	public String selectDeptAddList(@RequestParam("departmentTitle") String departmentTitle, WideMember wm,
			Model model) {

		ArrayList<WideMember> deptList = addressBookService.selectDeptAddlist(departmentTitle);

		model.addAttribute("deptList", deptList);
		System.out.println("조회해온리스트:" + deptList);

		return "addressBook/deptAdd";

	}

	// 검색창에서 전체검색으로진행됨 전체주소록이랑 같은 표에서 출력된다.
	@PostMapping("allAddSearch.do")
	public String selectAllAddSearch(WideMember wm, String search, Model model) {

		ArrayList<WideMember> allAddList = addressBookService.selectAllAddSearch(wm, search);
		model.addAttribute("allAddList", allAddList);

		System.out.println("검색결과는? " + allAddList);
		return "addressBook/mainAdd";
	}

	/* 고객주소록 */
	// 고객주소록 메인화면으로 이동 ("목록조회된 화면")
	@GetMapping("custoAdd.do")
	public String selectCustoList(@ModelAttribute("loginUser") Member m, Customer custo, Model model) {

		// 세션에서 사번 가져오기
		int empNo = m.getEmpNo();

		ArrayList<Customer> custoList = addressBookService.selectCustoList(custo, empNo);
		model.addAttribute("custoList", custoList);
		System.out.println("고객주소록이 잘 들어왔는가" + custoList);
		return "addressBook/custoAddList";
	}

	// 고객등록하기누르면 고객폴더리스트를 가지고 등록폼으로 이동
	@PostMapping("cusAddWriter.do")
	public String insertCusAdd(@ModelAttribute("loginUser") Member m, Customer custo, Model model) {

		int empNo = m.getEmpNo();

		// 고객 폴더명들을 가져온다
		ArrayList<Company> cusFolList = addressBookService.selectCusFolList(custo, empNo);

		// 화면에 넘겨주기전에 확인
		System.out.println("고객 폴더리스트가 잘 넘어 왔느뇨?: " + cusFolList);

		model.addAttribute("cusFolList", cusFolList);

		// 가져온 거래처폴더명을 가지고 등록폼으로
		return "addressBook/cusAddWriter";
	}

	/* 거래처주소록 */
	// 거래처주소록 메인화면("목록조회된 화면")

	@GetMapping("comAdd.do")
	public String selectComList(@ModelAttribute("loginUser") Member m, Company com, Model model) {

		// 로그인세션에서 정보 가져오기
		System.out.println(m);
		// 세션에서 가져온 정보 empNo에 넣기
		int empNo = m.getEmpNo();
		// m.getEmpNo() 잘됐는지 확인
		System.out.println("로그인한 세션에서 가져온 사번" + empNo);
		ArrayList<Company> comList = addressBookService.selectComList(com, empNo);
		// 거래처주소록 리스트 model에 담기
		model.addAttribute("comList", comList);
		// 리스트 제대로 들어왔는지 확인
		System.out.println("comList가 제대로 들어왔니?" + comList);
		// jsp로 넘겨주기

		// 폴더 목록 불러오기
		ArrayList<Company> comFolList = addressBookService.selectComFolList(com, empNo);
		// 화면에 넘겨주기전에 확인
		System.out.println("폴더리스트가 잘 넘어 왔는가?: " + comFolList);
		model.addAttribute("comFolList", comFolList);

		return "addressBook/comAddList";

	}

	// 거래처등록하기누르면 등록폼으로 이동
	@PostMapping("comAddWriter.do")
	public String insertComAdd(@ModelAttribute("loginUser") Member m, Company com, Model model) {

		int empNo = m.getEmpNo();

		// 거래처 폴더명들을 가져온다
		ArrayList<Company> comFolList = addressBookService.selectComFolList(com, empNo);

		// 화면에 넘겨주기전에 확인
		System.out.println("폴더리스트가 잘 넘어 왔는가?: " + comFolList);

		model.addAttribute("comFolList", comFolList);

		// 가져온 거래처폴더명을 가지고 등록폼으로
		return "addressBook/comAddWriter";
	}

	// 거래처 등록하고 거래처리스트로 넘어가기
	@PostMapping("insertComAdd")
	public String insertComAdd(@ModelAttribute("loginUser") Member m, Company com) {

		int empNo = m.getEmpNo();

		addressBookService.insertComAdd(com, empNo);
		// redirect를 쓰는 이유: 뷰이름을 적어주는 포워딩 방식시 새로고침하면 똑같은글이 또 작성됨
		return "redirect:comAdd.do";
	}

	// 고객 등록하고 고객리스트로 넘어가기
	@PostMapping("insertCusAdd")
	public String insertCusAdd(@ModelAttribute("loginUser") Member m, Customer cus) {

		int empNo = m.getEmpNo();

		addressBookService.insertCusAdd(cus, empNo);
		// redirect를 쓰는 이유: 뷰이름을 적어주는 포워딩 방식시 새로고침하면 똑같은글이 또 작성됨
		return "redirect:custoAdd.do";

	}

	// 거래처별 폴더명으로 조회 리스트
	@PostMapping("selectSearchComFolList")
	public String selectComFolList(@ModelAttribute("loginUser") Member m, String inFolder, Model model, Company com) {

		int empNo = m.getEmpNo();

		ArrayList<Company> comList = addressBookService.selectSearchComFolList(empNo, inFolder, com);

		System.out.println("폴더명으로 리스트 조회해온 결과는?!" + comList);
		model.addAttribute("comList", comList);
		// return "addressBook/comAddList";
		// 폴더 목록 불러오기
		ArrayList<Company> comFolList = addressBookService.selectComFolList(com, empNo);
		// 화면에 넘겨주기전에 확인
		System.out.println("폴더리스트가 잘 넘어 왔는가?: " + comFolList);
		model.addAttribute("comFolList", comFolList);
		return "addressBook/comAddList";
	}
	
	// 고객별 폴더명으로 조회 리스트
		@PostMapping("selectSearchCustoFolList")
		public String selectCustoFolList(@ModelAttribute("loginUser") Member m, String inFolder, Model model, Customer custo) {

			int empNo = m.getEmpNo();
			// 폴더 목록 불러오기
			ArrayList<Company> custoFolList = addressBookService.selectCusFolList(custo, empNo);
			
			System.out.println("폴더목록?!" + custoFolList);
			model.addAttribute("custoFolList", custoFolList);
			// return "addressBook/comAddList";
			
			ArrayList<Customer> custoFolList = addressBookService.selectCustoFolList(custo, empNo);
			// 화면에 넘겨주기전에 확인
			System.out.println("폴더리스트가 잘 넘어 왔는가?: " + custoFolList);
			model.addAttribute("custoFolList", custoFolList);
			return "addressBook/custoAddList";
		}

	// 임시보관함 화면으로 이동
	@RequestMapping("boxAdd.do")
	public String selectBoxAdd() {
		return "addressBook/boxAdd";
	}

	// 고객주소록 상세조회
	@GetMapping("custoDetailView.do")
	public String selectCustoDetailView(int cusNo, Customer custo, Model model) {

		ArrayList<Customer> custoDetail = addressBookService.selectCustoDetailView(custo, cusNo);
		System.out.println("고객주소록 상세클릭" + custoDetail);
		model.addAttribute("custoDetail", custoDetail);
		return "addressBook/custoDetail";
	}

	// 거래처 주소록 상세조회
	@GetMapping("comDetailView.do")
	public String selectComDetailView(int compNo, Company com, Model model) {

		ArrayList<Company> comDetail = addressBookService.selectComDetailView(com, compNo);

		System.out.println("거래처 주소록 상세클릭:" + comDetail);
		model.addAttribute("comDetail", comDetail);

		return "addressBook/comDetail";
	}

}
