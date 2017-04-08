<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");

	Map<String,String> params = new HashMap<String,String>();
	params.put("mem_id",mem_id);
	
	IMemberService service =  IMemberServiceImpl.getInstance();
	service.deleteMemberInfo(params);
	
	response.sendRedirect(request.getContextPath()+"/09/main.jsp?contentPage=memberList.jsp");

%>