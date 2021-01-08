<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="getDB.jsp"%>

<%
	String l_memo = request.getParameter("comment");
	String l_idd = request.getParameter("lidd");
	String p_id = request.getParameter("pid");
	String acc = "";
	String pas = "";
	try{
                Cookie getC[]=request.getCookies();
                for(int i=0;i<getC.length;i++)
                {
                    if(getC[i].getName().equals("getin"))
                    {
                        String[] sp=getC[i].getValue().split("-");
                        acc=sp[0];
                        pas=sp[1];
                    }
                }
            }
        catch(Exception e)
        {}

%>

<%
    sql="update list_shopping set l_boolean='1',message='"+l_memo+"' where l_idd='"+l_idd+"' and p_id='"+p_id+"'";
  	con.createStatement().execute(sql);
  	out.println("<script language=javascript>alert('評論成功')</script>");
  	response.setHeader("refresh","0;URL=member.jsp");
%>
    
 


