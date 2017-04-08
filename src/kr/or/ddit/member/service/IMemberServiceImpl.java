package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.IMemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class IMemberServiceImpl implements IMemberService {
	// 싱글톤 패턴 : 서블릿
	//            사용자 정의 클래스
	private static IMemberServiceImpl service = new IMemberServiceImpl();
	private IMemberDao dao;
	
	private IMemberServiceImpl() {
		dao = IMemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null){
			service = new IMemberServiceImpl();
		}
		return service;
	}
	
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) {
		MemberVO memberInfo = null;
		try {
			 memberInfo = dao.getMemberInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberInfo;
	}

	@Override
	public List<MemberVO> getMemberList(Map<String, String> params) {
		List<MemberVO> memberList = null;
		try{
			memberList = dao.getMemberList(params);
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		return memberList;
	}

	@Override
	public void insertMemberInfo(MemberVO memberInfo) {
		try {
			dao.insertMemberInfo(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int deleteMemberInfo(Map<String, String> params) {
		int deleteCnt = 0;
		try {
			deleteCnt = dao.deleteMemberInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteCnt;
	}

	@Override
	public int updateMemberInfo(MemberVO memberInfo) {
		int updateCnt = 0;
		try {
			updateCnt = dao.updateMemberInfo(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return updateCnt;
	}


}
