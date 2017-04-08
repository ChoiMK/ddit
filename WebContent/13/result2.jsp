<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.util.UUID"%>
<%@page import="kr.or.ddit.utils.GlobalConstant"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="kr.or.ddit.utils.FileUploadRequestWrapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper) request;

	String mem_id = wrapper.getParameter("mem_id");
	String mem_pass = wrapper.getParameter("mem_pass");
	
	FileItem[] items = wrapper.getFileitemValues("files");
	
	for(FileItem item : items){
		//전송 파일(file01,file02)
			String key = item.getFieldName(); //  <input type="file" name="file01">
			String fileName = item.getName(); // [찾아보기] 버튼 클릭으로 선택한 파일 
			int fileSize = (int)item.getSize();
			String contentType = item.getContentType();
			out.println(key + " : " + fileName + "<br/>");
			out.println(fileSize + " : " + contentType + "<br/>");
				
			// 브라우저별로 [찾아보기] 버튼 클릭으로 선택된 파일이 서버로 전송시에
			// Fileitem.getName()  === 해당 파일의 클라이언트 파일시스템 풀패스
			//						| ex) D:\temp\a.png
			//                      | - 파일명
			//						  ex) a.png
			String saveFileName = item.getName();
			saveFileName = saveFileName.substring(fileName.lastIndexOf("\\")+1);
			
			// 업로드 파일 a.png    파일명 + 유니크한값 +확장자
			// a_53245235432.png
			// UUID : 128bit로 처리된 랜덤한 암호화 강도가 높은 난수 제너레이터
			String genID = UUID.randomUUID().toString().replace("-", "");
			
			// a
			String baseName = FilenameUtils.getBaseName(saveFileName);
			// png
			String extension = FilenameUtils.getExtension(saveFileName);
			
			saveFileName = baseName + "_" + genID + "." + extension; 
			File saveFile = new File(GlobalConstant.SAVE_PATH, saveFileName);
			
			item.write(saveFile);
			
			pageContext.setAttribute("fileName", saveFileName);
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="http://localhost/file/${fileName }" alt="대신문자열" width="200px" height="150px" 
	onclick="javascript:location.href='${pageContext.request.contextPath}/13/fileDownload.jsp?fileName=${fileName }';"/>
</body>
</html>