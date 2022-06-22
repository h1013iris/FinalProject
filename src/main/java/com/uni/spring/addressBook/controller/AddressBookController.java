package com.uni.spring.addressBook.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.uni.spring.addressBook.model.dto.Company;
import com.uni.spring.addressBook.model.dto.Customer;
import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.addressBook.model.dto.Favorite;
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
	public String mainAddress(@ModelAttribute("loginUser") Member m,WideMember wm, Dept dp, Model model) {

		ArrayList<WideMember> allAddList = addressBookService.selectAllAddList(wm);

		System.out.println("주소록 전체내용 조회결과:" + allAddList);

		ArrayList<Dept> deptTitleList = addressBookService.selectDeptTitleList(dp);

		System.out.println("부서명 조회결과:" + deptTitleList);

		int empNo = m.getEmpNo();
		System.out.println("세션에서 가져온 사번"+empNo);
		//메인주소록으로 이동할때 즐겨찾기 추가된것들은 체크 유지해주기
		ArrayList<WideMember> emoNoCkList= addressBookService.selectEmpNoChList(empNo);
		System.out.println("즐겨찾기가 추가된 사번들 : "+emoNoCkList);
		model.addAttribute("allAddList", allAddList);//조회한 전체 주소록 내용
		model.addAttribute("deptTitleList", deptTitleList);//상단에 위치시킬 부서명 타이틀
		model.addAttribute("emoNoCkList", emoNoCkList);//이미 즐겨찾기 추가가 된 사번들 조회

		return "addressBook/mainAdd";
	}

	// 부서명 버튼눌러서 각 부서별 주소록 조회
	@GetMapping("deptAddList")
	public String selectDeptAddList(@RequestParam("departmentTitle") String departmentTitle, Dept dp, WideMember wm,
			Model model) {

		ArrayList<WideMember> deptList = addressBookService.selectDeptAddlist(departmentTitle);

		model.addAttribute("deptList", deptList);

		System.out.println("부서별 리스트 조회 결과:" + deptList);

		ArrayList<Dept> deptTitleList = addressBookService.selectDeptTitleList(dp);

		System.out.println("부서명 조회결과:" + deptTitleList);

		model.addAttribute("deptTitleList", deptTitleList);

		return "addressBook/deptAdd";

	}

	// 검색창에서 전체검색으로진행됨 전체주소록이랑 같은 표에서 출력된다.
	@PostMapping("allAddSearch.do")
	public String selectAllAddSearch(WideMember wm, String search,Dept dp, Model model) {

		ArrayList<WideMember> allAddList = addressBookService.selectAllAddSearch(wm, search);
		model.addAttribute("allAddList", allAddList);

		System.out.println("검색결과는? " + allAddList);
		
		ArrayList<Dept> deptTitleList = addressBookService.selectDeptTitleList(dp);

		System.out.println("부서명 조회결과:" + deptTitleList);

		model.addAttribute("deptTitleList", deptTitleList);
		if(allAddList==null||allAddList.isEmpty()) {
			model.addAttribute("msg","전체 부서록 검색 결과가 없습니다.");
			model.addAttribute("msgTitle","검색 결과");
		}
		return "addressBook/mainAdd";
	}
	
	// 부서별 검색 부서별주소록 리스트랑 같은 표에서 출력된다.
	@PostMapping("deptAddSearch.do")
	public String selectDeptAddSearch(String departmentTitle,String search,Dept dp, Model model) {
		
		ArrayList<WideMember> deptList = addressBookService.selectDeptAddSearch(departmentTitle,search);

		System.out.println("검색결과는? " + deptList);

		model.addAttribute("deptList", deptList);
		
		ArrayList<Dept> deptTitleList = addressBookService.selectDeptTitleList(dp);

		System.out.println("부서명 조회결과:" + deptTitleList);

		model.addAttribute("deptTitleList", deptTitleList);
		if(deptList==null||deptList.isEmpty()) {
			model.addAttribute("msg","해당 부서내 검색 결과가 없습니다.");
			model.addAttribute("msgTitle","검색결과");
		}

		return "addressBook/deptAdd";
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

		// 고객 폴더명들을 가져온다
		ArrayList<Company> cusFolList = addressBookService.selectCusFolList(custo, empNo);
		model.addAttribute("cusFolList", cusFolList);
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
		// 폴더 목록 불러오기
		ArrayList<Company> comFolList = addressBookService.selectComFolList(com, empNo);
		// 화면에 넘겨주기전에 확인
		System.out.println("폴더리스트가 잘 넘어 왔는가?: " + comFolList);
		model.addAttribute("comFolList", comFolList);
		return "addressBook/comAddList";
	}

	// 고객별 폴더명으로 조회 리스트
	@PostMapping("selectSearchCustoFolList")
	public String selectCustoFolList(@ModelAttribute("loginUser") Member m, String inFolder, Model model,
			Customer custo) {

		int empNo = m.getEmpNo();

		// 고객 폴더명들을 가져온다
		ArrayList<Company> cusFolList = addressBookService.selectCusFolList(custo, empNo);
		System.out.println("폴더목록?!" + cusFolList);
		model.addAttribute("cusFolList", cusFolList);
		// return "addressBook/comAddList";

		ArrayList<Customer> custoList = addressBookService.selectSearchCustoFolList(empNo, inFolder, custo);
		// 화면에 넘겨주기전에 확인
		System.out.println("리스트가 잘 넘어 왔는가?: " + custoList);
		model.addAttribute("custoList", custoList);
		return "addressBook/custoAddList";
	}

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

		System.out.println("거래처 주소록 상세조회클릭:" + comDetail);
		model.addAttribute("comDetail", comDetail);

		return "addressBook/comDetail";
	}

	// 거래처 주소록 업데이트하기전(변경전 내용 불러오기)
	@PostMapping("selectupDetailCom.do")
	public String updateDeatilCom(int compNo, int empNo, Company com, Model model) {
		ArrayList<Company> comDetail = addressBookService.selectComDetailView(com, compNo);

		System.out.println("거래처 주소록 업데이트전:" + comDetail);
		model.addAttribute("comDetail", comDetail);

		ArrayList<Company> comFolList = addressBookService.selectComFolList(com, empNo);
		// 화면에 넘겨주기전에 확인
		System.out.println("업데이트용..폴더리스트가 잘 넘어 왔는가?: " + comFolList);
		model.addAttribute("comFolList", comFolList);
		return "addressBook/updateDetailCom";
	}

	// 고객주소록 업데이트하기전(변경전 내용 불러오기)
	@PostMapping("selectupDetailCusto.do")
	public String updateDeatilCom(int cusNo, int empNo, Customer custo, Model model) {

		ArrayList<Customer> custoDetail = addressBookService.selectCustoDetailView(custo, cusNo);
		System.out.println("고객주소록 상세클릭" + custoDetail);
		model.addAttribute("custoDetail", custoDetail);

		ArrayList<Company> cusFolList = addressBookService.selectCusFolList(custo, empNo);
		System.out.println("폴더목록?!" + cusFolList);
		model.addAttribute("cusFolList", cusFolList);

		return "addressBook/updateDetailCusto";
	}

	// 거래처 주소록 업데이트 하기
	@PostMapping("updateComList.do")
	public String updateComList(Company com) {
		addressBookService.updateComList(com);
		return "redirect:comAdd.do";
	}

	// 고객 주소록 업데이트 하기
	@PostMapping("updateCustoList.do")
	public String updateComList(Customer custo) {
		addressBookService.updateCustoList(custo);
		return "redirect:custoAdd.do";
	}

	// 거래처 주소록 삭제
	@PostMapping("deleteComAdd.do")
	@ResponseBody
	public String deleteComAdd(String compNo, Model model) {

		// System.out.println("거래처주소록에서 삭제버튼 눌렀을때");
		// System.out.println("compNo는?: "+compNo);

		int num = addressBookService.deleteComAdd(compNo);

		String result = Integer.toString(num);
		System.out.println("result값: "+result);
		return result;
	}

	// 고객 주소록 삭제
	@PostMapping("deleteCusAdd.do")
	@ResponseBody
	public String deleteCusAdd(String cusNo, Model model) {

		System.out.println("고객주소록에서 삭제버튼 눌렀을때");
		System.out.println("cusNo는?: " + cusNo);

		int num = addressBookService.deleteCusAdd(cusNo);
		
		System.out.println("num은?"+num);
		String result = Integer.toString(num);
		System.out.println("result값: "+result);
		return result;
	}

	// 임시보관함 화면으로 이동
	@RequestMapping("boxAdd.do")
	public String selectBoxAdd(Company com,@ModelAttribute("loginUser") Member m,Model model) {
		
		int empNo = m.getEmpNo();
		ArrayList<Company>comBoxList = addressBookService.selectComBoxAdd(empNo);
		//거래처 임시보관함 잘 넘어왔는지
		System.out.println("거래처 주소록 임시보관함 리스트 : "+comBoxList);
		model.addAttribute("comBoxList", comBoxList);
		
		ArrayList<Customer>custoBoxList = addressBookService.selectCustoBoxAdd(empNo);
		//고객 임시보관함 잘 넘어왔는지
		System.out.println("고객 주소록 임시보관함 리스트 : "+custoBoxList);
		model.addAttribute("custoBoxList", custoBoxList);
		
		return "addressBook/boxAdd";
	}
	
	//임시보관함 고객주소록 영구삭제
	@PostMapping("deleteCustoBox.do")
	@ResponseBody
	public int deleteCustoBox(@RequestParam(value="cusNoArr[]")List<String> cusNoArr) {
		
	System.out.println("cusNoArr의 값 : " + cusNoArr);
	int deletecount=addressBookService.deleteCustoBox(cusNoArr);
	System.out.println("고객 임시보관함 삭제결과"+deletecount);
	
	return deletecount; 
	}
	
	//임시보관함 거래처주소록 영구삭제
	@PostMapping("deleteComBox.do")
	@ResponseBody
	public int deleteComBox(@RequestParam(value="comNoArr[]")List<String> comNoArr) {
		
	System.out.println("comNoArr의 값 : " + comNoArr);
	int deletecount=addressBookService.deleteComBox(comNoArr);
	System.out.println("거래처 임시보관함 삭제결과"+deletecount);
	
	return deletecount; 
	}
	
	//임시보관함 고객주소록 복원
	@PostMapping("backCustoBox.do")
	@ResponseBody
	public int updateBackCustoBox(@RequestParam(value="cusNoArr[]")List<String> cusNoArr) {
	
	System.out.println("고객복원 컨트롤러 cusNoArr의 값"+cusNoArr);
	int backCount = addressBookService.updateBackCustoBox(cusNoArr);
	System.out.println("고객 임시보관함 복원결과"+backCount);
		
	return backCount;
	}
	
	//임시보관함 거래처 주소록 복원
	@PostMapping("backComBox.do")
	@ResponseBody
	public int updatebackComBox(@RequestParam(value="comNoArr[]")List<String> comNoArr) {
		int backCount = addressBookService.updateBackComBox(comNoArr);
		System.out.println("고객 임시보관함 복원결과"+backCount);
			
		return backCount;
	}
	
	//즐겨찾기 추가 
	@PostMapping("insertPavoAdd.do")
	@ResponseBody
	public int insertPavoAdd(@ModelAttribute("loginUser") Member m, @RequestParam("ckEmpNo") String ckEmpNo) {
		//즐겨찾기 테이블에 추가하기
		int eNo = m.getEmpNo();//로그인한 유저의 사번
		String empNo = String.valueOf(eNo);
		System.out.println("로그인한 유저의 사번은?: " + empNo + " 즐겨찾기 대상의 사번은?" + ckEmpNo);//잘넘어오넹
		//추가하기
		int count = addressBookService.insertPavoAdd(ckEmpNo,empNo);
		System.out.println("즐겨찾기 추가 결과: "+ count);
		return count;
	}
	
	//즐겨찾기 조회
	@GetMapping("favoAdd.do")
	public String selectFavoAdd(@ModelAttribute("loginUser") Member m, Model model) {
		int eNo=m.getEmpNo();
		String empNo=String.valueOf(eNo);
		ArrayList<WideMember> favoAddList = addressBookService.selectFavoAdd(empNo);
		model.addAttribute("favoAddList", favoAddList);
		return "addressBook/favoAdd";
	}
	
	//메인주소록에서 즐겨찾기 삭제 
		@PostMapping("deletePavoAdd.do")
		@ResponseBody
		public int deletePavoAdd(@ModelAttribute("loginUser") Member m, @RequestParam("ckEmpNo") String ckEmpNo) {
		int eNo=m.getEmpNo();
		String empNo=String.valueOf(eNo);
		System.out.println("체크 해제시 넘어온 ckEmpNo"+ckEmpNo);//휴 넘어왔다..
		int count=addressBookService.deletePavoAdd(empNo,ckEmpNo);
		System.out.println("즐겨찾기 삭제 결과"+count);
		return count;
		}

}