<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cookieControl.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validation.js"></script>
<script type="text/javascript" src="/ddit/js/validation.js"></script>
<script type="text/javascript">
$(function(){
	// 자바스크립트에서 인코딩/디코딩 함수
	// 				escape/unescape : 유니코드 형식으로 인코딩 또는 디코딩.
	//								 URL(://?.)을 포함해서 모두 인코딩 또는 디코딩
	//			encodeURI/decodeURI : 유니코드 형식으로 인코딩 또는 디코딩.
	//								 URL(://?.)기호를 배제하고 인코딩 또는 디코딩
	//     encodeURIComponent/decodeURIConponent : 유니코드 형식으로 인코딩 또는 디코딩.
	//								                자바스크립트 코드를 활용해서 한글 인코딩/디코딩
	
	// 자바스크립트에서 jsp 익스프레션을 활용하기 위해서는 반드시 ''또는 ""으로 익스프레션을 랩핑
	// 'null' or '회원이 아닙니다.'
	if(eval('${!empty param.message}')){
		alert('${param.message}');
	}
	
	$('input[name=mem_id]').val(Get_Cookie("id"));
		
	if(Get_Cookie("id")!=null){
		$("#saveID").prop('checked',true);
	}
	
	$('form[name=loginForm]').submit(function(){
			 if(!$('input[name=mem_id]').val().validationID()){
				 alert("아이디를 바르게 입력해주세요");
				 return false;
			 }
			 if(!$('input[name=mem_pass]').val().validationPWD()){
				 alert("패스워드를 바르게 입력해주세요");
				 return false;
			 }
			 $(this).attr('action','/ddit/03/loginCheck.jsp');
		
			 if($("#saveID").is(":checked")){
				 Set_Cookie("id", $('input[name=mem_id]').val(), 1, "/");				 
			 }else{
				 Delete_Cookie("id", "/");
			 }
			 
			 return; // return true; 랑 같음
		});	
	$('input[type=button]').click(function(){
		var $frm = $('<form action="<%=request.getContextPath()%>/03/memberForm.jsp"></form>');
		$frm.attr('name','memberForm');
		$frm.attr('method','get');
		
		$frm.append('<input type="text" name="amugerna" value="아무거나"/>');
		
		$(document.body).append($frm);
		
		$frm.submit();
	});
});


</script>
</head>
<body>
	<form action="" name="loginForm" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="mem_id" />
				</td>
					
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="text" name="mem_pass"/></td>
			</tr>
			<tr>
				 <td colspan="2">
					 아이디저장<input type="checkbox"  id="saveID"/>
					<input type="submit" value="로그인"/>
				 	<input type="button" value="회원가입" />
				 </td>
			</tr>
		</table>
	</form>
</body>
</html>