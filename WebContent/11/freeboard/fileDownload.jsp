<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.vo.FileItemVO"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardService"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="kr.or.ddit.utils.GlobalConstant"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileSeq = request.getParameter("fileSeq");
	
	Map<String,String> params = new HashMap<String, String>();
	params.put("file_seq", fileSeq);

	IBoardService service = IBoardServiceImpl.getInstance();
	FileItemVO fileItemInfo = service.getFileItemInfo(params);
	
	File downloadFile = new File(GlobalConstant.SAVE_PATH, fileItemInfo.getFile_save_name());		

	// 다운로드 대상 파일명 한글
	// 다운로드 창의 인코딩 타입 ISO-8859-1
	String fileName = new String(fileItemInfo.getFile_name().getBytes("UTF-8"),"8859_1");
	
	
	// Content-Disposition : attachment = 다운로드 창 출력으로 파일 스트리밍 다운로드
	// Content-Disposition : inline = 브라우저에 직접 출력
	response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	
	//브라우저가 인지하는 content type : application/vns.ms-word, application/vnd.excel, application/hwp
	//								 application/pdf, application/octet-stream
	//								 text/html, text/xml, text/plain, 
	//								 application/zip, application/x-javascript
	//								 image/gif, image/png, image/jpg, image/jpeg
	response.setContentType("application/octet-stream");
	response.setContentLength((int)downloadFile.length());

	out.clear();
	out = pageContext.pushBody();
	
	byte[] buffer = new byte[(int)downloadFile.length()];
	
	BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(downloadFile));
	
	BufferedOutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
	
	int readByte = 0;
	while((readByte = inputStream.read(buffer)) != -1){
		outputStream.write(buffer, 0, readByte);
	}
	
	inputStream.close();
	outputStream.close();
	
	
	

%>
