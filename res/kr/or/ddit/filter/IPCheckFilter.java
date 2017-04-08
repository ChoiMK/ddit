package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class IPCheckFilter implements Filter {
	
	private Map<String, String> ipMap;
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("해당 필터가 인스턴스화 된 직후에 콜백");
		ipMap = new HashMap<String, String>();
		ipMap.put("127.0.0.1","A");
		ipMap.put("0:0:0:0:0:0:0:1","A");
		ipMap.put("192.168.201.30","A");
		ipMap.put("192.168.201.36","Fuck");
	}
	
	@Override
	public void destroy() {
		System.out.println("해당 필터의 인스턴스가 힙 메모리상에서 GC되기 직전에 콜백");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		System.out.println("클라이언트의 요청을 처리하는 jsp에 요청 전달전 실행될 코드");
		
		String clientIPAddr = request.getRemoteAddr();
		if(clientIPAddr != null && ipMap.containsKey(clientIPAddr)){
			if("A".equals(ipMap.get(clientIPAddr))){
				chain.doFilter(request, response); //클라이언트의 요청을 처리하는 jsp로 요청이 전달
			}
			if("Fuck".intern() == ipMap.get(clientIPAddr).intern()){
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.println("거부된 IP주소로 서비스에 접근하셨습니다.<br/>");
				out.println("<font color='red'>관리자에게 문의해주세요</font>");
			}
		}else{
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println("인가되지 않은 IP주소로 서비스에 접근하셨습니다.<br/>");
			out.println("<font color='red'>관리자에게 문의해주세요</font>");
		}
		
		System.out.println("요청 처리 jsp가 출력버퍼에 응답 컨텐츠를 저장 후 응답처리 완료후에 실행될 코드");
	}


}
