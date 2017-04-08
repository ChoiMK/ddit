<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<LprodVO> lprodList = service.getLprodList();

	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(lprodList);
	
	//System.out.println(jsonData);
	//out.println(jsonData);
%>
