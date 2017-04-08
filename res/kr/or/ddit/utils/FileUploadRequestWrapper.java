package kr.or.ddit.utils;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

// 클라이언트가 파일 업로드 서버 요청시 해당 요청으로부터 FileItem(업로드 한 파일),
// 폼필드(FileItem : mem_id, mem_pass)을 취득하기 용이하게 구성된 공통코드.
// FileUploadRequestWrapper is a HttpServletRequestWrapper;
public class FileUploadRequestWrapper extends HttpServletRequestWrapper {
	
	private boolean multipart = false;
	// 파일 업로드 시 전송되는 폼필드를 저장하기 위한 컬렉션
	private Map<String, String[]> parameterMap;
	// 파일 업로드 시 전송되는 파일을 저장하기 위한 컬렉션
	private Map<String, FileItem[]> fileItemMap;
	
	public FileUploadRequestWrapper(HttpServletRequest request) {
		this(request, -1, -1, null);
	}
	
	public FileUploadRequestWrapper(HttpServletRequest request, int thresold,
		  int max, String repositoryPath){
		super(request);
		this.fileUploadRequestParsing(request, thresold, max, repositoryPath);
	}
	
	private void fileUploadRequestParsing(HttpServletRequest request, int thresold,
			  int max, String repositoryPath){
		if(ServletFileUpload.isMultipartContent(request)){
			this.multipart = true;
			this.parameterMap = new HashMap<String, String[]>();
			this.fileItemMap = new HashMap<String, FileItem[]>();
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 임시저장소에 저장되는 파일의 사이즈 제한이 없음.(default)
			//factory.setSizeThreshold(-1);
			if(thresold != -1){
				factory.setSizeThreshold(thresold);
			}

			// 임시저장소의 파일시스템 패스
			if(repositoryPath != null){
				factory.setRepository(new File(repositoryPath));
			}
			
			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			// 실제 저장소에 저장될 파일의 사이즈 제한.default
			// fileUpload.setSizeMax(-1);
			if(max != -1){
				fileUpload.setSizeMax(max);
			}
			
			// 파일 업로드(<form action='주소' method='post' enctype='multipart/form-data'/>)
			// 폼필드(mem_id, mem_pass), 파일 => FileItem
			try {
				List<FileItem> items = fileUpload.parseRequest(request);
				
				for(FileItem item : items){
					// file01, file02, mem_id, mem_pass
					String fieldName = item.getFieldName();
					if(item.isFormField()){
						//mem_id, mem_pass
						String value = item.getString("UTF-8");
						String[] values = this.parameterMap.get(fieldName);
						if(values == null){
							 values = new String[] { value };
						}else{
							String[] temps = new String[values.length+1];
							// String 배열 values의 모든 저장값을 temps에 복사(deep copy)
							System.arraycopy(values, 0, temps, 0, values.length);
							temps[temps.length-1] = value;
							values = temps;
						}
						this.parameterMap.put(fieldName, values);
					}else{
						//file01, file02
						FileItem[] values = this.fileItemMap.get(fieldName);
						if(values == null){
							values = new FileItem[]{ item };
						}else{
							FileItem[] temps = new FileItem[values.length+1];
							System.arraycopy(values, 0, temps, 0, values.length);
							temps[temps.length-1] = item;
							values = temps;
						}
						this.fileItemMap.put(fieldName, values);
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public String getParameter(String name) {
		if(multipart){
			String[] values = this.parameterMap.get(name);
			if(values==null){
				return null;
			}else{
				return values[0];
			}
		}else{
			return super.getParameter(name);
		}
	}

	@Override
	public Map<String, String[]> getParameterMap() {
		if(multipart){
			return this.parameterMap;
		}else{
			return super.getParameterMap();	
		}
		
	}

	@Override
	public Enumeration<String> getParameterNames() {
		if(multipart){
			return new Enumeration<String>() {
				Iterator iter = parameterMap.keySet().iterator();
				
				@Override
				public boolean hasMoreElements() {
					return iter.hasNext();
				}

				@Override
				public String nextElement() {
					return (String)iter.next();
				}
				
			};
		}else{
			return super.getParameterNames();
		}
	}

	@Override
	public String[] getParameterValues(String name) {
		if(multipart){
			return parameterMap.get(name);
		}else{
			return super.getParameterValues(name);
		}
	}


	public FileItem getFileitem(String name){
		if(multipart){
			FileItem[] values = fileItemMap.get(name);
			if(values != null){
				return values[0];
			}
		}
		return null;
	}

	public FileItem[] getFileitemValues(String name){
		if(multipart){
			return fileItemMap.get(name);
		}
		return null;
	}
	
	public Map<String, FileItem[]> getFileitemMap(){
		if(multipart){
			return fileItemMap;
		}
		return null;
	}
	
}
