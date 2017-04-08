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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	// 취득시 다운캐스팅 처리
	MemberVO pageMemberInfo =(MemberVO)pageContext.getAttribute("pageMemberInfo");
%>
pageContext : 아이디 - <%=pageMemberInfo.getMem_id() %><br/>
pageContext : 패스워드 - <%=pageMemberInfo.getMem_pass() %><br/>

<%
	MemberVO reqMemberInfo = (MemberVO)request.getAttribute("reqMemberInfo");
%>
request : 아이디 - <%=reqMemberInfo.getMem_id() %><br/>
request : 패스워드 - <%=reqMemberInfo.getMem_pass() %><br/>

<%
	MemberVO sesMemberInfo = (MemberVO) session.getAttribute("sesMemberInfo");
%>
session : 아이디 - <%=sesMemberInfo.getMem_id() %><br/>
session : 패스워드 - <%=sesMemberInfo.getMem_pass() %><br/>

<%
	MemberVO appMemberInfo = (MemberVO)application.getAttribute("appMemberInfo");
%>
application : 아이디 - <%=appMemberInfo.getMem_id() %><br/>
application : 패스워드 - <%=appMemberInfo.getMem_pass() %><br/>
</body>
</html>
<%
	response.sendRedirect("/ddit/04/redirectRequest2.jsp");
%>