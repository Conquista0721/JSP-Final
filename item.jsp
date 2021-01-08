<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品詳細</title>

    <style type="text/css">
 
        @import "css/menu.css";
        @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap");
        @import "css/menu.css";
        @import"css/home.css";
        @import"css/divv2.css";
        @import"css/item.css";
        @import"css/buttom.css";
        @import"css/score.css";
       </style>

<script src="js/clock.js"></script>
<script src="js/item.js"></script>

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
					<li><a href="logout.jsp">登出</a>
					
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
     <div class="divv2"><center>
		
		<%
            ResultSet pp = null;
            ResultSet rs = null;
            String aa=request.getParameter("p_id");
            sql="SELECT * FROM product WHERE p_id='"+aa+"'";
            pp = con.createStatement().executeQuery(sql);
            if(pp.next()){
        %>
		
        <div style="padding: 1em 0;" class="divv2">
            <div id="slider1" class="csslider">
                <input type="radio" name="slides" id="slides_1" />
                <input type="radio" name="slides" id="slides_2" checked />
                <input type="radio" name="slides" id="slides_3" />
                <input type="radio" name="slides" id="slides_4" />
                <ul>
                    <li>
                        <img src="<%=pp.getString("p_image")%>">
                    </li>
                    <li>
                        <img src="<%=pp.getString("p_image2")%>" />
                    </li>
                    <li>
                        <img src="<%=pp.getString("p_image3")%>">
                    </li>

                </ul>
                <div class="arrows">
                    <label for="slides_1"></label>
                    <label for="slides_2"></label>
                    <label for="slides_3"></label>

                </div>
                <div class="navigation">
                    <div>
                        <label for="slides_1"></label>
                        <label for="slides_2"></label>
                        <label for="slides_3"></label>

                    </div>
                </div>
            </div></center>
        </div>
		
		<%
			}
		%>
     </div>


	<div>
        <h class="name">商品名稱:<%=pp.getString("p_name")%></h><br>
        <h class="name2">價格:<%=pp.getString("p_price")%></h>
    </div>

		<center>
			<img src="img/選擇尺寸.png" class="size">
			<div class="abgne-menu-20140101-1">
				<input type="radio" id="8" name="sex">
				<label for="8">8</label>
				<input type="radio" id="8.5" name="sex">
				<label for="8.5">8.5</label>
				<input type="radio" id="9" name="sex">
				<label for="9">9</label>
				<input type="radio" id="9.5" name="sex">
				<label for="9.5">9.5</label>
				<input type="radio" id="10" name="sex">
				<label for="10">10</label>
				<input type="radio" id="10.5" name="sex">
				<label for="10.5">10.5</label>
				<input type="radio" id="11" name="sex">
				<label for="11">11</label>
				<input type="radio" id="11.5" name="sex">
				<label for="11.5">11.5</label>
			</div>
		</center>

		<center>
			<img src="img/選擇數量.png" class="size">
			<div class="abgne-menu-20140101-2">
				<input type="radio" id="1" name="math">
				<label for="1">1</label>
				<input type="radio" id="2" name="math">
				<label for="2">2</label>
				<input type="radio" id="3" name="math">
				<label for="3">3</label>
				<input type="radio" id="4" name="math">
				<label for="4">4</label>
				<input type="radio" id="5" name="math">
				<label for="5">5</label>
			</div>
		</center>

	<center><button class="but"><img src="img/加入收藏.png" class="car"></button><button class="but"><img src="img/加入購物車.png" class="car"></button></center>

     <div class="border">
		<h2><%=pp.getString("p_textarea")%></h2>
     </div>


     <div class="word2">
        <img src="img/頭貼.png" class="head1">
          <br>
          名字:<br>
          <input placeholder="請輸入名字" class="input"><br>
          <center>
          
<div class="scoreEvaluation">

    <div class="title"></div>
    
    <div class="scoringDevice clearfix">
    
    <img src="img/star.png" alt="分数" class="scoreImg fl" data-index='1' onclick="scoreFunc(event)" />
    
    <img src="img/star.png" alt="分数" class="scoreImg fl" data-index='2' onclick="scoreFunc(event)" />
    
    <img src="img/star.png" alt="分数" class="scoreImg fl" data-index='3' onclick="scoreFunc(event)" />
    
    <img src="img/star.png" alt="分数" class="scoreImg fl" data-index='4' onclick="scoreFunc(event)" />
    
    <img src="img/star.png" alt="分数" class="scoreImg fl" data-index='5' onclick="scoreFunc(event)" />
    
    </div>
    
    </div>
             </center>
  <br>
          評論:<br>
          <textarea name="mytext"
                rows="8"
                cols="65"
                required
                class="aa"></textarea>
                <br>
                <button class="but"><img src="img/送出.png" class="car2">
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