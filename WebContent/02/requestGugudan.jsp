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
	전송방식 GET 사이즈 제한 : IE - 2048kbyte
						   Firefox - 100kb
						   Opera   - 200kb
						   Chrome, Safari - 200kb
	전송방식 POST 사이즈 제한 : 무제한
							파일 업로드					   
 -->


<form action="/ddit/02/resultGugudan.jsp" method="post">
	<select name="dan" id="">
		<option value="2">2단</option>
		<option value="3">3단</option>
		<option value="4">4단</option>
		<option value="5">5단</option>
		<option value="6">6단</option>
		<option value="7">7단</option>
		<option value="8">8단</option>
		<option value="9">9단</option>
	</select>
		<input type="submit" value="전송" />
	</form>
</body>
</html>