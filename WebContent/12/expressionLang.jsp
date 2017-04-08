<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   Map<String, String> params = new HashMap<String, String>();
   params.put("mem_id","a001");
   params.put("mem_pass","asdfasdf");

   IMemberService service = IMemberServiceImpl.getInstance();
   MemberVO memberInfo = service.getMemberInfo(params);
   
   //9개의 기본객체 내에서 저장영역을 포함하는 기본객체 4개 : pageContext, request, session, application
   // Scope(저장영역)를 포함하는 기본객체 4개에 값 저장시 저장값은 Object Type으로 업캐스팅되어 저장 
   //저장영역 접근 : 저장 - setAttribute(키, 저장값);
   //             취득 - getAttribute(키);
   //             삭제 - removeAttribute(키);
   //              갱신 - setAttribute(동일 키, 다른 저장값);
   pageContext.setAttribute("pageMemberInfo", memberInfo);
   request.setAttribute("reqMemberInfo", memberInfo);
   session.setAttribute("sesMemberInfo", memberInfo);
   application.setAttribute("appMemberInfo", memberInfo);
%>
<c:set var="sesMemberInf" value="${sesMemberInfo.mem_id}" scope="session" ></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>EL 연산</h3>

<table border="1px" width="600px">
   <tr><td>표현연어</td><td>결과값</td></tr>
   <tr><td>\${3+1}</td><td>${3+1}</td></tr>
   <tr><td>\${3-1}</td><td>${3-1}</td></tr>
   <tr><td>\${3*1}</td><td>${3*1}</td></tr>
   <tr><td>\${3/1}</td><td>${3/1}</td></tr>
<%--    <tr><td>\${3 div 1}</td><td>${3 div 1}</td></tr> --%>
   <tr><td>\${3 % 1}</td><td>${3 % 1}</td></tr>
   <tr><td>\${3 mod 1}</td><td>${3 mod 1}</td></tr>
   <tr><td>\${3 > 1}</td><td>${3 > 1}</td></tr>
   <tr><td>\${3 gt 1}</td><td>${3 gt 1}</td></tr>
   <tr><td>\${3 ge 1}</td><td>${3 ge 1}</td></tr>
   <tr><td>\${3 < 1}</td><td>${3 < 1}</td></tr>
   <tr><td>\${3 lt 1}</td><td>${3 lt 1}</td></tr>
   <tr><td>\${3 le 1}</td><td>${3 le 1}</td></tr>
</table>

<h3>요청헤더</h3>
<table border="1px" width="600px">
   <tr><td>표현연어</td><td>결과값</td></tr>
   <tr><td><%=request.getHeader("user-agent") %></td><td>${header["user-agent"]}</td></tr>
   <tr><td><%=request.getHeader("host") %></td><td>${header["host"]}</td></tr>
   <tr><td>request.getCookies()[0].getValue()</td><td>${cookie.mem_id.value}</td></tr>
</table>

<h3>web.xml 선언된 글로벌 상수</h3>
<table border="1px" width="600px">
   <tr><td>표현연어</td><td>결과값</td></tr>
         <tr><td><%=application.getInitParameter("oracleDriver") %></td>
      <td>${initParam.oracleDriver}</td>
   </tr>
   <tr>
      <td><%=application.getInitParameter("oracleURL") %></td>
      <td>${initParam.oracleURL }</td>
   </tr>
</table>


   <h3>요청시 파라메터 취득</h3>
   mem_id 파라메터 : <%=request.getParameter("mem_id") %><br/>
   mem_id 파라메터 : ${param.mem_id }<br/>
   mem_pass 파라메터 : ${param.mem_pass }<br/>

<h3>scope 내 저장된 값 취득,활용</h3>
pageContext(scope) : <%=((MemberVO)pageContext.getAttribute("pageMemberInfo")).getMem_id() %><br/>
pageContext(scope) : ${pageScope.pageMemberInfo.mem_id }<br/>
pageContext(scope) : ${pageMemberInfo.mem_id }<br/>

request(scope) : <%=((MemberVO)request.getAttribute("reqMemberInfo")).getMem_id() %><br/>
request(scope) : ${requestScope.reqMemberInfo.mem_id }<br/>
request(scope) : ${reqMemberInfo.mem_id }<br/>

session(scope) :<%=((MemberVO)session.getAttribute("sesMemberInfo")).getMem_id() %><br/> 
session(scope) :${sessionScope.sesMemberInfo.mem_id }<br/>
session(scope) :${sesMemberInfo.mem_id }<br/>
session(scope)asddsa :${sesMemberInf}<br/>

application(scope) : <%=((MemberVO)application.getAttribute("appMemberInfo")).getMem_id() %><br/>
application(scope) : ${applicationScope.appMemberInfo.mem_id }<br/>
application(scope) : ${appMemberInfo.mem_id }<br/>

<h3>기본객체(9개)에 getter접근. pageContext로 선두어</h3>
ip : <%=request.getRemoteAddr() %><br/>
ip : ${pageContext.request.remoteAddr }<br/>
contextPath : <%=request.getContextPath() %><br/>
contextPath : ${pageContext.request.contextPath }<br/>
real path : <%=application.getRealPath("")%><br/>
<%-- real path : ${pageContext.servletContext.getRealPath('') }<br/> --%>

<h3>값 비교와 널 처리</h3>
<%
   // 스크립트릿, 디클러레이션 내에서는 EL을 활용 못함.
   // EL 표기법은 값을 취득 전용.(값 설정할때는 활용 못함.)
   // javascript에서 EL 활용시에는 '', ""으로 랩핑.
   // html에서 EL 활용시에는 '', "" 랩핑 설정 또는 미설정 모두 유효
   String test1 = "test1";
   pageContext.setAttribute("test1", test1);
%>
<table border="1px" width="600px">
   <tr><td>표현연어</td><td>결과값</td></tr>
   <tr><td>\${test1 == 'test1' }</td><td>${test1 == 'test1' }</td></tr>
   <tr><td>\${test1 != 'test1' }</td><td>${test1 != 'test1' }</td></tr>
   <tr>
         <td>\${test1 == 'test1' && test1 != 'test2'}</td>
         <td>${test1 == 'test1' && test1 != 'test2'}</td>
   </tr>
      <tr>
         <td>\${test1 == 'test1' and test1 != 'test2'}</td>
         <td>${test1 == 'test1' and test1 != 'test2'}</td>
   </tr>
      <tr>
         <td>\${test1 == 'test1' || test1 != 'test2'}</td>
         <td>${test1 == 'test1' || test1 != 'test2'}</td>
   </tr>
      <tr>
         <td>\${test1 == 'test1' or test1 != 'test2'}</td>
         <td>${test1 == 'test1' or test1 != 'test2'}</td>
   </tr>
   <tr>
         <td>\${test1 == 'test1' ? '같음' : '틀림' }</td>
         <td>${test1 == 'test1' ? '같음' : '틀림' }</td>
   </tr>
   <tr>
         <td>\${test1 == null}</td>
         <td>${test1 == null}</td>
   </tr>
   <tr>
         <td>\${test1 != null}</td>
         <td>${test1 != null}</td>
   </tr>
   <tr>
         <td>\${empty test1}</td>
         <td>${empty test1}</td>
   </tr>
   <tr>
         <td>\${not empty test1}</td>
         <td>${not empty test1}</td>
   </tr>
   <tr>
         <td>\${!empty test1}</td>
         <td>${!empty test1}</td>
   </tr>
 	<tr>
         <td>\${empty test2}</td>
         <td>${empty test2}</td>
   </tr>
 
   
 </table>







</body>
</html>
