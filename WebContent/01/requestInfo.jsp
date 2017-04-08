<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
	요청 : 요청라인 - 요청시 전송방식,프로토콜,주소
		  요청헤더 - 웹브라우저로부터 전송되는 클라이언트 정보(브라우저,요청지역과 언어 등) 
 		  요청본문 - POST 전송시 서버로 전송되는 파라미터
     응답 : 응답라인 - 응답 전송시 프로토콜, 상태코드, 상태값
            응답헤더 - 서버의 종류, 전송컨텐츠타입,전송 컨텐츠 사이즈
            응답본문 - 클라이언트로부터 전송되는 html,javascript    		  

							요청(request)
				------------------URL-------------------			
				http://localhost/ddit/01/requestInfo.jsp
				                ---------URI------------
				http : 프로토콜
				localhost : 도메인
				:80 :포트
				/ddit : 컨텍스트 루트 또는 컨텍스트 패스
클라이언트																		Server
		=====================================================================>  jasper 엔진 : requestInfo.jsp
																					서블릿 전환 : requestInfo_jsp.java
																					서블릿 컴파일 : requestInfo_jsp.class
																				catalina 엔진 : new requestInfo_jsp();
																									_jspServie(request,response){
																								html,javascript
																							 } 호출
							응답(response)
	    <====================================================================
	
	
</pre>
클라이언트의 ip 주소 : <%=request.getRemoteAddr() %><br />
요청시 인코딩 : <%= request.getCharacterEncoding() %><br />
프로토콜 : <%= request.getProtocol() %> <br />
URL : <%= request.getRequestURL() %><br />
URI : <%= request.getRequestURI() %><br />
컨텍스트 패스|루트 : <%= request.getContextPath() %><br />
전송방식 : <%= request.getMethod() %>
</body>		
</html>