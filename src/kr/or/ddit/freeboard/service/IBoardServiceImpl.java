package kr.or.ddit.freeboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.freeboard.dao.IBoardDao;
import kr.or.ddit.freeboard.dao.IBoardDaoImpl;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeBoardVO;

public class IBoardServiceImpl implements IBoardService {
	
	private static IBoardServiceImpl service = new IBoardServiceImpl();
	private IBoardDao dao;
	
	private IBoardServiceImpl() {
		dao = IBoardDaoImpl.getInstance();
	}
	
	public static IBoardService getInstance(){
		if(service == null){
			service = new IBoardServiceImpl();
		}
		return service;
	}
	
	
	
	@Override
	public List<FreeBoardVO> getBoardList(Map<String, String> params) {
		List<FreeBoardVO> boardList = null;
		try {
			boardList = dao.getBoardList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public FreeBoardVO getBoardInfo(Map<String, String> params) {
		FreeBoardVO boardInfo = null;
		try {
			boardInfo = dao.getBoardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardInfo;
	}

	@Override
	public void insertBoardInfo(FreeBoardVO boardInfo, FileItem[] items) {
		boardInfo =  AttachFileMapper.mapping(boardInfo, items);	
		try {
			dao.insertBoardInfo(boardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int deleteBoardInfo(Map<String, String> params) {
		int deleteCnt = 0;
		try {
			deleteCnt = dao.deleteBoardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteCnt;
	}

	@Override
	public int updateBoardInfo(FreeBoardVO boardInfo) {
		int updateCnt = 0;
		
		try {
			updateCnt = dao.updateBoardInfo(boardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateCnt;
	}

	@Override
	public FileItemVO getFileItemInfo(Map<String, String> params) {
		FileItemVO fileItemInfo = null;
		try{
			fileItemInfo = dao.getFileItemInfo(params);
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		return fileItemInfo;
	}

	@Override
	public void insertBoardReplyInfo(FreeBoardVO freeboardInfo) {
		try{
			dao.insertBoardReplyInfo(freeboardInfo);
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
	}

	@Override
	public int getTotalCount(Map<String, String> params) {
		int totalCount = 0;
		try{
			totalCount = dao.getTotalCount(params);
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		return totalCount;
	}

	

}
