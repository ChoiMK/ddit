package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.MemberVO;

public interface IBuyerDao {
	public BuyerVO getBuyerInfo(Map<String, String> params) throws SQLException;
	public List<BuyerVO> getBuyerList() throws SQLException;
	public int updateBuyerInfo(BuyerVO buyerInfo) throws SQLException;
	public void insertBuyerInfo(BuyerVO buyerInfo) throws SQLException;
	public int deleteBuyerInfo(Map<String, String> params) throws SQLException;
	public List<LprodVO> getLprodList() throws SQLException;

}
