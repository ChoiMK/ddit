<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	MemberVO memberInfo = new MemberVO();
	
	BeanUtils.populate(memberInfo, request.getParameterMap());
	
	IMemberService service = IMemberServiceImpl.getInstance();
	service.updateMemberInfo(memberInfo);
	
	response.sendRedirect("/ddit/03/memberList.jsp");
	
%>

