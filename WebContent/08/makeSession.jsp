<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	// 세션 생성 : 클라이언트가 서버로 최초 요청시 서버단에 생성
	// 세산 아이디 : 클라이언트가 서버로 최초 요청시 전송되는 쿠키 베이스 값을 서버가 취득 후
	//             유니크한 아이디를 생성하고, 해당 아이디를 세션에 할당.
	// 브라우저  할당된 세션을 구분 : 최초 세션 아이디가 생성 후 세션에 할당 되고, 할당된 세션 아이디는
	//                          최초 응답에 저장되어 클라이언트로 응답 전송.
	//                          이후 브라우저의 서버 요청시마다 JESSIONID라는 키로 쿠키처럼 전송.
	// 							서버로 전송된 브라우저별로 상이한 JESSIONID를 기준으로 해당 브라우저에
	//						     할당된 세션이 선택되고 활용됨.
	// 세션 만료시간 : Apache 웹서버 - default 30분
	//				만료시간 설정 - 자바 코드로 setMaxInActiveInterval() 초단위 설정
	//							  0또는 -1 할당 default 만료시간을 준수
	//							  web.xml에서 session-timeout 분단위 설정
	
	session.setMaxInactiveInterval(60*60); // 세션 만료시간 초단위 설정

%> 	

세션 생성 완료



</body>
</html>