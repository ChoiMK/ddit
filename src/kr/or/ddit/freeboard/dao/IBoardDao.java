package kr.or.ddit.freeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeBoardVO;

public interface IBoardDao {
	public FreeBoardVO getBoardInfo(Map<String, String> params) throws SQLException;
	public List<FreeBoardVO> getBoardList(Map<String, String> params)throws SQLException;
	public void insertBoardInfo(FreeBoardVO boardInfo) throws SQLException;
	public int deleteBoardInfo(Map<String, String> params) throws SQLException;
	public int updateBoardInfo(FreeBoardVO boardInfo) throws SQLException;
	public FileItemVO getFileItemInfo(Map<String, String> params) throws SQLException;
}
