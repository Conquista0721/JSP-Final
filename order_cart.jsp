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
<br>

<center>

<div class="foot" id="foot">
 <label class="fl select-all"><input type="checkbox" class="check-all check"/> 全選</label>
 <a class="fl delete" id="deleteAll" href="javascript:;">刪除</a>
 <div class="fr closing">結 算</div>
 <div class="fr total">合計：$<span id="priceTotal">000</span></div>
 <div class="fr selected" id="selected">已選商品
  <span id="selectedTotal">0</span>件
  <span class="arrow up">︽</span>
  <span class="arrow down">︾</span>
 </div>
 <div class="selected-view">
  <div id="selectedViewList" class="clearfix">

  </div>
  <span class="arrow">◆<span>◆</span></span>
 </div>
</div></center>
<script>

</script>



<br>
<br>
<br>
<br>
<br>
</div>
<center>
<img src="img/訂購資料.png" class="pc3">
<div class="word1">
收件者姓名: <input type="text" placeholder="輸入姓名" class="input"><br><br>
手機號碼:<input type="text" placeholder="輸入手機號碼" class="input"><br><br>
取貨店家:<input type="text" placeholder="輸入取貨店家" class="input"><br><br>
(請寫全名。ex:全家 中壢復興店。)

</div></center>
<div><center><a href="index.jsp"><button class="butttt"><img src="img/訂購.png" class="pc4" onclick="myFunction()"></a></center> </div>

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