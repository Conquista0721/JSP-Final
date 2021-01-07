<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="getDB.jsp"%>
<%	
	String acc=request.getParameter("acc");
	sql="delete from member where m_account='"+acc+"';";
	con.createStatement().executeUpdate(sql);
	out.write("<script>alert('刪除會員成功');</script>");
    response.setHeader("refresh","0;URL=bk_member.jsp");
%> 