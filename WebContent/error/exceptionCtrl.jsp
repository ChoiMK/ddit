<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	jsp 기본객체 exception를 활용 : isErrorPage = "true" 설정시 활용.
	
	jsp 기본객체 exception : jsp내에서 발생된 익셉션을 별도로 처리하는 jsp내에서 활용.
	 *익셉션 발생 여지가 있는 jsp내에서 page 디렉티브의 errorPage 속성에 익셉션 발생시
	 *errorPage = "익셉션 처리 자원" 포워드 처리.
 	
 	 *브라우저별로 사이즈가 상이하지만 IE의 경우 익셉션 발생시 클라이언트로 전송되는
 	 컨텐츠는 513Byte 이상이어야함
 -->
 에러메세지 : <%=exception.getMessage() %><br/>
 에러클래스 : <%=exception.getClass().getName()%><br/>
</body>
</html>