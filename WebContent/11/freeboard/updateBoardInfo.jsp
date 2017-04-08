<%@page import="kr.or.ddit.freeboard.service.IBoardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="com.sun.xml.internal.messaging.saaj.packaging.mime.util.BEncoderStream"%>
<%@page import="kr.or.ddit.vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	FreeBoardVO boardInfo = new FreeBoardVO();
	
	BeanUtils.populate(boardInfo, request.getParameterMap());
	
	IBoardService service = IBoardServiceImpl.getInstance();
	service.updateBoardInfo(boardInfo);
	
	response.sendRedirect(request.getContextPath()+"/11/main.jsp");

%>