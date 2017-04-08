<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String buyer_id = request.getParameter("buyer_id");


	Map<String, String> params = new HashMap<String, String>();
	params.put("buyer_id", buyer_id);

	IBuyerService service = IBuyerServiceImpl.getInstance();
	BuyerVO buyerInfo =  service.getBuyerInfo(params);
//	ObjectMapper mapper = new ObjectMapper();
	//String jsonData = mapper.writeValueAsString(buyerList);
	
	//System.out.println(jsonData);
	//out.println(jsonData);
	if(buyerInfo != null){
%>
{
	"buyerId" : "<%=buyerInfo.getBuyer_id() %>"
}
<%
	}else{
%>
{
    "buyerId" : ""
 }
<%
	}
%>