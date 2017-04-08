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
<form action="<c:url value="/13/result1.jsp"/>" 
      method="post" enctype="multipart/form-data">
   <table>
      <tr>
         <td>아이디</td>
         <td><input type="text" name="mem_id"/></td>
      </tr>
      <tr>
         <td>패스워드</td>
         <td><input type="text" name="mem_pass"/></td>
      </tr>
      <tr>
         <td>file1</td>
         <td><input type="file" name="file01"/></td>
      </tr>
      <tr>
         <td>file2</td>
         <td><input type="file" name="file02"/></td>
      </tr>
      <tr>
         <td colspan="2">
            <input type="submit" value="전송"/>
         </td>
      </tr>
   </table>
</form>

<form action="<c:url value="/13/result2.jsp"/>" 
      method="post" enctype="multipart/form-data">
   <table>
      <tr>
         <td>아이디</td>
         <td><input type="text" name="mem_id"/></td>
      </tr>
      <tr>
         <td>패스워드</td>
         <td><input type="text" name="mem_pass"/></td>
      </tr>
      <tr>
         <td>file1</td>
         <td><input type="file" name="files"/></td>
      </tr>
      <tr>
         <td>file2</td>
         <td><input type="file" name="files"/></td>
      </tr>
      <tr>
         <td colspan="2">
            <input type="submit" value="전송"/>
         </td>
      </tr>
   </table>
</form>
</body>
</html>