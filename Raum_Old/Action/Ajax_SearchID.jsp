<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="connectionDB.jsp"%>
<%
	//
	// 중복검사
	//
	String Id = request.getParameter("id");
	
	Query = "SELECT * FROM Raum_Member WHERE M_id='"+Id+"'";
	PreparedStatement sessionHelper = con.prepareStatement(Query);
	ResultSet sessionCursor = sessionHelper.executeQuery();

	sessionCursor.last();
	int sessionLength = sessionCursor.getRow();
	sessionCursor.beforeFirst();

	if(sessionLength==0){
		%>true
		<%
	}
	else{
		%>false
		<%
	}
%>