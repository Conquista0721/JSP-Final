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
</head>
<body>
<center  style="padding:10%;"><table border="1" class="out">
	<tr>
		<td><center><a href="back_index.jsp">管理者介面</a></center></td>
		<td colspan="2" style="width: 70rem"><center>訂單管理</center></td>
	</tr>
	<tr>
		<td><a href="back_member.jsp">會員管理</a></td>
		<td colspan="2" rowspan="4" style="width: 70rem">
			<center><table border="1" class="in">
				<tr>
					<td>訂單編號</td>
          <td>商品名稱</td>
					<td>訂單數量</td>
					<td>會員帳號</td>
					<td>訂單地址</td>
          <td>訂單電話</td>
          <td>訂單國家</td>
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
                <form action="write_order.jsp" method="post">
<%
                sql="SELECT * FROM list_shopping;";
				        ResultSet tmp=con.createStatement().executeQuery(sql);
                while(tmp.next())
                {
                  out.println("<tr>");
                  out.println("<td>"+"<textarea name='lid' readonly>"+tmp.getString("l_id")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='pname'>"+tmp.getString("product_name")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='lnumber'>"+tmp.getString("l_number")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='maccount'>"+tmp.getString("m_account")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='laddress'>"+tmp.getString("l_address")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='lcellphone'>"+tmp.getString("l_cellphone")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='lcountry'>"+tmp.getString("l_country")+"</textarea>"+"</td>");
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
  <tr><td colspan="3" style="width: 80rem">訂單資料</td></tr>
                  
  <form action="add_order.jsp" method="post">
  <tr>
  	<td>訂單編號(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="lid"></textarea></td>
  </tr>
  <tr>
  <tr>
    <td>商品名稱(必填)</td>
    <td colspan="2"><textarea style="width: 90%;" name="pname"></textarea></td>
  </tr>
  <tr>
  	<td>訂單數量(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="lnumber"></textarea></td>
  </tr>
  <tr>
  	<td>會員帳號</td>
  	<td colspan="2"><textarea style="width: 90%;" name="maccount"></textarea></td>
  </tr>
    <tr>
  	<td>訂單地址</td>
  	<td colspan="2"><textarea style="width: 90%;" name="laddress"></textarea></td>
  </tr>
    <tr>
  	<td>訂單電話</td>
  	<td colspan="2"><textarea style="width: 90%;" name="lcellphone"></textarea></td>
  </tr>
  <tr>
    <td>訂單國家</td>
    <td colspan="2"><textarea style="width: 90%;" name="lcountry"></textarea></td>
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
