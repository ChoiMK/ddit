package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.build.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;

public class IMemberDaoImpl implements IMemberDao {
	private static IMemberDao dao = new IMemberDaoImpl();
	private SqlMapClient client;
	
	private IMemberDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getInstance(){
		return (dao == null) ? new IMemberDaoImpl() : dao;
	}
	
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException {
		
		return (MemberVO)client.queryForObject("member.memberInfo",params);
	}

	@Override
	public List<MemberVO> getMemberList(Map<String, String> params) throws SQLException {
		
		return client.queryForList("member.memberList",params);
	}

	@Override
	public void insertMemberInfo(MemberVO memberInfo) throws SQLException {
		client.insert("member.insertMember", memberInfo);

	}

	@Override
	public int deleteMemberInfo(Map<String, String> params) throws SQLException {
		return client.update("member.deleteMember",params);
	}

	@Override
	public int updateMemberInfo(MemberVO memberInfo) throws SQLException {
		return client.update("member.updateMember", memberInfo);
	}

}
