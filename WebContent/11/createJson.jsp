<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   IMemberService service = IMemberServiceImpl.getInstance();
   List<MemberVO> memberList = service.getMemberList();
   
   Map<String, String> params = new HashMap<String, String>();
   params.put("mem_id", "a001");
   MemberVO memberInfo = service.getMemberInfo(params);
   
   Map<String, String> jsonMap = new HashMap<String, String>();
   jsonMap.put("flag", "yes");
   
   ObjectMapper mapper = new ObjectMapper();
   String jsonList = mapper.writeValueAsString(memberList);
   
   String jsonVO = mapper.writeValueAsString(memberInfo);
   
   String jsonData = mapper.writeValueAsString(jsonMap);
   
   out.println(jsonList + "<br/>");
   out.println(jsonVO + "<br/>");
   out.println(jsonData + "<br/>");
%>