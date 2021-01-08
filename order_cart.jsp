<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<html>
<head>
 <meta charset="UTF-8">
 <title>購物車</title>
</head>
<style type="text/css">
    @import"css/car.css";
    @import "css/menu.css";
    @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap");
   </style>
<style type="text/css">

</style>
<script>
    function myFunction()
    {
        alert("感謝您的購買！本店產品皆是貨到付款，請耐心等候到貨通知~");
    }
</script>
<script src="js/clock.js"></script>
<script src="js/car.js"></script>

<body class="bg">
 <form action="insertlist2.jsp" method="">
	<%
		String amount = request.getParameter("amount");
        String pid = request.getParameter("pid");
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
			if(acc==null||acc.equals("")||pas==null||pas.equals(""))
		{
			 out.write("<script language=javascript>alert('請先登入');</script>");
             response.setHeader("refresh","0;URL=login.jsp") ;
	%>

		<div class="box"><a href="#">TOP</a></div>
		<div class="bo"><a href="search.jsp">搜尋</a></div>
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
		
				<li><a href="#">LOGIN</a>
					<ul>
						<li><a href="login.jsp">登入</a></li>
						<li><a href="register.jsp">註冊</a></li>
					</ul>
				</li>
				</ul>
				</center> 
			</div>
	<%
		}
		else
		{
			 sql="SELECT * FROM member WHERE m_account='"+acc+"' and m_password='"+pas+"'";
             ResultSet ins=con.createStatement().executeQuery(sql);
             ins.next();
             if(ins.getString("m_level").equals("1"))
             {
                out.write("<script language=javascript>alert('歡迎管理員大大');</script>");
                response.setHeader("refresh","0;URL=back_index.jsp") ;
             }
             else
             {
	%>
		<div class="box"><a href="#">TOP</a></div>
		<div class="bo"><a href="search.jsp">搜尋</a></div>
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
            
			<li><a href="#">會員中心</a>
				<ul>
					<li><a href="personal information.jsp">個人資料</a></li>
					<li><a href="favorite.jsp">我的收藏</a></li>
					<li><a href="car.jsp">購物車</a></li>
				</ul>
			</li>
			<li>
				<a href="logout.jsp">登出</a>
			</li>
			</ul>
			</center> 
		</div>
		 <%
                        try{
                            String[] idd= request.getParameterValues("pid");
                            String[] nbb= request.getParameterValues("amount");
                        //如果一次購買5種不同商品 個別不同數量，idd[這裡會是0~4] nbb[也是0~4];陣列取的大小=idd.length
                        
                            for(int i=0;i<idd.length;i++) 
                            {
                     %>
                             <input type="hidden" name="pdid" value="<%=idd[i]%>">
                             <input type="hidden" name="amt" value="<%=nbb[i]%>">
                             
                    <%
							}
                         }catch(Exception e){
                         out.write("<script language=javascript>alert('無商品');</script>");
                         response.setHeader("refresh","0;URL=car.jsp") ;
                         }
                         sql="UPDATE shopping_cart SET amount='"+amount+"' WHERE p_id='"+pid+"' AND m_account='"+acc+"'";
						 con.createStatement().execute(sql);
                    %>
					 <%
                      
                        sql="SELECT * FROM member WHERE member.m_account='"+acc+"'";
                        ResultSet list = con.createStatement().executeQuery(sql);
                        list.next();
                    %>
	
<br>
<br>
<br>
<br>
<br>
</div>
<center>
<img src="img/訂購資料.png" class="pc3">
<div class="word1">
收件者姓名: <input type="text" placeholder="輸入姓名" class="input" name="oname" value="<%=list.getString("m_name")%>"><br><br>
手機號碼:<input type="text" placeholder="輸入手機號碼" class="input" name="ophone" value="<%=list.getString("m_phone")%>"><br><br>
取貨店家:<input type="text" placeholder="輸入取貨店家" class="input" name="oaddress" value="<%=list.getString("m_address")%>"><br><br>
(請寫全名。ex:全家 中壢復興店。)

</div></center>
<div><center><button class="butttt" type="submit"><img src="img/訂購.png" class="pc4" onclick="myFunction()"></center> </div>

</form>

	 <%			}
			}
		}
		catch(Exception e)
		{
			
			//銷毁session：
		 
			//清除cookie：
			try{
					Cookie getC[]=request.getCookies();
					for(int i=0;i<getC.length;i++)
					{
						if(getC[i].getName().equals("getin"))
						{
							getC[i].setMaxAge(0);
							response.addCookie(getC[i]);
							response.sendRedirect("index.jsp");
						}
					}
				}
			catch(Exception err)
			{
				response.sendRedirect("index.jsp");
			}
		}
	%>
<div class="bgg"><center>
    <p>瀏覽人數:
		<%
			try{
				ResultSet ct=con.createStatement().executeQuery("select * from count");
				ct.next();
				int count1=Integer.parseInt(ct.getString("idcount"));
				if(session.isNew()){
					count1++;
					con.createStatement().executeUpdate("update count set idcount='"+count1+"';");
				}
				out.println(count1);
			}
			catch(Exception e){
				out.println(e.toString());
			}
		%>
	</p>
    <p>本網站照片來源皆來自<a href="https://www.adidas.com.tw/" target="_blank"> 愛迪達官網</a></p>
    <script>writeclock()</script>
          </div></center>

</body>
</html>