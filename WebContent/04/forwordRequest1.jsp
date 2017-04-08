<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id","a001");
	params.put("mem_pass","asdfasdf");

	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	//9개의 기본객체 내에서 저장영역을 포함하는 기본객체 4개 : pageContext, request, session, application
	// Scope(저장영역)를 포함하는 기본객체 4개에 값 저장시 저장값은 Object Type으로 업캐스팅되어 저장 
	//저장영역 접근 : 저장 - setAttribute(키, 저장값);
	//			    취득 - getAttribute(키);
	//             삭제 - removeAttribute(키);
	// 			    갱신 - setAttribute(동일 키, 다른 저장값);
	pageContext.setAttribute("pageMemberInfo", memberInfo);
	request.setAttribute("reqMemberInfo", memberInfo);
	session.setAttribute("sesMemberInfo", memberInfo);
	application.setAttribute("appMemberInfo", memberInfo);


	//컨텍스트 루트|패스는 배제
	RequestDispatcher dispatcher = request.getRequestDispatcher("/04/forwordRequest2.jsp");
	dispatcher.forward(request, response);
%>