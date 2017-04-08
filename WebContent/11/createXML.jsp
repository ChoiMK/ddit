<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.getMemberList();
	
	out.println("<members>");
	for(MemberVO memberInfo : memberList){
		out.println("<member id='" + memberInfo.getMem_id() + "'>");
			out.println("<mem_pass>" + memberInfo.getMem_pass() + "</mem_pass>");
			out.println("<mem_regno1>" + memberInfo.getMem_regno1() + "</mem_regno1>");
			out.println("<mem_regno2>" + memberInfo.getMem_regno2() + "</mem_regno2>");
		out.println("</member>");
	}
	
	out.println("</members>");

%>
