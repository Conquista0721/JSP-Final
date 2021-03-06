<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@include file="getDB.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首頁</title>

    <style type="text/css">
    @import"css/home.css";
    @import"css/div2.css";
    @import"css/div1.css";
    @import "css/menu.css";
    @import "css/container projects.css";
    @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap");
    </style>
<script src="js/home.js"></script>
<script src="js/clock.js"></script>

<script>
    
</script> 
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
		<div class="bo"><a href="search.jsp">搜尋</a></div>
        <div id="menu"> 
            <a href="index.jsp"><img src="img/商標.png" class="img1"></a>
            <center>
			<ul class="drop-down-menu">
            <li><a href="about us.jsp">ABOUT US</a>
                <ul>
                    <li><a href="about us.jsp">關於我們</a></li>
                    <li><a href="about us.jsp">常見問題</a></li>
                </ul>
            </li>
    
            <li><a href="commodity.jsp">MENU</a>
                <ul>
                    <li><a href="commodity.jsp">熱門商品</a></li>
                    <li><a href="commodity.jsp">休閒鞋款</a></li>
                    <li><a href="commodity.jsp">籃球鞋款</a></li>
                    <li><a href="commodity.jsp">慢跑鞋款</a></li>
                </ul>
            </li>
    
            <li><a href="login.jsp">登入</a></li>
			<li><a href="register.jsp">註冊</a></li>
			
			</ul>
			</center> 
        </div>
    <%
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
       
<br>
<br>
<br>
    <div id="cover" class="coverflow" class="div1">
		<a href="#"><img src="img/1.png"></a>
        <a href="#"><img src="img/2.png"></a>
        <a href="#"><img src="img/3.png"></a>
    </div>

    <div>
        <br>
        <br>
        <br>
        <br>
        <br>
    </div>
	<div class = 'container projects'>
        <h1>impossible is nothing</h1>
    <div class="overlay"></div>
    </div>
     <div>
        <br>
        <br>
        <br>
        <br>
        <br>
    </div>

<div class="div2">
<div style="padding: 1em 0;" class="div2">
	<div id="slider1" class="csslider">
		<input type="radio" name="slides" id="slides_1" />
		<input type="radio" name="slides" id="slides_2" checked />
		<input type="radio" name="slides" id="slides_3" />
		<input type="radio" name="slides" id="slides_4" />
		<ul>
			<li>
                <img src="img/4.png">
			</li>
			<li>
				<img src="img/5.png" />
			</li>
			<li>
                <img src="img/6.png">
			</li>
			<li>
				<img src="img/7.png">
			</li>
		</ul>
		<div class="arrows">
			<label for="slides_1"></label>
			<label for="slides_2"></label>
			<label for="slides_3"></label>
			<label for="slides_4"></label>
		</div>
		<div class="navigation">
			<div>
				<label for="slides_1"></label>
				<label for="slides_2"></label>
				<label for="slides_3"></label>
				<label for="slides_4"></label>
			</div>
		</div>
	</div>
</div>

		<!--隨機廣告板-->
		<%
           ResultSet rs;
           con.createStatement().execute(sql);
           Random ran=new Random();
           int current_adid=ran.nextInt(3);            
           sql="SELECT * FROM `randad` WHERE `adid`= " + current_adid;
           rs=con.createStatement().executeQuery(sql);
           while (rs.next())
           {
             out.println("<a href='httsps://"+rs.getString(4)+"'>");
             out.println("<img src='"+rs.getString(2)+"/"+rs.getString(3)+"'");
             out.println(" alt='"+rs.getString(5)+"'></a>");
           }
		%>

</div> 



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