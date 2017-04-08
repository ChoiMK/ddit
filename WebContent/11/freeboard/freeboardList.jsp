<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.FreeBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardService"%>
<%@page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String search_keycode = request.getParameter("search_keycode");
	String search_keyword = request.getParameter("search_keyword");
	Map<String, String> params = new HashMap<String, String>();
	
	params.put("search_keycode",search_keycode);
	params.put("search_keyword",search_keyword);
	
	IBoardService service = IBoardServiceImpl.getInstance();
	List<FreeBoardVO> boardList = service.getBoardList(params);
%>
<c:set var="boardList" value="<%=boardList%>" ></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<script>
	$(function(){
		$('#tbody').on("click","#title",function(){
			if(eval('${empty LOGIN_MEMBERINFO}')){
				alert("로그인후 이용해주세용");
			 return false;
			}
		});
		
		$('#write').click(function(){
			$(location).attr('href','${pageContext.request.contextPath}/11/main.jsp?contentPage=/11/freeboard/freeboardForm.jsp');
		});
		
		
	});
</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">게시판 목록</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id = "tbody">
				<c:forEach items="${boardList}" var="boardInfo">
				<tr>
					<td>${boardInfo.bo_no}</td>
					<td>
						<a id="title" href="${pageContext.request.contextPath}/11/main.jsp?contentPage=/11/freeboard/freeboardView.jsp&bo_no=${boardInfo.bo_no}">
							${boardInfo.bo_title}
						</a>
					</td>
					<td>${boardInfo.bo_writer }</td>
					<td>${boardInfo.bo_reg_date }</td>
					<td>${boardInfo.bo_hit}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div >
<form action="${pageContext.request.contextPath}/11/main.jsp" method="post" class="form-inline pull-right">
      <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
      <select class="form-control" name="search_keycode" >
         <option>검색조건</option>
         <option value="TOTAL">전체</option>
         <option value="TITLE">제목</option>
         <option value="CONTENT">내용</option>
         <option value="WRITER">작성자</option>
      </select>
       <button type="submit" class="btn btn-primary form-control">검색</button>
       
       <c:if test="${!empty LOGIN_MEMBERINFO}">
       	 <button type="button" id="write" class="btn btn-info form-control">게시글 등록</button>
       </c:if>
       
</form>
</div>	
</body>
</html>