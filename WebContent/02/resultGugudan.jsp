<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//http://localhost/ddit/02/resultGugudan.jsp?dan=값
//Map<String, String[]> map = request.getParameterMap();
//String[] value = map.get("dan");
//String dan = value[0];

// http://localhost/ddit/02/resultGugudan.jsp?dan=값&mem_pass=값
// 전송되는 파라메터에서 키만 순차접근
//Enumeration<String> paramEnums = request.getParameterNames();
//while(paramEnums.hasMoreElements()){
// mem_id or mem_pass
// String key = paramEnums.nextElement();
// String value = request.getParameter(key);
//}

// http://localhost/ddit/02/resultGugudan.jsp?dan=값1&dan=값2
//String[] dans = request.getParameterValues("dan");

// http://localhost/ddit/02/resultGugudan.jsp?dan=값
	String dan =  request.getParameter("dan");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<%	
		int dan2 = Integer.parseInt(dan);
	
	%>
	===============<%=dan%>단============<br/>
	<% 
			for(int i=1; i<=9; i++){
	%>
		<%=dan2 %> * <%=i %> = <%=dan2*i %><br/>
	<%			
			
		}
	%>
</body>
</html>