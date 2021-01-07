<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登入</title>
<style type="text/css">
 @import"css/login.css";
 @import "css/menu.css";
 @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap");
</style>
<script src="js/clock.js"></script>
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
     
     <div class="video">
         <img src="img/line.png">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/uBcVc2iFzkU" frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        <img src="img/line.png">
    </div>
	<form action="tologin.jsp" method="post">
		<div class="b"> <center>
			<img src="img/login.png" class="pc"><br><br><br>
		   
			帳號:<br><br><input type="text" placeholder="輸入帳號" class="input" name="acc"><br>
		
			密碼:<br><br><input type="password" placeholder="輸入密碼" class="input" name="psd"><br>

			<button class="buttt" type="submit"><img src="img/登入.png" class="pc2"></button>
			<button class="buttt"><img src="img/註冊.png" class="pc2"></button>
			<button class="buttt"><img src="img/忘記密碼.png" class="pc3"></button>
			</center>
		</div>
	</form>
   
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
<br>
<br>
<br>
<br>

    
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