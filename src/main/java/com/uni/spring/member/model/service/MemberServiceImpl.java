package com.uni.spring.member.model.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.member.model.dao.MemberDao;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.member.model.dto.WideMember;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	//비밀번호 암호화 이전
	/*@Override
	public Member loginMember(Member m) throws Exception {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		if(loginUser == null) {
			throw new Exception("로그인정보를 확인해주세요");
		}	
		return loginUser;
	}*/
	//비밀번호 암호화된것 로그인
	@Override
	 public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m){
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		if(loginUser == null) {
			
			
			throw new CommException("로그인 정보를 다시 확인해주세요");
		}
		
		//mathes(입력한비번,암호화비번) ture, false로 반환
		if(!bCryptPasswordEncoder.matches(m.getUserPw(), loginUser.getUserPw())) {
			
			
			throw new CommException("로그인 정보를 다시 확인해주세요");
			
		}
		return loginUser;
		

	}
	

	@Override
	public WideMember selectNewMember(int empNo) {
		
		WideMember m =  null;
		
		int result = memberDao.selectEmpNoCount(sqlSession, empNo);
		
		if(result < 1){//조회한 사번이 조회되지 않으면 count한게 0 이라면
			//throw new CommException("사번을 확인해주세요");
			
		}
		else {//조회한 사번이 있다면
			m = memberDao.selectNewMember(sqlSession,empNo);
		}
		return m;
	}

	
	//아이디 중복체크
	@Override
	public int logincheck(String userId){
		int idno = memberDao.selectIdCheck(sqlSession, userId);
		return idno;
	}

	@Override
	public void updateNewMember(Member m){
		int result = memberDao.updateNewMember(sqlSession, m);
		if(result < 0) {
			throw new CommException("회원가입에 실패했습니다");
		}
		
	}

	//아이디찾기에 출력될 부서명
	@Override
	public ArrayList<Dept> findDept() {
		ArrayList<Dept> dtlist = memberDao.selectDeptTitle(sqlSession);
		return dtlist;
	}


	@Override
	public String selectFindId(WideMember wm) {
		String msg = memberDao.selectFindId(sqlSession, wm);
		
		/*if(msg.isEmpty()) {
			
			throw new CommException("입력정보를 다시 확인해주세요");
		}
		
		*/return msg;
		
	}


	@Override
	public int insertMemberAttachFile(MultipartFile file, HttpServletRequest request, int empNo) {
		//사원 프로필 사진 업로드
		int success = 0;
		String orgName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());//년월일시분초
		
		//업로드 경로 - resources - upload_files
		String filePath = request.getSession().getServletContext().getRealPath("resources")+"\\upload_files\\";
		
		
		String ext = orgName.substring(orgName.lastIndexOf("."));
		String chgName = currentTime+ext;
		
		try {
			file.transferTo(new File(filePath + chgName));
			success = 1;
		} catch (IllegalStateException | IOException e) {
			success = 0;
			e.printStackTrace();
			throw new CommException("file Upload error");
		}
		if(success > 0) {
			Map <String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("orgName", orgName);
			resultMap.put("chgName", chgName);
			resultMap.put("empNo",empNo);
			memberDao.insertMemberAttachFile(sqlSession, resultMap);
		}
		return success;
	}


	//이메일 인증번호 보내기전 사원정보 있는지 확인
	@Override
	public int selectFindUser(Member m) {
		// TODO Auto-generated method stub
		return memberDao.selectFindUser(sqlSession,m);
	
	}

	//비밀번호 변경
	@Override
	public int updatePw(Member m) {
		// TODO Auto-generated method stub
		return memberDao.updatePw(sqlSession,m);
	}

}
