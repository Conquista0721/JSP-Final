<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*,java.io.*"%>
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
	width: 6rem;
	height: 4rem;
}	
.out td
 {
	width: 6rem;
	height: 4rem;
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
  width: 5rem;
  height: 3rem;
 }
</style>
</head>
<body>
<center style="padding:2%; padding-bottom: 10%;padding-top: 10%;"><table border="1" class="out">
	<tr>
		<td><center><a href="back_index.jsp">管理者介面</a></center></td>
		<td colspan="2" style="width: 70rem"><center>會員管理</center></td>
	</tr>
	<tr>
		<td><a href="back_member.jsp">會員管理</a></td>
		<td colspan="2" rowspan="4" style="width: 70rem">
			<center><table border="1" class="in">
				<tr>
          <td>序號</td>
					<td>帳號</td>
					<td>密碼</td>
					<td>名字</td>
					<td>姓氏</td>
					<td>地址</td>
					<td>電郵</td>
					<td>權限</td>
					<td>稱謂</td>
					<td>電話</td>
					<td>刪除</td>
				</tr>
         <%
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
				<form action="write_member.jsp" method="get">
<%
                sql="SELECT * FROM member;";
				        ResultSet tmp=con.createStatement().executeQuery(sql);
                while(tmp.next())
                {
                  out.println("<tr>");
                  out.println("<td>"+"<textarea name='mid' readonly>"+tmp.getString("m_id")+"</textarea>"+"</td>");
                  out.println("<td name='maccount'>"+tmp.getString("m_account")+"</td>");
                  out.println("<td>"+"<textarea name='mpassword'>"+tmp.getString("m_password")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='mfirstname'>"+tmp.getString("m_firstname")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='mlastname'>"+tmp.getString("m_lastname")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='maddress'>"+tmp.getString("m_address")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='memail'>"+tmp.getString("m_email")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='mlevel'>"+tmp.getString("m_level")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='mhead'>"+tmp.getString("m_head")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='mtel'>"+tmp.getString("m_tel")+"</textarea>"+"</td>");
                  out.println("<td>"+"<a href='del_member.jsp?acc="+tmp.getString("m_account")+"'>"+"刪除"+"</a>"+"</td>");
                  out.println("</tr>");
                }
                out.println("<tr>");
                out.println("<td colspan='11'>");
                out.println("<button type='submit'>");
                out.println("修改會員");
                out.println("</button>");
                out.println("</td>");
                out.println("</tr>");
                con.close();

%>	
</form> 
			    <!--<tr>
					<td>y</td>
					<td>m</td>
					<td>ym</td>
					<td>chen</td>
					<td>三重</td>
					<td>peter880118@gmail.com</td>
					<td>1</td>
					<td>管理者</td>
					<td>0920218763</td>
				</tr>!-->
			</table></center>
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

<center  style=" margin-top:-10%;padding:5%;"><table border="1" class="under">
  <tr><td colspan="3" style="width: 80rem">會員資料</td></tr>
                  
  <form action="add_member.jsp" method="post">
  <tr>
  	<td>帳號(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="acc"></textarea></td>
  </tr>
  <tr>
  	<td>密碼(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="pas"></textarea></td>
  </tr>
  <tr>
  	<td>名字</td>
  	<td colspan="2"><textarea style="width: 90%;" name="firstname"></textarea></td>
  </tr>
    <tr>
  	<td>姓氏</td>
  	<td colspan="2"><textarea style="width: 90%;" name="lastname"></textarea></td>
  </tr>
    <tr>
  	<td>地址</td>
  	<td colspan="2"><textarea style="width: 90%;" name="address"></textarea></td>
  </tr>
    <tr>
  	<td>電郵</td>
  	<td colspan="2"><textarea style="width: 90%;" name="email"></textarea></td>
  </tr>
    <tr>
  	<td>權限</td>
  	<td colspan="2"><textarea style="width: 90%;" name="level"></textarea></td>
  </tr>
    <tr>
  	<td>稱謂</td>
  	<td colspan="2"><textarea style="width: 90%;" name="head"></textarea></td>
  </tr>
    <tr>
  	<td>電話</td>
  	<td colspan="2"><textarea style="width: 90%;" name="tel"></textarea></td>
  </tr>
  <tr>
  <td colspan="3">
    <button>新增會員</button>
  </td>
  </tr>
</form>
</table></center>
</body>
</html>