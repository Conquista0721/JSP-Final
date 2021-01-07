<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp" %>
<body>
	<%
	    response.setCharacterEncoding("big5");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("big5");
	    request.setCharacterEncoding("UTF-8");
		String acc=request.getParameter("acc");
		String pas=request.getParameter("psd");
		if(acc==null||acc.equals("")||pas==null||pas.equals(""))
		{
			out.write("<script language=javascript>alert('帳號、密碼輸入錯誤');</script>");
			response.setHeader("refresh","0;URL=index.jsp");
		}
		else 
		{
			String sql2="select * from member where m_account='"+acc+"';";
			ResultSet a=con.createStatement().executeQuery(sql2);
			if(a.next())
			{
				out.write("<script language=javascript>alert('帳號重複');</script>");
				response.setHeader("refresh","0;URL=login.jsp");
			}
			else
			{
				sql="INSERT INTO member(m_account,m_password,m_level,m_name,m_head) values('"+acc+"','"+pas+"','"+"0"+"','"+acc+"','"+"一般會員"+"');";
				con.createStatement().execute(sql);
				out.write("<script language=javascript>alert('註冊成功');</script>");
				response.setHeader("refresh","0;URL=index.jsp");
		    }
		}
	%>
</body>