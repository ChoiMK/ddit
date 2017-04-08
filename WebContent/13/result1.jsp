<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파일업로드
	// 1.라이브러리
	//		http://commons.apache.org
	//			commons-fileupload-1.2.2.jar
	//			commons-io-2.3.jar
	//String savePath = application.getRealPath("/upload");
	String savePath = "D:\\temp\\upload\\";	
	application.log(savePath);
	// true  : form method=post    enctype=multipart/form-data/form-date
	// false : form method=post		enctype=application/x-www-form-urlencoded
	boolean multipartFlag = ServletFileUpload.isMultipartContent(request);
	if(multipartFlag){
		// 파일 업로드 : 임시저장소(WAS : 메모리 또는 서버 내에 파일시스템)
		//			   실제 저장소(서버 내에 특정 패스)
		DiskFileItemFactory factory = new DiskFileItemFactory();
	    factory.setSizeThreshold(1024*1024*100);
	    factory.setRepository(new File(savePath));
	    
	    ServletFileUpload servletfileUpload = new ServletFileUpload(factory);
	  	// 전체 파일의 사이즈 제한
	    servletfileUpload.setSizeMax(1024*1024*100);
	  	// 파일 업로드 시에 파일단위의 사이즈 제한
	// 	servletfileUpload.setFileSizeMax(1024 * 1024);
	    
	  	//form에서 서버로 이진 바이너리 코드화 되어서 전송된
	  	// mem_id=값   mem_pass=값  file01=파일 file02=파일
	  	List<FileItem> items =  servletfileUpload.parseRequest(request);
	  	
	  	Iterator<FileItem> itemsIter = items.iterator();
	  	while(itemsIter.hasNext()){
	  		FileItem item = itemsIter.next();
	  		// true : mem_id, mem_pass
	  		// flase : file01, file02
	  		if(item.isFormField()){
	  			// 전송 폼필드(mem_id,mem_pass)
	  			String key = item.getFieldName(); // <input type="text" name="mem_id">
	  			String value = item.getString("UTF-8");
	  			out.println(key + " : "+ value +  "<br/>");
	  		}else{
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
	  			
	  			File saveFile = new File(savePath, saveFileName);
	  			
	  			item.write(saveFile);
	  		}
	  	
	  	
	  	}
	  	
	  	
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>