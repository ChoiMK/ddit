<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
		절대경로 : 컨텍스트 루트|패스를 시작으로한 자원 접근 경로
		상대경로 : 현재 해당 요청을 처리하는 자원의 위치가 기준
  -->
컨텍스트 루트 : <%=request.getContextPath() %><br/>
<img src="<%=request.getContextPath() %>/image/index.jpg" alt="이미지" style="width:200px; height:150px;" />
<img src="../image/index.jpg" alt="이미지" style="width:200px; height:150px;" />
<img src="./img/index.jpg" alt="이미지" style="width:200px; height:150px;" />
<%
	int i = 1/0;
%>
</body>
</html>