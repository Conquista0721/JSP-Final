<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="getDB.jsp"%>
<%	
	String pid=request.getParameter("pid");
	sql="delete from product where p_id='"+pid+"';";
	con.createStatement().executeUpdate(sql);
	out.write("<script>alert('刪除商品成功');</script>");
    response.setHeader("refresh","0;URL=bk_product.jsp");
%> 