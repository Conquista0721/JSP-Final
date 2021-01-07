<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*,java.io.*"%>
<%@include file="getDB.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>後台介面</title>
<style type="text/css" media="screen">
td
 {
 	text-align:center;
 }
a
 {
  text-decoration:none;
 }
.in td
{
	width: 10rem;
	height: 5rem;
}	
.out td
 {
	width: 10rem;
	height: 5rem;
 }
</style>
</head>
<body>
	 <%
		String acc="";
        String pas="";
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
                                        sql="SELECT * FROM member WHERE m_account='"+acc+"' and m_password='"+pas+"'";
                                        ResultSet man=con.createStatement().executeQuery(sql);
                                        man.next();
                                        if(man.getString("m_level").equals("1"))
                                        {

                                        }
                                        else
                                        {
                                            out.write("<script language=javascript>alert('非管理者，無法進入');</script>");
                                            response.setHeader("refresh","0;URL=index.jsp");
                                        }
                                    }
                                catch(Exception e)
                                    {
                                        out.write("<script language=javascript>alert('非管理者，無法進入');</script>");
                                        response.setHeader("refresh","0;URL=index.jsp");
                                    }
                               
                            %>
<center style="padding:10%;"><table border="1" class="out">
	<tr>
		<td><center><a href="back_index.jsp">管理者介面</a></center></td>
		<td colspan="2" style="width: 70rem"><center>後台首頁</center></td>
	</tr>
	<tr>
		<td><a href="back_member.jsp">會員管理</a></td>
		<td colspan="2" rowspan="4" style="width: 70rem">
			<center><span><a href="index.jsp">回到前台首頁</a></span></center>
		</td>
	</tr>
	<tr>
		<td><a href="back_order.jsp">訂單管理</a></td>
	</tr>
	<tr>
		<td><a href="back_product.jsp">商品管理</a></td>
	</tr>
	<tr>
		<td><a href="back_comment.jsp">評論管理</a></td>
	</tr>
</table></center>

</body>
</html>