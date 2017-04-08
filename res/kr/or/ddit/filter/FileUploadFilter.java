package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.utils.FileUploadRequestWrapper;

public class FileUploadFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		
		// 파일업로드 : <form method='post' enctype='multipart/form-data'/>
		//           contentType = multipart/form-data
		// 일반폼전송 : <form method='get|post' enctype='application/x-ww-form-urlencoded'/>
		//			 contentType = application/x-ww-form-urlencoded
		// location.href, location.replace(), <a href=''/>
		//			 contentType = null
		//        $.ajax({   
		//               url:'주소'
		//				 contentType : ' application/x-ww-form-urlencoded'
		//				});
		String contentType = request.getContentType();
		if(contentType != null && contentType.startsWith("multipart")){
			FileUploadRequestWrapper wrapper = new FileUploadRequestWrapper(request);
			chain.doFilter(wrapper, response);
		}else{
			chain.doFilter(req, resp);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
