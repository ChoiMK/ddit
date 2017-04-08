package kr.or.ddit.buyer.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.dao.IBuyerDaoImpl;
import kr.or.ddit.member.dao.IMemberDaoImpl;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.MemberVO;

public class IBuyerServiceImpl implements IBuyerService {
	
	private static IBuyerServiceImpl service = new IBuyerServiceImpl();
	private IBuyerDao dao;
	
	private IBuyerServiceImpl() {
		dao = IBuyerDaoImpl.getInstance();
	}
	
	public static IBuyerService getInstance(){
		if(service == null){
			service = new IBuyerServiceImpl();
		}
		return service;
	}
	
	
	@Override
	public List<BuyerVO> getBuyerList() {
    List<BuyerVO> buyerList = null;
    try {
		buyerList = dao.getBuyerList();
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return buyerList;
	}

	@Override
	public BuyerVO getBuyerInfo(Map<String, String> params) {
		BuyerVO buyerInfo = null;
		try {
			buyerInfo = dao.getBuyerInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyerInfo;
	}

	@Override
	public int updateBuyerInfo(BuyerVO buyerInfo) {
		int updateCnt = 0;
		try {
			updateCnt = dao.updateBuyerInfo(buyerInfo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return updateCnt;
	}

	@Override
	public void insertBuyerInfo(BuyerVO buyerInfo) {
		try {
			dao.insertBuyerInfo(buyerInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int deleteBuyerInfo(Map<String, String> params) {
		int deleteCnt = 0;
		try {
			deleteCnt = dao.deleteBuyerInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteCnt;
	}

	@Override
	public List<LprodVO> getLprodList() {
		 List<LprodVO> lprodList = null;
		    try {
		    	lprodList = dao.getLprodList();
			} catch (SQLException e) {
				e.printStackTrace();
			}
				return lprodList;
	}

	
}
