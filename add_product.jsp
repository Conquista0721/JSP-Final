<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp" %>
<body>
	<%
        request.setCharacterEncoding("utf-8");
		String pclass=request.getParameter("pclass");
		String phot=request.getParameter("phot");
		String pname=request.getParameter("pname");
		String pstock=request.getParameter("pstock");
		String pprice=request.getParameter("pprice");
		String pimage=request.getParameter("pimage");
		String pimage2=request.getParameter("pimage2");
		String pimage3=request.getParameter("pimage3");
		String ptextarea=request.getParameter("ptextarea");

		if(pname==null||pname.equals("")||pstock==null||pstock.equals("")||pprice==null||pprice.equals(""))
		{
			out.write("<script language=javascript>alert('必填欄位不能為空');</script>");
			response.setHeader("refresh","0;URL=bk_product.jsp");
		}
		else 
		{
			
			sql="INSERT INTO jspfinal.product(p_class,p_hot,p_name,p_stock,p_price,p_image,p_image2,p_image3,p_textarea) values('"+pclass+"','0','"+pname+"','"+pstock+"','"+pprice+"','"+pimage+"','"+pimage2+"','"+pimage3+"','"+ptextarea+"');";
            con.createStatement().execute(sql); 
			out.write("<script language=javascript>alert('建立成功');</script>");
			response.setHeader("refresh","0;URL=bk_product.jsp");
		    
		}
	%>
</body>
