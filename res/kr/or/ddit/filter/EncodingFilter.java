package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 클라이언트 요청시에 get|post으로 전송되는 파라미터를 서버에서 처리시에
		// 적용할 인코딩 타입 설정
		String encodingType = request.getCharacterEncoding();
		if(encodingType == null){
			request.setCharacterEncoding("UTF-8");
		}
		chain.doFilter(request, response); //클라이언트의 요청을 처리하는 jsp에 요청이 전달(포워딩)
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
