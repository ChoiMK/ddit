<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%-- <%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ page language="java" contentType="application/vnd.word; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%>     --%>
<%@ page language="java" contentType="application/hwp; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 브라우저에게 전송되는 컨텐츠가 excel 파일인것을 통지
	// Content-Disposition : 브라우저의 다운로드 창 활성화 헤더 설정
	// attachment : 다운로드창에 출력될 파일의 정보 
	// 	response.setHeader("Content-Disposition", "attachment;filename=member.xls");
	// 	response.setHeader("Content-Description", "JSP generate excel file");
	// 	response.setContentType("application/vnd.ms-excel");
	
// 	response.setHeader("Content-Disposition", "attachment;filename=member.doc");
// 	response.setHeader("Content-Description", "JSP generate msword file");
// 	response.setContentType("application/vnd.ms-word");
	
	response.setHeader("Content-Disposition", "attachment;filename=member.hwp");
	response.setHeader("Content-Description", "JSP generate hwp file");
	response.setContentType("application/hwp");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.getMemberList(new HashMap());
	
%>

<c:set var="memberList" value="<%=memberList %>"></c:set>
	<table>
		<thead>
			<tr>
				<td>아이디</td>
				<td>패스워드</td>
				<td>이름</td>
				<td>직업</td>
				<td>취미</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${memberList}" var="memberInfo">
			<tr>
				<td>${memberInfo.mem_id }</td>
				<td>${memberInfo.mem_pass }</td>
				<td>${memberInfo.mem_name }</td>
				<td>${memberInfo.mem_job }</td>
				<td>${memberInfo.mem_like }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
