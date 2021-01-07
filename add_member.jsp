<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp" %>
<body>
	<%
        request.setCharacterEncoding("utf-8");
		String acc=request.getParameter("acc");
		String pas=request.getParameter("pas");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String level=request.getParameter("level");
		String head=request.getParameter("head");
		String phone=request.getParameter("phone");

		if(acc==null||acc.equals("")||pas==null||pas.equals(""))
		{
			out.write("<script language=javascript>alert('必填欄位不得為空');</script>");
			response.setHeader("refresh","0;URL=bk_member.jsp");
		}
	    else 
		{
			String sql2="select * from member where m_account='"+acc+"';";
			ResultSet a=con.createStatement().executeQuery(sql2);
			if(a.next())
			{
				out.write("<script language=javascript>alert('帳號重複');</script>");
				response.setHeader("refresh","0;URL=bk_member.jsp");
			}
		    else 
		    {
			sql="INSERT INTO member(m_account,m_password,m_name,m_address,m_email,m_level,m_head,m_phone) values('"+acc+"','"+pas+"','"+name+"','"+address+"','"+email+"','"+level+"','"+head+"','"+phone+"');";
            con.createStatement().execute(sql); 
			out.write("<script language=javascript>alert('註冊成功');</script>");
			response.setHeader("refresh","0;URL=bk_member.jsp");
		    }
		}
	%>
</body>