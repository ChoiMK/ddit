<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// http://localhost/ddit/03/memberView.jsp?mem_id=a00l
	String mem_id = request.getParameter("mem_id");
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id",mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
%>
<c:set var="memberInfo" value="<%=memberInfo%>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/ddit/js/validation.js"></script>
<script type="text/javascript">
$(function(){
	$('form[name=memberViewForm]').submit(function(){
		if(!$('input[name=mem_hometel]').val().validationHOMETEL()){
			alert('집 전화번호를 바르게 입력해주세요');
			return false;
		}
		if(!$('input[name=mem_comtel]').val().validationCOMTEL()){
			alert('회사 전화번호를 바르게 입력해주세요');
			return false;
		}
		if(!$('input[name=mem_hp').val().validationHP()){
			alert('휴대폰번호를 바르게 입력해주세요');
			return false;
		}
		if(!$('input[name=mem_mail]').val().validationMAIL()){
			alert('메일을 바르게 입력해주세요');
			return false;
		}
		
		$(this).append('<input type="hidden" name="mem_id" value="${memberInfo.mem_id}"/>');
		$(this).attr('action','${pageContext.request.contextPath}/03/updateMemberInfo.jsp');
		return;
	});
	
	$('input[type=button]').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/03/deleteMemberInfo.jsp?mem_id=${memberInfo.mem_id}')
	});
});
</script>
</head>
<body>
<form action='' name='memberViewForm' method='POST'>
   <table>
      <tr>
         <td>아이디</td>
         <td><input type='text' name='mem_id' value='${memberInfo.mem_id}' disabled="disabled"/></td>
      </tr>
      <tr>
         <td>패스워드</td>
         <td><input type='text' name='mem_pass' value='${memberInfo.mem_pass}'/></td>
      </tr>
      <tr>
         <td>이름</td>
         <td><input type='text' name='mem_name' value='${memberInfo.mem_name}'disabled="disabled"/></td>
      </tr>
      <tr>
         <td>생일</td>
         <td><input type='text' name='mem_bir' value='${memberInfo.mem_bir}'disabled="disabled"/></td>
      </tr>
      <tr>
         <td>주민번호1</td>
         <td><input type='text' name='mem_regno1' value='${memberInfo.mem_regno1}'disabled="disabled"/></td>
      </tr>
      <tr>
         <td>주민번호2</td>
         <td><input type='text' name='mem_regno2' value='${memberInfo.mem_regno2}'disabled="disabled"/></td>
      </tr>
      <tr>
         <td>우편번호</td>
         <td><input type='text' name='mem_zip' value='${memberInfo.mem_zip}'/></td>
      </tr>
      <tr>
         <td>주소1</td>
         <td><input type='text' name='mem_add1' value='${memberInfo.mem_add1}'/></td>
      </tr>
      <tr>
         <td>주소2</td>
         <td><input type='text' name='mem_add2' value='${memberInfo.mem_add2}'/></td>
      </tr>
      <tr>
         <td>집 전화번호</td>
         <td><input type='text' name='mem_hometel' value='${memberInfo.mem_hometel}'/></td>
      </tr>
      <tr>
         <td>회사 전화번호</td>
         <td><input type='text' name='mem_comtel' value='${memberInfo.mem_comtel}'/></td>
      </tr>
      <tr>
         <td>휴대폰</td>
         <td><input type='text' name='mem_hp' value='${memberInfo.mem_hp}'/></td>
      </tr>
      <tr>
         <td>메일</td>
         <td><input type='text' name='mem_mail' value='${memberInfo.mem_mail}'/></td>
      </tr>
      <tr>
         <td>직업</td>
         <td><input type='text' name='mem_job' value='${memberInfo.mem_job}'/></td>
      </tr>
      <tr>
         <td>취미</td>
         <td><input type='text' name='mem_like' value='${memberInfo.mem_like}'/></td>
      </tr>
      <tr>
         <td><input type='submit' value='수정'/></td>
         <td><input type='button' value='회원탈퇴'/></td>
      </tr>
   </table>
</form>
</body>
</html>