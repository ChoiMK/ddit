<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<BuyerVO> buyerList = service.getBuyerList();
%>
<c:set var="buyerList" value="<%=buyerList%>"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$('table tr').click(function(){
			var index = $(this).index()+1;
			var buyer_id = $('table tr:eq('+ index +') td:eq(0)').text();
			
			$(location).attr('href','${pageContext.request.contextPath}/10/main.jsp?contentPage=buyerView.jsp&buyer_id='+buyer_id);
		 });
		
		$('#buyerBtn').click(function(){
			$(location).attr('href','${pageContext.request.contextPath}/10/main.jsp?contentPage=buyerForm.jsp');
		});
	})
</script>
</head>
<style>
#list{margin-left: 140px;}
</style>
<body>
<div id="list">
	<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 80%;">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">거래처코드</th>
				<th class="mdl-data-table__cell--non-numeric">거래처명</th>
				<th class="mdl-data-table__cell--non-numeric">상품분류명</th>
				<th class="mdl-data-table__cell--non-numeric">담당자명</th>
				<th class="mdl-data-table__cell--non-numeric">전화번호</th>
				<th class="mdl-data-table__cell--non-numeric">메일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${buyerList}" var="buyerInfo"> 
			<tr>
				<td class="mdl-data-table__cell--non-numeric">${buyerInfo.buyer_id}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyerInfo.buyer_name}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyerInfo.lprod_nm}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyerInfo.buyer_charger}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyerInfo.buyer_comtel}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyerInfo.buyer_mail}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="searchForm" align="right" style="margin-top: 10px;">
	<form method="post" action="">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="BUYERID">거래처코드</option>
			<option value="BUYERNAME">거래처명</option>
			<option value="BUYERCHARGER">담당자명</option>
		</select>
		<input type="text" id="search_keyword" name="search_keyword">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button" id="buyerBtn">거래처등록</button>
	</form>
</div>
</body>
</html>








