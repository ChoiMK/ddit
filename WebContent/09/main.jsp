<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("UTF-8");
	
// /ddit/09/main.jsp 요때 요청시에는 contentPage가 null값
	// /ddit/09/main.jsp?contentPage=/09/memberForm.jsp contentPage가 null이 아님  
	// /ddit/09/main.jsp?contentPage=/09/memberList.jsp
	// /ddit/09/main.jsp?contentPage=/09/memberView.jsp
	String contentPage = request.getParameter("contentPage");
	if(contentPage == null){
		// contentPage가 null일때는 default로 memberList.jsp가 출력되도록 하기위해서
		contentPage = "/09/memberList.jsp";
	}
	// contentPage가 null이든 아니든 contentPage라는 변수는 값을 가짐
	// 그래서 이 contentPage를 jsp:include 액션태그에서 익스프레션을 가지고 사용해서 화면 전환

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
<script
	src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
.mdl-layout__container {
	width: 240px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<center>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/09/layout/header.jsp" />
		</div>
		<p style="clear: both;"></p>
		<div>
			<div class="left">
				<jsp:include page="/09/layout/left.jsp" />
			</div>
			<div id="content" style="height: 600px; margin-left: 250px; overflow: scroll;">
				<jsp:include page="<%=contentPage%>" />
			</div>
		</div>
		<div>
			<jsp:include page="/09/layout/footer.jsp" />
		</div>
	</div>
</center>
</body>
</html>









