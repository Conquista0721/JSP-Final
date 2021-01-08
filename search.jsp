<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品搜尋</title>

    <style type="text/css">
        @import"css/manager.css";
        @import "css/menu.css";
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
	
        <div class="content">
            <table width="50%" style="margin-top: 6rem;margin-bottom: 6rem;">
                <thead>
                    <tr >
                        <th colspan="3"><h2>商品搜尋</h2></th>
                    </tr>
                </thead>
                <tbody>
                    <tr >
						<td colspan="3">
						<form action="#" method="post">
                         <input type="search" name="target" placeholder="請輸入要搜尋的商品" style=" text-align: center;font-size: 1.2rem;margin: 2rem 0 2rem 25%;">
						  <button type="submit" class="btn btn-primary" style="text-align: center;font-size: 1.2rem;margin: 2rem 0 2rem 16%;"><b>搜尋</b></button>
						</form>
						</td>
						
                    </tr>
					<%
                    ResultSet tmp=null;
					try
					{
						try
						{
							String tar = new String(request.getParameter("target").getBytes("ISO-8859-1"),"UTF-8");
                            sql="SELECT * FROM product WHERE (p_name like '%"+tar+"%')";
						}
						catch(Exception e)
                        {
                            sql="SELECT * FROM product;";
                        }
						tmp=con.createStatement().executeQuery(sql);
					
					while(tmp.next())
                    {
						out.println("<tr >");
						out.println("<td width='25%'>");
						out.println("<b>"+tmp.getString("p_name")+"</b>");
						out.println("</td>");	
						out.println("<td width='45%'>");	
						out.println("<a href=>"+"<img src='"+tmp.getString("p_image")+"' class='img1' style='margin: 2rem 0 0rem 10%;width: 60%;height: 20%;' >"+"</a>");	
						out.println("</td>");	
						out.println("<td width='30%'>");	   
						out.println("<a href>"+"<button type='submit' class'btn btn-primary' style='text-align: center;font-size: 0.8rem;margin: 2rem 0 2rem 16%;'>"+"<b>"+"加入購物車"+"</b>"+"</button>"+"</a>");	   
						out.println("<a href>"+"<button type='submit' class='btn btn-primary' style='text-align: center;font-size: 0.8rem;'>"+"<b>"+"加入最愛"+"</b>"+"</button>"+"</a>");	
						out.println("</td>");	
						out.println("</tr>");			
					}
					}
					catch(Exception e)
                    {
                        out.write("<script language=javascript>alert('查無此資料');</script>"); 
                        response.setHeader("refresh","0");
                    }
					%>      
                </tbody>
            </table>
        </div>
    </div>
    <footer class="footer">
        <div class="bgg">
            <center>
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
    </footer>
</body>

</html>