<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="customtagtargetclazz"
		 uri="http://www.ddit.or.kr/custom/tag/customtagtargetclazz" %>

<!-- pageContext.setAttribute("value1","맛집") -->
<c:set var="value1" value="군산 서해바다횟집 인당 3만원..속초회센타(물회)..제주도 보말 칼국수..전주 교동석갈비..abc" scope="page"></c:set>
<c:set var="value2" value="속초" scope="page"></c:set>
<c:set var="value3" value="승리,희정,연수" scope="page"></c:set>
<c:set var="value4" value="<script type='text/javascript'>alert('메세지');</script>" scope="page"></c:set>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

length : ${fn:length(value1) }<br/>
toUpperCase : ${fn:toUpperCase(value1) }<br/>
toLowerCase : ${fn:toLowerCase(value1) }<br/>
substring : ${fn:substring(value1, 0, 3) }<br/>
substringAfter : ${fn:substringAfter(value1, value2) }<br/>
substringBefore : ${fn:substringBefore(value1, value2) }<br/>
replace : ${fn:replace(value1, value2, '강릉') }<br/>
indexOf : ${fn:indexOf(value1, value2 ) }<br/>
startsWith : ${fn:startsWith(value1, '군산') }<br/>
endsWith : ${fn:endsWith(fn:trim(value1), 'abc') }<br/>
contains : ${fn:contains(value1, 'value2') }<br/>
split : ${fn:split(value3, ',') }<br/>
<%-- ${value4} --%>
escapeXml : ${fn:escapeXml(value4) }
charCount : ${customtagtargetclazz:charCount('12341','1')}<br/>
<%-- plus : ${customtagtargetclazz:plus('1','1')} --%>









</body>
</html>