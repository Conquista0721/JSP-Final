<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="getDB.jsp"%>
<%	
	String lid=request.getParameter("love_id");
	sql="delete from love where love_id='"+lid+"';";
	con.createStatement().executeUpdate(sql);
    response.sendRedirect("favorite_content.jsp");
%> 