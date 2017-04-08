<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 삭제
	session.invalidate();

   // session.setAttribute(키, 값);
   // session.getAttribute(키);
   // session.removeAttribute(키);  세션 저장영역 내에 값을 삭제.
   
   HttpSession ses1 =  request.getSession(); //현재 생성되어 있는 세션을 반환
   
   
   	//true : default. 세션을 새로 생성하거나, 생성되어 있는 세션 존재시 해당 세션을 반환.
    //false : 생성되어 있는 세션을 반환하거나, 세션이 없으면 익셉션 발생.
   
   //request.getSession(true or false);
	
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