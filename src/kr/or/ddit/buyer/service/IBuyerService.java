package kr.or.ddit.buyer.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.MemberVO;

public interface IBuyerService {
	public BuyerVO getBuyerInfo(Map<String, String> params);
	public List<BuyerVO> getBuyerList();
	public int updateBuyerInfo(BuyerVO buyerInfo);
	public void insertBuyerInfo(BuyerVO buyerInfo);
	public int deleteBuyerInfo(Map<String, String> params);
	public List<LprodVO> getLprodList();
	
}
