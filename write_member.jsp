<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp"%>
<html>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String [] mid=null;
		String [] maccount=null;
		String [] mpassword=null;
		String [] mname=null;
		String [] maddress=null;
		String [] memail=null;
		String [] mlevel=null;
		String [] mhead=null;
		String [] mphone=null;

			mid=request.getParameterValues("mid");
			maccount=request.getParameterValues("maccount");
			mpassword=request.getParameterValues("mpassword");
			mname=request.getParameterValues("mname");
		    maddress=request.getParameterValues("maddress");
		    memail=request.getParameterValues("memail");
		    mlevel=request.getParameterValues("mlevel");
		    mhead=request.getParameterValues("mhead");
		    mphone=request.getParameterValues("mphone");
			for(int i=0;i<mid.length;i++)
			{	
			
			sql="UPDATE member SET m_account='"+maccount[i]+"'m_password='"+mpassword[i]+"',m_name='"+mname[i]+"',m_address='"+maddress[i]+"',m_email='"+memail[i]+"',m_level='"+mlevel[i]+"',m_head='"+mhead[i]+"',m_phone='"+mphone[i]+"' WHERE m_id='"+mid[i]+"'";
			con.createStatement().executeUpdate(sql); 
			}
			out.write("<script language=javascript>alert('修改成功');</script>");
			response.setHeader("refresh","0;URL=bk_member.jsp");
		
	

	con.close();
	%>
</body>
</html>
