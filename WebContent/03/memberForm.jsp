<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/ddit/js/validation.js"></script>
<script>
$(function(){
	$('form[name=memberForm]').submit(function(){
		    if(!$('input[name=mem_id]').val().validationID()){                   
	            alert('아이디를 입력해주세요');                                  
	            return false;                                                    
	         }                                                                   
	         if(!$('input[name=mem_pass]').val().validationPWD()){               
	            alert('패스워드를 입력해주세요');                                
	            return false;                                                    
	         }                                                                   
	         if(!$('input[name=mem_name]').val().validationNM()){                
	            alert('이름을 입력해주세요');                                    
	            return false;                                                    
	         }                                                                   
            var regno = $('input[name=mem_regno1]').val()+'-'+$('input[name=mem_regno2]').val();
	         if(!regno.validationREGNO()){                                  
	            alert('주민등록번호 바르게 입력해주세요');                  
	            return false;                                               
	         }                                                              
	         if(!$('input[name=mem_bir]').val().validationBIR()){           
	            alert('생일을 바르게 입력해주세요');                        
	            return false;                                               
	         }                                                              
	         if(!$('input[name=mem_hometel]').val().validationHOMETEL()){   
	            alert('집 전화번호를 바르게 입력해주세요');                 
	            return false;                                               
	         }                                                              
	         if(!$('input[name=mem_comtel]').val().validationCOMTEL()){     
	            alert('회사 전화번호를 바르게 입력해주세요');               
	            return false;                                               
	         }                                                              
	         if(!$('input[name=mem_mail]').val().validationMAIL()){         
	            alert('메일을 바르게 입력해주세요');                        
	            return false;                                               
	         }                                                              
	         if(!$('input[name=mem_hp]').val().validationHP()){             
	            alert('휴대폰 번호를 바르게 입력해주세요');                 
	            return false;                                               
	         }    
	         return;
	});
});
</script>
</head>
<body>
<form action='/ddit/03/insertMemberInfo.jsp' name='memberViewForm' method='post'>
   <table>
      <tr>
         <td>아이디</td>
         <td><input type='text' name = 'mem_id' value='' /></td>
      </tr>
      <tr>
         <td>패스워드</td>
         <td><input type='text'name = 'mem_pass' value='' /></td>
      </tr>
      <tr>
         <td>이름</td>
         <td><input type='text' name = 'mem_name' value=''/></td>
      </tr>
      <tr>
         <td>주민번호1</td>
         <td><input type='text' name = 'mem_regno1' value='' /></td>
      </tr>
      <tr>
         <td>주민번호2</td>
         <td><input type='text' name = 'mem_regno2' value='' /></td>
      </tr>
      <tr>
         <td>생일</td>
         <td><input type='text' name = 'mem_bir' value='' /></td>
      </tr>
      <tr>
         <td>우편번호</td>
         <td><input type='text' name = 'mem_zip' value='' /></td>
      </tr>
      <tr>
         <td>주소1</td>
         <td><input type='text' name = 'mem_add1' value='' /></td>
      </tr>
      <tr>
         <td>주소2</td>
         <td><input type='text' name = 'mem_add2' value='' /></td>
      </tr>
      <tr>
         <td>집전화번호</td>
         <td><input type='text' name = 'mem_hometel' value=''/></td>
      </tr>
      <tr>
         <td>회사전화번호</td>
         <td><input type='text' name = 'mem_comtel' value=''/></td>
      </tr>
      <tr>
         <td>휴대폰</td>
         <td><input type='text' name = 'mem_hp' value=''/></td>
      </tr>
      <tr>
         <td>메일</td>
         <td><input type='text' name = 'mem_mail' value=''/></td>
      </tr>
      <tr>
         <td>직업</td>
         <td><input type='text' name = 'mem_job' value=''/></td>
      </tr>
      <tr>
         <td>취미</td>
         <td><input type='text' name = 'mem_like' value=''/></td>
      </tr>
      <tr>
         <td colspan="2"><input type = 'submit' value = '회원가입' /></td>
      </tr>
   </table>
</form>
</body>
</html>