<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊</title>

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
    
            <li>
				<a href="login.jsp">登入</a>
            </li>
    
            <li>
				<a href="register.jsp">註冊</a>
            </li>
        </ul>
			</center> 
        </div>
			<center>
			  <div class="video2"> 
					<img src="img/line.png"><br>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/zkzxheV-LpE" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><br>
					<img src="img/line.png">
				</div>
				<form action="regis.jsp" method="post">
					<div class="word">
						<img src="img/填寫資料.png" class="pc4">
						<br>
							
							帳號:<input type="text" placeholder="輸入帳號" class="input" name="acc">
							密碼:<input type="password" placeholder="輸入密碼" class="input" name="psd">
							電子信箱:<input type="password" placeholder="輸入信箱" class="input" name="eml">
							
						<button class="buttt" type="submit"><img src="img/註冊.png" class="pc2" onclick="location.href='regis.jsp'">
					</div>
				</form>
			</center>


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