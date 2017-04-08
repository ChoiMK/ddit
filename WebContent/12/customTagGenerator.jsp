<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.lang.reflect.Constructor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    // kr.or.ddit.utils.CustomTagTargetClazz
    Class targetClazz = Class.forName("kr.or.ddit.utils.CustomTagTargetClazz");
    // 생성자 취득
    Constructor constructor = targetClazz.getConstructor();
    // 인스턴스화
    Object instanceClazz = constructor.newInstance();
    // 클래스명
    // CustomTagTargetClazz
    String className = 
             targetClazz.getName().substring(targetClazz.getName().lastIndexOf(".")+1); 
    
    String declareStart = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n"+
                    "<taglib xmlns=\"http://java.sun.com/xml/ns/j2ee\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n"+
                     "\t\txsi:schemaLocation=\"http://java.sun.com/xml/ns/j2ee\n"+ 
                     "\t\thttp://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd\"\n"+
                     "\t\tversion=\"2.0\">\n"+
                     "\t<tlib-version>1.0</tlib-version>\n" +
                     "\t<short-name>"+ className.toLowerCase() +"</short-name>\n" +
                     "\t<uri>http://www.ddit.or.kr/custom/tag/"+ className.toLowerCase() +"</uri>\n";
   String declareContent = "";
   String declareEnd =      "</taglib>"   ;   
   
   Method[] methods = targetClazz.getMethods();
   
   String objectMethods = "clone hashCode toString wait notify notifyAll getClass";
   
   for(Method method : methods){
      // public static Integer plus(Integer i, Integer j){
      // method.getName() : plus 
      if(!objectMethods.contains(method.getName())){
         Class[] params = method.getParameterTypes();
         
         // java.lang.Integer plus(
         String functionsignature = method.getReturnType().getName() + " " + 
                              method.getName() + "(";
         int paramCnt = 1;
         for(Class param : params){
            // java.lang.Intege plus(java.lang.Integer,
            functionsignature += param.getName();
            if(paramCnt++ < params.length){
               functionsignature += ", ";
            }
         }
         // java.lang.Intege plus(java.lang.Integer, java.lang.Integer
         functionsignature += ")";
         
         // <function-class>kr.or.ddit.utils.CustomTagTargetClazz</function-class>
         declareContent += "\t<function>\n" +
                       "\t\t<description>"+ method.getName() + "의 활용</description>\n" + 
                       "\t\t<name>"+ method.getName() +"</name>" + 
                       "\t<function-class>"+ targetClazz.getName() +"</function-class>\n" +
                        "\t\t<function-signature>"+ functionsignature +"</function-signature>\n" + 
                        "\t\t<example>\n" +
                        "\t\t\t<![CDATA[\n" +
                        "\t\t\t\t${" + className.toLowerCase() + ":" + 
                                 functionsignature.substring(functionsignature.indexOf(" ")+1) + "}\n" +
                        "\t\t\t]]>\n" + 
                           "\t\t</example>\n" +
                        "\t</function>\n";
      }
   }
      
   BufferedWriter writer = null;
   try{
      writer = new BufferedWriter(
            new FileWriter(
                  new File("D:\\temp\\"+ className.toLowerCase() + ".tld")));
      writer.write(declareStart + declareContent + declareEnd);
   }catch(IOException e1){
      e1.printStackTrace();
   }finally{
      writer.close();
   }
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
사용자 정의 태그가 작성되었습니다.
</body>
</html>