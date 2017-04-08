<%@page import="kr.or.ddit.utils.FileUploadRequestWrapper"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardService"%>
<%@page import="kr.or.ddit.freeboard.service.IBoardServiceImpl"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper)request;
	
	FreeBoardVO boardInfo = new FreeBoardVO();
	
	BeanUtils.populate(boardInfo, wrapper.getParameterMap());
	
	IBoardService service = IBoardServiceImpl.getInstance();
	service.insertBoardInfo(boardInfo, wrapper.getFileitemValues("files"));
	
	response.sendRedirect(request.getContextPath()+"/11/main.jsp");

	
%>