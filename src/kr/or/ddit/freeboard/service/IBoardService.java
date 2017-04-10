package kr.or.ddit.freeboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeBoardVO;

public interface IBoardService {
	public FreeBoardVO getBoardInfo(Map<String, String> params);
	public List<FreeBoardVO> getBoardList(Map<String, String> params);
	public void insertBoardInfo(FreeBoardVO boardInfo, FileItem[] items);
	public int deleteBoardInfo(Map<String, String> params);
	public int updateBoardInfo(FreeBoardVO boardInfo);
	public FileItemVO getFileItemInfo(Map<String, String> params);
	public void insertBoardReplyInfo(FreeBoardVO freeboardInfo);
	public int getTotalCount(Map<String, String> params);
}
