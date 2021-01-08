<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>個人資料</title>

    <style type="text/css">
        @import"css/login.css";
        @import "css/menu.css";
        @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap");
       </style>
<script src="js/clock.js"></script>
</head>


<body class="bg">   
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
			if(acc==null||acc.equals("")||pas==null||pas.equals(""))
		{
	%>

		<div class="box"><a href="#">TOP</a></div>
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
	%>
		<div class="box"><a href="#">TOP</a></div>
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
            
			<li><a href="#">hello</a>
				<ul>
					<li><a href="personal information.jsp">個人資料</a></li>
					<li><a href="#">我的收藏</a></li>
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

     <img src="img/個人資料.png" class="pc5">
    <div class="word1">
   名字: <br><input type="text" placeholder="輸入名字"class="input"><br><br>
    帳號:<br><input type="text" placeholder="輸入帳號" class="input"><br><br>
    密碼:<br><input type="password" placeholder="輸入密碼" class="input"><br><br>
	身分證: <br><input type="text" placeholder="輸入身分證" class="input"><br><br>
    手機號碼:<br><input type="text" placeholder="輸入手機號碼" class="input"><br><br>
    E-mail:<br><input type="text" placeholder="輸入e-mail" class="input"><br><br>
    <button class="buttt"><img src="img/修改.png" class="pc2">
 </div>
 
 <div>
     <img src="img/消費紀錄.png" class="pc6">
     <div class="span2">
<img src="img/頭貼.png" class="item2"><h class="item3">商品名稱</h><br><h class="item4">數量</h><br><h class="item4">價錢</h>
     </div>
     <div class="span3"></div>
     <div class="span2"></div>
 </div>
 <div>
    <img src="img/商品評論.png" class="pc6">
    <div class="span2">

        <img src="img/頭貼.png" class="item2"><h class="item3">名字</h><br><img src="img/1star.png" class="item5"></h><br><h class="item4">評論</h>

    </div>
    <div class="span3"></div>
    <div class="span2"></div>
 </div>
<div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

</div>
	<center>
	<div class="bgg">
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
	</div>
	</center>


</body>
</html>