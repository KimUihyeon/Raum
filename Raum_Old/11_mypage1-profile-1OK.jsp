<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<%

	String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
	String pw=request.getParameter("pw");
	String pw_crrnet = "";

	
	if(currentLogin==null){
			response.sendRedirect("error_500.html");
	}
	else{
	
		Query = "select * from Raum_Member where M_id='"+currentLogin+"'";
		PreparedStatement QueryHelper = con.prepareStatement(Query);
		ResultSet cursor = QueryHelper.executeQuery();

		while(cursor.next()){
			pw_crrnet = cursor.getString("M_pw");
		}
	
		if(pw_crrnet.equals(pw)){
			response.sendRedirect("11_mypage1-profile-2.jsp");
		}
		else{
			response.sendRedirect("11_mypage1-profile-1.jsp?log=1");
		}
	}

%>