<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //http://localhost/ddit/03/loginCheck.jsp
   //        mem_id=값&mem_pass=값
   String mem_id = request.getParameter("mem_id");
   String mem_pass = request.getParameter("mem_pass");
   
   Map<String, String> params = new HashMap<String, String>();
   params.put("mem_id", mem_id);
   params.put("mem_pass", mem_pass);
   
   IMemberService service = IMemberServiceImpl.getInstance();
   MemberVO memberInfo = service.getMemberInfo(params);
   
   if(memberInfo == null){
	   String message = URLEncoder.encode("회원이아닙니다", "UTF-8");
	   response.sendRedirect(request.getContextPath()+"/03/loginForm.jsp?message="+message);
   }else{
	   // loginCheck.jsp => 포워드 => memberList.jsp
	   // 포워드 시 uri : 컨텍스트 루트 | 패스가 배제.
	   RequestDispatcher dispatcher = request.getRequestDispatcher("/03/memberList.jsp");
	   // request : 브라우저가 loginCheck.jsp 요청시에 서버에 신규 생성
	   // response : 브라우저가 loginCheck.jsp 요청시에 서버에 신규 생성
	   // memberList.jsp 에 request, response가 그대로 활용되면서 요청.
	   
	   dispatcher.forward(request, response);
//	   response.sendRedirect("/ddit/03/memberList.jsp");	   
   }
   
%>

