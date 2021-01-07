<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@include file="getDB.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    <li><a href="login.jsp">會員</a></li>
                    <li><a href="register.jsp">非會員</a></li>
                    <li><a href="login.jsp">管理者</a></li>
                </ul>
            </li>
    
            <li><a href="#">MEMBER</a>
                <ul>
                    <li><a href="personal information.jsp">個人資料</a></li>
                    <li><a href="#">我的收藏</a></li>
                    <li><a href="car.jsp">購物車</a></li>
                </ul>
            </li>
        </ul>
       </center> 
         </div>
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
</div></div> 



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