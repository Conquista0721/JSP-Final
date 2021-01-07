<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getDB.jsp"%>
<html>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String [] lid=null;
		String [] date=null;
		String [] pid=null;
		String [] lname=null;
		String [] message=null;

			lid=request.getParameterValues("lid");
			date=request.getParameterValues("date");
			pid=request.getParameterValues("pid");
			lname=request.getParameterValues("lname");
		    message=request.getParameterValues("message");
			for(int i=0;i<lid.length;i++)
			{	
			
			sql="UPDATE list_shopping SET date='"+date[i]+"',p_id='"+pid[i]+"',l_name='"+lname[i]+"',message='"+message[i]+"' WHERE l_id='"+lid[i]+"'";
			con.createStatement().executeUpdate(sql); 
			}
			out.write("<script language=javascript>alert('修改成功');</script>");
			response.setHeader("refresh","0;URL=back_comment.jsp");
		    
		    con.close();
	%>
</body>
</html>
