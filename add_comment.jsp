<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp" %>
<body>
	<%
        request.setCharacterEncoding("utf-8");
		String lid=request.getParameter("lid");
		String ldate=request.getParameter("date");
		String pid=request.getParameter("pid");
		String lname=request.getParameter("lname");
		String message=request.getParameter("message");

		if(lid==null||lid.equals("")||pid==null||pid.equals("")||lname==null||lname.equals("")||message==null||message.equals("")||ldate==null||ldate.equals(""))
		{
			out.write("<script language=javascript>alert('必填欄位不能為空');</script>");
			response.setHeader("refresh","0;URL=bk_comment.jsp");
		}
		else 
		{
			String sql2="select * from shoppinglist where l_id='"+lid+"';";
			ResultSet a=con.createStatement().executeQuery(sql2);
			if(a.next())
			{
				out.write("<script language=javascript>alert('評論重複');</script>");
				response.setHeader("refresh","0;URL=bk_comment.jsp");
			}
		    else 
		    {
			sql="INSERT INTO shoppinglist(date,l_id,p_id,l_name,message) values('"+ldate+"','"+lid+"','"+pid+"','"+lname+"','"+message+"');";
            con.createStatement().execute(sql); 
			out.write("<script language=javascript>alert('評論成功');</script>");
			response.setHeader("refresh","0;URL=bk_comment.jsp");
		    }
		}
	%>
</body>