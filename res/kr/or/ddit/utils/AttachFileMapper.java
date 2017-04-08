package kr.or.ddit.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeBoardVO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;

public class AttachFileMapper {
	public static FreeBoardVO mapping(FreeBoardVO freeboardInfo, FileItem[] items){
		List<FileItemVO> fileItemList = new ArrayList<FileItemVO>();
		for(FileItem item : items){
			FileItemVO fileItemInfo = null;
			// 클라이언트에 input type=file [찾아보기] 파일첨부시에는 파일이 서버로 전송
			// 클라이언트에서 파일 미첨부시에서도 파일 사이즈 0인 파일이 서버로 전송.
			if(item.getSize() > 0){
				fileItemInfo = new FileItemVO();
				
				// D:\\temp\\a.png or a.png
				// String fileName = item.getName().substring(item.getName().lastIndexOf("\\")+1);
				String fileName = FilenameUtils.getName(item.getName());
				//실제 업로드한 파일명
				fileItemInfo.setFile_name(fileName);
				fileItemInfo.setFile_save_name(makeSaveFileName(fileName));
				fileItemInfo.setFile_content_type(item.getContentType());
				fileItemInfo.setFile_size(String.valueOf(item.getSize()));

				saveFile(item, fileItemInfo.getFile_save_name());
				
				
				fileItemList.add(fileItemInfo);
				fileItemInfo = null;
			
			}
		}
		freeboardInfo.setAttachFileItemList(fileItemList);
		return freeboardInfo;
	}
	
public static void saveFile(FileItem item, String saveFileName){
	File saveFile = new File(GlobalConstant.SAVE_PATH, saveFileName);
	try {
		item.write(saveFile);
	} catch (Exception e) {
		e.printStackTrace();
	}
}

public static String makeSaveFileName(String fileName){
	//a.png => a
	String baseName = FilenameUtils.getBaseName(fileName);
	String uuid = UUID.randomUUID().toString().replace("-", "");
	
	//a.png => png
	String extension = FilenameUtils.getExtension(fileName);
	String saveFileName = baseName + "_" + uuid + "." + extension;
	return saveFileName;
}
	

}
