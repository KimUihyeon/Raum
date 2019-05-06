<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>

<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String id = request.getParameter("id");

	if(name == null || email == null){
		response.sendRedirect("error_500.html");
	}
	else{
		Query = "select * from Raum_Member where M_name='"+name+"' and M_tel='"+email+"' and M_id='"+id+"'";
		PreparedStatement QueryHelper = con.prepareStatement(Query);
		ResultSet cusor = QueryHelper.executeQuery();

		cusor.last();
		int sessionLength = cusor.getRow();
		cusor.beforeFirst();

		if(sessionLength>0){
			cusor.next();
			String FindPw = cusor.getString("M_pw");
			response.sendRedirect("10_find-PW-show.jsp?Find="+FindPw);
		}
		else{
			response.sendRedirect("10_find-IDPW.jsp?type=9");
		}
	}
%>