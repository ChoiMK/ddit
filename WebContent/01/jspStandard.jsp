<!-- 디렉티브  -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	//디클러레이션 영역
	private int prtMethod(){
	System.out.println("디클러레이션");
	return 1;
}
%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
	//스크립트릿
	Date date = new Date();
%>
<!-- 익스프레션  -->
오늘 날짜 : <%= dateFormat.format(date) %><br/>
메서드 콜 : <%= prtMethod() %> <br/>
<pre>
디렉티브 : jsp 파일 내 설정.
		 해당 jsp 파일에서 동적으로 작성된 html, javascript 코드를 브라우저에 전송하기 위한 컨텐츠 타입 결정.
		 ex)	contentType="text/html; charset=UTF-8"
		 스크립트릿 내에 선언된 자원의 import 선언.
		 태그 선언.
스크립트릿 : 자바 코드 베이스의 비지니스 로직 작성.
익스프레션 : 스크립트릿 내에서 선어된 변수의 값을 취득해서 html, javascript 컨텐츠 작성시 활용
디클러레이션 : 자바 메서드 선언.		 
</pre>
</body>
</html>