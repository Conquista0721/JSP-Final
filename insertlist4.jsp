<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="getDB.jsp"%>

<%

    String q = request.getParameter("quantity");
    String p_id = request.getParameter("pid");
    String acc = "";
    String pas = "";
    ResultSet a=null;


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
                            out.write("<script language=javascript>alert('歡迎管理員');</script>");
                        response.setHeader("refresh","0;URL=back_index.jsp") ;
                        }
                        else
                        {

                

            

                 sql="SELECT * FROM member WHERE m_account='"+acc+"' and m_password='"+pas+"'";
                ResultSet man=con.createStatement().executeQuery(sql);
                man.next();
                if(man.getString("m_level").equals("0"))
                    {
                        String sql2="select * from shopping_cart,product where m_account='"+acc+"' and shopping_cart.p_id='"+p_id+"' and shopping_cart.p_id=product.p_id";
                        a=con.createStatement().executeQuery(sql2);
                        if(a.next()){
                            sql="update shopping_cart set amount='"+String.valueOf(Integer.valueOf(a.getString("amount"))+Integer.valueOf(q))+"' where m_account='"+acc+"'and p_id='"+p_id+"';";
                            con.createStatement().execute(sql);
                            out.write("<script language=javascript>alert('再次將「"+a.getString("p_name")+"x"+q+"」加入購物車!');</script>");
                        }
                        else{
                            sql="INSERT INTO shopping_cart(p_id, amount, m_account) VALUE('"+p_id+"','"+q+"','"+acc+"');";
                            con.createStatement().execute(sql);
                            out.write("<script language=javascript>alert('成功加入購物車!');</script>");
                                   

                        }

                            response.setHeader("refresh","0;URL=item.jsp?p_id="+p_id+"");

                    }
                else
                     {
                        out.write("<script language=javascript>alert('非會員，請先登入');</script>");
                        response.setHeader("refresh","0;URL=index.jsp");
                    }
                }
            }
        }
              catch(Exception e){
               out.write("<script language=javascript>alert('非會員，請先登入');</script>");
                        response.setHeader("refresh","0;URL=index.jsp");
          }
          

%>