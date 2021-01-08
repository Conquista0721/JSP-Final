<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="getDB.jsp" %>
<!DOCTYPE html>
<html lang="en">
<body>	
	<%
		
	 	//銷毁session：
		 session.invalidate();
	    //清除cookie：
	try{
	Cookie getC[]=request.getCookies();
	for(int i=0;i<getC.length;i++)
	{
		if(getC[i].getName().equals("getin"))
		{
			getC[i].setMaxAge(0);
			response.addCookie(getC[i]);
			response.sendRedirect("index.jsp");
		}
	}
}
catch(Exception e)
{

}

	
	   
	%>

</body>
</html>