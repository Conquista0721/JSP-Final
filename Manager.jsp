<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理者介面</title>

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
    <div class="box"><a href="#">TOP</a></div>
    <div id="menu"> 
        <a href="index.jsp"><img src="img/商標.png" class="img1"></a>
        <center>
			<ul class="drop-down-menu">
				<li><a href="#">ABOUT US</a>
					<ul>
						<li><a href="#">關於我們</a></li>
						<li><a href="#">常見問題</a></li>
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
        <div class="content">
            <table width="50%" style="margin-top: 6rem;margin-bottom: 6rem;">
                <thead>
                    <tr >
                        <th colspan="2"><h2>商品上架管理</h2></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td >
                            <input placeholder="請輸入要搜尋的商品" style="text-align: center;font-size: 1.2rem;margin: 2rem 0 2rem 25%;">
                        </td>
                        <td>
                            <button class="insert" type="button" class="btn btn-primary" style="text-align: center;font-size: 1.2rem;margin: 2rem 0 2rem 25%;"><b>新增產品</b></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <img src="img/商標.png" class="img1" style="margin: 2rem 0 2rem 15%;width: 50%;height: 70%;" >
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" style="text-align: center;font-size: 1.2rem;margin: 2rem 0 2rem 16%;"><b>編輯</b></button>
                            <button type="button" class="btn btn-primary" style="text-align: center;font-size: 1.2rem;"><b>刪除</b></button>
                        </td>                    
                    </tr>
                    <tr>
                        <td>
                           <img src="img/商標.png" class="img1" style="margin: 2rem 0 2rem 15%;width: 50%;height: 70%;" >
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" style="text-align: center;font-size: 1.2rem;margin: 2rem 0 2rem 16%;"><b>編輯</b></button>
                            <button type="button" class="btn btn-primary" style="text-align: center;font-size: 1.2rem;"><b>刪除</b></button>
                        </td>                    
                    </tr>
                    <tr>
                        <td>
                           <img src="img/商標.png" class="img1" style="margin: 2rem 0 2rem 15%;width: 50%;height: 70%;" >
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" style="text-align: center;font-size: 1.2rem;margin: 2rem 0 2rem 16%;"><b>編輯</b></button>
                            <button type="button" class="btn btn-primary" style="text-align: center;font-size: 1.2rem;"><b>刪除</b></button>
                        </td>                    
                    </tr>
                    
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