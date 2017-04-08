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
	jsp 액션 태크 include : 속성 page 선언된 jsp 파일을 대상으로 포워딩 처리
 -->
<table style="boder:1px solid blue; width:800px;">
	<tr>
		<td colspan="2">
			<jsp:include page="/06/layout/header.jsp"></jsp:include>
		</td>
	</tr>
	<tr height="500px">
		<td width="80px">
			<jsp:include page="/06/layout/left.jsp"></jsp:include>
		</td>
		<td>
			<jsp:include page="/06/news.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="/06/layout/footer.jsp"></jsp:include>
		</td>
	</tr>
</table>
</body>
</html>