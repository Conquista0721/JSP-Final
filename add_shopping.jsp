<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ include file="getDB.jsp"%>

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
         if(acc==null||acc.equals("")||pas==null||pas.equals("")){
         out.write("<script language=javascript>alert('請先登入');</script>");
        
         response.setHeader("refresh","0;URL=login.jsp") ;
        }
        else{
            
            sql="SELECT * FROM member WHERE m_account='"+acc+"' and m_password='"+pas+"'";
            ResultSet ins=con.createStatement().executeQuery(sql);
            ins.next();
                if(ins.getString("m_level").equals("1"))
                {
                    out.write("<script language=javascript>alert('歡迎管理員大大');</script>");
                    response.setHeader("refresh","0;URL=back_index.jsp") ;
                }
                else
                {
                     
    String act = (String) request.getParameter("act");
    String amount = (String) request.getParameter("amount");
    String p_id = request.getParameter("p_id");
    ResultSet rs2=con.createStatement().executeQuery("SELECT * FROM product WHERE p_id='"+p_id+"'; ");
    rs2.next();
    if(act!=null)
    {
        /*total = String.valueOf(Integer.parseInt(amount)*Integer.parseInt(rs2.getString("p_price")));
       "*/
        if(act.equals("buy"))
        {
            
             String sql2="select * from shopping_cart where m_account='"+acc+"' and p_id='"+p_id+"'";
            ResultSet a=con.createStatement().executeQuery(sql2);
            if(a.next()){
                sql="update shopping_cart set amount='"+String.valueOf(Integer.valueOf(a.getString("amount"))+Integer.valueOf(amount))+"' where m_account='"+acc+"'and p_id='"+p_id+"';";
                con.createStatement().execute(sql);
                out.write("<script language=javascript>alert('再次將「"+rs2.getString("p_name")+"x"+amount+"」加入購物車!');</script>");
            }
            else{
                sql="INSERT INTO shopping_cart(p_id, amount, m_account) VALUE('"+p_id+"','"+amount+"','"+acc+"');";
                con.createStatement().execute(sql);
                out.write("<script language=javascript>alert('成功將「"+rs2.getString("p_name")+"x"+amount+"」加入購物車!');</script>");        

            }
        }
        else if(act.equals("buy2"))//我的最愛
        {
            String sql2="select * from shopping_cart where m_account='"+acc+"' and p_id='"+p_id+"'";
            ResultSet a=con.createStatement().executeQuery(sql2);
            if(a.next()){
                sql="update shopping_cart set amount='"+String.valueOf(Integer.valueOf(a.getString("amount"))+Integer.valueOf(amount))+"' where m_account='"+acc+"'and p_id='"+p_id+"';";
                con.createStatement().execute(sql);
                out.write("<script language=javascript>alert('再次將「"+rs2.getString("p_name")+"x"+amount+"」加入購物車!');</script>");
            }
            else{
                sql="INSERT INTO shopping_cart(p_id, amount, m_account) VALUE('"+p_id+"','"+amount+"','"+acc+"');";
                con.createStatement().execute(sql);
                out.write("<script language=javascript>alert('成功將「"+rs2.getString("p_name")+"x"+amount+"」加入購物車!');</script>");        

            }

          
        }

       else if(act.equals("love"))
       {
            String sql2="select * from love where m_account='"+acc+"' and p_id='"+p_id+"';";
            ResultSet a=con.createStatement().executeQuery(sql2);
            if(a.next()){
                    out.write("<script language=javascript>alert('已經收入最愛囉!');</script>");
            }
            else{
                sql="INSERT INTO love(p_id, m_account) VALUE('"+p_id+"','"+acc+"');";
            con.createStatement().execute(sql);
            out.write("<script >alert('成功將「"+rs2.getString("p_name")+"x"+amount+"」加入收藏!');</script>");
            }
       }
       else if(act.equals("love2"))
       {
            String sql2="select * from love where m_account='"+acc+"' and p_id='"+p_id+"';";
            ResultSet a=con.createStatement().executeQuery(sql2);
            if(a.next()){
                    out.write("<script language=javascript>alert('已經收入最愛囉!');</script>");
                    response.setHeader("refresh","0;URL=all_single.jsp?p_id="+p_id+"");
            }
            else{
                sql="INSERT INTO love(p_id, m_account) VALUE('"+p_id+"','"+acc+"');";
                con.createStatement().execute(sql);
                out.write("<script >alert('成功將「"+rs2.getString("p_name")+"x"+amount+"」加入收藏!');</script>");
                response.setHeader("refresh","0;URL=all_single.jsp?p_id="+p_id+"");
           
            }
           
       }
    }
    try{
        String outlink=(String)request.getParameter("outlink");
        if(outlink.equals("1"))
        {
            out.println("<script>window.open('index.jsp','_self')</script>");
        }
        else if(outlink.equals("2"))
        {
            out.println("<script>window.open('all_products.jsp','_self')</script>");
        }
    }
    catch(Exception e)
    {

    }
                }
    
    
            }
           
    
   
   
%>