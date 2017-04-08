<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>web.xml 내 선언된 전역 상수</h3>
oracleDriver : <%=application.getInitParameter("oracleDriver") %><br/>
oracleURL : <%=application.getInitParameter("oracleURL") %><br/>
MySqlDriver : <%=application.getInitParameter("MySqlDriver") %><br/>
MySqlURL : <%=application.getInitParameter("MySqlURL") %><br/>
<h3>이클립스가 웹 어플리케이션을 배포하는 경로</h3>
배포 위치 : <%=application.getRealPath("") %><br/>
<h3>서블릿 버전</h3>
서블릿 버전 : <%=application.getMajorVersion() %>.<%=application.getMinorVersion() %><br/>
<pre>
버전 : log4j-1.2.16.jar
      1 : Major version
      2 : Minor version
      16 : detail version 
</pre>
<%
   application.log("이클립스 내에서 출력 방향은 콘솔.");
   application.log("실제 어플리케이션 배포 후 서비스 시 출력 방향은 서버설치폴더\\logs\\날짜로그명.log");
   
   String buffer = "";
   BufferedReader reader = new BufferedReader(
                        new InputStreamReader(
                              new FileInputStream(
                                    application.getRealPath("/05/readme.txt")), "UTF-8"));
   while((buffer = reader.readLine()) != null){
%>
<%=buffer %><br>
<% 
   }
   reader.close();
   
   String temp = "";
   // http://localhost/ddit/05/readme.txt
   URL url = application.getResource("/05/readme.txt");
   
   reader = new BufferedReader(
            new InputStreamReader(url.openStream(), "UTF-8"));
   while((temp = reader.readLine()) != null){
      out.println(temp + "<br/>");
   }
%>

</body>
</html>