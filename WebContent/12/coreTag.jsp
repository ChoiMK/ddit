<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Core Tag의 속성 중 var 또는 var로 시작하는 속성의 값은 EL로 표현 활용 가능. -->
<c:forEach begin="1" end="10" var="i">
   ${i }<br/>
</c:forEach>

<c:forEach begin="1" end="10" var="i" step="3">
   ${i }<br/>
</c:forEach>
<hr>
<c:forEach begin="2" end="10" var="i" varStatus="stat">
   <c:if test="${stat.first }">
      stat.first : 해당 반복문의 첫번째 반복시 true.<br/>
   </c:if>
   ${stat.index} , ${stat.count} : ${i }<br/>
   <c:if test="${stat.last }">
      stat.last : 해당 반복문의 마지막 반복시 true<br/>
   </c:if>
</c:forEach>

<hr>


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
//    pageContext.setAttribute("pageMemberInfo", memberInfo);
//    request.setAttribute("reqMemberInfo", memberInfo);
//    session.setAttribute("sesMemberInfo", memberInfo);
//    application.setAttribute("appMemberInfo", memberInfo);
%>
<!-- pageContext.setAttribute("pageMemberInfo", memberInfo); -->
<c:set var="pageMemberInfo" value="<%=memberInfo %>" scope="page"></c:set>
<!-- request.setAttribute("reqMemberInfo", memberInfo); -->
<c:set var="reqMemberInfo" value="<%=memberInfo %>" scope="request"></c:set>
<!-- session.setAttribute("sesMemberInfo", memberInfo); -->
<c:set var="sesMemberInfo" value="<%=memberInfo %>" scope="session"></c:set>
<!-- application.setAttribute("appMemberInfo", memberInfo); -->
<c:set var="appMemberInfo" value="<%=memberInfo %>" scope="application"></c:set>

${pageScope.pageMemberInfo.mem_id }<br/>
<c:out value="${pageMemberInfo.mem_id }"></c:out><br/><br/>

request mem_id : <c:out value="${requestScope.reqMemberInfo.mem_id }"></c:out>
session mem_id : <c:out value="${sesMemberInfo.mem_id }"></c:out>
<br/><br/>
<!-- pageContext.setAttribute("jumsu", "82"); -->
<c:set var="jumsu" value="82"></c:set>
<c:if test="${jumsu > 90 }">수</c:if>
<c:if test="${jumsu le 90 and jumsu > 80}">우</c:if>
<c:if test="${jumsu le 80 and jumsu > 70}">미</c:if>
<c:if test="${jumsu le 70 }">분발합시다.</c:if>


<!-- switch문 -->
<c:choose>
   <c:when test="${jumsu > 90 }">수</c:when>
   <c:when test="${jumsu le 90 && jumsu > 80 }">우</c:when>
   <c:when test="${jumsu le 80 && jumsu > 70 }">미</c:when>
   <c:otherwise>
      분발합시다.
   </c:otherwise>
</c:choose>


<!-- pageContext.removeAttribute("pageMemberInfo"); -->
<c:remove var="pageMemberInfo" scope="page"/>
<!-- request.removeAttribute("reqMemberInfo") -->
<c:remove var="reqMemberInfo" scope="request"/>
<br/>
pageContext mem_id : ${pageMemberInfo.mem_id }<br/>
request mem_id : ${reqMemberInfo.mem_id }<br/>
<%
   List<MemberVO> memberList = service.getMemberList();
%>
<c:set var="memberList" value="<%=memberList %>"></c:set>
<table>
   <thead>
      <tr>
         <th>아이디</th>
         <th>이름</th>
         <th>생일</th>
         <th>직업</th>
         <th>취미</th>
      </tr>
   </thead>
   <tbody>
   <c:forEach items="${pageScope.memberList }" var="memberVO" >
      <tr>
         <td>${memberVO.mem_id }</td>
         <td>${memberVO.mem_name }</td>
         <td>${memberVO.mem_bir }</td>
         <td>${memberVO.mem_job }</td>
         <td>${memberVO.mem_like }</td>
      </tr>
   </c:forEach>
   </tbody>
</table>
<%-- 쿠키생성(mem_id=a001;path=/;) : ${cookie.mem_id.value }<br/> --%>
<%-- 쿠키생성(mem_pass=0000;path=/ddit/12/;) : ${cookie.mem_pass.value }<br/> --%>
<!-- Cookie[] cookies = request.getCookies(); -->
<c:forEach items="${cookie }" var="currentCookie">
${currentCookie.key } : ${currentCookie.value.value }<br/>
</c:forEach>

<%-- <jsp:include page="/02/resultGugudan.jsp?dan=5"/> --%>
<!-- request.setAttribute("gugudan", "02/resultGugudan.jsp 포워딩 후 취득한 html 코드"); -->
<c:import url="/02/resultGugudan.jsp" var="gugudan" scope="request">
   <c:param name="dan" value="5"></c:param>
</c:import>
${gugudan }<br/>

<c:url value="/02/resultGugudan.jsp" var="resultGugudan">
	<c:param name="dan" value="2"></c:param>
</c:url>
<a href="${resultGugudan }">2단</a>

<c:catch var="errorMsg">
<%
	int i = 1/0;	
%>
</c:catch>
${errorMsg}<br/>
</body>
</html>