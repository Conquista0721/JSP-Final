<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="getDB.jsp"%>
<%	
	String lid=request.getParameter("lid");
	sql="delete from shoppinglist where l_id='"+lid+"';";
	con.createStatement().executeUpdate(sql);
	out.write("<script>alert('刪除評論成功');</script>");
    response.setHeader("refresh","0;URL=bk_comment.jsp");
%> 