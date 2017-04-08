package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.build.SqlMapClientFactory;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;

public class IBuyerDaoImpl implements IBuyerDao{
	private static IBuyerDao dao = new IBuyerDaoImpl();
	private SqlMapClient client;
	
	private IBuyerDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IBuyerDao getInstance(){
		return (dao == null) ? new IBuyerDaoImpl() : dao;
	}
	
	
	@Override
	public List<BuyerVO> getBuyerList() throws SQLException {
		return client.queryForList("buyer.buyerList");
	}

	@Override
	public BuyerVO getBuyerInfo(Map<String, String> params) throws SQLException {
		
		return (BuyerVO)client.queryForObject("buyer.buyerInfo",params);
	}

	@Override
	public int updateBuyerInfo(BuyerVO buyerInfo) throws SQLException {
		return client.update("buyer.updateBuyer", buyerInfo);
	}

	@Override
	public void insertBuyerInfo(BuyerVO buyerInfo) throws SQLException {
		client.insert("buyer.insertBuyer", buyerInfo);
	}

	@Override
	public int deleteBuyerInfo(Map<String, String> params) throws SQLException {
		return client.update("buyer.deleteBuyer", params);
	}

	@Override
	public List<LprodVO> getLprodList() throws SQLException {
		return client.queryForList("buyer.lprodList");
	}
	
}
