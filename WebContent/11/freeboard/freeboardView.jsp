<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.vo.FreeBoardVO"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardService"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardServiceImpl"%>
<%@page import="java.util.Map"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String bo_no = request.getParameter("bo_no");
	Map<String,String> params = new HashMap<String, String>();
	params.put("bo_no", bo_no);
	
	IBoardService service = IBoardServiceImpl.getInstance();
	FreeBoardVO boardInfo = service.getBoardInfo(params);
%>
<c:set var="boardInfo" value="<%=boardInfo %>" ></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
<script type="text/javascript">
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#bo_content').summernote('code', '${boardInfo.bo_content}');
    
	
    $('form[name=boardForm]').submit(function(){
		var val = $('#bo_content').summernote('code');
		$(this).append('<input type="hidden" name="bo_no" value="${boardInfo.bo_no}"/>');
		$(this).append("<input type='hidden' name='bo_content' value='"+val+"'/>");

		$(this).attr('action','${pageContext.request.contextPath}/11/freeboard/updateBoardInfo.jsp');
	});
	
    $('#list').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/11/main.jsp');		
	});
    
    $('#delete_btn').click(function(){
    	$(location).attr('href','${pageContext.request.contextPath}/11/freeboard/deleteBoardInfo.jsp?bo_no=${boardInfo.bo_no}');
    });
    
   
    

});
</script>
</head>
<body>
<form name="boardForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" value="${boardInfo.bo_title}" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nickname" name="bo_nickname" value="${boardInfo.bo_nickname }" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_pwd" name="bo_pwd" value="${boardInfo.bo_pwd }" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_mail" name="bo_mail" value="${boardInfo.bo_mail }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 200px;">
			<c:forEach items="${boardInfo.attachFileItemList}" var="fileitem" varStatus="stat">
				<c:if test="${stat.first }">
					<div class="item active">
				</c:if>
				<c:if test="${stat.last }">
					<div class="item">
				</c:if>
				<img src="http://localhost/file/${fileitem.file_save_name}" alt="pic${stat.count}"
					onclick="javascript:location.href='${pageContext.request.contextPath}/11/freeboard/fileDownload.jsp?fileSeq=${fileitem.file_seq}'">
				</div>
			</c:forEach>
			</div>
			
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" id="write"class="btn btn-success">글쓰기</button>
			<c:if test="${LOGIN_MEMBERINFO.mem_id.equals(boardInfo.bo_writer)}">
				<button type="button" id="delete_btn" class="btn btn-danger">삭제</button>
				<button type="submit" class="btn btn-default" style="float: right">수정</button>
			</c:if>
			<button type="button" class="btn btn-primary">답글</button>
			<button type="button" id="list" class="btn btn-info">목록</button>
			
		</div>
	</div>
</form>
</body>
</html>