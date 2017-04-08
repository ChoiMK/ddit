<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String buyer_id = request.getParameter("buyer_id");

	Map<String,String> params = new HashMap<String,String>();
	params.put("buyer_id",buyer_id);
	
	IBuyerService service =  IBuyerServiceImpl.getInstance();
	service.deleteBuyerInfo(params);
	
	response.sendRedirect(request.getContextPath()+"/10/main.jsp?contentPage=buyerList.jsp");

%>