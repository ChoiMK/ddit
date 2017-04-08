<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	BuyerVO buyerInfo = new BuyerVO();
	
	BeanUtils.populate(buyerInfo, request.getParameterMap());
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	service.insertBuyerInfo(buyerInfo);
	
	response.sendRedirect(request.getContextPath()+"/10/main.jsp?contentPage=buyerList.jsp");
	

%>