<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	if(pageMemberInfo != null){
%>
pageContext : 아이디 - <%=pageMemberInfo.getMem_id() %><br/>
pageContext : 패스워드 - <%=pageMemberInfo.getMem_pass() %><br/>

<%  
	}
	
	MemberVO reqMemberInfo = (MemberVO)request.getAttribute("reqMemberInfo");
	if(reqMemberInfo != null){
%>
request : 아이디 - <%=reqMemberInfo.getMem_id() %><br/>
request : 패스워드 - <%=reqMemberInfo.getMem_pass() %><br/>

<%	
	}
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
