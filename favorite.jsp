<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<html>
<head>
 <meta charset="UTF-8">
 <title>我的收藏</title>
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
<table id="cartTable">
 <thead>
  <tr>
  
   <th>商品</th>
   <th>單價</th>
   <th>加入購物車</th>
   <th>操作</th>
  </tr>
 </thead>
 <tbody>
	<%//jsp連接前端範例
			sql="SELECT * FROM  product, love WHERE love.m_account='"+acc+"' AND love.p_id=product.p_id; ";
			ResultSet tmp = con.createStatement().executeQuery(sql);
            int count = 0;
			while(tmp.next()){
				out.print("<tr>");
				out.print("<td class='goods'>"+"<a href='item.jsp?p_id="+tmp.getString("p_id")+"'/>"+"<img src='"+tmp.getString("p_image")+"'/>"+"<span>"+tmp.getString("p_name")+"</span>"+"</a>"+"</td>");
				out.print("<td class='price'>"+tmp.getString("p_price")+"</td>");
				out.print("<td>"+"<a href='add_shopping.jsp?p_id="+tmp.getString("p_id")+"&act=buy2&amount=1&outlink=2' />"+"加入購物車"+"</a>"+"</td>");
				out.print("<td class='operation'>"+"<a href='del_favorite.jsp?love_id="+tmp.getString("love_id")+"'"+"<span class='delete'>"+"刪除"+"</span>"+"</a>"+"</td>");
				out.print("</tr>");
			}	
	%>
	
	<!--
		<tr>
			<td class="checkbox"><input class="check-one check" type="checkbox"/></td>
			<td class="goods"><img src="img/shoe1.jpg" alt=""/><span>鞋子一</span></td>
			<td class="price">2500</td>
			<td class="count">
				<span class="reduce"></span>
				<input class="count-input" type="text" value="1"/>
				<span class="add">+</span>
			</td>
			<td class="subtotal">2500</td>
			<td class="operation"><span class="delete">刪除</span></td>
		</tr>
		<tr>
		    <td class="checkbox"><input class="check-one check" type="checkbox"/></td>
		    <td class="goods"><img src="img/shoe4.jpg" alt=""/><span>鞋子二</span></td>
		    <td class="price">3500</td>
		    <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
		    <td class="subtotal">3500</td>
			<td class="operation"><span class="delete">刪除</span></td>
		</tr>
		<tr>
		    <td class="checkbox"><input class="check-one check" type="checkbox"/></td>
		    <td class="goods"><img src="img/shoe9.jpg" alt=""/><span>鞋子三</span></td>
		    <td class="price">2000</td>
		    <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
		    <td class="subtotal">2000</td>
		    <td class="operation"><span class="delete">刪除</span></td>
		</tr>
		<tr>
		    <td class="checkbox"><input class="check-one check" type="checkbox"/></td>
		    <td class="goods"><img src="img/shoe6.jpg" alt=""/><span>鞋子四</span></td>
		    <td class="price">3000</td>
		    <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
		    <td class="subtotal">3000</td>
		    <td class="operation"><span class="delete">刪除</span></td>
		</tr>
	-->
 </tbody>
</table>
	<!--
		<div class="foot" id="foot">
			 <label class="fl select-all"><input type="checkbox" class="check-all check"/> 全選</label>
			 <a class="fl delete" id="deleteAll" href="javascript:;">刪除</a>
			 <div class="fr closing">加入購物車</div>
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
		</div>
	-->
</center>
<script>

</script>



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