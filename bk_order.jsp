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
            <a href="bk_index.jsp"><img src="img/商標.png" class="img1"></a>
            <center>
        <ul class="drop-down-menu">
            <li><a href="#">MEMBER</a>
                <ul>
                    <li><a href="bk_index.jsp">管理區</a></li>
                </ul>
            </li>
			<li>
				<a href="logout.jsp">登出</a>
			</li>
        </ul>
       </center> 
         </div>
<center  style="padding:10%;"><table border="1" class="out">
	<tr>
		<td><center><a href="back_index.jsp">管理者介面</a></center></td>
		<td colspan="2" style="width: 70rem"><center>訂單管理</center></td>
	</tr>
	<tr>
		<td><a href="bk_member.jsp">會員管理</a></td>
		<td colspan="2" rowspan="4" style="width: 70rem">
			<center><table border="1" class="in">
				<tr>
					<td>訂單編號</td>
					<td>下訂時間</td>
				    <td>商品編號</td>
					<td>會員帳號</td>
					<td>訂單數量</td>
					<td>訂單電話</td>
					<td>訂單地址</td>
					<td>總共金額</td>
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
                <form action="write_order.jsp" method="post">
<%
                sql="select *, DATE_FORMAT(`date`, '%Y-%m-%d') as `date2` FROM jspfinal.shoppinglist;";
				        ResultSet tmp=con.createStatement().executeQuery(sql);
                while(tmp.next())
                {
                  out.println("<tr>");
                  out.println("<td>"+"<textarea name='lid' readonly>"+tmp.getString("l_id")+"</textarea>"+"</td>");
				   out.println("<td>"+"<input type='date' value='"+tmp.getString("date2")+"' name='ldate'>"+"</td>");
				  out.println("<td>"+"<textarea name='pid'>"+tmp.getString("p_id")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='maccount'>"+tmp.getString("m_account")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='lnumber'>"+tmp.getString("l_number")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='lphone'>"+tmp.getString("l_phone")+"</textarea>"+"</td>");
				  out.println("<td>"+"<textarea name='laddress'>"+tmp.getString("l_address")+"</textarea>"+"</td>");
				  out.println("<td>"+"<textarea name='ltotalprice'>"+tmp.getString("l_totalprice")+"</textarea>"+"</td>");
                  out.println("<td>"+"<a href='del_order.jsp?lid="+tmp.getString("l_id")+"'>"+"刪除"+"</a>"+"</td>");
                  out.println("</tr>");
                }
                out.println("<tr>");
                out.println("<td colspan='10'>");
                out.println("<button>");
                out.println("修改訂單");
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

<center  style=" margin-top:-10%;padding:5%;"><table border="1" class="under">
  <tr><td colspan="3" style="width: 80rem">訂單資料</td></tr>
                  
  <form action="add_order.jsp" method="post">
  <tr>
  <tr>
    <td>訂單編號</td>
    <td colspan="2"><textarea style="width: 90%;" name="lid" disabled="disabled"></textarea></td>
  </tr>
   <tr>
    <td>下定日期(必填)</td>
    <td colspan="2"><input type="date" style="width: 90%;" name="ldate"></td>
  </tr>
  <tr>
  <tr>
    <td>商品編號(必填)</td>
    <td colspan="2"><textarea style="width: 90%;" name="pid"></textarea></td>
  </tr>
  <tr>
  	<td>會員帳號</td>
  	<td colspan="2"><textarea style="width: 90%;" name="maccount"></textarea></td>
  </tr>
   <tr>
  	<td>訂單數量</td>
  	<td colspan="2"><textarea style="width: 90%;" name="lnumber"></textarea></td>
  </tr>
   <tr>
  	<td>訂單電話</td>
  	<td colspan="2"><textarea style="width: 90%;" name="lphone"></textarea></td>
  </tr>
    <tr>
  	<td>訂單地址</td>
  	<td colspan="2"><textarea style="width: 90%;" name="laddress"></textarea></td>
  </tr>
  <tr>
  <td colspan="3">
    <button type="submit">新增訂單</button>
  </td>
  </tr>
</form>
</table></center>
</body>
</html>
