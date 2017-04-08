package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	public MemberVO getMemberInfo(Map<String, String> params);
	public List<MemberVO> getMemberList(Map<String, String> params);
	public void insertMemberInfo(MemberVO memberInfo);
	public int deleteMemberInfo(Map<String, String> params);
	public int updateMemberInfo(MemberVO memberInfo);

}
