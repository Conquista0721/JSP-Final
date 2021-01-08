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
		String [] pimage=null;
		String [] pimage2=null;
		String [] pimage3=null;
		String [] ptextarea=null;
		
			pid=request.getParameterValues("pid");
			pclass=request.getParameterValues("pclass");
			pname=request.getParameterValues("pname");
			pstock=request.getParameterValues("pstock");
		    pprice=request.getParameterValues("pprice");
		    pimage=request.getParameterValues("pimage");
			pimage2=request.getParameterValues("pimage2");
			pimage3=request.getParameterValues("pimage3");
			ptextarea=request.getParameterValues("ptextarea");
			for(int j=0;j<pid.length;j++)
			{	
			
			sql="UPDATE product SET p_class='"+pclass[j]+"',p_name='"+pname[j]+"',p_stock='"+pstock[j]+"',p_price='"+pprice[j]+"',p_image='"+pimage[j]+"',p_image2='"+pimage2[j]+"',p_image3='"+pimage3[j]+"',p_textarea='"+ptextarea[j]+"' WHERE p_id='"+pid[j]+"'";
			con.createStatement().executeUpdate(sql); 
			}
			out.write("<script language=javascript>alert('修改成功');</script>");
			response.setHeader("refresh","0;URL=bk_product.jsp");
		    con.close();
	%>
</body>
</html>
