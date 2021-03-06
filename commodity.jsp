<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品頁面</title>
  <style type="text/css">
    @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap");
    @import"css/word.css";
    @import"css/item.css";
    @import"css/menu.css";
    @import"css/word2.css";
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
		<div class="bo"><a href="search.jsp">搜尋</a></div>
        <div id="menu"> 
            <a href="index.jsp"><img src="img/商標.png" class="img1"></a>
            <center>
        <ul class="drop-down-menu">
            <li><a href="#">ABOUT US</a>
                <ul>
                    <li><a href="about us.jsp#mark5">關於我們</a></li>
                    <li><a href="about us.jsp#mark">常見問題</a></li>
                </ul>
            </li>
    
            <li><a href="#">MENU</a>
                <ul>
                    <li><a href="commodity.jsp#mark1">熱門商品</a></li>
                    <li><a href="commodity.jsp#mark2">休閒鞋款</a></li>
                    <li><a href="commodity.jsp#mark3">籃球鞋款</a></li>
                    <li><a href="commodity.jsp#mark4">慢跑鞋款</a></li>
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
                    <li><a href="about us.jsp#mark5">關於我們</a></li>
                    <li><a href="about us.jsp#mark">常見問題</a></li>
                </ul>
            </li>
    
            <li><a href="#">MENU</a>
                <ul>
                    <li><a href="commodity.jsp#mark1">熱門商品</a></li>
                    <li><a href="commodity.jsp#mark2">休閒鞋款</a></li>
                    <li><a href="commodity.jsp#mark3">籃球鞋款</a></li>
                    <li><a href="commodity.jsp#mark4">慢跑鞋款</a></li>
                </ul>
            </li>
            
				<li><a href="#">會員中心</a>
					<ul>
						<li><a href="personal information.jsp">個人資料</a></li>
						<li><a href="favorite.jsp">我的收藏</a></li>
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
		
	<div class="centered" id="mark1">
	
		<center>
			<h1>
			<span>熱</span>
			<span>門</span>
			<span>商</span>
			<span>品</span>

			</br>
			<span>p</span>
			<span>o</span>
			<span>p</span>
			<span>u</span>
			<span>l</span>
			<span>a</span>
			<span>r</span>
		  </h1>
		</center>

	</div>

  <div id="jogging">
	  <%//jsp連接前端範例
			sql="SELECT * FROM product ORDER BY p_hot DESC LIMIT 3; ";
			
			ResultSet rs=con.createStatement().executeQuery(sql);
			
			while(rs.next()){
				out.print("<div class='com'>");
				out.print("<img src='"+rs.getString("p_image")+"' ");
				out.print("class='img'>"+"<br>");
				out.print("<a href='item.jsp?p_id="+rs.getString("p_id")+"'>");
				out.print("<input type='button' value='詳細' style='width:300px;height:50px;'></a></div>");
			}	
	  %>
    
    <!--
    <div class="com">
      <img src="img/shoe1.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
    <div class="com">
      <img src="img/shoe6.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
    <div class="a">
      <img src="img/shoe8.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
	-->

  </div>
<div> 
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
<br>
</div>
  <div class="centered"id="mark2">

    <center>
      <h1>
        <span>休</span>
        <span>閒</span>
        <span>鞋</span>
        <span>款</span>

        </br>
        <span>C</span>
        <span>a</span>
        <span>s</span>
        <span>u</span>
        <span>a</span>
        <span>l</span>

      </h1>

  </div>
  </center>
  <div id="jogging">
	<%//jsp連接前端範例
			sql="SELECT DISTINCT p_image, p_class, p_id FROM product WHERE p_class='1'; ";
			rs=con.createStatement().executeQuery(sql);
			
			while(rs.next()){
				out.print("<div class='com'>");
				out.print("<img src='"+rs.getString("p_image")+"' ");
				out.print("class='img'>"+"<br>");
				out.print("<a href='item.jsp?p_id="+rs.getString("p_id")+"'>");
				out.print("<input type='button' value='詳細' style='width:300px;height:50px;'></a></div>");
			}	
	%>
  <!--
    <div class="com">
      <img src="img/shoe1.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
    <div class="com">
      <img src="img/shoe2.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
    <div class="a">
      <img src="img/shoe3.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
  -->
  </div>
<div> 
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
<br>
</div>
  <div class="centered"id="mark3">

    <center>
      <h1>
        <span>籃</span>
        <span>球</span>
        <span>鞋</span>
        <span>款</span>

        </br>
        <span>b</span>
        <span>a</span>
        <span>s</span>
        <span>k</span>
        <span>e</span>
        <span>t</span>
        <span>b</span>
        <span>a</span>
        <span>l</span>
        <span>l</span>

      </h1>

  </div>
  </center>


  </div>

  <div id="jogging">
	<%//jsp連接前端範例
			sql="SELECT DISTINCT p_image, p_class, p_id FROM product WHERE p_class='2'; ";
			rs=con.createStatement().executeQuery(sql);
			
			while(rs.next()){
				out.print("<div class='com'>");
				out.print("<img src='"+rs.getString("p_image")+"' ");
				out.print("class='img'>"+"<br>");
				out.print("<a href='item.jsp?p_id="+rs.getString("p_id")+"'>");
				out.print("<input type='button' value='詳細' style='width:300px;height:50px;'></a></div>");
			}	
	%>
  <!--
    <div class="com">
      <img src="img/shoe4.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
    <div class="com">
      <img src="img/shoe5.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
    <div class="a">
      <img src="img/shoe6.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
  -->
  </div>

<div> 
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
<br>
</div>

  <div class="centered" id="mark4">


    <center>
      <h1>
        <span>慢</span>
        <span>跑</span>
        <span>鞋</span>
        <span>款</span>

        </br>
        <span>j</span>
        <span>o</span>
        <span>g</span>
        <span>g</span>
        <span>i</span>
        <span>n</span>
        <span>g</span>

      </h1>

  </div>
  </center>



  </div>

  <div id="jogging">
	<%//jsp連接前端範例
			sql="SELECT DISTINCT p_image, p_class, p_id FROM product WHERE p_class='3'; ";
			rs=con.createStatement().executeQuery(sql);
			
			while(rs.next()){
				out.print("<div class='com'>");
				out.print("<img src='"+rs.getString("p_image")+"' ");
				out.print("class='img'>"+"<br>");
				out.print("<a href='item.jsp?p_id="+rs.getString("p_id")+"'>");
				out.print("<input type='button' value='詳細' style='width:300px;height:50px;'></a></div>");
			}		
	%>
  <!--
    <div class="com">
      <img src="img/shoe7.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
    <div class="com">
      <img src="img/shoe8.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
    <div class="a">
      <img src="img/shoe9.jpg" class="img"><br>
      <a href=""> <input type="button" value="詳細" style="width:300px;height:50px;"></a>
    </div>
  -->
  </div>
  
  </center>
  <div>
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
    <br>
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