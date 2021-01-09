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
		<td><center><a href="bk_index.jsp">管理者介面</a></center></td>
		<td colspan="2" style="width: 70rem"><center>後台首頁</center></td>
	</tr>
	<tr>
		<td><a href="bk_member.jsp">會員管理</a></td>
		<td colspan="2" rowspan="4" style="width: 70rem">
			<center><span><a href="index.jsp">回到前台首頁</a></span></center>
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
	<tr>
	<td colspan="2" ><p style="font-size:40px">管理階層</p>
	</td>
	</tr>
	<tr>
	<td><img src="img/1.jpg" width="100%" style="display: block;"></td>
	<td style="font-size:90px">許柏聰<br>是一名帥哥兼馬子狗</td>
	</tr>
	<tr>
	<td><img src="img/22.png" width="100%" style="display: block;"></td>
		<td style="font-size:90px">董謙<br>呼吸.....好麻煩歐</td>

	</tr>
	<tr>
	<td><img src="img/333.jpg" width="100%" style="display: block;"></td>
	<td style="font-size:90px">杜得瑋<br>TALE OFF!!</td>

	</tr>
	
</table></center>

</body>
</html>