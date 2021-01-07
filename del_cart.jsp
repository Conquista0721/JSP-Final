<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="getDB.jsp"%>
<% 
   String acc="";
        String pas="";
      //session.setAttribute("in",acc);the memory of the logged in account
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
        {

        
        }

 String gd=request.getParameter("s_id");
 sql="delete from shop.shopping_cart where m_account='"+acc+"' and s_id='"+gd+"'";
 con.createStatement().executeUpdate(sql);
 out.write("<script>alert('刪除商品成功');</script>");
    response.setHeader("refresh","0;URL=shopcart.jsp");
%>