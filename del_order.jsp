<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="getDB.jsp"%>
<%	
	String lid=request.getParameter("lid");
	sql="delete from list_shopping where l_id='"+lid+"';";
	con.createStatement().executeUpdate(sql);
	out.write("<script>alert('刪除訂單成功');</script>");
    response.setHeader("refresh","0;URL=bk_order.jsp");
%> 