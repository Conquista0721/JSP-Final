<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@ include file="getDB.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>關於我們</title>

    <style type="text/css">
        @import "css/about.css";
        @import "css/menu.css";
        @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap");



    </style>

<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
    <SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
    
    
    function btnDivShow_onclick() {
        div1.style.display='';
    }
    
    function btnDivH_onclick() {
        div1.style.display='none';
    }
    
    
    function btnDivShow2_onclick() {
        div2.style.display='';
    }
    
    function btnDivH2_onclick() {
        div2.style.display='none';
    }
    
    function btnDivShow3_onclick() {
        div3.style.display='';
    }
    
    function btnDivH3_onclick() {
        div3.style.display='none';
    }
    
    function btnDivShow4_onclick() {
        div4.style.display='';
    }
    
    function btnDivH4_onclick() {
        div4.style.display='none';
    }
    
    </SCRIPT>
<script src="js/clock.js"></script>
<script src="js/about.js"></script>
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
						<li><a href="#">我的收藏</a></li>
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



    <div>
		<img src="img/愛迪達.webp" class="pc">
    </div>
    <div class="div"></div>

    <div class="div2">adidas，全球最著名的運動品牌。<br>
        從德國鄉間一個平凡的製鞋匠開始，發展出最經典最完美，讓全世界各種不同運動項目的選手都愛用的各項運動產品。<br><br>
        adidas創辦人Adi Dassler先生基於他對運動的熱愛及對創新的堅持，創造出全世界最偉大的品牌！<br>
        今天，全球160多個國家都能買到adidas的運動鞋、運動服和背袋，球類等運動用品。<br>
        超過50家子公司、合夥企業和授權代理商，鞏固了adidas產品在全球運動用品市場的占有率。<br>
        adidas產品的銷售分為五大區：歐洲中東地區、非洲地區、北美地區、亞太地區和拉丁美洲。<br><br>
        至今，adidas是全歐洲最大的運動鞋和運動服供應商。<br>
        adidas品牌提出一創新的商業策略，目標在於擴展顧客基礎帶動業績成長，<br>
        這項策略的重點在於將傳統的「運動鞋」和「運動服」雙重點結構，轉型成「專業運動Sport Performance」、<br>
        「運動時尚Sport Style」，讓adidas的商品更能符合消費者的各式需求。<br>
    </div>
    <div>
 
    </div>




<div class="ques3">
    <div>
        <FORM action="" method=POST id=form1 name=form1 class="ques">
        <br>
        如何成為購物網站會員？<br>
        <INPUT type="button" value="顯示內容" id=btnDivShow  LANGUAGE=javascript onclick="return btnDivShow_onclick()">
            <div id=div1 style="display:none">
        <hr>
        您可以點選購物網站頁面上方的非會員，並且填寫資料。<br>
        註冊時，請驗證您的手機號碼，並完整填寫個人資料。<br>
        提醒您，為保障您個人權益，填寫時請提供真實個人資訊。<br>
        <INPUT type="button" value="關閉" id=btnDivH  LANGUAGE=javascript onclick="return btnDivH_onclick()"><br>
        
        <hr>
        </div>
        </div>
        
        
        <div class="ques2">
            <FORM action="" method=POST id=form1 name=form1 >
            <br>
           我可以使用超商取貨付款嗎？<br>
            <INPUT type="button" value="顯示內容" id=btnDivShow2  LANGUAGE=javascript onclick="return btnDivShow2_onclick()">
                <div id=div2 style="display:none">
            <hr>
          目前購物網站只提供超商取貨付款服務<br>
            <INPUT type="button" value="關閉" id=btnDivH2  LANGUAGE=javascript onclick="return btnDivH2_onclick()"><br>
            
            <hr>
            </div>
            </div>
            
            <div class="ques2">
                <FORM action="" method=POST id=form1 name=form1 >
                <br>
                購買的商品何時會出貨？<br>
                <INPUT type="button" value="顯示內容" id=btnDivShow3  LANGUAGE=javascript onclick="return btnDivShow3_onclick()">
                    <div id=div3 style="display:none">
                <hr>
                當您確定成立訂單後，正常狀況下我們會在1至3個工作天內完成出貨。<br>
                出貨時間為星期一至星期五 (國定假日除外)。<br>
                若於例假日期間下的訂單，處理及出貨時間可能會有所延遲。<br>
                <INPUT type="button" value="關閉" id=btnDivH3  LANGUAGE=javascript onclick="return btnDivH3_onclick()"><br>
                
                <hr>
                </div>
                </div>
        
                <div class="ques2">
                    <FORM action="" method=POST id=form1 name=form1 >
                    <br>
                    如果在這裡找不到我的問題怎麼辦？<br>
                    <INPUT type="button" value="顯示內容" id=btnDivShow4  LANGUAGE=javascript onclick="return btnDivShow4_onclick()">
                        <div id=div4 style="display:none">
                    <hr>
                    若您在網站幫助中心找不到您想諮詢的問題 ，請與我們網站的客服人員聯繫，謝謝。<br>
                    <INPUT type="button" value="關閉" id=btnDivH4  LANGUAGE=javascript onclick="return btnDivH4_onclick()"><br>
                    
                    <hr>
                    </div>
                    </div>
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