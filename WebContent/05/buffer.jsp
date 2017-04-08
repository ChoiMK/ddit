<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
	JSP 출력버퍼 : 서버로부터 클라이언트에 전송될 컨텐츠(html, javascript 등)이 저장되는 영역
  	 default : 8kb
  	 flush : 출력버퍼에 저장된 컨텐츠를 클라이언트에 전송 후 해당 출력버퍼를 clear함
  	 clear : 출력버퍼에 저장된 컨텐츠를 삭제
  -->
<%
	for(int i=0; i<50; i++){
		out.println("버퍼 사이즈" + out.getBufferSize() + "<br/>");
		
		out.println("비음주 상태에서 건배사 : 나가자~~<br/>");
		out.println("나도.....잘되고<br/>");
		out.println("가도.....잘되고<br/>");
		out.println("자도.....잘되고<br/>");
		out.println("나가자");
		
		if(i%5 == 0){
			//out.flush();
			out.clearBuffer();
		}
		out.println("저장 가능 사이즈" + out.getRemaining());
	}
  
%>
</body>
</html>