<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엄마!!미안해!!</title>
</head>
<body>
<jsp:include page="/11/layout/header.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="/11/layout/left.jsp"></jsp:include>
	<div id="page-wrapper">
		<jsp:include page="content_header.jsp"></jsp:include>
		<div class="page-content">
			<jsp:include page="${not empty param.contentPage ? param.contentPage : '/11/freeboard/freeboardList.jsp'}"></jsp:include>
		</div>
		<jsp:include page="/11/layout/footer.jsp"></jsp:include>
		
	</div>
</div>
</body>
</html>