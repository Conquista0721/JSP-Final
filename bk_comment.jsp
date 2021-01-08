<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*,java.io.*"%>
<%@include file="getDB.jsp" %>

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
 button
 {
   height: 1.5rem;
   float: right;
   margin-left: 3rem;
 }

 .under td
 {
  width: 10rem;
  height: 2rem;
 }

 .in textarea
 {
  width: 5.5rem;
  height: 3.5rem;
 }
</style>
<style type="text/css">
    @import"css/home.css";
    @import"css/div2.css";
    @import"css/div1.css";
    @import "css/menu.css";
    @import "css/container projects.css";
    @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap");
    </style>
<script src="js/home.js"></script>
</head>
<body class="bg">
<div id="menu"> 
            <a href="index.jsp"><img src="img/商標.png" class="img1"></a>
            <center>
        <ul class="drop-down-menu">
            <li><a href="#">ABOUT US</a>
                <ul>
                    <li><a href="about us.jsp">關於我們</a></li>
                    <li><a href="about us.jsp">常見問題</a></li>
                </ul>
            </li>
    
            <li><a href="#">MENU</a>
                <ul>
                    <li><a href="commodity.jsp">熱門商品</a></li>
                    <li><a href="commodity.jsp">休閒鞋款</a></li>
                    <li><a href="commodity.jsp">籃球鞋款</a></li>
                    <li><a href="commodity.jsp">慢跑鞋款</a></li>
                </ul>
            </li>
    
            <li><a href="#">MEMBER</a>
                <ul>
                    <li><a href="personal information.jsp">個人資料</a></li>
                </ul>
            </li>
        </ul>
       </center> 
         </div>
<center  style="padding:10%;"><table border="1" class="out">
	<tr>
		<td><center><a href="bk_index.jsp">管理者介面</a></center></td>
		<td colspan="2" style="width: 70rem"><center>評論管理</center></td>
	</tr>
	<tr>
		<td><a href="bk_member.jsp">會員管理</a></td>
		<td colspan="2" rowspan="4" style="width: 70rem">
			<center><table border="1" class="in">
				<tr>
					<td>評論序號</td>
					<td>評論日期</td>
					<td>評論商品</td>
					<td>留言人名</td>
					<td>評論內容</td>
					<td>刪除</td>
				</tr>
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
                <form action="write_comment.jsp" method="post">
<%
                sql="select *, DATE_FORMAT(`date`, '%Y-%m-%d') as `date2` FROM jspfinal.shoppinglist;";
				ResultSet tmp=con.createStatement().executeQuery(sql);
                while(tmp.next())
			
                {
                  out.println("<tr>");
                  out.println("<td>"+"<textarea name='lid' readonly>"+tmp.getString("l_id")+"</textarea>"+"</td>");
                  out.println("<td>"+"<input type='date' value='"+tmp.getString("date2")+"' name='date'>"+"</td>");
                  out.println("<td>"+"<textarea name='pid'>"+tmp.getString("p_id")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='lname'>"+tmp.getString("l_name")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='message'>"+tmp.getString("message")+"</textarea>"+"</td>");
                  out.println("<td>"+"<a href='del_comment.jsp?lid="+tmp.getString("l_id")+"'>"+"刪除"+"</a>"+"</td>");
                  out.println("</tr>");
                }
                out.println("<tr>");
                out.println("<td colspan='10'>");
                out.println("<button>");
                out.println("修改評論");
                out.println("</button>");
                out.println("</td>");
                out.println("</tr>");
                  con.close();

%>
</form>
			    <!--<tr>
			    	<td>1</td>
					<td>6/15</td>
					<td>ym</td>
					<td>商品編號</td>
                    <td>訂購數量</td>
					<td>訂購總價</td>
					<td>訂購地點</td>
				</tr>

			    <tr>
			    	<td>2</td>
					<td>6/15</td>
					<td>ym</td>
					<td>商品編號</td>
                    <td>訂購數量</td>
					<td>訂購總價</td>
					<td>訂購地點</td>
				</tr>!-->
			</table></center>
		</td>
	</tr>
	<tr>
		<td><a href="bk_order.jsp">訂單管理</a></td>
	</tr>
	<tr>
		<td><a href="bk_product.jsp">商品管理</a></td>
	</tr>
	<tr>
		<td><a href="bk_comment.jsp">評論管理</a></td>
	</tr>
</table></center>

<center  style="margin-top:-10%; padding:5%;"><table border="1" class="under">
  <tr><td colspan="3" style="width: 80rem">評論資料</td></tr>
                  
  <form action="add_comment.jsp" method="post">
  <tr>
  	<td>評論序號(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="lid"></textarea></td>
  </tr>
  <tr>
  	<td>評論商品(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="pid"></textarea></td>
  </tr>
    <tr>
  	<td>留言人名(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="lname"></textarea></td>
  </tr>
    <tr>
  	<td>評論內容(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="message"></textarea></td>
  </tr>
  <tr>
  	<td>時間(必填)</td>
  	<td colspan="2"><input type="date" style="width: 90%;" name="date"></td>
  </tr>
  <tr>
  <td colspan="3">
    <button>新增評論</button>
  </td>
  </tr>
</form>
</table></center>
</body>
</html>