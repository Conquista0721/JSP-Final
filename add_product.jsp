<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp" %>
<body>
	<%
        request.setCharacterEncoding("utf-8");
		String pid=request.getParameter("pid");
		String pclass=request.getParameter("pclass");
		String pclass=request.getParameter("phot");
		String pname=request.getParameter("pname");
		String pstock=request.getParameter("pstock");
		String pprice=request.getParameter("pprice");
		String pimage=request.getParameter("pimage");
		String pimage=request.getParameter("pimage2");
		String pimage=request.getParameter("pimage3");
		String pimage=request.getParameter("ptextarea");

		if(pid==null||pid.equals("")||pname==null||pname.equals("")||pstock==null||pstock.equals("")||pprice==null||pprice.equals(""))
		{
			out.write("<script language=javascript>alert('必填欄位不能為空');</script>");
			response.setHeader("refresh","0;URL=bk_product.jsp");
		}
		else 
		{
			String sql2="select * from product where p_id='"+pid+"';";
			ResultSet a=con.createStatement().executeQuery(sql2);
			if(a.next())
			{
				out.write("<script language=javascript>alert('商品重複');</script>");
				response.setHeader("refresh","0;URL=back_product.jsp");
			}
			else
			{
			sql="INSERT INTO product(p_id,p_class,p_name,p_stock,p_price,p_originprice,p_discount,p_image) values('"+pid+"','"+pclass+"','"+pname+"','"+pstock+"','"+pprice+"','"+poriginprice+"','"+pdiscount+"','"+pimage+"');";
            con.createStatement().execute(sql); 
			out.write("<script language=javascript>alert('建立成功');</script>");
			response.setHeader("refresh","0;URL=back_product.jsp");
		    }
		}
	%>
</body>
