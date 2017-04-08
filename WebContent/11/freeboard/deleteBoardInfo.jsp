<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardService"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bo_no = request.getParameter("bo_no");
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("bo_no",bo_no);
	
	IBoardService service  = IBoardServiceImpl.getInstance();
	service.deleteBoardInfo(params);
	
	response.sendRedirect(request.getContextPath()+"/11/main.jsp");

	
%>