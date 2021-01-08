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
			for(int i=0;i<pid.length;i++)
			{	
				sql="UPDATE product SET p_name='"+pname[i]+"', p_stock='"+pstock[i]+"', p_price='"+pprice[i]+"', p_image='"+pimage[i]+"', p_image2='"+pimage2[i]+"', p_image3='"+pimage3[i]+"', p_textarea='"+ptextarea[i]+"' WHERE p_id='"+pid[i]+"'";
				con.createStatement().execute(sql);
			}
			out.write("<script language=javascript>alert('修改成功');</script>");
			response.setHeader("refresh","0;URL=bk_product.jsp");
			
			
		    con.close();
	%>
</body>
</html>
"