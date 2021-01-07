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
		<td colspan="2" style="width: 70rem"><center>商品管理</center></td>
	</tr>
	<tr>
		<td><a href="back_member.jsp">會員管理</a></td>
		<td colspan="2" rowspan="4" style="width: 70rem">
			<center><table border="1" class="in">
				<tr>
					<td>商品編號</td>
					<td>商品類別</td>
					<td>商品名稱</td>
					<td>商品數量</td>
					<td>商品單價</td>
					<td>商品原價</td>
					<td>商品折扣</td>
          <td>商品圖片</td>
          <td>刪除</td>
				</tr> <%
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
                <form action="write_product.jsp" method="post">
        
<%
                sql="SELECT * FROM product;";
				        ResultSet tmp=con.createStatement().executeQuery(sql);
                while(tmp.next())
                {
                  out.println("<tr>");
                  out.println("<td>"+"<textarea name='pid' readonly>"+tmp.getString("p_id")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='pclass'>"+tmp.getString("p_class")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='pname'>"+tmp.getString("p_name")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='pstock'>"+tmp.getString("p_stock")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='pprice'>"+tmp.getString("p_price")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='poriginprice'>"+tmp.getString("p_originprice")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='pdiscount'>"+tmp.getString("p_discount")+"</textarea>"+"</td>");
                  out.println("<td>"+"<textarea name='pimage'>"+tmp.getString("p_image")+"</textarea>"+"</td>");
                  out.println("<td>"+"<a href='del_product.jsp?pid="+tmp.getString("p_id")+"'>"+"刪除"+"</a>"+"</td>");
                  out.println("</tr>");
                }
                out.println("<tr>");
                out.println("<td colspan='10'>");
                out.println("<button>");
                out.println("修改商品");
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
  <tr><td colspan="3" style="width: 80rem">商品資料</td></tr>
                  
  <form action="add_product.jsp" method="post">
  <tr>
  	<td>商品編號(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="pid"></textarea></td>
  </tr>
  <tr>
  	<td>商品類別</td>
  	<td colspan="2"><textarea style="width: 90%;" name="pclass"></textarea></td>
  </tr>
  <tr>
  	<td>商品名稱(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="pname"></textarea></td>
  </tr>
    <tr>
  	<td>商品數量(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="pstock"></textarea></td>
  </tr>
    <tr>
  	<td>商品單價(必填)</td>
  	<td colspan="2"><textarea style="width: 90%;" name="pprice"></textarea></td>
  </tr>
   <tr>
  	<td>商品原價</td>
  	<td colspan="2"><textarea style="width: 90%;" name="poriginprice"></textarea></td>
  </tr>
    <tr>
  	<td>商品折扣</td>
  	<td colspan="2"><textarea style="width: 90%;" name="pdiscount"></textarea></td>
  </tr>
    <tr>
  	<td>商品圖片</td>
  	<td colspan="2"><textarea style="width: 90%;" name="pimage"></textarea></td>
  </tr>
  <tr>
  <td colspan="3">
    <button>新增商品</button>
  </td>
  </tr>
</form>
</table></center>
</body>
</html>
