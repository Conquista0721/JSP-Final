<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp"%>
<html>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String [] pid=null;
		String [] pclass=null;
		String [] pname=null;
		String [] pstock=null;
		String [] pprice=null;
		String [] poriginprice=null;
		String [] pdiscount=null;
		String [] pimage=null;

			pid=request.getParameterValues("pid");
			pclass=request.getParameterValues("pclass");
			pname=request.getParameterValues("pname");
			pstock=request.getParameterValues("pstock");
		    pprice=request.getParameterValues("pprice");
		    poriginprice=request.getParameterValues("poriginprice");
		    pdiscount=request.getParameterValues("pdiscount");
		    pimage=request.getParameterValues("pimage");
			for(int i=0;i<pid.length;i++)
			{	
			
			sql="UPDATE product SET p_class='"+pclass[i]+"',p_name='"+pname[i]+"',p_stock='"+pstock[i]+"',p_price='"+pprice[i]+"',p_originprice='"+poriginprice[i]+"',p_discount='"+pdiscount[i]+"',p_image='"+pimage[i]+"' WHERE p_id='"+pid[i]+"'";
			con.createStatement().executeUpdate(sql); 
			}
			out.write("<script language=javascript>alert('修改成功');</script>");
			response.setHeader("refresh","0;URL=back_product.jsp");
		    
		    con.close();
	%>
</body>
</html>
