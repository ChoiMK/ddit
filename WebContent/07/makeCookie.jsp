<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키 생성 : 서버에서 자바 기반으로 쿠키를 생성하고 response에 저장 후에 클라이언트에 전송
	//          클라이언트에서 javascript 기반으로 쿠키를 생성.
	//쿠키 저장소 : 클라이언트(메모리 또는 파일 시스템)
	//            저장소 인코딩 타입 - ISO-8859-1
	//쿠키 형식 : 문자열(키=값;유효시간=값;도메인=값;패스=값;)
	//쿠키 사이즈 : default max size 4kb
	//쿠키 특징 : 클라이언트에 저장된 쿠키는 서버 요청시 동반 전송됨.
	//          *쿠키 생성시의 도메인과 패스 설정으로 전송, 미전송 구분
	
	Cookie idCookie = new Cookie("mem_id","a001");
	idCookie.setPath("/");	//default path 설정
	response.addCookie(idCookie);
	
	Cookie pwdCookie = new Cookie("mem_pass", "asdfasdf");
	pwdCookie.setPath("/ddit/07");
	pwdCookie.setMaxAge(60*60); //쿠키 유효시간(초당위 설정)
	response.addCookie(pwdCookie);
	
	Cookie nameCookie = new Cookie("mem_name",URLEncoder.encode("김은대", "UTF-8"));
	nameCookie.setPath("/");
	nameCookie.setMaxAge(-1); // 쿠키 유효시간(음수값 : 브라우저 종료되면 해당 쿠키 삭제)
	nameCookie.setDomain("www.ddit.com");
	response.addCookie(nameCookie);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키가 잘 구어졌습니다.
</body>
</html>