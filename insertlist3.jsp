<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="getDB.jsp"%>

<%
	String msg = request.getParameter("message");
	String acc = request.getParameter("acc");
	String pid = request.getParameter("pid");

    sql="INSERT INTO message(p_id, m_account, message) values('"+pid+"','"+acc+"','"+msg+"');";
  	con.createStatement().execute(sql);
  	out.println("<script language=javascript>alert('評論成功')</script>");
    response.setHeader("refresh","0;URL=item.jsp?p_id="+pid+"");
%>
    
 


