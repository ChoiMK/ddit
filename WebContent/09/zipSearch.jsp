<%@page import="com.ajax.util.StrUtil"%>
<%@page import="com.ajax.util.DButil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String dong = request.getParameter("dong");
//dong = "대사동";

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;

try{
	conn = DButil.getConnection();
	String sql = "select * from ziptb where dong like ?";
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, "%" + dong + "%" );
	
	rs = psmt.executeQuery();
%>
[
<%
	while(rs.next()){
		if(rs.getRow()>1) out.println(",");
%>
		{
			"zipCode" : "<%=rs.getString("zipcode") %>",
			"addr"    : "<%=rs.getString("sido") %> <%=rs.getString("gugun") %> <%=rs.getString("dong") %> <%=StrUtil.toJS(rs.getString("ri")) %> <%=StrUtil.toJS(rs.getString("bldg")) %>",
			"bunji"   : "<%=StrUtil.toJS(rs.getString("bunji")) %>"
		}
<%		
	}// while
%>	
]
	
<%	
}catch(SQLException e){
	out.clearBuffer();
	e.printStackTrace();
%>
[]
<%	
}finally{
	if(rs!=null) try{ rs.close(); }catch(SQLException ee){}
	if(psmt!=null) try{ psmt.close(); }catch(SQLException ee){}
	if(conn!=null) try{ conn.close(); }catch(SQLException ee){}
}
%>