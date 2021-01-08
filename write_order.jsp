<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp"%>
<html>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String [] lid=null;
		String [] pid=null;
		String [] ldate=null;
		String [] lnumber=null;
		String [] maccount=null;
		String [] laddress=null;
		String [] lphone=null;
		String [] ltotalprice=null;


			lid=request.getParameterValues("lid");
			pid=request.getParameterValues("pid");
			ldate=request.getParameterValues("ldate");
			lnumber=request.getParameterValues("lnumber");
			maccount=request.getParameterValues("maccount");
			laddress=request.getParameterValues("laddress");
			ltotalprice=request.getParameterValues("ltotalprice");
		    lphone=request.getParameterValues("lphone");
			for(int i=0;i<lid.length;i++)
			{	
			
			sql="UPDATE jspfinal.shoppinglist SET date='"+ldate[i]+"',p_id='"+pid[i]+"',l_number='"+lnumber[i]+"',m_account='"+maccount[i]+"',l_address='"+laddress[i]+"',l_phone='"+lphone[i]+"',l_totalprice='"+ltotalprice[i]+"' WHERE l_id='"+lid[i]+"'";
			con.createStatement().executeUpdate(sql); 
			}
			out.write("<script language=javascript>alert('修改成功');</script>");
			response.setHeader("refresh","0;URL=bk_order.jsp");
		    
		    con.close();
	%>
</body>
</html>
