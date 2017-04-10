package kr.or.ddit.freeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.build.SqlMapClientFactory;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeBoardVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IBoardDaoImpl implements IBoardDao {
	private static IBoardDaoImpl dao = new IBoardDaoImpl();
	private SqlMapClient client;
	
	private  IBoardDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IBoardDaoImpl getInstance(){
		if(dao==null){
			dao = new IBoardDaoImpl();
		}
		return dao;
	}
	
	
	@Override
	public List<FreeBoardVO> getBoardList(Map<String, String> params) throws SQLException {
		return client.queryForList("board.boardList", params);
	}

	@Override
	public FreeBoardVO getBoardInfo(Map<String, String> params)
			throws SQLException {
		client.update("board.updateHit", params);
		return (FreeBoardVO)client.queryForObject("board.boardInfo",params);
	}

	@Override
	public void insertBoardInfo(FreeBoardVO boardInfo) throws SQLException {
		// freeboard table 대상 insert
		// fileitem table 대상 insert*2
		try{
			// commit : startTransaction() => 다수 쿼리 질의 => commitTransaction()
			//           endTransaction()
			// rollback :  startTransaction() => 다수 쿼리 질의 중에 에러 => endTransaction()
			//
			client.startTransaction();
			
			String bo_no = (String)client.insert("board.insertBoard", boardInfo);
			
			List<FileItemVO> fileItemList = boardInfo.getAttachFileItemList();
			for(FileItemVO fileItemInfo : fileItemList){
				fileItemInfo.setFile_bo_no(bo_no);
				client.insert("board.insertFileItem", fileItemInfo);
			}
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
	}

	@Override
	public int deleteBoardInfo(Map<String, String> params) throws SQLException {
		return client.update("board.deleteBoard",params);
	}

	@Override
	public int updateBoardInfo(FreeBoardVO boardInfo) throws SQLException {
		return client.update("board.updateBoard", boardInfo);
		
	}

	@Override
	public FileItemVO getFileItemInfo(Map<String, String> params)
			throws SQLException {
		client.update("board.updateDownloadHit", params);
		return (FileItemVO) client.queryForObject("board.fileitemInfo", params);
	}

	@Override
	public void insertBoardReplyInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		// 부모 게시글 : bo_group, bo_depth, bo_seq
		// 자식 게시글 : bo_title, bo_nickName, bo_content, bo_mail .....
		String bo_seq = "";
		if("0".intern() == freeboardInfo.getBo_seq().intern()){
		  bo_seq = (String)client.queryForObject("board.incrementSeq",freeboardInfo);
		}else{
			client.update("board.updateSeq",freeboardInfo);
			bo_seq = String.valueOf(Integer.parseInt(freeboardInfo.getBo_seq()) + 1); 
		}
		freeboardInfo.setBo_seq(bo_seq);
		
		freeboardInfo.setBo_depth(String.valueOf(Integer.parseInt(freeboardInfo.getBo_depth())+1));
		
		client.insert("board.insertReplyInfo",freeboardInfo);
		
	}

	@Override
	public int getTotalCount(Map<String, String> params) throws SQLException {
		return (int)client.queryForObject("board.totalCount",params);
	}

}
