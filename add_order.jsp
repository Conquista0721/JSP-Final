<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp" %>
<body>
	<%
        request.setCharacterEncoding("utf-8");
		String lid=request.getParameter("lid");
		String pid=request.getParameter("pid");
		String ldate=request.getParameter("ldate");
		String lnumber=request.getParameter("lnumber");
		String maccount=request.getParameter("maccount");
		String laddress=request.getParameter("laddress");
		String lphone=request.getParameter("lphone");
		try{
			if(pid==null||pid.equals("")||ldate==null||ldate.equals(""))
			{
				out.write("<script language=javascript>alert('必填欄位不能為空');</script>");
				response.setHeader("refresh","0;URL=bk_order.jsp");
			}
			else 
			{
				String sql2="select * from shoppinglist where l_id='"+lid+"';";
				ResultSet a=con.createStatement().executeQuery(sql2);
				if(a.next())
				{	
				out.write("<script language=javascript>alert('訂單重複');</script>");
				response.setHeader("refresh","0;URL=bk_order.jsp");
				}
				else
				{
				sql="INSERT INTO jspfinal.shoppinglist(date,p_id,l_number,m_account,l_address,l_phone) values('"+ldate+"','"+pid+"','"+lnumber+"','"+maccount+"','"+laddress+"','"+lphone+"');";
				con.createStatement().execute(sql); 
				out.write("<script language=javascript>alert('下單成功');</script>");
				response.setHeader("refresh","0;URL=bk_order.jsp");
				}
			}
		}
		catch(Exception e){
			out.write("<script language=javascript>alert('下單錯誤');</script>");
			response.setHeader("refresh","0;URL=bk_order.jsp");
		}
	%>
</body>